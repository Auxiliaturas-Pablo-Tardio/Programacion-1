program ptipo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
type
  Persona=Record
    ci:integer;
    nombre:string[150];
    sexo:char;
  end;

var
  f:file of Persona;
  reg:persona;
  fnom:string;
  i,n:integer;
begin
  fnom:='persona.dat';
  {assign(f,fnom);
  {$I-}
  rewrite(f);
  {$I+}
  if(IOResult<>0)then
  begin
    writeln('Error de Creacion de Archivo con TIPO...!!!');
    exit;
  end;
  write('Cuantos Registros : ');
  readln(n);
  for i:=1 to n do
  begin
    write('CI : ');
    readln(reg.ci);
    write('Nombre Completo : ');
    readln(reg.nombre);
    write('Sexo : ');
    readln(reg.sexo);
    write(f,reg);
  end;
  close(f);
  readln;}
  //Leer archivo con tipo
  {assign(f,fnom);
  {$I-}
  reset(f);
  {$I+}
  if(IOResult<>0)then
  begin
    writeln('Error de Apertura de Archivo con TIPO...!!!');
    exit;
  end;
  writeln('Listado de Registros : ');
  while(NOT eof(f))do
  begin
    read(f,reg);
    writeln('CI : ',reg.ci);
    writeln('Nombre Completo : ',reg.nombre);
    writeln('Sexo : ',reg.sexo);
  end;
  close(f);
  readln;}
  assign(f,fnom);
  {$I-}
  reset(f);
  {$I+}
  if(IOResult<>0)then
  begin
    writeln('Error de Apertura de Archivo con TIPO...!!!');
    exit;
  end;
  write('Que registro quiere ver : ');
  readln(n);
  seek(f,n-1);
  read(f,reg);
  writeln('CI : ',reg.ci);
  writeln('Nombre Completo : ',reg.nombre);
  writeln('Sexo : ',reg.sexo);
  close(f);
  readln;
end.

