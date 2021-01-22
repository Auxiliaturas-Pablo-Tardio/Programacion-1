unit UCCadenas;

interface
Uses SysUtils;
Const
    MaxC= 1024;
Type
    Cadena =Class

      Private
              longitud : Word;
              caracteres: Array[1..MaxC] of Char; // of Letras (Texto)
      Public
              Function getLongitud: Word;
              Function getChar(posicion: Word) : Char;
              Procedure setChar(p:Word; c:Char);
              Procedure addChar(c:Char) ;
              Procedure AMayuscula();
              Procedure AMinuscula();
              Function getCadena():String;
              Procedure setString(s: string);
              Function contarPalabras():Word;
              Function sgtePalabra(var i :word):string ;
              Function esVocalRepetida(palabra:string):Boolean;
              Procedure eliminarPalabra(palabra:string);
              Procedure eliminarPalabrasVocalRepetida();
    End;

implementation

{ Cadena }

procedure Cadena.addChar(c: Char);
begin
 longitud:=longitud+1;
 caracteres[longitud]:=c;
end;

procedure Cadena.AMayuscula();
var i: integer;
  caracterNumerico:integer;
    car:Char;
begin
  i:=1;
 while i<=longitud do
 begin
    car:=caracteres[i];
    if(car in['a'..'z'])then
    begin
      caracterNumerico:= ord(car) ;
      caracterNumerico:=caracterNumerico-32;
      caracteres[i]:=chr(caracterNumerico);
    end  ;


    i:=i+1;
 end;

end;

procedure Cadena.AMinuscula;
var i: integer;
  caracterNumerico:integer;
    car:Char;
begin
     i:=1;
 while i<=longitud do
 begin
    car:=caracteres[i];
    if(car in['A'..'Z'])then
    begin
      caracterNumerico:= ord(car) ;
      caracterNumerico:=caracterNumerico+32;
      caracteres[i]:=chr(caracterNumerico);
    end  ;


    i:=i+1;
 end;
end;

function Cadena.contarPalabras: Word;
var i:word;
cp:word;
begin
i:=1;
cp:=0;
while(i<=Longitud) do
begin
 if(((caracteres[i] in ['A'..'Z']) or (caracteres[i] in ['a'..'z'])
    or (caracteres[i] in ['ñ','Ñ']))
   and  (caracteres[i+1] in [' ',',']))  then
   begin
           cp:=cp+1;
   end;


 i:=i+1;
end;

 cp:=cp+1;
Result:=cp;
end;

procedure Cadena.eliminarPalabra(palabra: string);
var i:word;
iInicio:word;
iFinal:word  ;
p:string;
b:boolean;
j,h:word;
//La palabra debe existir
begin
i:=1;
b:=false;
    while( i<Longitud) and (b=false) do    //i va quedar en el final de la palabra
    begin
      p:=  sgtePalabra(i) ;
      if(p=palabra)  then
      b:=true;
       i:=i+1;
    end;
    i:=i-1;
 iInicio:= i-Length(palabra);
  iFinal:=i;
 h:=iFinal;
 j:=iInicio;
 while(h<=Longitud) do
 begin
    caracteres[j]:=caracteres[h];
    j:=j+1;
   h:=h+1;
 end;
 Longitud:= longitud-Length(palabra);
end;

procedure Cadena.eliminarPalabrasVocalRepetida;
var
i:word;
p:string;
begin
i:=1;
while i<=Longitud do
begin
p:=sgtePalabra(i);
if(esVocalRepetida(p)) then
 begin
    eliminarPalabra(p);
    i:=i-Length(p);
 end;

i:=i+1
end;

end;

function Cadena.esVocalRepetida(palabra: string): Boolean;
var c:word;
a,e,i,o,u :word;
b : boolean;
begin
c:=1;
a:=0;
e:=0;
i:=0;
o:=0;
u:=0;
while c<= Length(palabra) do
begin
   if(palabra[c] in ['a','A','e','E','i','I','o','O','u','U']) then//Verificar si es vocal
     begin
       if(palabra[c] in ['a','A']) then
       begin
       a:=a+1;
       end
       else
     if(palabra[c] in ['e','E']) then
       begin
        e:=e+1  ;
       end
       else
     if(palabra[c] in ['i','I']) then
       begin
         i:=i+1 ;
       end
       else
      if(palabra[c] in ['o','O']) then
       begin
        o:=o+1;
       end
       else
      if(palabra[c] in ['U','u']) then
       begin
         u:=u+1;
       end

     end;
  c:=c+1;
end;

if (a>1)or (e>1)or (i>1)or (o>1)or (u>1)then
begin
 b:=true;
end
 else
   b:=false;

Result:=b;

end;

function Cadena.getCadena: String;
var s:string;
  i: Integer;
begin
   s:='';
   for i := 1 to longitud do
      s:=s+caracteres[i]  ;
   Result:=s;
end;

function Cadena.getChar(posicion: Word): Char;
var caracterRetorno:Char;
begin
  if(posicion >0) and (posicion<=longitud) then
  begin
    caracterRetorno:=caracteres[posicion];
  end
  else raise Exception.Create('Error posicion equivocada');
  Result:=caracterRetorno;
end;

function Cadena.getLongitud: Word;
begin
Result:=longitud;
end;

procedure Cadena.setChar(p: Word; c: Char);

begin
if(p >0) and (p<=longitud) then
  begin
      caracteres[p]:=c;
  end
  else raise Exception.Create('Error posicion equivocada');

end;

procedure Cadena.setString(s: string);
var i:integer;
cs:char;
begin

for i := 1 to Length(s) do
begin
cs:=s[i]  ;
  caracteres[i]:=cs;
end;
longitud:=Length(s);
end;

function Cadena.sgtePalabra(var i: word): string;
var
p: string;
begin
p:='';


while (i<=longitud )and ( caracteres[i] in [' ',',']) do
begin

i:=i+1;
end;
while ((i<=longitud )and not(caracteres[i] in [' ',','])) do
begin
p:=p+caracteres[i];
i:=i+1;
end;

Result:=p;
end;

end.
