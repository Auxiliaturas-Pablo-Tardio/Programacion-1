unit PMatriz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,UCMatriz,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Cargar: TButton;
    VerDescargar: TButton;
    MainMenu1: TMainMenu;
    Ejercicios1: TMenuItem;
    ContarUnicos1: TMenuItem;
    ContarUnicosParam1: TMenuItem;
    StringGrid2: TStringGrid;
    Cargar2: TButton;
    Descargar: TButton;
    SumarMatricesEnla11: TMenuItem;
    procedure CargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VerDescargarClick(Sender: TObject);
    procedure ContarUnicos1Click(Sender: TObject);
    procedure ContarUnicosParam1Click(Sender: TObject);
    procedure Cargar2Click(Sender: TObject);
    procedure DescargarClick(Sender: TObject);
    procedure SumarMatricesEnla11Click(Sender: TObject);
  private
    { Private declarations }
    miMatriz: Matriz;
    otraMatriz:Matriz;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Cargar2Click(Sender: TObject);
var
filas,columna,i,j:Word;
elemento:Real;
begin
    filas:=StrToInt(inputBox('','Introducir Filas',''));
    columna:=StrToInt(inputBox('','Introducir Col',''));
    otraMatriz.redimensionar(filas,columna);
    for i := 1 to filas do
      begin
        for j := 1 to columna do
          begin
            elemento:= StrToFloat(inputBox('',
              'Introducir Elemento: Fila '+IntToStr(i)
              +' columna' +IntToStr(j),''));
              otraMatriz.setElemento(i,j,elemento);
          end;
      end;

end;

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

procedure TForm1.ContarUnicos1Click(Sender: TObject);
var
conteoUnicos:Word;
begin
   conteoUnicos:= miMatriz.contarUnicos();
    showMessage('Numero de elementos unicos'+intToStr(conteoUnicos));

end;

procedure TForm1.ContarUnicosParam1Click(Sender: TObject);
var
conteoUnicos,cf,ff:Word;
begin
  cf:=StrToInt(inputbox('introducir limite de cols','','')) ;
 ff:=StrToInt(inputbox('introducir limite de filas','','')) ;
   conteoUnicos:= miMatriz.contarUnicosParamFin(ff,cf);
    showMessage('Numero de elementos unicos'+intToStr(conteoUnicos));

end;

procedure TForm1.DescargarClick(Sender: TObject);
var
filas,columnas,i,j:Word;
elemento:Real;
begin
filas:=otraMatriz.getFilas();
columnas:=otraMatriz.getCols();
//Redimensionar matriz Diseño
StringGrid2.RowCount:= filas;
StringGrid2.ColCount:=columnas;
 //Cargar Matriz
   for i := 1 to filas do
      begin
        for j :=1  to columnas do
        begin
           elemento:=otraMatriz.getElemento(i,j);
            StringGrid2.Cells[j-1,i-1]:= FloatToStr(elemento);
        end;
      end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
      miMatriz:= Matriz.Create();
      otraMatriz:=Matriz.Create();
end;

procedure TForm1.SumarMatricesEnla11Click(Sender: TObject);
begin
 miMatriz.sumarAMiMatriz(otraMatriz);
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
