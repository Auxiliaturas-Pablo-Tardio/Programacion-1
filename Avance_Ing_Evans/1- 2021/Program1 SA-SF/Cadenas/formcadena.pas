unit formCadena;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,UConjunto,UCadena,UVector,UNatural;

type

  { TForm1 }

  TForm1 = class(TForm)
    DescNumButton: TButton;
    CargarNumeButton: TButton;
    cargarVectButton: TButton;
    DescargarvectorButton: TButton;
    CargarButton: TButton;
    DescargarButton: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    procedure CargarButtonClick(Sender: TObject);
    procedure CargarNumeButtonClick(Sender: TObject);
    procedure cargarVectButtonClick(Sender: TObject);
    procedure DescargarButtonClick(Sender: TObject);
    procedure DescargarvectorButtonClick(Sender: TObject);
    procedure DescNumButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

