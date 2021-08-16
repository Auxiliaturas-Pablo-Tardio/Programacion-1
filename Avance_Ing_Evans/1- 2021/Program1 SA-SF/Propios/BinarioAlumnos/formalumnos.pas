unit FormAlumnos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  UArchivoAlumnos, UPersonaRecord,UArchivoEmpleados,UEmpleadoRecord;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    AgregarDatosButton: TButton;
    Edit111DomButton: TButton;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    NuevoArchivoButton: TButton;
    procedure AgregarDatosButtonClick(Sender: TObject);
    procedure Edit111DomButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure NuevoArchivoButtonClick(Sender: TObject);
  private

  public
    faa:ArchivoAlumnos;
    archivoBE:ArchivoBEmpleado;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.NuevoArchivoButtonClick(Sender: TObject);
var s:string;
r:Persona;
i: Integer;
begin
  s:=InputBox('Introduzca nombre del archivo Persona','','');
  faa.setNom(s);
  faa.setExt('dat');
  ShowMessage(faa.getNom());
  faa.crear();
  //Persona 1
  r.CI :=111;
  r.Reg:=202001;
  r.Nombre:='Alumno01';
  r.Domicilio:='Av. Busch';
  faa.escribirPersona(r);
  r.CI :=222;
  r.Reg:=202001;
  r.Nombre:='Alumno02';
  r.Domicilio:='Av. Busch';
  faa.escribirPersona(r);
  r.CI :=333;
  r.Reg:=202001;
  r.Nombre:='Alumno03';
  r.Domicilio:='Av. Busch';
  faa.escribirPersona(r);
  r.CI :=444;
  r.Reg:=202001;
  r.Nombre:='Alumno04';
  r.Domicilio:='Av. Busch';
  faa.escribirPersona(r);
  faa.cerrar();
end;

procedure TForm1.FormCreate(Sender: TObject);
var re:Empleado;
begin
  faa:=ArchivoAlumnos.create;
  //ARCHIVO BINARIO EMPLEADO

  archivoBE:=ArchivoBEmpleado.create;
  archivoBe.setNom('sueldo');
  archivoBe.setExt('dat');
  archivoBE.crear();
  re.nombre:='Juan Perez';
  re.sexo:='H';
  re.cargo:='Tecnico';
  re.sueldo:=500;
  re.moneda:='$us';
  archivoBE.escribirEmpleado(re);


  re.nombre:='Josefina Mojica';
  re.sexo:='M';
  re.cargo:='Tecnico';
  re.sueldo:=200;
  re.moneda:='$us';

  archivoBE.escribirEmpleado(re);

  re.nombre:='Maria Nuñez';
  re.sexo:='M';
  re.cargo:='Tecnico';
  re.sueldo:=300;
  re.moneda:='$us';

  archivoBE.escribirEmpleado(re);


  re.nombre:='Marco Condori';
  re.sexo:='H';
  re.cargo:='Tecnico';
  re.sueldo:=1000;
  re.moneda:='$us';

  archivoBE.escribirEmpleado(re);


  re.nombre:='Ana Maria';
  re.sexo:='M';
  re.cargo:='Tecnico';
  re.sueldo:=800;
  re.moneda:='$us';

  archivoBE.escribirEmpleado(re);
  archivoBE.cerrar();
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  archivoBE.listarMujeres(ListBox1);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  archivoBE.listarDosSueldos(ListBox1);
end;

procedure TForm1.AgregarDatosButtonClick(Sender: TObject);
var
r:Persona;
begin
     r.CI:=StrToInt(InputBox('Introduzca el CI','',''));
     r.Reg:=StrToInt(InputBox('Introduzca el Registro','',''));
     r.Nombre:=(InputBox('Introduzca el Nombre','',''));
     r.Domicilio:=(InputBox('Introduzca el Domicilio','',''));

     faa.abrir();
     faa.escribirPersona(r);
     faa.cerrar();
end;

procedure TForm1.Edit111DomButtonClick(Sender: TObject);
var r:Persona;
dom:string ;
pos:integer;
begin
     dom:=InputBox('Introduzca Domicilio','','');
     pos:=faa.posPersonaCI(111);
     faa.abrir();
     faa.saltarALinea(pos);
     r:=faa.leerRecord();
     r.Domicilio:=dom;
     faa.saltarALinea(pos);
     faa.escribirPersona(r);
     faa.cerrar();
end;

end.

