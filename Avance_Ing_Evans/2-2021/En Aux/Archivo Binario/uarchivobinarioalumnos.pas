unit UArchivoBinarioAlumnos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, URecordAlumnos,UArchivoTexto;

type

  { ArchivoBinarioAlumnos }

  ArchivoBinarioAlumnos = class
    f: file of Alumno;
    nom, ext: string;
    modo: integer;
  public
    constructor crear(nombre: string; extNueva: string);
    procedure abrir();
    procedure cerrar();
    procedure setNombre(nombre: string);
    procedure setExt(extensionNueva: string);
    procedure escribirRecord(r: Alumno);
    procedure escribirAlumno(ci, registro: integer;
      nombre: string; sexo: char; domicilio: string; INF110, LIN100, MAT101, FIS101, INF119: real);
    procedure insertarAlumno(ci, registro: integer;
      nombre: string; sexo: char; domicilio: string; INF110, LIN100, MAT101, FIS101, INF119: real);
    function getNombreCompleto(): string;
    function getExt(): string;
    function leerRecord(): Alumno;
    function getRecord(pos:integer):Alumno;
    procedure setRecord(pos:integer;r:Alumno);
    function fin(): boolean;
    procedure aCrearArchivoAlumnosBase();
    procedure eliminar();
    function eliminarUnRecordPorRegistro(reg:Integer):ArchivoBinarioAlumnos;
    function mostrarDatos(cantidadPorLinea: integer): string;
    function accederPorRegistro(reg: integer): Alumno;
    function mostrarAccederPorRegistro(reg: integer): string;
    function generarTexto():Texto;
    function getDim():integer;
    procedure ordenarPorNombre();
    procedure ordenarPorRegistro();
    procedure intercambiar(a,b:integer); //Intercambia dos records
  end;


implementation

{ ArchivoBinarioAlumnos }

constructor ArchivoBinarioAlumnos.crear(nombre: string; extNueva: string);
begin
  //0:=LECTURA
  //1:=Escritura
  nom := nombre;
  ext := extNueva;
  modo := 3;
  Assign(f, getNombreCompleto());
    {$I-}
  rewrite(f);
  //rewrite= si existe un archivo con el mismo nombre, lo sobreescribe (no debe estar abierto)
  //SI NO EXISTE lo crea
    {$I+}
  if (IOResult <> 0) then
  begin
    WriteLn('ERROR AL CREAR EL ARCHIVO DE REAL :' + getNombreCompleto());

  end;

  modo := 0; //LECTURA
end;

procedure ArchivoBinarioAlumnos.abrir();
begin
  Assign(f, getNombreCompleto());
  {$I-}
  reset(f);
  {$I+}
  if (IOResult <> 0) then
  begin
    WriteLn('ERROR AL LEER/ABRIR EL ARCHIVO DE TEXTO :' + getNombreCompleto());
    exit;
  end;
  modo := 1; //Escritura
end;

procedure ArchivoBinarioAlumnos.cerrar();
begin
  Close(f);
  modo := 0;
end;

procedure ArchivoBinarioAlumnos.setNombre(nombre: string);
begin
  nom := nombre;
end;

procedure ArchivoBinarioAlumnos.setExt(extensionNueva: string);
begin
  ext := extensionNueva;
end;

procedure ArchivoBinarioAlumnos.escribirRecord(r: Alumno);
begin
  Write(f, r);
end;

procedure ArchivoBinarioAlumnos.escribirAlumno(ci, registro: integer;
  nombre: string; sexo: char; domicilio: string;
  INF110, LIN100, MAT101, FIS101, INF119: real);
var
  r: Alumno;
begin
  r.ci := ci;
  r.registro := registro;
  r.nombre := nombre;
  r.sexo := sexo;
  r.domicilio := domicilio;
  r.INF110 := INF110;
  r.LIN100 := LIN100;
  r.MAT101 := MAT101;
  r.FIS101 := FIS101;
  r.INF119 := INF119;
  escribirRecord(r);
end;

// Metodo para insertar un alumno en la ultima posicion
procedure ArchivoBinarioAlumnos.insertarAlumno(ci, registro: integer;
  nombre: string; sexo: char; domicilio: string;
  INF110, LIN100, MAT101, FIS101, INF119: real);
begin
  abrir();
  while (not fin()) do
  begin
    leerRecord();
  end;
  // Esta en la ultima posicion
  escribirAlumno(ci, registro, nombre, sexo, domicilio, INF110, LIN100,
    MAT101, FIS101, INF119);
  cerrar();
end;

function ArchivoBinarioAlumnos.getNombreCompleto(): string;
begin
  Result := nom + '.' + ext;
end;

function ArchivoBinarioAlumnos.getExt(): string;
begin
  Result := ext;
end;

function ArchivoBinarioAlumnos.leerRecord(): Alumno;
var
  r: Alumno;
begin
  if (modo = 1) then
  begin
    Read(f, r); //s:=leerLinea(archivo );
    Result := r;

  end
  else
  begin
    Result := r;

  end;

end;

function ArchivoBinarioAlumnos.getRecord(pos: integer): Alumno;
begin
  Seek(f,pos);
  Result:=leerRecord();
end;

procedure ArchivoBinarioAlumnos.setRecord(pos: integer;r:Alumno);
begin
  Seek(f,pos);
  escribirRecord(r);
end;

function ArchivoBinarioAlumnos.fin(): boolean;
begin
  Result := EOF(f);
end;

procedure ArchivoBinarioAlumnos.aCrearArchivoAlumnosBase();
var
  r: Alumno;
