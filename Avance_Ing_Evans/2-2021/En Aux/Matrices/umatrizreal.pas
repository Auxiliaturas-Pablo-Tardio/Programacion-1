unit UMatrizReal;


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

const MAX_F =1024;
const MAX_C =1024;
type

  { Matriz }

  { MatrizReal }

  MatrizReal=class
    private
      f: integer;
      c: integer;

      elem : array [1..MAX_F,1..MAX_C] of Real;
    public
      constructor crear();
      function getElem (fil,col:integer):Real;
      function getFilas ():integer;
      function getCols():integer;
      procedure cargar();
      procedure setElem(fil, col:integer; elemNuevo: Real);

      procedure setFilas(fil:integer);
      procedure setColumnas(cols:integer);

      procedure adicionarFila(a, b: integer;m:Real);
      procedure multiplicacionDeFila(a: integer;m :Real);
      procedure inversaPorGauss();
      procedure intercambiarFilas(a,b:integer);
      procedure concatenarMatrizIdentidad();
  end;

implementation

{ Matriz }

constructor MatrizReal.crear();
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

function MatrizReal.getElem(fil, col: integer): Real;
begin
  Result:=elem[fil,col];
end;

function MatrizReal.getFilas(): integer;
begin
   Result:=f;
end;

function MatrizReal.getCols(): integer;
begin
  Result:=c;
end;

procedure MatrizReal.cargar();
 var i,j:integer;
begin
 f:=StrToInt(InputBox('Introduzca Filas','',''));
 c:=StrToInt(InputBox('Introduzca Columnas','',''));
 for i:=1 to f do
 begin
    for j:=1 to c do
    begin
       elem[i,j]:=StrToFloat(InputBox('Introduzca Elem ','Fila:'+IntToStr(i)+' Columna: '+IntToStr(j),''));
    end;
 end;
end;

procedure MatrizReal.setElem(fil, col:integer; elemNuevo: Real);
begin
     elem[fil,col]:=elemNuevo;
end;



procedure MatrizReal.setFilas(fil: integer);
begin
   f:=fil;
end;

procedure MatrizReal.setColumnas(cols: integer);
begin
   c:=cols;
end;



procedure MatrizReal.adicionarFila(a, b: integer;m:Real);
 var i:integer;
 begin
  for i:=1 to c   do
  begin
       elem[b,i]:=elem[b,i] +(elem[a,i]*m) ;
  end;
 end;
procedure MatrizReal.multiplicacionDeFila(a: integer;m :Real);
var i:integer;
begin
 for i:=1 to c   do
 begin
      elem[a,i]:=elem[a,i]*m;
 end;
end;

procedure MatrizReal.inversaPorGauss();
var i,j,intF:integer;
    r:Real;
begin
   //Crear La matriz de identidad a su derecha
    concatenarMatrizIdentidad();



  for i:=1 to f do
  begin
     if(elem[i,i]=0)then
     begin
      //Intercambio con fila distinta de 0
      intF:=1 ;
      while((elem[intF,i]=0) and (intF<=f)) do
      begin
           intF:=intF+1
      end;
      intercambiarFilas(intF,i);
     end;
     if(elem[i,i]<>1) then
     begin
     //convierto en 1

           r:=1/elem[i,i];
           multiplicacionDeFila(i,r);
     end;
     //hasta este punto el elemento actual de la DP esta en 1
      //convierto toda la columna en 0
      for j:=1 to f do
      begin
           if(i<>j) then
           begin
            adicionarFila(i,j,-elem[j,i]);
           end;
      end;



  end;
end;

procedure MatrizReal.intercambiarFilas(a, b: integer);
var i:integer;
    x:Real;
begin
  for i:=1 to c do
  begin
      x:= elem[a,i];
      elem[a,i]:=elem[b,i];
      elem[b,i]:=x;
  end;
end;

procedure MatrizReal.concatenarMatrizIdentidad();
var cAnti,i,j:integer;

begin
  cAnti:=c;
  c:=c*2;

  for i:=1 to f do
  begin
      for j:=(cAnti+1) to (cAnti*2) do
      begin
         if((j-i)=cAnti)then
         begin
              elem[i,j]:=1;
         end
         else
         begin
             elem[i,j]:=0;
         end;
      end;
  end;
end;

end.

