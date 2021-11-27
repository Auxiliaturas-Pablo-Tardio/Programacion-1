unit UCadena;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
const MAX_ELEM=1200;
  type

    { cadena }

    cadena=class
      private
      dim:integer;
      elem:array [1..MAX_ELEM] OF char;
       public
       constructor crear;
       function getDim():Integer;

       function getElem(pos:Integer):char;
       //function cantRep(elemABuscar:Integer):Integer;
      // function getElemModa():Integer;
       //function insertarComprobandoMayor(a,b:vector;elemA,elemB,j,i:integer):integer;
       procedure cargarElem();
       procedure concatenarCadena(cad:cadena);
        procedure cargarTodo();
       procedure insertarElem(elemN:char); //pone elemento en la ultima Posicion
       procedure setElem(elemN:char;pos:Integer);  //Pone elemento en la posicion que yo quiera
       procedure eliminarElem(pos:Integer);   //Elimina un elemento en una posicion del vector
       function descargarToString():String;
       procedure cargarDeString(s:String);
       function getUltPosDePalabra(pal:string):integer;
       procedure separarCadDePos(pos:integer;cada,cadb:cadena);
       procedure separarCadDePal(pal:string;cada,cadb:cadena);
       procedure invertir();
       procedure ocultarInvirtiendo(); //MODELO DE EXANMEN: DONDE INVIERTO PALABRA POR PALABRA
      // procedure eliminarRep();
      // procedure eliminarPrimos();
     //  procedure fusionOrdenada(a:vector;b:vector);
    end;

implementation


{ cadena }

constructor cadena.crear;
begin
  dim:=0;
end;

function cadena.getDim(): Integer;
begin
  Result:=dim;
end;

function cadena.getElem(pos: Integer): char;
begin
   Result:=elem[pos];
end;

procedure cadena.cargarElem();
var i:integer;
  dimTeclado,elemTeclado:String;

begin
      dimTeclado:=InputBox('Introducir dim','','');
      dim:=StrToInt(dimTeclado);
  for i:=1 to dim do
  begin
       elemTeclado:=InputBox('Introducir elem: ' + IntToStr(i),'','');;
       elem[i]:=elemTeclado[1];
  end;

end;

procedure cadena.concatenarCadena(cad: cadena);
begin

end;

procedure cadena.cargarTodo();
VAR str:String;
  i:integer;
begin
    str:=InputBox('Introducir la cadena','','');
    for i:=1 to length(str) do
      begin
           insertarElem(str[i]);
      end;

end;

procedure cadena.insertarElem(elemN: char);
begin
    dim:=dim+1;
    elem[dim]:=elemN;

end;

procedure cadena.setElem(elemN: char; pos: Integer);
begin
   elem[pos]:=elemN;
end;

procedure cadena.eliminarElem(pos: Integer);
begin

end;

function cadena.descargarToString(): String;
var s:String;
  i:integer;

begin
   s:='';
  for i:=1 to dim do
    s:=s+elem[i];

  Result:=s;
end;

procedure cadena.cargarDeString(s: String);
var i:integer;
  c:char;
begin
  i:=1;
  dim:=0;
  while (i<=Length(s))do
  begin
       c:=s.Chars[i];
       insertarElem(c);
       i:=i+1;
  end;
end;

function cadena.getUltPosDePalabra(pal: string): integer;
var i,j:integer;
    palabraCoincide:boolean;
begin
  i:=1;
  palabraCoincide:=false;
  while ((i<=dim) and   (palabraCoincide=false)) do
 begin
      //limpiamos o saltamos los espacios
      while ((i<=dim) and (elem[i]=' ')) do
            i:=i+1;
      //a este punto tengo la pos inicial de mi palabra
     j:=1;// indice para la palabra de entrada
     palabraCoincide:=true;//asumo que es verdadero
     while ((i<=dim) and (elem[i]<>' ')) do
           begin
               if (pal[j]<> elem[i]) then
               begin
                    palabraCoincide:=false;
               end;


               j:=j+1;
               i:=i+1;

           end;

     // a este punto tiene la posicion final dela palabra
 end;
  Result:=i-1;
end;

procedure cadena.separarCadDePos(pos: integer; cada, cadb: cadena);
var i:integer;
begin


    for i:=1 to  pos do
    begin
         cada.insertarElem(elem[i]);
    end;
    for  i:=pos+1 to dim do
    begin
         cadb.insertarElem(elem[i]);
    end;
end;

procedure cadena.separarCadDePal(pal: string; cada, cadb: cadena);
var pos:integer;
begin
  pos:=getUltPosDePalabra(pal);
  separarCadDePos(pos,cada,cadb);
end;

procedure cadena.invertir();
var ia,ib:integer;
    x:char;
begin
  ia:=1;
  ib:=dim;
  while(ia<=ib)do
  begin
       x:=elem[ia];
       elem[ia]:=elem[ib];
       elem[ib]:=x;
       ia:=ia+1;
       ib:=ib-1
  end;

end;

procedure cadena.ocultarInvirtiendo();
var i:integer;
    palabraActual:cadena;
    s:string;
begin
  s:='';

  i:=1;
  while (i<=dim) do
  begin
      //saltar espacios
       palabraActual:=cadena.Create;
  palabraActual:=cadena.crear;
      while((elem[i]=' ')and (i<=dim))do
      begin
          i:=i+1;
      end;
      //saltar Letras
      while((elem[i]<>' ')and( i<=dim)) do
      begin
          palabraActual.insertarElem(elem[i]); //copia palabra, caracter por caracter
          i:=i+1;

      end;

      //variable palabraActual tiene la palabra Actual

      //invertir
     palabraActual.invertir();
      //copiar a nueva cad
      s:=s+' '+palabraActual.descargarToString();

  end;
   cargarDeString(s);

end;

end.



///-------------

