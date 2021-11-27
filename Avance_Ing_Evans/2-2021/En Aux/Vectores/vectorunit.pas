unit VectorUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
const MAX_ELE=1200 ;
type

  { vector }

  vector= class
    private
      //Atributos
      dim : integer;   //Dimension del arreglo
      elem : array [1..MAX_ELE] of integer ;//Todo el arreglo
      function esEnterPrimo(num:integer):boolean;
    public
       constructor crear;
       function getDim():Integer;

       function getElem(pos:Integer):Integer;
       function cantRep(elemABuscar:Integer):Integer;
       function getElemModa():Integer;
       function insertarComprobandoMayor(a,b:vector;elemA,elemB,j,i:integer):integer;
       procedure cargarElem();
       procedure insertarElem(elemN:Integer); //pone elemento en la ultima Posicion
       procedure setElem(elemN:Integer;pos:Integer);  //Pone elemento en la posicion que yo quiera
       procedure eliminarElem(pos:Integer);   //Elimina un elemento en una posicion del vector
       procedure eliminarRep();
       procedure eliminarPrimos();
       procedure fusionOrdenada(a:vector;b:vector);
       //Modelo Intercalar Vectores
       procedure intercalar3Vectores(a,b,c:vector);
       function insertarIntercalado(i:Integer;v:vector):Integer;


  end;

implementation

{ vector }

function vector.esEnterPrimo(num: integer): boolean;
var i:integer;
    c:integer;
    b:boolean;
begin
  c:=0;
  i:=1;
  b:=false;
  for i:=1 to num do
  begin
      if(num mod i =0)  then
      begin
           c:=c+1;
      end;
  end;

  if ((c<=2) and (c>=1)) then
  begin
        b:=true;
  end;


   Result:=b;
end;

constructor vector.crear;
var i :integer;
begin

  for i:=1 to MAX_ELE do
  begin
    elem[i]:=0;
  end;
  dim:=0
end;
//Getters
function vector.getDim(): Integer;
begin
  Result:=dim;
end;

function vector.getElem(pos: Integer): Integer;
begin
  Result:=elem[pos];
end;

function vector.cantRep(elemABuscar: Integer): Integer;
var i,elemActual:integer;
    c:integer ;
begin
  c:=0;
  for i:=1 to dim do
  begin
    elemActual:=elem[i];
    if(elemABuscar=elemActual)then
    begin
       c:=c+1
    end;
  end;
    Result:=c
end;

function vector.getElemModa(): Integer;
var i,elemModa,elemActual:integer;
begin
  elemModa:=elem[1];
  for i:=1 to dim do
  begin
    elemActual:=elem[i];
    if(cantRep(elemActual)>cantRep(elemModa))then
    begin
       elemModa:=elemActual;
    end;
  end;
  Result:=elemModa;
end;

function vector.insertarComprobandoMayor(a, b: vector; elemA, elemB, j,
  i: integer): integer;
begin
    if(i<=a.getDim())then
        begin

           if((elemA>=elem[dim]) and ((elemA<elemB))) then
           begin
              insertarElem(elemA);
              i:=i+1;
           end
           else
            if (j>b.getDim()) then
            begin
               insertarElem(elemA);
              i:=i+1;
            end;
          //insertar Elem
          //Entrada:   vectorA,vectorB,elemA,elemB ,i
          // incrementaElIndice  ...debe devolver el indice

        end;
    Result:=i;
end;

procedure vector.cargarElem();
var i:integer;
  dimTeclado,elemTeclado:String;

begin
      dimTeclado:=InputBox('Introducir dim','','');
      dim:=StrToInt(dimTeclado);
  for i:=1 to dim do
  begin
       elemTeclado:=InputBox('Introducir elem: ' + IntToStr(i),'','');;
       elem[i]:=StrToInt(elemTeclado);
  end;

end;



//Setters
procedure vector.insertarElem(elemN: Integer);
begin
  dim:=dim+1;
  elem[dim]:=elemN;
end;

procedure vector.setElem(elemN: Integer; pos: Integer);
begin
  if(pos<=dim)then
  begin
    elem[pos]:=elemN;
  end;
  //else
  //DefaultMessageBox('Error de rango');
end;

procedure vector.eliminarElem(pos: Integer);
var
  encontro:Boolean ;
  i,j:integer;
begin
  encontro:=false;
  i:=1;
  while ((i< dim) and not encontro) do
  begin

      if(i=pos) then
      begin
        encontro:=true;
        for j:=i to (dim-1) do
           elem[j]:=elem[j+1];

      end;
      i:=i+1

  end;
    dim:=dim-1;

end;

procedure vector.eliminarRep();
var i,elemActual:integer;
begin
  i:=1;
  while (i<=dim) do
  begin
     elemActual:=elem[i];
     if(cantRep(elemActual)>1)then
     begin
       eliminarElem(i);
     end
     else
     begin
        i:=i+1;
     end;
  end;

end;

procedure vector.eliminarPrimos();
var i: integer;

begin
  i:=1;
  while i<=dim do
  begin
      if( esEnterPrimo(elem[i])=true) then
      begin

           eliminarElem(i);
      end
      else
      begin
          i:=i+1;
      end ;
  end;
end;

procedure vector.fusionOrdenada(a: vector; b: vector);
var dimF,jF,i,j,elemA,elemB:integer;
  band:Boolean;
begin
  band:=True; //True=A   False=B
  //tamaño de mi fusion
//jf:=2;

  //Insertar el primer elemento en el vector fusion
  if((a.getElem(1)>=b.getElem(1)))then
  begin
    insertarElem(a.getElem(1));
   i:=2; //Indice de A
   j:=1; //Indice de B
  end
  else
  begin
    insertarElem(b.getElem(1));
    i:=1; //Indice de A
    j:=2; //Indice de B ;
  end;
  dimF:=a.getDim()+b.getDim();//Tamaño de mi vector fusion
  while (dim<dimF)do
  begin
     ShowMessage('Dim: '+IntToStr(dim));
     elemA:=a.getElem(i);
     elemB:=b.getElem(j);
     //Caso recorrer A
      if(band=true)then
      begin
        i:=insertarComprobandoMayor(a, b, elemA, elemB, j,  i);
        band:=false;
      end else
      begin
         //Caso recorrer B
         j:=insertarComprobandoMayor(b, a, elemB, elemA, i,  j);
         //if(j<=b.getDim() )then
//begin

//if( (elemB>=elem[dim]) and (elemB<elemA)) then
        // begin
       //
          //    insertarElem(elemB);
          //    j:=j+1;

          // end
        //// else
          //  if (i>a.getDim()) then
         //   begin
          //     insertarElem(elemB);
           //   j:=j+1;
          //  end;
//end;
          band:=true;
         end;
      end;
  end;

procedure vector.intercalar3Vectores(a, b, c: vector);
var ia,ib,ic:integer;
begin
  ia:=1;
  ib:=1;
  ic:=1;
  while ((ia<=a.getDim()) or( ib <=b.getDim()) or( ic <=c.getDim())) do
  begin
      ic:=insertarIntercalado(ic,c);
      ia:=insertarIntercalado(ia,a);
      ib:=insertarIntercalado(ib,b);
  end;

end;

function vector.insertarIntercalado(i: Integer; v: vector): Integer;
begin
   if(i<=v.getDim())then
       begin
          insertarElem(v.getElem(i));
          i:=i+1;
       end;
   Result:=i;
end;



end.

