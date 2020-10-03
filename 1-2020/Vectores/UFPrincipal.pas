unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Menus,UCVector;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Obtenerdimension1: TMenuItem;
    AdicionarElemento1: TMenuItem;
    InsertarElemento1: TMenuItem;
    EliminarElemento1: TMenuItem;
    ModificarElemento1: TMenuItem;
    ObtenerElemento1: TMenuItem;
    SumarElementos1: TMenuItem;
    PromediodeElementos1: TMenuItem;
    CargarVector1: TMenuItem;
    MostrarVector1: TMenuItem;
    SGVector: TStringGrid;
    ScrollBar1: TScrollBar;
    BuscarElemento1: TMenuItem;
    Borrarelemento1: TMenuItem;
    SegmentarVector1: TMenuItem;
    Verificariguales1: TMenuItem;
    VerificarOrdenRango1: TMenuItem;
    ContarDiferentes1: TMenuItem;
    contarDiferentesConRango1: TMenuItem;
    multiplosMenor1: TMenuItem;
    elementodemenorFrec1: TMenuItem;
    procedure ScrollBar1Change(Sender: TObject);
    procedure MostrarVector1Click(Sender: TObject);
    procedure CargarVector1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BuscarElemento1Click(Sender: TObject);
    procedure Borrarelemento1Click(Sender: TObject);
    procedure SegmentarVector1Click(Sender: TObject);
    procedure Verificariguales1Click(Sender: TObject);
    procedure VerificarOrdenRango1Click(Sender: TObject);
    procedure ContarDiferentes1Click(Sender: TObject);
    procedure contarDiferentesConRango1Click(Sender: TObject);
    procedure multiplosMenor1Click(Sender: TObject);
    procedure elementodemenorFrec1Click(Sender: TObject);
  private
    { Private declarations }
    vectorA : Vector;
  public
    { Public declarations }
    k: Integer;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Borrarelemento1Click(Sender: TObject);
var
elem :Real;
begin
elem:=StrToFloat(inputbox('','Introd elem',''));
vectorA.borrarElemento(elem);
end;

procedure TfrmPrincipal.BuscarElemento1Click(Sender: TObject);
var
elemABuscar:Real;
b:Boolean;
begin
    elemABuscar:=StrToFloat(inputbox('Elementos','Introduzca elemento',''));
    b:=vectorA.BuscarElemento(elemABuscar);
    if(b=true)  then
    begin
    ShowMessage('Se encontro');
    end
    else
      ShowMessage('NO Se encontro');

end;

procedure TfrmPrincipal.CargarVector1Click(Sender: TObject);
var n :Integer;
    i: Integer;
  elemento: Real;
begin

n:= StrToInt(inputbox('Test program', 'Introducir dimension', ''));

for i := 0 to n-1 do
begin
    elemento:=StrToFloat(inputbox('test','Introducir elemento:'+IntToStr(i+1),''));
    vectorA.AddElement(elemento);
end;
end;

procedure TfrmPrincipal.ContarDiferentes1Click(Sender: TObject);
begin
      ShowMessage(IntToStr(vectorA.contarDiferentes())) ;

end;

procedure TfrmPrincipal.contarDiferentesConRango1Click(Sender: TObject);
var
a,b :word;
begin
 a:= StrToInt(inputBox('Introduzca A','',''));
 b:= StrToInt(inputBox('Introduzca B','',''));
 ShowMessage(IntToStr(vectorA.contarDiferentesRango(a,b)));


end;

procedure TfrmPrincipal.elementodemenorFrec1Click(Sender: TObject);
begin
      ShowMessage(FloatToStr(vectorA.elemMenosRepetido()));
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
vectorA:= Vector.Create;

end;

procedure TfrmPrincipal.MostrarVector1Click(Sender: TObject);
var
i :integer;
begin
    sgVector.ColCount:=vectorA.Dim;

for i := 0 to vectorA.Dim-1 do
begin
     SGVector.Cells[i,0]:=FloatToStr(vectorA.GetElement(i+1));
end;

   
end;

procedure TfrmPrincipal.multiplosMenor1Click(Sender: TObject);
var a :Word;
resultado: Real;
begin
  a:=StrToInt(inputbox('Introducir m','',''));
  resultado:=vectorA.elemMenorDePosicionesMult(a);
  ShowMessage(FloatToStr(resultado));
end;

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
    SGVector.ColCount:=Scrollbar1.Position;
end;

procedure TfrmPrincipal.SegmentarVector1Click(Sender: TObject);
begin
      vectorA.segmentarParImpar;
end;

procedure TfrmPrincipal.Verificariguales1Click(Sender: TObject);
var a,b:word;
begin
  a:=StrToInt(inputbox('Introduzca inicio','',''))  ;
  b:=StrToInt(inputbox('Introduzca final','',''))  ;
  if(vectorA.verificarIgualesRango(a,b)=true)  then
   begin
   ShowMessage('son iguales');
   end
   else
   begin
    ShowMessage('son diferentes');
   end;
end;

procedure TfrmPrincipal.VerificarOrdenRango1Click(Sender: TObject);
var a,b:word;
begin
a:=StrToInt(inputbox('Introduzca inicio','',''))  ;
  b:=StrToInt(inputbox('Introduzca final','',''))  ;
  if(vectorA.verificarOrdenRango(a,b)=true)  then
   begin
   ShowMessage('esta ordenado Ascendentemente');
   end
   else
   begin
    ShowMessage('esta desordenado ascendentemente');
   end;
end;

end.
