unit UCVector;

interface
const
    MaxE=1024;

Type
  Vector=Class
    Private
        //Longitud
        Dimension: Word;
        Elementos : Array [1..MaxE] of Real;
    Public
          Function getDimension():Word;
          Procedure addElem(elemNuevo:Real); //Añade a la ultima posicion un elemento
          Procedure eliminarElem(indice:Word);
          Procedure modElem(elemNuevo:Real;pos:Word);
          Function getElem(pos:Word):Real;
          procedure ordenar();
          procedure selectionSort();
           procedure selectionSortVFunciones();
          function encontrarPosMayor(pi:word;pf:word):Word;
          procedure intercambiar(pa:word;posb:word) ;
          procedure bubbleSort() ;
          procedure bubleSortRango(a:Word;b:Word);
          procedure selectionSortSaltos(saltos:Word);
          procedure eliminarUnRango(a,b:Word);
  End;

implementation

{ Vector }

procedure Vector.addElem(elemNuevo: Real);
begin
   Dimension:=Dimension+1;
   Elementos[Dimension]:=elemNuevo;
end;

procedure Vector.bubbleSort;
var  I,k: Integer;
begin
   if dimension >0  then begin
  for k := dimension downto 2 do
    begin
       for I := 1 to k-1 do
         begin
            if elementos[i] > elementos[i+1] then intercambiar(i,i+1);
         end;
    end;
   end else
   // raise Exception.Create('Error vector vacío');
end;

procedure Vector.bubleSortRango(a, b: Word);
var  I,k: Integer;
begin
   if (b <=dimension) and (a<=dimension-1) then begin
  for k := b downto a+1 do
    begin
       for I := a to k-1 do
         begin
            if elementos[i] > elementos[i+1] then intercambiar(i,i+1);
         end;
    end;
   end else
   // raise Exception.Create('Error vector vacío');
end;

procedure Vector.eliminarElem(indice: Word);
var i:Word;
begin
for i := indice to Dimension-1 do
 Elementos[i]:=Elementos[i+1];

Dimension:=Dimension-1
end;

procedure Vector.eliminarUnRango(a, b: Word);
var i,indiceABorrar:word;

begin
if((a<=Dimension) and (a>0) and (b>0) and (b<=Dimension)) then
begin
    indiceABorrar:=a;
    for i := a to b do
    begin
           eliminarElem(indiceABorrar);
    end;


end;
end;

function Vector.encontrarPosMayor(pi, pf: word): Word;
var may:Real;
j,p:word;
begin
          p:=pi;
          may:=Elementos[pi];
          for j := pi+1 to pf do
            begin
              if(Elementos[j]> may) then
              begin
                may:= Elementos[j];
                p:=j ;
              end;
            end;
Result:=p;
end;

function Vector.getDimension: Word;
begin
Result:=Dimension;
end;


function Vector.getElem(pos: Word): Real;
begin
 Result:=Elementos[pos];
end;



procedure Vector.intercambiar(pa, posb: word);
var x:Real;
begin
    x:=Elementos[pa];
         elementos[pa]:=Elementos[posb];
         elementos[posb]:=x;
end;

procedure Vector.modElem(elemNuevo: Real; pos: Word);
begin
    Elementos[pos]:=elemNuevo;
end;

procedure Vector.ordenar;
var i,j:word;
x:Real;
begin
for i := 1 to Dimension-1 do
  for j := i+1 to Dimension do
           if(Elementos[j]<Elementos[i]) then
           begin
               x:=Elementos[j];
               Elementos[j]:=Elementos[i];
               Elementos[i]:=x;
           end;

end;

procedure Vector.selectionSort;
var
i,j,p:word;
x,may:Real;
begin
   for i := 1 to Dimension-1 do
     begin
          p:=i;
          may:=Elementos[i];
          for j := i+1 to Dimension do
            begin
              if(Elementos[j]> may) then
              begin
                may:= Elementos[j];
                p:=j
              end;
            end;
            if(p<>i)then
            begin
                x:=Elementos[p];
                 elementos[p]:=Elementos[i];
                elementos[i]:=x;
            end;

     end;
end;

procedure Vector.selectionSortSaltos(saltos: Word);
var
i,j,p:word;
x,may:Real;
begin
   i:=saltos;
   while (i<=Dimension-1) do


     begin
          p:=i;
          may:=Elementos[i];
          j:=i+saltos;

            while(j<=Dimension)do
            begin
              if(Elementos[j]> may) then
              begin
                may:= Elementos[j];
                p:=j
              end;
                j:=j+1;
            end;
            if(p<>i)then
            begin
                x:=Elementos[p];
                 elementos[p]:=Elementos[i];
                elementos[i]:=x;
            end;
        i:=i+saltos ;
     end;
end;

procedure Vector.selectionSortVFunciones;
var
i,j,p:word;
x,may:Real;
begin
   for i := 1 to Dimension-1 do
     begin
          p:=encontrarPosMayor(i,Dimension);
          if(p<>i)then
            interCambiar(p,i);

     end;
end;

end.
