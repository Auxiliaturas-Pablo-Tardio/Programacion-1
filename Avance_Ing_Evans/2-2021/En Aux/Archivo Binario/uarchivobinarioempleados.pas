unit UArchivoBinarioEmpleados;


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, URecordAlumnos,UArchivoTexto,URecordEmpleados;

type

  { ArchivoBinarioEmpleados }

  ArchivoBinarioEmpleados = class
    f: file of Empleado;
    nom, ext: string;
    modo: integer;
  public
    constructor crear(nombre: string; extNueva: string);
    procedure abrir();
    procedure cerrar();
    procedure setNombre(nombre: string);
    procedure setExt(extensionNueva: string);
    procedure escribirRecord(r: Empleado);
    procedure escribirEmpleado(nombre:string;sexo:char;cargo:string;sueldo:Real;moneda:string);
    procedure insertarAlumno(ci, registro: integer;
      nombre: string; sexo: char; domicilio: string; INF110, LIN100, MAT101, FIS101, INF119: real);
    function getNombreCompleto(): string;
    function getExt(): string;
    function leerRecord(): Empleado;
    function getRecord(pos:integer):Empleado;
    procedure setRecord(pos:integer;r:Empleado);
    function fin(): boolean;
    procedure aCrearArchivoEmpleadosBase();
    procedure eliminar();
    function mostrarDatos(cantidadPorLinea: integer): string;
    function accederPorRegistro(reg: integer): Empleado;
    function mostrarAccederPorRegistro(reg: integer): string;
    function generarTexto():Texto;
    function getDim():integer;
    procedure ordenarPorNombre();
    procedure ordenarPorRegistro();
    procedure intercambiar(a,b:integer); //Intercambia dos records
    function separarMujeres():ArchivoBinarioEmpleados;
    function obtenerUnoCadena(pos:integer):String;
    function mujeresMayorSueldo():ArchivoBinarioEmpleados;
  end;


implementation

{ ArchivoBinarioEmpleados }

constructor ArchivoBinarioEmpleados.crear(nombre: string; extNueva: string);
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

procedure ArchivoBinarioEmpleados.abrir();
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

procedure ArchivoBinarioEmpleados.cerrar();
begin
  Close(f);
  modo := 0;
end;

procedure ArchivoBinarioEmpleados.setNombre(nombre: string);
begin
  nom := nombre;
end;

procedure ArchivoBinarioEmpleados.setExt(extensionNueva: string);
begin
  ext := extensionNueva;
end;

procedure ArchivoBinarioEmpleados.escribirRecord(r: Empleado);
begin
  Write(f, r);
end;

procedure ArchivoBinarioEmpleados.escribirEmpleado(nombre: string; sexo: char;
  cargo: string; sueldo: Real; moneda: string);
var r:Empleado;
begin
  r.nombre:=nombre;
  r.sexo:=sexo;
  r.cargo:=cargo;
  r.sueldo:=sueldo;
  r.moneda:=moneda;
  escribirRecord(r);
end;



// Metodo para insertar un Empleado en la ultima posicion
procedure ArchivoBinarioEmpleados.insertarAlumno(ci, registro: integer;
  nombre: string; sexo: char; domicilio: string;
  INF110, LIN100, MAT101, FIS101, INF119: real);
begin
  abrir();
  while (not fin()) do
  begin
    leerRecord();
  end;
  // Esta en la ultima posicion
 // escribirEmpleado(ci, registro, nombre, sexo, domicilio, INF110, LIN100,
  //  MAT101, FIS101, INF119);
  cerrar();
end;

function ArchivoBinarioEmpleados.getNombreCompleto(): string;
begin
  Result := nom + '.' + ext;
end;

function ArchivoBinarioEmpleados.getExt(): string;
begin
  Result := ext;
end;

function ArchivoBinarioEmpleados.leerRecord(): Empleado;
var
  r: Empleado;
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

function ArchivoBinarioEmpleados.getRecord(pos: integer): Empleado;
begin
  Seek(f,pos);
  Result:=leerRecord();
end;

procedure ArchivoBinarioEmpleados.setRecord(pos: integer;r:Empleado);
begin
  Seek(f,pos);
  escribirRecord(r);
end;

function ArchivoBinarioEmpleados.fin(): boolean;
begin
  Result := EOF(f);
end;

procedure ArchivoBinarioEmpleados.aCrearArchivoEmpleadosBase();
var
  r: Empleado;
begin

  escribirEmpleado('Juan Perez', 'H', 'Tecnico', 500, '$us');
  escribirEmpleado('Josefina Mojica', 'M', 'Secretaria', 200, '$us');
  escribirEmpleado('Maria Nuñez', 'M', 'Experto', 300, '$us');
  escribirEmpleado('Marco Condori', 'H', 'Jefe', 1000, '$us');
  escribirEmpleado('Ana Maria', 'M', 'Profesional', 800, '$us');
end;



procedure ArchivoBinarioEmpleados.eliminar();
begin

end;

function ArchivoBinarioEmpleados.mostrarDatos(cantidadPorLinea: integer): string;
var
  s: string;
  r: Empleado;
  c: integer;
begin
  c := 0;
  s := 'Nombre │Sexo│ Cargo│Sueldo│Moneda' +
    Chr(10) + Chr(13);
  //abro el archivo
  abrir();
  //recorro linea por linea
  while (not fin()) do
  begin
    r := leerRecord();
    s := s + r.nombre + '-';
    s := s + r.sexo + '-';
    s := s + r.cargo + '-'; //alt+179
    s := s + FloatToStr(r.sueldo) + '-';
    s := s + r.moneda + '-';


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

