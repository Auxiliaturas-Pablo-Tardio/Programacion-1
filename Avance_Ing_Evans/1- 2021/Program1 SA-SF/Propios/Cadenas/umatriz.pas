unit UMatriz;

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

  Matriz = class
  private
    filas: integer;
    columnas: integer;
    elem: array [1..MAX_F, 1..MAX_C] of integer;
  public
    constructor crear();
    procedure setFilas(f: integer);
    function getFilas(): integer;
    procedure setCols(c: integer);
    procedure setFilCols(f, c: integer);
    function getCols(): integer;
    procedure setElem(f, c, ele: integer);
    function getElem(f, c: integer): integer;
    function myToString(): string;

    procedure sumarAMiMatriz(m2: Matriz);
    procedure resolverEcuacion();

  end;

implementation


constructor Matriz.crear();
var
  f, c: integer;
begin
  filas := 0;
  columnas := 0;
  for f := 1 to MAX_F do
    for c := 1 to MAX_C do
      elem[f, c] := 0;
end;

procedure Matriz.setFilas(f: integer);

begin
  if (f > 0) and (f <= MAX_F) then
    filas := f
  else
    ShowMessage('Matriz.setFils:Fuera de Rango...!!!');

end;

function Matriz.getFilas(): integer;
begin
  Result := filas;
end;

procedure Matriz.setCols(c: integer);
begin
  if (c > 0) and (c <= MAX_C) then
    columnas := c
  else
    ShowMessage('Matriz.setCols:Fuera de Rango...!!!');
end;

function Matriz.getCols(): integer;
begin
  Result := columnas;
end;

procedure Matriz.setElem(f, c, ele: integer);
begin
  if (f > 0) and (f <= filas) and (c > 0) and (c <= columnas) then
    elem[f, c] := ele
  else
    ShowMessage('Matriz.setElem:Fuera de Rango...!!!');
end;

function Matriz.getElem(f, c: integer): integer;
begin
  if (f > 0) and (f <= filas) and (c > 0) and (c <= columnas) then
  begin
    Result := elem[f, c];
  end
  else
  begin
    ShowMessage('Matriz.setElem:Fuera de Rango...!!!');
    Result := -999;
  end;
end;

procedure Matriz.setFilCols(f, c: integer);
begin
  setFilas(f);
  setCols(c);
end;

function Matriz.myToString(): string;
var
  i, j: integer;
  s: string;
begin
  s := '';
  for i := 1 to filas do
  begin
    for j := 1 to columnas do
    begin
      s := s + IntToStr(getElem(i, j)) + ',';
    end;
    s := s + chr(13);
  end;
  Result := s;
end;

procedure Matriz.sumarAMiMatriz(m2: Matriz);
var
  i, j, eleActu2: integer;
begin
  if ((filas = m2.getFilas()) and (columnas = m2.getCols())) then
  begin
    for i := 1 to filas do
    begin
      for j := 1 to columnas do
      begin
        eleActu2 := m2.getElem(i, j);
        elem[i, j] := elem[i, j] + eleActu2;
        // setElem(i,j,(elem[i,j]+eleActu2));
      end;
    end;
  end
  else
  begin
    ShowMessage('No son del mismo tamaño');
  end;
end;

procedure Matriz.resolverEcuacion();
var columnaActual,index,filaActual,divisor,multiplicador,i:integer;
begin
  columnaActual:=1;
  for filaActual:= 1 to filas do
  begin
    // Si el elemento en la columna actual es 0 intercambiar filas
    while(elem[filaActual,columnaActual]=0) do
    begin
        index := filaActual ;
        // Hacer el intercambio de filas dem matriz

        if(elem[filaActual,columnaActual]=0) then
         columnaActual:=columnaActual+1;
    end;


  // Hacer que la diagonal principal quede en uno
  if( not elem[filaActual][columnaActual]=1) then
  begin
       divisor:=elem[filaActual][columnaActual];

   //Dividir toda la fila por el elemento actual
     //dividirFila(filaActual,divisor);
  end;
   for i:=1 to filas do
   begin
        if((not i=filaActual) and  (not elem[i,columnaActual]= 0)) then
        begin
          multiplicador:=elem[i,columnaActual]*(-1);
          //Funcion para multiplicar una fila por un elemento y adicionarla a otr
          // multiplicarFilayAdicion(mult,filaActual,i);
        end;
   end;
  end;
end;

end.
