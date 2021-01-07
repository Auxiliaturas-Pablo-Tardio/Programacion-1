unit UCNumeros;

interface
uses Math,System.SysUtils;
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
          Function conversionBaseN01(baseN :cardinal): cardinal;
          Function conversionBaseN02Teorema(baseN :cardinal): cardinal;
          Function conversionARomano(): String;
          Function convertirDigARomano(dig,pos:cardinal): String  ;
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

function Numero.conversionARomano: String;
var dig, pos,nAux :cardinal;
acumPalabra: string;
begin
nAux:=valor;
pos:=1;

     while nAux>0 do
     begin
      dig:= nAux mod 10;

      acumPalabra:= convertirDigARomano(dig,pos) +acumPalabra;
      pos:=pos+1;
      nAux:=nAux div 10;
     end;
Result:= acumPalabra;
end;

function Numero.conversionBaseN01(baseN: cardinal): cardinal;
var nAux,dActual : cardinal;
    acum: String;
begin
acum := '';
nAux:=  valor;
while (nAux>0) do
begin
  dActual:=nAux mod baseN;
  acum:= IntToStr(dActual) +acum;
  nAux:=nAux div baseN;

end;

Result:=StrToInt(acum);
end;

function Numero.conversionBaseN02Teorema(baseN: cardinal): cardinal;
var nAux,dActual,acum,pos : cardinal;

begin
acum := 0;
pos:=0;
nAux:=  valor;
while (nAux>0) do
begin

  dActual:=nAux mod baseN;
  //digito x Base  Elevado a la posicion
  //Trunc --> Extended To Int
  acum:= acum+ dActual*(Trunc(power(10,pos)));
  nAux:=nAux div baseN;
  pos:=pos+1; // 1 unidad, 2 decena , 3 centena
end;

Result:=acum;
end;

function Numero.convertirDigARomano(dig, pos: cardinal): String;
begin

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