function ArchivoBinarioEmpleados.accederPorRegistro(reg: integer): Empleado;
var
  rActual, rRes: Empleado;

begin
  abrir();
  while (not fin()) do
  begin
    //leer linea de archivo
    rActual := leerRecord();
   // if (reg = rActual.registro) then
   // begin
   //   rRes := rActual;
  //  end;
  end;
  cerrar();
  Result := rRes;
end;

function ArchivoBinarioEmpleados.mostrarAccederPorRegistro(reg: integer): string;
var
  r: Empleado;
  s: string;
begin
  //r := accederPorRegistro(reg);
  //s := 'CI, Reg, Nombre, Domicilio,notas: INF110 ,LIN100,MAT101 ,FIS101 ,INF119 │ ' +
  //  Chr(10) + Chr(13);
  //s := s + IntToStr(r.ci) + '-';
  //s := s + IntToStr(r.registro) + '-';
  //s := s + r.nombre + '-'; //alt+179
  //s := s + r.sexo + '-';
  //s := s + r.domicilio + '-';
  //s := s + FloatToStr(r.INF110) + '-';
  //s := s + FloatToStr(r.LIN100) + '-';
  //s := s + FloatToStr(r.MAT101) + '-';
  //s := s + FloatToStr(r.FIS101) + '-';
  //s := s + FloatToStr(r.INF119);
  //Result := s;
end;

function ArchivoBinarioEmpleados.generarTexto(): Texto;
var r:Empleado;
    at:Texto;
    lineaAEscribir:String;
begin
 // at:=Texto.crear('AlumnosProgramacion','txt');
 //
 // abrir();
 // at.escribirLinea('CI  │  Nombre   │  Domicilio');
 // while(not fin())do
 // begin
 //
 //   r:=leerRecord();
 //   lineaAEscribir:=IntToStr(r.ci)+'  │  '+r.nombre +'  │ '+r.domicilio;
 //   at.escribirLinea(lineaAEscribir);
 // end;
 //cerrar();
 //at.cerrar();
 //Result:=at;
end;

function ArchivoBinarioEmpleados.getDim(): integer;
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

procedure ArchivoBinarioEmpleados.ordenarPorNombre();
var i,j:integer;
    d:integer;
    alumJ,alumI:Empleado;
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

procedure ArchivoBinarioEmpleados.ordenarPorRegistro();
var i,j:integer;
    d:integer;
    alumJ,alumI:Empleado;
begin
//  d:=getDim();
//  abrir();
//  for i:=0 to d-1 do
//  begin
//    for j:=i+1 to d-1 do
//    begin
//         alumJ:=getRecord(j);
//         alumI:=getRecord(i);
//         if(alumJ.registro>alumI.registro) then
//         begin
//              intercambiar(i,j);
//         end;
//    end;
//  end;
//cerrar();
end;

procedure ArchivoBinarioEmpleados.intercambiar(a, b: integer);
var ara,arb,x:Empleado;
begin
   x:=getRecord(a);
   setRecord(a,getRecord(b));
   setRecord(b,x);
end;

function ArchivoBinarioEmpleados.separarMujeres(): ArchivoBinarioEmpleados;
var ra:Empleado;
    archivoDos:ArchivoBinarioEmpleados;
begin
   //ra es el empleado actual
  archivoDos:=ArchivoBinarioEmpleados.crear('EmpleadAs','dat');
  abrir();
  while(not fin()) do
  begin
    ra:=leerRecord();
    if(ra.sexo='M')then
    begin
         archivoDos.escribirRecord(ra);
    end;
  end;
  cerrar();
  archivoDos.cerrar();
Result:=archivoDos;
end;

function ArchivoBinarioEmpleados.obtenerUnoCadena(pos: integer): String;
var s:string;
    r:Empleado;

begin
   r:=getRecord(pos);
   s:=r.nombre+'│'+r.sexo+'│'+r.cargo+'│'+FloatToStr(r.sueldo)+'│'+r.moneda;
   Result:=s;
end;

function ArchivoBinarioEmpleados.mujeresMayorSueldo(): ArchivoBinarioEmpleados;
var auxMujeres:ArchivoBinarioEmpleados;
    i,d:integer;
    a:ArchivoBinarioEmpleados;

    rMayorA,rMayorB,rTemporal:Empleado;
begin

     auxMujeres:=separarMujeres();
     d:=auxMujeres.getDim();
     auxMujeres.abrir();
     rMayorA:=auxMujeres.getRecord(0);
     for i:=1  to d-1 do
      begin
     rTemporal:=auxMujeres.getRecord(i);

        if(rTemporal.sueldo>rMayorA.sueldo)then
        begin
             rMayorA:=rTemporal;
        end;
     end;
     rMayorB:=rMayorA;
     rMayorB.sueldo:=-1;
     for i:=1  to d-1 do
      begin
     rTemporal:=auxMujeres.getRecord(i);

        if((rTemporal.sueldo <>rMayorA.sueldo))then
        begin
             if((rTemporal.sueldo>rMayorB.sueldo))then
             rMayorB:=rTemporal;
        end;
     end;
     auxMujeres.cerrar();
     a:=ArchivoBinarioEmpleados.crear('MujeresConmayorSueldo','dat');
     a.escribirRecord(rMayorA);
     a.escribirRecord(rMayorB);
     a.cerrar();
Result:=a;
end;

end.

