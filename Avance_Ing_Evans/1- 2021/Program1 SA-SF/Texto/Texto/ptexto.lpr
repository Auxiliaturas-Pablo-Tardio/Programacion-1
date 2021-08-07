program ptexto;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, uTexto
  { you can add units after this };
var
  f:text;
  fnom,cad:string;
begin
  fnom:='texto1.txt';
  writeln('Creando Archivo Texto...!!!');
  assign(f,fnom);
  {$I-}
  rewrite(f);
  {$I+}
  if(IOResult<>0)then
  begin
    writeln('Error en Creacion de Archivo...!!!');
    exit;
  end;
  writeln(f,'1123490');
  writeln(f,'Evans Balcazar Veizaga');
  writeln(f,'Ingenieria Informatica');
  close(f);
  writeln('Cerrando Archivo Texto...!!!');
  readln;
  //Codigo para leer un archivo creado o existente
  writeln('Abriendo Archivo Texto...!!!');
  assign(f,fnom);
  {$I-}
  reset(f);
  {$I+}
  if(IOResult<>0)then
  begin
    writeln('Error en Apertura de Archivo...!!!');
    exit;
  end;
  while(NOT eof(f))do
  begin
    readln(f,cad);
    writeln(cad);
  end;
  close(f);
  writeln('Cerrando Archivo Texto...!!!');
  readln;
end.

