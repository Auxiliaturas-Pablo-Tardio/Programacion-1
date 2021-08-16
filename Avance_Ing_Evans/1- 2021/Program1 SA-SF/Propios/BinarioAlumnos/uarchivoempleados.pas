unit UArchivoEmpleados;


{$mode objfpc}{$H+}


interface
uses
  Classes, SysUtils,UEmpleadoRecord,Forms, Graphics,StdCtrls;
  type

    { ArchivoEmpleados }

    { ArchivoBEmpleado }

    ArchivoBEmpleado=class
     private



         f: file of Empleado;
         nom: String;
         ext: String;
     public
        constructor create();
        procedure setNom(n:string);
        function getNom():string;
        procedure setExt(e:string);
        function getExt():string;
        procedure crear();
        procedure abrir();
         procedure escribirEmpleado(r: Empleado);
         function leerEmpleado():Empleado;
         function fin ():boolean;
          procedure cerrar();
          procedure saltarALinea(pos:integer);
          function posPersonaCI(ci:integer):integer;
          procedure listarMujeres(lista:TListBox);
          procedure listarDosSueldos(lista:TListBox);
  end;



implementation

{ ArchivoBEmpleado }

constructor ArchivoBEmpleado.create();
begin
 nom:='empleadosDefecto';
 ext:='dat';
end;

procedure ArchivoBEmpleado.setNom(n: string);
begin
   nom:=n;
end;

function ArchivoBEmpleado.getNom(): string;
begin
   Result:=nom+'.'+ext;
end;

procedure ArchivoBEmpleado.setExt(e: string);
begin
   ext:=e;
end;

function ArchivoBEmpleado.getExt(): string;
begin
   Result:=ext;
end;

procedure ArchivoBEmpleado.crear();
begin
    assign(f,getNom());
 {$I-}
 rewrite(f);
 {$I+}
 If(IOResult<>0) then
 begin
   writeln('Text::crear:error al crear TXT!');
   exit;
 end;
 //modo:=0;//escritura
end;

procedure ArchivoBEmpleado.abrir();
begin
   assign(f,getNom());
  {$I-}
  reset(f);
  {$I+}
  if(IOResult<>0)then
  begin
    writeln('Texto:: abrir : error al abrir TXT');
    exit;
  end;
end;

procedure ArchivoBEmpleado.escribirEmpleado(r: Empleado);
begin
   write(f,r);
end;

function ArchivoBEmpleado.leerEmpleado(): Empleado;
var
 r:Empleado;
begin
   //if(modo=1)then
   //begin
        read(f,r);
        result:=r;
end;

function ArchivoBEmpleado.fin(): boolean;
begin
  result:=eof(f);
end;

procedure ArchivoBEmpleado.cerrar();
begin
  close(f);
end;

procedure ArchivoBEmpleado.saltarALinea(pos: integer);
begin
  Seek(f,pos-1);
end;

function ArchivoBEmpleado.posPersonaCI(ci: integer): integer;
begin

end;

procedure ArchivoBEmpleado.listarMujeres(lista: TListBox);
var r:Empleado; //record
    s:string;
begin
  lista.Items.Clear;
  abrir();
  while(not fin()) do
  begin
    r:=leerEmpleado();
    if(r.sexo='M')then
    begin
      s:=r.nombre+' '+r.sexo+' '+r.cargo+' '+FloatToStr(r.sueldo)+' '+ r.moneda;
      lista.Items.Add(s);
    end;
  end;
  cerrar();
end;

procedure ArchivoBEmpleado.listarDosSueldos(lista: TListBox);
var r:Empleado;
    s1,s2:Real;
begin
  abrir();
  s1:=0;
  lista.Items.Clear;
  while(not fin())do
  begin
    r:=leerEmpleado();
    if((r.sueldo>s1)and (r.sexo='M'))then
    begin
      s1:=r.sueldo;
    end;
  end;
  lista.items.add(FloatToStr(s1));
  cerrar();

  abrir();
  while(not fin())do
  begin
    r:=leerEmpleado();
    if((r.sueldo>s2)and (r.sexo='M') and(r.sueldo<s1))then
    begin
      s2:=r.sueldo;
    end;
  end;
  lista.items.add(FloatToStr(s2));
  cerrar();
end;

end.

