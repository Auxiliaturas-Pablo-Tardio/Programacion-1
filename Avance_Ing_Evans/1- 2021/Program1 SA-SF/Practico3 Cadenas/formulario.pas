unit formulario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,UConjunto,UCadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    SG1: TStringGrid;
    SG2: TStringGrid;
    SG3: TStringGrid;
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private
    //inicializamos el objeto
     cad:cadena;
     cad2:cadena;
     cad3:cadena;
     procedure ActualizarSG();
     procedure ActualizarSG2();
     procedure ActualizarSG3();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   cad:= cadena.crear();
  cad2:= cadena.crear();
  cad3:= cadena.crear();
end;

procedure TForm1.Label5Click(Sender: TObject);
begin

end;



procedure TForm1.ActualizarSG();
var i :integer;
begin
  SG1.ColCount:=cad.getDim();
  for i:=1 to cad.getDim  do
     SG1.Cells[i-1,0]:=cad.getChar(i);
               //  columna,fila
end;

procedure TForm1.ActualizarSG2();
var i :integer;
begin
  SG2.ColCount:=cad2.getDim();
  for i:=1 to cad2.getDim  do
    SG2.Cells[i-1,0]:=cad2.getChar(i);
                 //columna,fila
end;
procedure TForm1.ActualizarSG3();
var i :integer;
begin
  SG3.ColCount:=cad3.getDim();
  for i:=1 to cad3.getDim  do
    SG3.Cells[i-1,0]:=cad3.getChar(i);
                 //columna,fila
end;
//crear
procedure TForm1.MenuItem5Click(Sender: TObject);
begin
    cad:= cadena.crear(); //inicializando objeto
   ActualizarSG();
   Label6.Caption:='se creo su Cadena';
 //  ShowMessage('se creo su Cadena');
end;
//Cargar
procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  //cad.AddPal((InputBox('Ingrese una palabra','','')));
  cad.AddPal(Edit1.Text);
  Label6.Caption:='se cargo la cadena de clik en descargar';
     //ShowMessage('se creo su Cadena');
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
    ActualizarSG();
  Edit1.Text:='';
  edit2.Text:='';
  Label7.Caption:='Caracter ';
  Label8.Caption:='Posicion ';
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
var pos:Byte; ele:Char;
  palabra:String;
begin

  pos:=StrToInt(Edit2.Text);
  palabra:=Edit1.Text;
  ele:=palabra[1];
  cad.Inserchar(pos,ele);
end;
  //Cadena 2   Crear
procedure TForm1.MenuItem9Click(Sender: TObject);
begin
    cad2:= cadena.crear(); //inicializando objeto
   ActualizarSG2();
   Label6.Caption:='se creo su Cadena';
end;
//cargar
 procedure TForm1.MenuItem10Click(Sender: TObject);
begin
     cad2.AddPal(Edit1.Text);
  Label6.Caption:='se cargo la cadena de clik en descargar';
end;
 //Descargar
procedure TForm1.MenuItem11Click(Sender: TObject);
begin
   ActualizarSG2();
  Edit1.Text:='';
  edit2.Text:='';
end;
//Cadena 3
procedure TForm1.MenuItem12Click(Sender: TObject);
begin
   cad2:= cadena.crear(); //inicializando objeto
   ActualizarSG3();
   Label6.Caption:='se creo su Cadena';
end;
   //Cargar
procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  cad3.AddPal(Edit1.Text);
 Label6.Caption:='se cargo la cadena de clik en descargar';
end;
//Descargar
procedure TForm1.MenuItem14Click(Sender: TObject);
begin
 ActualizarSG3();
  Edit1.Text:='';
  edit2.Text:='';
end;
 {1.- Realice la división de una Cadena en dos Cadenas a partir de una
 palabra X, la palabra X formará parte de la Primer Cadena.}
procedure TForm1.MenuItem15Click(Sender: TObject);
var pal:String;
begin
  pal:=InputBox('palabra buscada','','');//'hola'
cad2:= cadena.crear(); //inicializando objeto
cad.ejercicio1(cad2,pal);
end;
{2.- Realice la unión de dos textos.}
procedure TForm1.MenuItem16Click(Sender: TObject);
begin

end;

end.

