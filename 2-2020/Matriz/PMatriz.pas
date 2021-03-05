unit PMatriz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,UCMatriz;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Cargar: TButton;
    VerDescargar: TButton;
    procedure CargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VerDescargarClick(Sender: TObject);
  private
    { Private declarations }
    miMatriz: Matriz;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CargarClick(Sender: TObject);
var
filas,columna,i,j:Word;
elemento:Real;
begin
    filas:=StrToInt(inputBox('','Introducir Filas',''));
    columna:=StrToInt(inputBox('','Introducir Col',''));
    miMatriz.redimensionar(filas,columna);
    for i := 1 to filas do
      begin
        for j := 1 to columna do
          begin
            elemento:= StrToFloat(inputBox('',
              'Introducir Elemento: Fila '+IntToStr(i)
              +' columna' +IntToStr(j),''));
              miMatriz.setElemento(i,j,elemento);
          end;
      end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      miMatriz:= Matriz.Create();
end;

procedure TForm1.VerDescargarClick(Sender: TObject);
var
filas,columnas,i,j:Word;
elemento:Real;
begin
filas:=miMatriz.getFilas();
columnas:=miMatriz.getCols();
//Redimensionar matriz Diseño
StringGrid1.RowCount:= filas;
StringGrid1.ColCount:=columnas;
 //Cargar Matriz
   for i := 1 to filas do
      begin
        for j :=1  to columnas do
        begin
           elemento:=miMatriz.getElemento(i,j);
        StringGrid1.Cells[j-1,i-1]:= FloatToStr(elemento);
        end;
      end;
end;

end.