begin

  escribirAlumno(111, 202001, 'Alumno01', 'H', 'Av. Busch', 70, 80, 50, 20, 80);
  escribirAlumno(222, 202002, 'Alumno02', 'H', 'Av. Centenario', 80, 50, 100, 30, 90);
  escribirAlumno(333, 202003, 'Alumno03', 'H', 'Av. Santos Dumont', 50, 90, 80, 90, 70);
  escribirAlumno(444, 202004, 'Alumno04', 'M', 'Av. Lujan', 90, 80, 80, 70, 60);

end;



procedure ArchivoBinarioAlumnos.eliminar();
begin

end;

function ArchivoBinarioAlumnos.eliminarUnRecordPorRegistro(reg:Integer):ArchivoBinarioAlumnos;
var
    abx:ArchivoBinarioAlumnos;
    r:Alumno;
begin

  abx:=ArchivoBinarioAlumnos.crear('Otros','dat');
  abrir();
  while( not fin())do
  begin
     r:=leerRecord();
     if( r.registro<>reg)then
     begin
        abx.escribirRecord(r);
     end;
  end;
  abx.cerrar();
  cerrar();
 Result:=abx;
end;

function ArchivoBinarioAlumnos.mostrarDatos(cantidadPorLinea: integer): string;
var
  s: string;
  r: Alumno;
  c: integer;
begin
  c := 0;
  s := 'CI, Reg, Nombre, Domicilio,notas: INF110 ,LIN100,MAT101 ,FIS101 ,INF119' +
    Chr(10) + Chr(13);
  //abro el archivo
  abrir();
  //recorro linea por linea
  while (not fin()) do
  begin
    r := leerRecord();
    s := s + IntToStr(r.ci) + '-';
    s := s + IntToStr(r.registro) + '-';
    s := s + r.nombre + '-'; //alt+179
    s := s + r.sexo + '-';
    s := s + r.domicilio + '-';
    s := s + FloatToStr(r.INF110) + '-';
    s := s + FloatToStr(r.LIN100) + '-';
    s := s + FloatToStr(r.MAT101) + '-';
    s := s + FloatToStr(r.FIS101) + '-';
    s := s + FloatToStr(r.INF119);


    c := c + 1;
    if (c = cantidadPorLinea) then
    begin
      s := s + Chr(10) + Chr(13) + '│';
      c := 0;
    end;

  end;
  //cierro el archivo
  cerrar();
  Result := s;
end;

function ArchivoBinarioAlumnos.accederPorRegistro(reg: integer): Alumno;
var
  rActual, rRes: Alumno;

begin
  abrir();
  while (not fin()) do
  begin
    //leer linea de archivo
    rActual := leerRecord();
    if (reg = rActual.registro) then
    begin
      rRes := rActual;
    end;
  end;
  cerrar();
  Result := rRes;
end;

function ArchivoBinarioAlumnos.mostrarAccederPorRegistro(reg: integer): string;
var
  r: Alumno;
  s: string;
begin
  r := accederPorRegistro(reg);
  s := 'CI, Reg, Nombre, Domicilio,notas: INF110 ,LIN100,MAT101 ,FIS101 ,INF119 │ ' +
    Chr(10) + Chr(13);
  s := s + IntToStr(r.ci) + '-';
  s := s + IntToStr(r.registro) + '-';
  s := s + r.nombre + '-'; //alt+179
  s := s + r.sexo + '-';
  s := s + r.domicilio + '-';
  s := s + FloatToStr(r.INF110) + '-';
  s := s + FloatToStr(r.LIN100) + '-';
  s := s + FloatToStr(r.MAT101) + '-';
  s := s + FloatToStr(r.FIS101) + '-';
  s := s + FloatToStr(r.INF119);
  Result := s;
end;

function ArchivoBinarioAlumnos.generarTexto(): Texto;
var r:Alumno;
    at:Texto;
    lineaAEscribir:String;
begin
  at:=Texto.crear('AlumnosProgramacion','txt');

  abrir();
  at.escribirLinea('CI  │  Nombre   │  Domicilio');
  while(not fin())do
  begin

    r:=leerRecord();
    lineaAEscribir:=IntToStr(r.ci)+'  │  '+r.nombre +'  │ '+r.domicilio;
    at.escribirLinea(lineaAEscribir);
  end;
 cerrar();
 at.cerrar();
 Result:=at;
end;

function ArchivoBinarioAlumnos.getDim(): integer;
var c:integer;
begin
 c:=0;
  abrir();
  while(not fin())do
  begin
    leerRecord();
    c:=c+1;
  end;
  cerrar();
  Result:=c;
end;

procedure ArchivoBinarioAlumnos.ordenarPorNombre();
var i,j:integer;
    d:integer;
    alumJ,alumI:Alumno;
begin
  d:=getDim();
  abrir();
  for i:=0 to d-1 do
  begin
    for j:=i+1 to d-1 do
    begin
         alumJ:=getRecord(j);
         alumI:=getRecord(i);
         if(alumJ.nombre>alumI.nombre) then
         begin
              intercambiar(i,j);
         end;
    end;
  end;
cerrar();
end;

procedure ArchivoBinarioAlumnos.ordenarPorRegistro();
var i,j:integer;
    d:integer;
    alumJ,alumI:Alumno;
begin
  d:=getDim();
  abrir();
  for i:=0 to d-1 do
  begin
    for j:=i+1 to d-1 do
    begin
         alumJ:=getRecord(j);
         alumI:=getRecord(i);
         if(alumJ.registro>alumI.registro) then
         begin
              intercambiar(i,j);
         end;
    end;
  end;
cerrar();
end;

procedure ArchivoBinarioAlumnos.intercambiar(a, b: integer);
var ara,arb,x:Alumno;
begin
   x:=getRecord(a);
   setRecord(a,getRecord(b));
   setRecord(b,x);
end;

end.
