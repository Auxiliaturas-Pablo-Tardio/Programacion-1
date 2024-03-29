unit UCadena;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,UConjunto,Dialogs, Grids;

const MAX_ELE = 1200;
  type

  { cadena }

 Cadena = class
    private      //atributos
       elem :array [1..MAX_ELE] OF char;
       dim: integer;
       May,Min,Dig,Sep:Conjunto;
     public
       Constructor crear();
       procedure setDim(n :integer);
       procedure LeerPal(var pos:integer;var pal:String);
       procedure AddPal(pal :String);

       procedure Inserchar(pos:integer;ele:char);
       procedure cargarString(pal:string);
       //Inserta un nuevo String apartir de una posicion(3,"hola")
       procedure InserPal(pos:integer;pal:String);
       //Elimina la primera palabra(String) del objeto
       procedure Eliminar(pal:String);
       //remplaza la primera palabra a buscar por la nueva palabra
       procedure ReemPal(palO,PalN:String);
       //retorna la cantidad de palabras
       function CantPal():integer;
       ////agarra palabra*palabra y verifica si EXISTE(palB), retorna el indice de la primera palabra
       function BuscPal(palB:String):integer;
       //retorna dim del objeto
       function getDim():integer;
       //retorna el char de una posicion;
       function getChar(pos:integer):char;
       //frecuencia de una palabra(pal)
       function frecuenciaPal(pal:String):integer;
       procedure encriptar();
       procedure desencriptar();
       procedure ejercicio1(cad2 :cadena;pal: String);
       procedure Invertir();
       procedure ejercicio6(cad1,cad2:String);
       procedure ejercicio6(cad1,cad2:cadena);
       function invertirPal():String;
       procedure ConverMayus();
       function Verif_primo(pos:integer):String;
       procedure ejercicio10(pal:String);
       function cantCaracteres():Integer;
       function LongMedia():real;
       function Ppal_UltCaracter():Char;
       FUNCTION cantpal_Fin(cha:char):integer;
       procedure descargar(v:TStringGrid );
       function mytoString():string;
       function nroCaracteres():integer;
       function contarPal():integer;
       function extraerUltCaracter():char;//De la primer palabra
       function longitudMediaPal():Real;
       function nroPalabrasFinLetra(c:char):integer;
       function obtenerPalPos(posABuscar:integer):string;
  end;
implementation

//inicializamos el constructor del objeto
constructor Cadena.crear();
var i:integer;
begin
  dim:=0;
  for i:=1 to MAX_ELE do    //Inicializamos vector
    elem[i]:=char(0);       //elem->[0,0,0,0,0,0,0,.......0]...1200
    May:=Conjunto.Create;   //dim    1                ..1200
    for i:=0 to 25 do       //puntero
      May.agregar(char(65+i));//A..Z = may
    Min:=Conjunto.Create;
    for i:=0 to 25 do
      Min.agregar(char(97+i));//a..z = min
    Dig:=Conjunto.Create;
    for i:=0 to 9 do
      Dig.agregar(char(48+i));//0..9 = dig
      Sep:=Conjunto.Create;
      Sep.agregar('.');
      Sep.agregar(';');
      Sep.agregar(' ');
      Sep.agregar(',');
      Sep.agregar(':');
      Sep.agregar('-');
      Sep.agregar('_');       //sep=[ . | ; | | , | : | - | _ |]

end;




procedure Cadena.cargarString(pal: string);
var i:integer;
begin
    dim:=0;
    for i:=1 to length(pal) do
      begin
        Inserchar(i,pal[i]);
      end;
end;



function Cadena.nroCaracteres(): integer;
var c,i:integer;
begin
    c:=0;
   for i:=1 to dim do
     begin
       if((elem[i] in ['A'..'Z'] ) or  (elem[i] in ['a'..'z'] ))then
        begin
           c:=c+1;
        end;
     end;
   Result:=c;
end;

function Cadena.contarPal(): integer;
var
     cp,i:integer;
begin
  i:=1;
  cp:=0;
  while( i<=dim) do
  begin
    while(elem[i]=' ' )  do
    begin
         i:=i+1;
    end;
    while(elem[i]<>' ') do
    begin
      i:=i+1;
    end;
       cp:=cp+1;
  end;
Result:=cp;
end;

function Cadena.extraerUltCaracter(): char;
var
     c:char;
     cp,i:integer;
begin
  i:=1;
  cp:=0;
  while( (i<=dim) and (cp<1)) do
  begin
    while((elem[i]=' ') and  (i<=dim ))  do
    begin
         i:=i+1;
    end;

    while((elem[i]<>' ') and  (i<=dim)) do
    begin
    //   ShowMessage(IntToStr(i));
      i:=i+1;
    end;
       c:=elem[i-1];
       cp:=cp+1;
  end;

