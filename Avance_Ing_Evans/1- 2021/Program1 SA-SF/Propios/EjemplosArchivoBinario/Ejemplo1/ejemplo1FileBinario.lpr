program ejemplo1FileBinario;

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
   assign(f,nom);
   {$I-}
        rewrite(f);
   {$I+}
   if(IOResult<>0)then
   begin
      writeln('Erro al Archivo TIPO Persona');
      exit;
   end;
   writeln('Cuantas Personas introducira');
   readln(n);
   for i:=1 to n do
   begin
      WriteLn('Introducir Persona #',i);
      Writeln('Carnet De identidad; ');
      Readln(R.ci);
      Writeln('Nombre');
      Readln(R.nom);
      Writeln('Apellidos');
      Readln(R.app);
      Writeln(' Int Sexo');
      readln(R.sex);
      write(f,R);

   end;
   close(f);
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
   while (not EOF(f))do
   begin
        Read(f,R);
        writeln('CI:',R.ci,'Nomb',R.nom+R.app,'Sex;',R.sex);
   end;
   close(f);
end.

