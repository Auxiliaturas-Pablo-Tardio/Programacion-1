unit UnitFormMatrices;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, Menus,
  UMatriz;

type

  { TForm1 }

  TForm1 = class(TForm)
    DescargarButtonn: TButton;

    DescargarButton: TButton;
    Cargar: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    StringGrid1: TStringGrid;
    procedure CargarClick(Sender: TObject);
    procedure DescargarButtonnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
  private
   procedure descargar();
  public
   m:Matriz;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DescargarButtonnClick(Sender: TObject);

begin
 descargar();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var fi,ci,ff,cf,r:integer;
begin
 fi:=StrToInt(InputBox('Introduzca Fila inicial','',''));
 ci:=StrToInt(InputBox('Introduzca Columna inicial','',''));
 ff:=StrToInt(InputBox('Introduzca Fila final','',''));
 cf:=StrToInt(InputBox('Introduzca Columna Final','',''));
  r:=m.ej6SumarBloque(fi,ci,ff,cf);
  ShowMessage(IntToStr(r));
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
VAR a:Real;
begin
  a:=m.promedioTID();
  ShowMessage(FloatToStr(a));


end;

procedure TForm1.CargarClick(Sender: TObject);
begin
  m:=Matriz.crear();
  m.cargar();
end;

procedure TForm1.descargar();
var f,c,i,j:integer;

begin
  f:=m.getFilas();
  c:=m.getCols();
  StringGrid1.RowCount:=f;
  StringGrid1.ColCount:=c;
  for i:=1 to f do
  begin
    for j:=1 to c do
    begin
      StringGrid1.Cells[j-1,i-1]:=IntToStr(m.getElem(i,j));
    end;
  end;
end;

end.

