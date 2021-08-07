unit uTexto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type

    { Texto }

    Texto=
      Class
      private
        f:text;
        nom,ext:string;
        modo:integer;
        public
         constructor create();
         procedure setNom(n:string);
         function getNom():string;
         procedure setExt(e:string);
         function getExt():string;
         procedure crear();
         procedure abrir();
    procedure escribirChar(c:char);
    procedure escribirLinea(ln:string);
    function leerChar():char;
    function leerLinea():string;
    function fin ():boolean;
     procedure cerrar();

    end;

implementation

{ Texto }

constructor Texto.create();
begin
  nom:='texto1';
  ext:='txt';
  modo:=3;
end;

procedure Texto.setNom(n: string);
begin
  nom:=n;
end;

function Texto.getNom(): string;
begin
   result:=nom+'.'+ext;
end;

procedure Texto.setExt(e: string);
begin
   ext:=e;
end;

function Texto.getExt(): string;
begin
     result:=ext;
end;

procedure Texto.crear();
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
  modo:=0;//escritura
end;

procedure Texto.abrir();
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
   modo:=1;//Lectura
end;

procedure Texto.escribirChar(c: char);
begin
   if(modo=0)then
   write(f,c);

end;

procedure Texto.escribirLinea(ln: string);
begin
    if(modo=0)then
    writeln(f,ln);
end;

function Texto.leerChar(): char;
var
  c:char;
begin
    if(modo=1)then
    begin
      read(f,c);
    result:=c;
    end
    else
    result:=null;

end;

function Texto.leerLinea(): string;
var
  cad:string;
begin
    if(modo=1)then
    begin
         readln(f,cad);
         result:=cad;
    end
    else
    result:=null;

end;

function Texto.fin(): boolean;
begin
   result:=eof(f);
end;

procedure Texto.cerrar();
begin
  close(f);
end;



end.

