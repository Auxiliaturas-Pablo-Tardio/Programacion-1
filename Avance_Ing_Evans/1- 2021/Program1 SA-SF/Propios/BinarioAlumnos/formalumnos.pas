unit FormAlumnos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,UArchivoAlumnos,UPersonaRecord;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    AgregarDatosButton: TButton;
    Edit111DomButton: TButton;
    NuevoArchivoButton: TButton;
    procedure AgregarDatosButtonClick(Sender: TObject);
    procedure Edit111DomButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NuevoArchivoButtonClick(Sender: TObject);
  private

  public
    faa:ArchivoAlumnos;

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
begin
  faa:=ArchivoAlumnos.create;
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

