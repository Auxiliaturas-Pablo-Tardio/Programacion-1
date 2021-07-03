unit UConjunto;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
const
  MAX_ELE=1200;
type

  { Conjunto }

  Conjunto=Class
    private
      elem:array[1..MAX_ELE]of char;
      dim:integer;
    public
      constructor Conjunto();
      procedure setElem(pos:integer;ele:char);
      function getElem(pos:integer):char;
      procedure setDim(n:integer);
      function getDim():integer;
      function pertenece(ele:char):boolean;
      procedure agregar(ele:char);
      procedure remover(ele:char);
      procedure union(A,B:Conjunto);
  end;

implementation

{ Conjunto }

constructor Conjunto.Conjunto();
var
  i:integer;
begin
  dim:=0;
  for i:=1 to MAX_ELE do
    elem[i]:=char(0); //null
end;

procedure Conjunto.setElem(pos: integer; ele: char);
begin
   if(pos>=1)AND(pos<=dim)then
     elem[pos]:=ele
   else
     ShowMessage('Conjunto.setElem:Fuera de Rango...');
end;

function Conjunto.getElem(pos: integer): char;
begin
  if(pos>=1)AND(pos<=dim)then
     result:=elem[pos]
   else
     result:=char(0);
end;

procedure Conjunto.setDim(n: integer);
begin
  if(n>=0)AND(n<=MAX_ELE)then
     dim:=n
   else
     ShowMessage('Conjunto.setDim:Fuera de Rango...');
end;

function Conjunto.getDim(): integer;
begin
  result:=dim;
end;

function Conjunto.pertenece(ele: char): boolean;
var
  i:integer;
  sw:boolean;
begin
  sw:=false;
  i:=1;
  while(i<=dim)and(NOT sw)do
  begin
    if(ele=elem[i])then
       sw:=true
    else
      i:=i+1;
  end;
  result:=sw;
end;

procedure Conjunto.agregar(ele: char);
begin
  if(NOT pertenece(ele))then
  begin
    dim:=dim+1;
    elem[dim]:=ele;
  end;
end;

procedure Conjunto.remover(ele: char);
var
  i,j:integer;
begin
  if(pertenece(ele))then
  begin
    i:=1;
    while(i<=dim)AND(ele<>elem[i])do
      i:=i+1;
    for j:=i to dim-1 do
      elem[i]:=elem[i+1];
    dim:=dim-1;
  end;
end;
procedure conjunto.union(A,B:Conjunto);
var i:Integer;
begin
dim:=0;
 for i:=1 to A.getDim() do
    agregar(A.getElem(i));
for i:=1 to B.getDim() do
if(NOT a.pertenece(B.getElem(i))) then
    agregar(B.getElem(i));
end;

end.

