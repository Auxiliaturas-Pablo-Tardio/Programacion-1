unit PVector;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,UCVector,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    MainMenu1: TMainMenu;
    Ejercicios1: TMenuItem;
    ordenar1: TMenuItem;
    SelectionSort1: TMenuItem;
    SelectionSortSubFunciones1: TMenuItem;
    BubbleSortRango1: TMenuItem;
    SelectionSortSaltos1: TMenuItem;
    EliminarConRango1: TMenuItem;
    Eliminar1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ordenar1Click(Sender: TObject);
    procedure SelectionSort1Click(Sender: TObject);
    procedure SelectionSortSubFunciones1Click(Sender: TObject);
    procedure BubbleSortRango1Click(Sender: TObject);
    procedure SelectionSortSaltos1Click(Sender: TObject);
    procedure EliminarConRango1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    miVector:Vector
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BubbleSortRango1Click(Sender: TObject);
var a,b:Word;
begin
 a:=StrToInt(inputBox('Introduzca A','','')) ;
 b:=StrToInt(inputBox('Introduzca B','',''));
miVector.bubleSortRango(a,b);
end;

procedure TForm1.Button1Click(Sender: TObject);
var n,i :word;
elem:Real;
begin
miVector:=Vector.Create;
n:=StrToInt(inputbox('Introduzca la dimension','',''));

for i := 0 to n-1 do
begin
elem:=StrToFloat(InputBox('','Introduzca elemento'+IntToStr(i+1),''));
 miVector.addElem(elem);
end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
dimMia:word;
  I: Integer;
begin
dimMia:=miVector.getDimension;
StringGrid1.ColCount:=dimMia;
for I := 0 to dimMia-1 do
begin
  //En una stringgrid tenemos columnas filas
  //en un vector solo tenemos columnas
  StringGrid1.Cells[I,0]:=FloatToStr(miVector.getElem(I+1));
end;
end;

procedure TForm1.Eliminar1Click(Sender: TObject);
var a:Word;
begin
      a:=StrToInt(inputBox('Introduzca indice a eliminar','','')) ;
      miVector.eliminarElem(a);
end;

procedure TForm1.EliminarConRango1Click(Sender: TObject);
var a,b:Word;
begin
    a:=StrToInt(inputBox('Introduzca A','','')) ;
 b:=StrToInt(inputBox('Introduzca B','',''));
 miVector.eliminarUnRango(a,b);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
miVector:=Vector.Create;
end;

procedure TForm1.ordenar1Click(Sender: TObject);
begin
miVector.ordenar;
end;

procedure TForm1.SelectionSort1Click(Sender: TObject);
begin
miVector.selectionSort();
end;

procedure TForm1.SelectionSortSaltos1Click(Sender: TObject);
var saltos:Word;
begin
saltos:=StrToInt(InputBox('','Introduzca saltos',''));
miVector.selectionSortSaltos(saltos);
end;

procedure TForm1.SelectionSortSubFunciones1Click(Sender: TObject);
begin
miVector.selectionSortVFunciones()
end;

end.