Result:=c;
end;

function Cadena.longitudMediaPal(): Real;
var
     cp,i,
       sl //Suma de longitudes
       :integer;
begin
  i:=1;
  sl:=0;
  cp:=0;
  while( i<=dim) do
  begin
    while((elem[i]=' ') and  (i<=dim ))  do
    begin
         i:=i+1;
    end;

    while((elem[i]<>' ') and  (i<=dim)) do
    begin
      sl:=sl+1;
      i:=i+1;
    end;
       cp:=cp+1;
  end;
Result:=sl/cp;
end;

function Cadena.nroPalabrasFinLetra(c: char): integer;
var
     cx:char;
     cp,i:integer;
begin
  i:=1;

  cp:=0;
  while( (i<=dim) ) do
  begin
    while((elem[i]=' ') and  (i<=dim ))  do
    begin
         i:=i+1;
    end;

    while((elem[i]<>' ') and  (i<=dim)) do
    begin
      i:=i+1;
    end;
       cx:=elem[i-1];
       if(cx=c) then
        begin
          cp:=cp+1;
        end;

  end;
Result:=cp;
end;

function Cadena.obtenerPalPos(posABuscar: integer): string;
var i,cp:integer;
     pal,palEncontrada:string;
begin
i:=1;
cp:=0;
pal:='';
palEncontrada:='';
while(i<=dim)do
begin
  //saltar espacios
  while((i<=dim) and (elem[i]=' ' ))do
  begin
    i:=i+1;
  end;
  //el comienzo d emi palabra

   pal:='';
  //saltar diferentes de espacio
  while((i<=dim) and (elem[i]<>' ' ))do
  begin
    pal:=pal+elem[i];
    i:=i+1;
  end;
   cp:=cp+1;
   if(cp=posABuscar)then
   begin
     palEncontrada:=pal;
   end;

end;
Result:=palEncontrada;


end;




function Cadena.mytoString(): string;
var s:String;i:integer;
begin
  for i:=1 to dim do
    begin
      s:=s+getChar(i);
    end;
  Result:=s;
end ;


procedure Cadena.encriptar();
var i:integer;
    myChar:char;
    myCharNum:byte;
begin
    for i:=1 to dim do
    begin
         myChar:=getChar(i);
          myCharNum:=ord(myChar);
         case myCharNum of

             88:myCharNum:=65;  //X=A

             89:myCharNum:=66;   //Y=B

             90:myCharNum:=67;   //Z=C


         end;

         if(myCharNum<88)then
            begin
              myCharNum:=myCharNum+3;//Letra+3
            end;
        myChar:=Chr(myCharNum);
        elem[i]:=myChar;

    end;
end;

procedure Cadena.desencriptar();
var i:integer;
    myChar:char;
    myCharNum:byte;
begin
    for i:=1 to dim do
    begin
         myChar:=getChar(i);
          myCharNum:=ord(myChar);
         case myCharNum of

             65:myCharNum:=88;  //A=X

             66:myCharNum:=89;   //B=Y

             67:myCharNum:=90;   //C=Z


         end;

         if((myCharNum<=90)and ((myCharNum>67))) then
            begin
              myCharNum:=myCharNum-3;//Letra+3
            end;
        myChar:=Chr(myCharNum);
        elem[i]:=myChar;

    end;
end;

procedure Cadena.setDim(n: integer);
begin
  dim:=n;
end;

//Adiciona una nueva palabra al objeto
procedure Cadena.AddPal(pal: String);
var n,i:integer;
begin
   n:=Length(pal);//'jose'=4
   if(dim+n+1<=MAX_ELE)then begin//longitud actual <= longitudMax
      if(dim<>0)then begin
       dim:=dim+1;
       elem[dim]:=' '; //[ |]
      end;
        for i:=1 to n do begin //[j | o| s| e|  |d | a | r | w | i | n ]
            dim:=dim+1;   //[ | |]
            elem[dim]:=pal[i];
        end;
   end;
end;
//Inserta una character en una posicion(2,'X')
//[a,b,c,d]->[a,X,b,c,d]

procedure Cadena.Inserchar(pos: integer; ele: char);
var i:integer;
begin
 dim:=dim+1;
 for i:=dim downto (pos+1) do
     BEGIN
     elem[i]:=elem[i-1];
     end;
 elem[pos]:=ele;
