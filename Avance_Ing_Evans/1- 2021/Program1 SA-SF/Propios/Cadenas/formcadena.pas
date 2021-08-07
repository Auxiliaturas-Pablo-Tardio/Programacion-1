unit formCadena;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,UConjunto,UCadena,UVector,UNatural,UMatriz,UMatrizDecimal;

type

  { TForm1 }

  TForm1 = class(TForm)
    MatrizRealDescargarButton: TButton;
    DescargarMatrizButton: TButton;
    CargarMatrizButton: TButton;
    DescNumButton: TButton;
    CargarNumeButton: TButton;
    cargarVectButton: TButton;
    DescargarvectorButton: TButton;
    CargarButton: TButton;
    DescargarButton: TButton;
    MainMenu1: TMainMenu;
    MatrizRealButton: TButton;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure DescargarMatrizButtonClick(Sender: TObject);
    procedure CargarMatrizButtonClick(Sender: TObject);
    procedure CargarButtonClick(Sender: TObject);
    procedure CargarNumeButtonClick(Sender: TObject);
    procedure cargarVectButtonClick(Sender: TObject);
    procedure DescargarButtonClick(Sender: TObject);
    procedure DescargarvectorButtonClick(Sender: TObject);
    procedure DescNumButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MatrizRealButtonClick(Sender: TObject);
    procedure MatrizRealDescargarButtonClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private
      //Inicializamos el objeto
      cad:Cadena;
      cad2:Cadena;
      vec:Vector;
      num:Natural;
      mat:Matriz;
      mat2:Matriz;
      matreal:MatrizReal;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CargarButtonClick(Sender: TObject);
var s:string;
begin
  cad:=cad.crear();
 s:=inputBox('','','');
 cad.cargarString(s);
end;

procedure TForm1.CargarMatrizButtonClick(Sender: TObject);
var f,c,ele,i,j:integer;
  sf,sc:string;
begin
 sf:=InputBox('Int Filas','','');
 sc:=InputBox('Int Cols','','')  ;
 if( (sf.length=0) or (sc.Length=0) )then
  begin
    ShowMessage('Por favor no ponga vacio')
  end
 else
 begin
          f:=StrToInt(sf) ;
        c:=StrToInt(sc) ;
        mat.setFilCols(f,c);
        //Mat2
        mat2.setFilCols(f,c);
        for i:=1 to f do
        begin
            for j:=1 to c do
            begin
               ele:=StrToInt(InputBox('Int elem fila: '+IntToStr(i)+' columna: '+IntToStr(j),'','')) ;
               mat.setElem(i,j,ele);
               mat2.setElem(i,j,ele);
            end;
        end;
     end;


end;

procedure TForm1.DescargarMatrizButtonClick(Sender: TObject);
begin
  ShowMessage(mat.myToString());
end;

procedure TForm1.CargarNumeButtonClick(Sender: TObject);
var a:integer ;
begin
 a:=StrToInt(InputBox('Numero','','')) ;
  num.setValor(a);
end;

procedure TForm1.cargarVectButtonClick(Sender: TObject);
var dim,i,ele:integer;
begin
 dim:=StrToInt(InputBox('introduzca dim del vector','',''));
 vec.setDim(dim);
 for i:=1 to vec.getDim() do
 begin
      ele:=StrToInt(InputBox('introduzca elem del vector','',''));
      vec.setEle(i,ele);
 end;

end;

procedure TForm1.DescargarButtonClick(Sender: TObject);
var s:string;
begin
  s:=cad.mytoString();
   ShowMessage(s);
end;

procedure TForm1.DescargarvectorButtonClick(Sender: TObject);
begin
  ShowMessage(vec.mytoString)
end;

procedure TForm1.DescNumButtonClick(Sender: TObject);
begin
  ShowMessage(IntToStr(num.getValor()));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
       cad:=cadena.crear();
       cad2:= cadena.crear();
       vec:=Vector.crear();
       num:=Natural.crear();
       mat:=Matriz.crear();
       mat2:= Matriz.crear();
       matreal:=MatrizReal.crear();
end;

procedure TForm1.MatrizRealButtonClick(Sender: TObject);
var f,c,ele,i,j:integer;
  sf,sc:string;
begin
 sf:=InputBox('Int Filas','','');
 sc:=InputBox('Int Cols','','')  ;
 if( (sf.length=0) or (sc.Length=0) )then
  begin
    ShowMessage('Por favor no ponga vacio')
  end
 else
 begin
          f:=StrToInt(sf) ;
        c:=StrToInt(sc) ;
        matreal.setFilCols(f,c);

        for i:=1 to f do
        begin
            for j:=1 to c do
            begin
               ele:=StrToInt(InputBox('Int elem fila: '+IntToStr(i)+' columna: '+IntToStr(j),'','')) ;
               matreal.setElem(i,j,ele);

            end;
        end;
     end;
end;

procedure TForm1.MatrizRealDescargarButtonClick(Sender: TObject);
begin
 //matreal.resolverEcuacion();
 ShowMessage(matreal.myToString());

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  mat.sumarAMiMatriz(mat2);
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
var c,a,b :vector;
  dimC,dimA,dimB,i,ele:integer;
begin
 c:=vector.crear();
 a:=vector.crear();
 b:=vector.crear();
 //Cargar los 3 vectores
 //PARA C

 dimC:=StrToInt(InputBox('introduzca dim del vector C ','',''));
 c.setDim(dimC);
 for i:=1 to c.getDim() do
 begin
      ele:=StrToInt(InputBox('introduzca elem del vector c','',''));
      C.setEle(i,ele);
 end;
 //Para A
 dimA:=StrToInt(InputBox('introduzca dim del vector a ','',''));
 a.setDim(dimA);
 for i:=1 to a.getDim() do
 begin
      ele:=StrToInt(InputBox('introduzca elem del vector a','',''));
      a.setEle(i,ele);
 end;
 //PARA B
 dimB:=StrToInt(InputBox('introduzca dim del vector b ','',''));
 b.setDim(dimB);
 for i:=1 to b.getDim() do
 begin
      ele:=StrToInt(InputBox('introduzca elem del vector b','',''));
      b.setEle(i,ele);
 end;

 vec.intercalar(a,b,c);


end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  matreal.ordenarCompDiagPrinc();
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
var a,b,c:vector;
  ele,dimA,dimB,dimC,i:integer;

begin

 a:=vector.crear();
 b:=vector.crear();
 //Cargar los 3 vectores
 //PARA C


 //Para A
 dimA:=StrToInt(InputBox('introduzca dim del vector a ','',''));
 a.setDim(dimA);
 for i:=1 to a.getDim() do
 begin
      ele:=StrToInt(InputBox('introduzca elem del vector a','',''));
      a.setEle(i,ele);
 end;
 //PARA B
 dimB:=StrToInt(InputBox('introduzca dim del vector b ','',''));
 b.setDim(dimB);
 for i:=1 to b.getDim() do
 begin
      ele:=StrToInt(InputBox('introduzca elem del vector b','',''));
      b.setEle(i,ele);
 end;
 vec.intercalarOrdenadoV2(a,b);
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
    cad.encriptar();
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  cad.desencriptar();
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  vec.ordenar;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var a,b:integer;
begin
  a:=StrToInt(InputBox('introduzca elem del vector','',''));
   b:=StrToInt(InputBox('introduzca elem del vector','',''));
  vec.ordenarInicioFin(a,b);
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  ShowMessage(num.convertirALiteral());
end;

end.

