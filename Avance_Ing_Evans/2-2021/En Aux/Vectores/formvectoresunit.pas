unit FormVectoresUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,VectorUnit,
  ExtCtrls, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Cargar: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure CargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public
      v:vector;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var dim:integer;
  i:integer;
begin
  dim:= v.getDim();
  StringGrid1.ColCount:=dim;
  for i:=1 to dim do
  begin
    StringGrid1.Cells[i-1,0]:=IntToStr(v.getElem(i));
  end;

end;

procedure TForm1.CargarClick(Sender: TObject);
begin
  v.cargarElem();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  v:=vector.crear;
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem11Click(Sender: TObject);
var a,b,c:vector ;
begin
  a:=vector.Create;
  b:=vector.Create;
  c:=vector.create;
  a.cargarElem();
   b.cargarElem();
   c.cargarElem();
  v.intercalar3VectoresOrdenados(a,b,c);

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
   v.eliminarPrimos();

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  v.eliminarRep();
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var pos:String;
begin
   pos:=InputBox('Int. Elem a eliminar','','');
   v.eliminarElem(StrToInt(pos));
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var elemModa:integer;
begin
  elemModa:=v.getElemModa();
  ShowMessage('El elemento moda es: '+IntToStr(elemModa));

end;

procedure TForm1.MenuItem7Click(Sender: TObject);
var va,vb:vector;
begin
  va.cargarElem();
  vb.cargarElem();
  v.fusionOrdenada(va,vb);

end;

procedure TForm1.MenuItem9Click(Sender: TObject);
var va,vb,vc:vector;
begin
  va:=vector.Create;
  vb:=vector.Create;
  vc:=vector.Create;
    va.cargarElem();
    vb.cargarElem();
    vc.cargarElem();
    v.intercalar3Vectores(va,vb,vc);
end;

end.

