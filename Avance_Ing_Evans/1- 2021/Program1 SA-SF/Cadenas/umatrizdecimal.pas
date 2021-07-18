unit UMatrizDecimal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs,UVector;

const
  MAX_F = 1200;

const
  MAX_C = 1200;

type

  { Matriz }

  MatrizReal = class
  private
    filas: integer;
    columnas: integer;
    elem: array [1..MAX_F, 1..MAX_C] of Real;
  public
   constructor crear();
//procedure setFilas(f: integer);
    //function getFilas(): integer;
    //procedure setCols(c: integer);
   procedure setFilCols(f, c: integer);
  //  function getCols(): integer;
  procedure setElem(f, c: integer; ele:real);
   // function myToString(): string;
    function myToString(): string;
   // procedure sumarAMiMatriz(m2: Matriz);
    procedure resolverEcuacion();

    procedure dividirFila(filaActual:integer;divisor:Real);
     procedure  multiplicarFilayAdicion(mult:Real; filaMul, filaDestino:integer);
     procedure intercambiarFilas(filaA,filaB:integer);
  end;

implementation


constructor MatrizReal.crear();
var
  f, c: integer;
begin
  filas := 0;
  columnas := 0;
  for f := 1 to MAX_F do
    for c := 1 to MAX_C do
      elem[f, c] := 0.0;
end;
 procedure MatrizReal.setElem(f, c :integer;ele: real);
begin
  if (f > 0) and (f <= filas) and (c > 0) and (c <= columnas) then
    elem[f, c] := ele
  else
    ShowMessage('Matriz.setElem:Fuera de Rango...!!!');
end;
 procedure MatrizReal.setFilCols(f, c: integer);
begin
  filas:=f;
  columnas:=c;
end;
function MatrizReal.myToString(): string;
var
  i, j: integer;
  s: string;
begin
  s := '';
  for i := 1 to filas do
  begin
    for j := 1 to columnas do
    begin
      s := s + FloatToStr(elem[i, j]) + ',';
    end;
    s := s + chr(13);
  end;
  Result := s;
end;

//Gauss Jordan;
procedure MatrizReal.resolverEcuacion();
var columnaActual,index,i,filaActual:integer;
  divisor,multiplicador:Real;
  seIntercambio:boolean;
begin
  columnaActual:=1;
  for filaActual:= 1 to filas do
  begin
    // Si el elemento en la columna actual es 0 intercambiar filas
    while(elem[filaActual,columnaActual]=0) do
    begin
         seIntercambio:=false;
        index := filaActual ;
        while( (index <= filas )and (not seIntercambio)) do
         begin
             if (not (elem[index][columnaActual]=0)) then
             begin

              // Hacer el intercambio de filas dem matriz
              intercambiarFilas(index,filaActual);
              seInterCambio:=true;
             end ;
             index:=index+1;
        end;

        if(elem[filaActual,columnaActual]=0) then
         columnaActual:=columnaActual+1;
    end;


  // Hacer que la diagonal principal quede en uno
  if( not (elem[filaActual][columnaActual]=1.0)) then
  begin
       divisor:=elem[filaActual][columnaActual];
   //Dividir toda la fila por el elemento actual
     dividirFila(filaActual,divisor);
  end;
  // hacer que los elementos que no estan en la diagonal principal de la columna actual sean 0
   for i:=1 to filas do
   begin
        if((not(i=filaActual)) and  (not (elem[i,columnaActual]= 0))) then
        begin
          multiplicador:=elem[i,columnaActual]*(-1);
          //Funcion para multiplicar una fila por un elemento y adicionarla a otr
           multiplicarFilayAdicion(multiplicador,filaActual,i);
        end;
   end;
  end;
end;

 procedure MatrizReal.dividirFila(filaActual:integer;divisor:Real);
var i:integer   ;
begin
     for i:=1 to columnas do
     begin
          elem[filaActual][i]:= elem[filaActual][i]/divisor;
     end;
end;

procedure MatrizReal.multiplicarFilayAdicion(mult:Real; filaMul, filaDestino:integer);
var i :integer;
  elemMulti:Real ;
begin

      for i:=1 to columnas do
     begin
          //Multiplicacion de la fila (pero no se guarda en la matriz)
          elemMulti:= elem[filaMul][i]*mult;
          // Adicion de la fila multiplicacda por la otra fila
          elem[filaDestino][i]:=elem[filaDestino][i]+ elemMulti ;
     end;
end;

procedure MatrizReal.intercambiarFilas(filaA, filaB:integer);
var i:integer;
  x:real;
begin
  for i:=1 to columnas do
  begin
       x:=elem[filaA][i];
       elem[filaA][i]:=elem[filaB][i] ;
       elem[filaB][i]:=x ;
  end;

end;

end.
