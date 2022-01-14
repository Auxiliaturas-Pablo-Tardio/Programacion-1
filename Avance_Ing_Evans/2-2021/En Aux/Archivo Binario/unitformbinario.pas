unit unitFormBinario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  UArchivoBinarioAlumnos,UArchivoBinarioEmpleados;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private
    fa: ArchivoBinarioAlumnos;
    ft,ftMujeres:ArchivoBinarioEmpleados;

    fileTrabajadorIndex:Integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  fa.abrir();
  fa.aCrearArchivoAlumnosBase();
  fa.cerrar();
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var
  reg: integer;
  s: string;
begin
  reg := StrToInt(InputBox('Introducir el registro a acceder', '', ''));
  s := fa.mostrarAccederPorRegistro(reg);
  Memo1.Clear;
  Memo1.Append(s);

end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var
  s: string;
begin
  s := fa.mostrarDatos(1);
  Memo1.Clear;
  Memo1.Append(s);

end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var
  ci, registro: integer;
  nombre, sexo: string;

  domicilio: string;
  INF110, LIN100, MAT101, FIS101, INF119: real;
begin

  ci := StrToInt(InputBox('Introduzca CI', '', ''));
  registro := StrToInt(InputBox('Introduzca Registro', '', ''));
  nombre := InputBox('Introduzca nombre', '', '');
  sexo := (InputBox('Introduzca SEXO', '', ''));
  domicilio := InputBox('Introduzca domicilio', '', '');
  INF110 := StrToFloat(InputBox('Introduzca nota INF110', '', ''));
  LIN100 := StrToFloat(InputBox('Introduzca nota LIN100', '', ''));
  MAT101 := StrToFloat(InputBox('Introduzca nota MAT101', '', ''));
  FIS101 := StrToFloat(InputBox('Introduzca nota FIS101', '', ''));
  INF119 := StrToFloat(InputBox('Introduzca nota INF119', '', ''));
  fa.insertarAlumno(ci, registro, nombre, sexo[1], domicilio, INF110, LIN100,
    MAT101, FIS101, INF119);

end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  fa.generarTexto();
  ShowMessage('Se genero el archivo texto');
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  fa.ordenarPorNombre();
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  fa.ordenarPorRegistro();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fileTrabajadorIndex:=0;
  fa := ArchivoBinarioAlumnos.crear('Alumnos', 'dat');
  fa.cerrar();
  ft:=ArchivoBinarioEmpleados.crear('Empleados','dat');
  ft.cerrar();
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.MenuItem11Click(Sender: TObject);

begin
ftMujeres.abrir();
 Edit1.Text:=ftMujeres.obtenerUnoCadena(fileTrabajadorIndex);
 ftMujeres.cerrar();
 fileTrabajadorIndex:=fileTrabajadorIndex+1;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  ft.abrir();
  ft.aCrearArchivoEmpleadosBase();
  ft.cerrar();
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  ftMujeres:=ft.separarMujeres();
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
var s:string;
begin
  s := ft.mostrarDatos(1);
  Memo1.Clear;
  Memo1.Append(s);
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
var abe:ArchivoBinarioEmpleados;
begin
  abe:=ft.mujeresMayorSueldo();
  Memo1.Clear;
  Memo1.Append(abe.mostrarDatos(1));
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
var i:integer;
begin
  i:=StrToInt(InputBox('Introduzca registro','',''));
  fa:=fa.eliminarUnRecordPorRegistro(i);


end;

end.
