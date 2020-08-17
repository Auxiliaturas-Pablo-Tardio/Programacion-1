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
    procedure ScrollBar1Change(Sender: TObject);
    procedure MostrarVector1Click(Sender: TObject);
    procedure CargarVector1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
    SGVector.ColCount:=Scrollbar1.Position;
end;

end.
