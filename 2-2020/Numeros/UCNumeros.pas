unit UCNumeros;

interface
uses Math  ;
Type
  Numero= class
    Private
          valor : cardinal;
    Public
          Function getValor: cardinal;
          procedure setValor (nuevoValor : cardinal);
          Function cantidadDig():cardinal;
          Function cantidadDig2():cardinal;
          Function sumaDeDig():cardinal;
  end;

implementation


{ Numero }

function Numero.cantidadDig: cardinal;   // Metodo rapido
begin
      Result:=Trunc(Log10(valor))+1;
end;

function Numero.cantidadDig2: cardinal;   // Metodo largo
var n,nd:cardinal;
begin
  nd:=0;
  n:=valor;
   while (n>0) do
   begin
      nd:=nd+1;

      n:=n div 10;
   end;
   Result:=nd;
end;

function Numero.getValor: cardinal;
begin
          Result:= valor;
end;

procedure Numero.setValor(nuevoValor: cardinal);
begin
    valor:= nuevoValor;
end;

function Numero.sumaDeDig: cardinal;
var nAux,d,acum: cardinal;
begin

nAux:=valor;
acum:=0;
while (nAux>0) do
begin
  d:= nAux mod 10; // 1era 4 si es que tenemos un 1234
  acum:=acum+d;
  nAux:=nAux div 10;
end;

Result:= acum;
end;

end.
