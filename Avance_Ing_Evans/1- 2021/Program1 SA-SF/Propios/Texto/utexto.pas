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
      procedure cifrar01();
      procedure cifrarSustitucion();
      procedure descifrarSustitucion();
      procedure descifrar01();
      function cifrarUnaLetra(c:char):char;
      function cifrarLetraSustitucion(c:char):char;
      function descifrarLetraSustitucion(c:char):char;
       function descifrarUnaLetra(c:char):char;
       function invertirCadena(s:string):String;
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

procedure Texto.cifrar01();
var
  linea:String;
  c,numeroDeLineas,i:integer;

  arreglo: Array[1..255] of String;
begin
  abrir();
   numeroDeLineas:=0;
  while(not fin()) do
  begin
     linea:=leerLinea();
     c:=1;
     while(c<=length(linea))do
     begin
        linea[c]:=cifrarUnaLetra(linea[c]);
        c:=c+1;
     end;
     numeroDeLineas:=numeroDeLineas+1;
     arreglo[numeroDeLineas]:= linea;
  end;
  cerrar();
  crear();
  c:=1;
  while(c<=numeroDeLineas) do
  begin
     escribirLinea(arreglo[c]);
     c:=c+1;
  end;
  cerrar();
end;

procedure Texto.cifrarSustitucion();
var
  linea:String;
  c,numeroDeLineas,i:integer;

  arreglo: Array[1..255] of String;
begin
  abrir();
   numeroDeLineas:=0;
  while(not fin()) do
  begin
     linea:=leerLinea();
     c:=1;
     while(c<=length(linea))do
     begin
        linea[c]:=cifrarLetraSustitucion(linea[c]);
        c:=c+1;
     end;
     numeroDeLineas:=numeroDeLineas+1;
     linea:=invertirCadena(linea);
     arreglo[numeroDeLineas]:= linea;
  end;
  cerrar();
  crear();
  c:=1;
  while(c<=numeroDeLineas) do
  begin
     escribirLinea(arreglo[c]);
     c:=c+1;
  end;
  cerrar();
end;

procedure Texto.descifrarSustitucion();
var
  linea:String;
  c,numeroDeLineas,i:integer;

  arreglo: Array[1..255] of String;
begin
  abrir();
   numeroDeLineas:=0;
  while(not fin()) do
  begin
     linea:=leerLinea();
     c:=1;
     while(c<=length(linea))do
     begin
        linea[c]:=descifrarLetraSustitucion(linea[c]);
        c:=c+1;
     end;
     numeroDeLineas:=numeroDeLineas+1;
     linea:=invertirCadena(linea);
     arreglo[numeroDeLineas]:= linea;
  end;
  cerrar();
  crear();
  c:=1;
  while(c<=numeroDeLineas) do
  begin
     escribirLinea(arreglo[c]);
     c:=c+1;
  end;
  cerrar();
end;

procedure Texto.descifrar01();
var
  linea:String;
  c,numeroDeLineas,i:integer;

  arreglo: Array[1..255] of String;
begin
  abrir();
   numeroDeLineas:=0;
  while(not fin()) do
  begin
     linea:=leerLinea();
     c:=1;
     while(c<=length(linea))do
     begin
        linea[c]:=descifrarUnaLetra(linea[c]);
        c:=c+1;
     end;
     numeroDeLineas:=numeroDeLineas+1;
     arreglo[numeroDeLineas]:= linea;
  end;
  cerrar();
  crear();
  c:=1;
  while(c<=numeroDeLineas) do
  begin
     escribirLinea(arreglo[c]);
     c:=c+1;
  end;
  cerrar();
end;

function Texto.cifrarUnaLetra(c: char): char;
var
  valorDeLetra:integer;
begin

  //1: Extraigo el numero
   valorDeLetra:=Ord(c);
   //2: Preguntar si son letras
  if((c in ['A'..'Z']) or (c in ['a'..'z']))  then
   begin

   if((c in ['X','Y','Z']) or ( c in ['x','y','z'])) then
   begin
        case  valorDeLetra of
              120: begin
                 valorDeLetra:=97
              end;
              121: begin
                 valorDeLetra:=98
              end;
              122: begin
                 valorDeLetra:=99
              end;
              88: begin
                 valorDeLetra:=65
              end;
              89: begin
                 valorDeLetra:=66
              end;
              90: begin
                 valorDeLetra:=67
              end;

        end;

   end
   else
      begin
        valorDeLetra:=valorDeLetra+3;
       end;


   end;
    Result:=Chr(valorDeLetra)
end;

function Texto.cifrarLetraSustitucion(c: char): char;
var
  valorNum:integer;
  letraResultado:char;
begin
  valorNum:=Ord(c);
  letraResultado:=c;
  case c of
     'A': letraResultado:='!';

     'E':letraResultado:='*';

     'I': letraResultado:='#';

     'O': letraResultado:='$';

     'U':  letraResultado:='%';
      'a': letraResultado:='!';

     'e':letraResultado:='*';

     'i': letraResultado:='#';

     'o': letraResultado:='$';

     'u':  letraResultado:='%';

  end;
   Result:=letraResultado;
end;

function Texto.descifrarLetraSustitucion(c: char): char;
var
  letraResultado:char;
begin
     letraResultado:=c;
  case c of
     '!': letraResultado:='A';
     '*': letraResultado:='E';
     '#': letraResultado:='I';
     '$': letraResultado:='O';
     '%': letraResultado:='U';
  end;
  Result:=letraResultado;
end;

function Texto.descifrarUnaLetra(c: char): char;
var
  valorDeLetra:integer;
begin

  //1: Extraigo el numero
   valorDeLetra:=Ord(c);
   //2: Preguntar si son letras
  if((c in ['A'..'Z']) or (c in ['a'..'z']))  then
   begin

   if((c in ['A','B','C']) or ( c in ['a','b','c'])) then
   begin
        case  valorDeLetra of
              97: begin
                 valorDeLetra:=120
              end;
              98: begin
                 valorDeLetra:=121
              end;
              99: begin
                 valorDeLetra:=122
              end;
              65: begin
                 valorDeLetra:=88
              end;
              66: begin
                 valorDeLetra:=89
              end;
              67: begin
                 valorDeLetra:=90
              end;

        end;

   end
   else
      begin
        valorDeLetra:=valorDeLetra-3;
       end;


   end;
    Result:=Chr(valorDeLetra);
end;

function Texto.invertirCadena(s: string): String;
var sx:string;
     i:integer;
begin
  sx:='';
  for i:=1 to length(s)do
  begin
    sx:=s[i]+sx;
  end;
  Result:=sx;
end;

end.

