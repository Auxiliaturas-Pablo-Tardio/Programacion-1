unit UVector;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
const MAX_ELE = 1200;
type
vector = class
  private
     dim :integer;
     elem :array [1..MAX_ELE] OF integer;
  public
      constructor crear;
       procedure ordenar;
       procedure ordenarInicioFin(posa,posb:integer);
       procedure setDim(newDim:integer);
       function getDim():integer;
       procedure setEle(pos:integer;newElem:integer);
        procedure intercambiar(posa,posb:integer);
        function myToString():string;
       end;
implementation
    constructor vector.crear();
    var i :integer;
    begin
         for i:=1 to MAX_ELE do
         begin
             elem[i]:=0;
         end;
         dim:=0;
    end;
    function vector.getDim():integer;
    begin
         Result:=dim;
    end;

    procedure vector.setDim(newDim:integer);
    begin
         dim:=newDim;
    end;
    procedure vector.setEle(pos:integer;newElem:integer);
    begin
         elem[pos]:=newElem;
    end;

    procedure vector.ordenar;
    var i,j,x: integer;
    begin
       for i:=1 to dim-1 do
       begin
          for j:=i+1 to dim do
          begin
             if (elem[i]<elem[j])then
              begin
                intercambiar(i,j);
              end;
          end;
       end;
    end;
    procedure vector.ordenarInicioFin(posa,posb:integer);
    var i,j,x: integer;
    begin
       if ((posa<dim) and (posb<=dim) and (posa<posb))then
       begin


       for i:=posa to posb-1 do
       begin
          for j:=i+1 to posb do
          begin
             if (elem[i]<elem[j])then
              begin
                intercambiar(i,j);
              end;
          end;
       end;
       end;
    end;
    procedure vector.intercambiar(posa,posb:integer);
    var x:integer;
    begin
         x:=elem[posa];
         elem[posa]:=elem[posb];
         elem[posb]:=x;
    end;

    function vector.myToString():string;
    var s:string; i:integer;
    begin
        s:='';
        for i:=1 to dim do
        begin
           s:=s+IntToStr(elem[i])+',';
        end;
        Result:=s;
    end ;
end.

