unit PracticoU1Unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
type

   { PracticoU1 }

   PracticoU1=class
   private
       n,m:Integer;
   function invertir(n1:integer):integer ;
   public
      //Solo se nombra los metodos
      procedure ejercicio01(k:Integer);
      function ejercico02(n2,m2:Integer):Integer;
      function ejercicio17Calculadora(n1,m1,lim:integer):Integer;
   end;

implementation

function PracticoU1.invertir(n1: integer): integer;
var
  r:integer;
begin
 r:=0;
 while(n1>0)do
  begin
    r:=r*10+ (n1 mod 10);
    n1:=n1 div 10;
  end;
  Result:=r;
end;

{ PracticoU1 }
//Se implementa el metodo
procedure PracticoU1.ejercicio01(k:Integer);
var c:integer;
begin

  c:=1;
  while (c<=k) do
  begin


    ShowMessage(IntToStr(c));
    c:=c+1;
   end;

end;

function PracticoU1.ejercico02(n2, m2: Integer): Integer;
var a,c:Integer;
begin
  c:=1;
   n:=n2;
   m:=m2;
   a:=n;
   while(c<m) do
   begin
     c:=c+1;
     a:=a+n ;
   end;

Result:=a;
end;

function PracticoU1.ejercicio17Calculadora(n1, m1, lim:integer): Integer;
//Asumiendo que la calculadora hace sumas
var
  n1Nuevo,m1Nuevo:Integer;
begin
n1Nuevo:=0;
m1Nuevo:=0;

     while(lim>0)  do
      begin
         n1Nuevo:=n1Nuevo*10+(n1 mod 10);
          m1Nuevo:=m1Nuevo*10+(m1 mod 10);
         n1:=n1 div 10 ;
         m1:=m1 div 10;
        lim:=lim-1;
      end;
       n1Nuevo:=invertir(n1Nuevo);
       m1Nuevo:=invertir(m1Nuevo);
 Result:= n1Nuevo+m1Nuevo
end;

end.
