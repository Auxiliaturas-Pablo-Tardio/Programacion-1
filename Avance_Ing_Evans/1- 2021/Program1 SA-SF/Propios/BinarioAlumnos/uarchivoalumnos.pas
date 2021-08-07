unit UArchivoAlumnos;

{$mode objfpc}{$H+}


interface
uses
  Classes, SysUtils,UPersonaRecord;
  type

    { ArchivoAlumnos }

    ArchivoAlumnos=class
     private



         f: file of Persona;
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
         procedure escribirPersona(r: Persona);
         function leerRecord():Persona;
         function fin ():boolean;
          procedure cerrar();
          procedure saltarALinea(pos:integer);
          function posPersonaCI(ci:integer):integer;

  end;



implementation

{ ArchivoAlumnos }

constructor ArchivoAlumnos.create();
begin
 nom:='texto1';
 ext:='txt';
 //modo:=3;
end;

procedure ArchivoAlumnos.setNom(n: string);
begin
  nom:=n;
end;

function ArchivoAlumnos.getNom(): string;
begin
   Result:=nom+'.'+ext;
end;

procedure ArchivoAlumnos.setExt(e: string);
begin
  ext:=e;
end;

function ArchivoAlumnos.getExt(): string;
begin
   Result:=ext;
end;

procedure ArchivoAlumnos.crear();
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

procedure ArchivoAlumnos.abrir();
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
  //modo:=1;//Lectura
end;

procedure ArchivoAlumnos.escribirPersona(r: Persona);

begin
   write(f,r);
end;

function ArchivoAlumnos.leerRecord(): Persona;
var
 r:Persona;
begin
   //if(modo=1)then
   //begin
        read(f,r);
        result:=r;
   //end
   //else
   //result:=null;

end;

function ArchivoAlumnos.fin(): boolean;
begin
  result:=eof(f);
end;

procedure ArchivoAlumnos.cerrar();
begin
  close(f);
end;
 {{Salta a la linea que se pone por parametro, pero hace un seek-1}}
procedure ArchivoAlumnos.saltarALinea(pos: integer);
begin
  Seek(f,pos-1);
end;

function ArchivoAlumnos.posPersonaCI(ci: integer): integer;
 var
 r:Persona;
 pos,i:integer;
begin
   pos:=0;
   i:=0 ;
     //Buscamos la persona
     abrir();
     while(not fin())do
     begin
          i:=i+1;
          r:=leerRecord();
          if(r.CI=ci) then
          begin
             pos:=i;

          end;
     end;
     cerrar();
     Result:=pos;
end;

end.
        //
