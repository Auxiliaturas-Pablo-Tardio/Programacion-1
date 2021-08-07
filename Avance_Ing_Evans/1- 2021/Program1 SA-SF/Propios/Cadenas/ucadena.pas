unit UCadena;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,UConjunto,Dialogs,UNatural, Grids;

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
  end;
implementation

//inicializamos el constructor del objeto
constructor cadena.crear();
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
procedure cadena.cargarString(pal:string);
var i:integer;
begin
    for i:=1 to length(pal) do
      begin
        Inserchar(i,pal[i]);
      end;
end;
function cadena.mytoString():string;
var s:String;i:integer;
begin
  for i:=1 to dim do
    begin
      s:=s+getChar(i);
    end;
  Result:=s;
end ;


procedure cadena.encriptar();
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

procedure cadena.desencriptar();
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

procedure cadena.setDim(n: integer);
begin
  dim:=n;
end;

//Adiciona una nueva palabra al objeto
procedure cadena.AddPal(pal: String);
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

procedure cadena.Inserchar(pos: integer; ele: char);
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
procedure cadena.InserPal(pos: integer; pal: String);
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
procedure cadena.LeerPal(var pos: integer; var pal: String);
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
function cadena.BuscPal(palB: String): integer;
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
procedure cadena.Eliminar(pal: String);
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
procedure cadena.ReemPal(palO, PalN: String);
var pos:integer;
begin
   pos:=BuscPal(palO);
   if(pos<>-1)then begin
       Eliminar(palO);
       InserPal(pos,PalN);
   end;
end;


//retorna la Cantidad de palabras
function cadena.CantPal(): integer;
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
function cadena.getDim(): integer;
begin
  result:=dim;
end;
//Retorna el character del objeto en una (posicion)
function cadena.getChar(pos:integer): char;
begin
   if(pos>=1)and(pos<=dim)then
      result:=elem[pos]
   else
      result:=char(0);
end;

function cadena.frecuenciaPal(pal: String): integer;
begin

end;
//[h,o,l,a, ,c,o,m,o, ,e,s,t,a,s]-> [h,o,l,a, ,c,o,m,o] [,e,s,t,a,s]
procedure cadena.ejercicio1(cad2 :cadena;pal: String);
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

procedure cadena.Invertir();
begin

end;

procedure cadena.ejercicio6(cad1, cad2: String);
begin

end;

procedure cadena.ejercicio6(cad1, cad2: cadena);
begin

end;

function cadena.invertirPal(): String;
begin

end;

procedure cadena.ConverMayus();
begin

end;

function cadena.Verif_primo(pos: integer): String;
begin

end;

procedure cadena.ejercicio10(pal: String);
begin

end;

function cadena.cantCaracteres(): Integer;
begin

end;

function cadena.LongMedia(): real;
begin

end;

function cadena.Ppal_UltCaracter(): Char;
begin

end;

function cadena.cantpal_Fin(cha: char): integer;
begin

end;

procedure cadena.descargar(v: TStringGrid);
begin

end;


end.


