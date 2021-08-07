program Ejemplo2LeerFileBinario;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,Sysutils
  { you can add units after this };
type
  Persona=Record
     ci: integer;
     nom: String[30];
     app: String [40];
     sex:char;
  end;
var
   f: file of Persona;
   nom: String;
   i,n: integer;
   R:Persona;
begin
   nom:='Persona.dat';
   //ABRIR ARCHIVO
   assign(f,nom);
   {$I-}
   reset(f);
   {$I+}
   if(IOResult<>0)then
   begin
     writeln('Texto:: abrir : error al abrir TXT');
     exit;
   end;
   writeln('Comenzamos a leer');
   while (not EOF(f))do
   begin
        Read(f,R);
        writeln('CI:',R.ci,'Nomb',R.nom+R.app,'Sex;',R.sex);
   end;

   close(f);
   readln();
end.