end;
//Inserta una nueva palabra apartir de una posicion(3,"hola")
//[a,b,c,d]->[a,b, ,h,o,l,a, ,c,d]
procedure Cadena.InserPal(pos: integer; pal: String);
var i:integer;
begin
  Inserchar(pos,' '); //Insertamos el separador al inicio
  for i:=1 to length(pal)do
   begin
       pos:=pos+1;
       Inserchar(pos,pal[i]);
   end;
   Inserchar(pos+1,' '); //Insertamos el separador al final
end;

//pos(referencia)=contador que ira incrementando
//pal(referencia)=sacara la primera palabra desdes (pos)

//[ h | o |  |  | l | a | ]
procedure Cadena.LeerPal(var pos: integer; var pal: String);
begin
  pal:='';           //sep[ . | ; |  | , | : | - | _ ]
  while(pos<=dim)and(not sep.pertenece(elem[pos]))do
  begin  //encuentra[ . | ; |  | , | : | - | _ ]->finaliza
    pal:=pal+elem[pos];  //pal='ho'
    pos:=pos+1;          //pos=5
  end;
  while(pos<=dim)and(sep.pertenece(elem[pos]))do
  begin //pos queda como puntero de la siguiente palabra
    pos:=pos+1;
  end;
end;

//agarra palabra*palabra y verifica si EXISTE(palB)
//retorna el indice de la primera palabra
function Cadena.BuscPal(palB: String): integer;
var pos,i:integer;
    pal:String;
    sw:Boolean;
begin
 sw:=false; pal:='';
 i:=1;                          //(existen caracteres) and not(falso)
 while((i<=dim )and(not sw))do  //(verdad)  and  (verdad) ==>verdadero
 begin
   pos:=i;
   LeerPal(i,pal);
   if(pal=palB)then
     sw:=true;
 end;
  if(sw)then
   result:=pos
  else
   result:=-1;
end;

//Elimina la primera palabra de la cadena(hola)
procedure Cadena.Eliminar(pal: String);
var i,pos,n:integer;
begin
  pos:=BuscPal(pal);
  if(pos<>-1)then begin
     n:=Length(pal);
     for i:=pos to dim-n do
        elem[i]:=elem[i+n];
        dim:=dim-n;
  end;
end;

//   PalO=palabra  original;
//Lo Remplaza por PalN=palabra nueva
procedure Cadena.ReemPal(palO, PalN: String);
var pos:integer;
begin
   pos:=BuscPal(palO);
   if(pos<>-1)then begin
       Eliminar(palO);
       InserPal(pos,PalN);
   end;
end;


//retorna la Cantidad de palabras
function Cadena.CantPal(): integer;
var cp,pos:integer;
     pal:String;
begin
  cp:=0;  pos:=1; pal:='';
  while(pos<=dim)do
  begin
   LeerPal(pos,pal);
   if(pal<>'')then
   cp:=cp+1;
  end;
  result:=cp;
end;

//retorna Dim del objeto cadena
function Cadena.getDim(): integer;
begin
  result:=dim;
end;
//Retorna el character del objeto en una (posicion)
function Cadena.getChar(pos: integer): char;
begin
   if(pos>=1)and(pos<=dim)then
      result:=elem[pos]
   else
      result:=char(0);
end;

function Cadena.frecuenciaPal(pal: String): integer;
begin

end;
//[h,o,l,a, ,c,o,m,o, ,e,s,t,a,s]-> [h,o,l,a, ,c,o,m,o] [,e,s,t,a,s]
procedure Cadena.ejercicio1(cad2: cadena; pal: String);
var n,i,pos:integer;
begin
   n:=Length(pal);//'c'o'm'o'=4
   pos:=BuscPal(pal);//->retorna posicion donde encontro=>6
   if(pos>0) then begin //existe la palabra
     for i:=(pos+n+1) to dim do begin
       cad2.dim:=cad2.dim+1;   //
       cad2.elem[cad2.dim]:=elem[i];
      end;
      dim:=n+pos-1;
   end else begin
     ShowMessage('No existe la palabra');
   end;
end;

procedure Cadena.Invertir();
begin

end;

procedure Cadena.ejercicio6(cad1, cad2: String);
begin

end;

procedure Cadena.ejercicio6(cad1, cad2: cadena);
begin

end;

function Cadena.invertirPal(): String;
begin

end;

procedure Cadena.ConverMayus();
begin

end;

function Cadena.Verif_primo(pos: integer): String;
begin

end;

procedure Cadena.ejercicio10(pal: String);
begin

end;

function Cadena.cantCaracteres(): Integer;
begin

end;

function Cadena.LongMedia(): real;
begin

end;

function Cadena.Ppal_UltCaracter(): Char;
begin

end;

function Cadena.cantpal_Fin(cha: char): integer;
begin

end;

procedure Cadena.descargar(v: TStringGrid);
begin

end;


end.



