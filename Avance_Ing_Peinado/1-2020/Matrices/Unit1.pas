unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCMatriz, Vcl.Grids, Vcl.Menus;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    Matrices1: TMenuItem;
    Cargar1: TMenuItem;
    mostrarMatriz1: TMenuItem;
    Practico1: TMenuItem;
    N01SeriePrimos1: TMenuItem;
    procedure Cargar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mostrarMatriz1Click(Sender: TObject);
    procedure N01SeriePrimos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    matriz1:Matriz;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Cargar1Click(Sender: TObject);
var filas,cols :word;
  i,j: Integer;
  elemento: Real;
begin
  filas:= StrToInt(inputBox('filas','',''));
  cols := StrToInt(inputBox('cols','',''));
  matriz1.setFilas(filas);
  matriz1.setColumnas(cols);
  for i := 1 to filas do
    begin
       for j := 1 to cols do
          begin
             elemento:= StrToFloat(inputBox(
               'Introduzca elemento',
              'fila: '+IntToStr(i)+' col: '+IntToStr(j),'')); 
             matriz1.setCelda(elemento,i,j);     
          end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
matriz1:=Matriz.Create();
end;

procedure TForm1.mostrarMatriz1Click(Sender: TObject);
Var f,c:word;
  i,j: Integer;
begin
  f:=matriz1.getFilas;
  c:=matriz1.getColumnas;
  StringGrid1.RowCount:=f;
  StringGrid1.ColCount:=c ;
  for i := 0 to f do
  Begin
    for j := 0 to c do
        StringGrid1.Cells[j,i]:=FloatToStr(matriz1.getCelda(i+1,j+1));
  End;
end;

procedure TForm1.N01SeriePrimos1Click(Sender: TObject);
var resultado:Real  ;
begin
    resultado:=matriz1.seriePrimosMatriz();
   ShowMessage(FloatToStr(resultado));
end;

end.
