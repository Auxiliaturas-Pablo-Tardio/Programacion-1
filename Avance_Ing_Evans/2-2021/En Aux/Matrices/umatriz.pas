unit UMatriz;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

const MAX_F =1024;
const MAX_C =1024;
type

  { Matriz }

  Matriz=class
    private
      f: integer;
      c: integer;

      elem : array [1..MAX_F,1..MAX_C] of integer;
    public
      constructor crear();
      function getElem (fil,col:integer):integer;
      function getFilas ():integer;
      function getCols():integer;
      procedure cargar();
      procedure setElem (fil,col,elemNuevo:integer);
      function ej6SumarBloque(fi,ci,ff,cf:integer):integer;
      procedure setFilas(fil:integer);
      procedure setColumnas(cols:integer);
      function promedioTID():Real;
  end;

implementation

{ Matriz }

constructor Matriz.crear();
var i,j:integer;
begin
  f:=0;
  c:=0;
  for i:=1 to MAX_F do
  begin
      for  j:=1 to MAX_C do
      begin
         elem[i,j]:=0;
      end;
  end;
end;

function Matriz.getElem(fil, col: integer): integer;
begin
  Result:=elem[fil,col];
end;

function Matriz.getFilas(): integer;
begin
   Result:=f;
end;

function Matriz.getCols(): integer;
begin
  Result:=c;
end;

procedure Matriz.cargar();
 var i,j:integer;
begin
 f:=StrToInt(InputBox('Introduzca Filas','',''));
 c:=StrToInt(InputBox('Introduzca Columnas','',''));
 for i:=1 to f do
 begin
    for j:=1 to c do
    begin
       elem[i,j]:=StrToInt(InputBox('Introduzca Elem ','Fila:'+IntToStr(i)+' Columna: '+IntToStr(j),''));
    end;
 end;
end;

procedure Matriz.setElem(fil, col, elemNuevo: integer);
begin
     elem[fil,col]:=elemNuevo;
end;

function Matriz.ej6SumarBloque(fi, ci, ff, cf: integer): integer;
var i,j,s:integer;
begin
 s:=0;
 if( (ff<=f) and (cf<=c) and (fi<=ff) and (ci<=cf))then
 begin
 for i:=fi to ff do
 begin
     for j:=ci to cf do
     begin
          s:=s+elem[i,j];
     end;
 end;
 end;
Result:=s;
end;

procedure Matriz.setFilas(fil: integer);
begin
   f:=fil;
end;

procedure Matriz.setColumnas(cols: integer);
begin
   c:=cols;
end;

function Matriz.promedioTID(): Real;
var i,j,ci,s,n:integer;
  prom:Real;
begin
 ci:=c;
 n:=0;
 s:=0;
  for i:=1 to f do
  begin

     for j:=ci to c  do
     begin
     //acumulo el promedio
     s:=s+elem[i,j];
     n:=n+1;

     end;
     ci:=ci-1;

  end;
prom:=s/n;
Result := prom;
end;

end.

