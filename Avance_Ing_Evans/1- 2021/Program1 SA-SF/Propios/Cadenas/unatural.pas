unit UNatural;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs,crt;
type

  { natural }

  natural= class
    private   valor:integer;

      public

        constructor Crear();
        procedure setValor(val:integer);
        procedure digIns(pos,dig:integer);
        procedure digEli(pos:integer);
        function getValor():integer;
        function digCant():integer;
        function digInv():integer;
        function digSum():integer;
        function digPar():integer;
        function digImp():integer;
        function digPrim():integer;
        function digMay():integer;
        function digMen():integer;
        function esCap():string;
        function esPar():string;
        function esImpar():string;
        function esPrim():string;
        function aBin():string;
        function aOct():string;
        function aHexa():string;
        function aBaN(base:integer):string;
        function aRomano():string;
        function UniRom(val:integer):String;
        function DecRom(val:integer):String;
        function CenRom(val:integer):String;
        function MilRom(val:integer):String;
        function unid(val:integer):string;
        function decen(val:integer):string;
        function cente(val:integer):string;
        function milli(val:integer):string;
        function decem(val:integer):string;
        function centem(val:integer):string;
        function millon(val:integer):string;
        function help(val:integer):string;
        function son():string;
        procedure Unir2num(n1:natural);
        procedure invertir();
        function capicua():boolean;
        function pot(b,e:integer):integer;
        procedure exa1();
        function frecuencia(ele:integer):integer;
        function elemasrepetido():integer;
        procedure elimininar(ele:integer);
        function IsPrimo():boolean;
        function convertirALiteral():string;
        function obtenerUnaPalabra(pos,num:integer):string;
        function getPalUnidad(num:integer):string;
        function getPalDecena(num:integer):string;
        function getPalCentena(num:integer):string;
  end;

implementation

{ natural }

constructor natural.Crear();
begin
  valor:=0;
end;

procedure natural.setValor(val: integer);
begin
  if(valor>=0)then
    valor:=val
  else
    ShowMessage('El valor debe ser positivo..');
end;

function natural.getValor(): integer;
begin
  result:= valor;
end;
function natural.convertirALiteral():string;
var valorX,pos,dig:integer;
    s,pal:string;
begin
  s:='';
     pos:=1;
    valorX:=valor;
    while (valorX>0)do
    begin
         dig:=valorX mod 10;
         pal:=obtenerUnaPalabra(pos,dig);
         //caso especial 0
         if(dig=0 ) then
              begin
                 if (valor=0)then
                 s:=pal+s;
              end
         else
             begin
               s:=pal+s;
             end;


          pos:=pos+1;
         valorX:=valorX div 10;
    end;
    Result:=s;
end;

function natural.obtenerUnaPalabra(pos,num:integer):string;
var s:string;
begin
    case pos of
     1:s:=getPalUnidad(num);
     2:s:=getPalDecena(num);
     3:s:=getPalCentena(num);
     end;
    Result:=s;
end ;
function natural.getPalUnidad(num:integer):string;
var s:string;
begin
  case num of
   0: s:='cero';
   1: s:='uno';
   2: s:='dos';
   3: s:='tres';
   4: s:='cuatro';
   5: s:='cinco';
   6: s:='seis';
   7:  s:='siete';
   8:  s:='ocho';
   9:  s:='nueve';
  end;
  Result:=s;
end;
        function natural.getPalDecena(num:integer):string;
        var s:string;
begin
  case num of

   1: s:='dieci';
   2: s:='veinte';
   3: s:='treinta';
   4: s:='cuarenta y ';
   5: s:='cincuenta y';
   6: s:='sesenta y';
   7:  s:='setenta y';
   8:  s:='ochenta y';
   9:  s:='noventa y';
  end;
  Result:=s;
end;
        function natural.getPalCentena(num:integer):string;
        var s:string;
begin
  case num of
   1: s:='cien ';
   2: s:='doscientos ';
   3: s:='trescientos ';
   4: s:='cuatrocientos ';
   5: s:='quinientos ';
   6: s:='seiscientos ';
   7:  s:='setecientos ';
   8:  s:='ochocientos ';
   9:  s:='novecientos ';
  end;
  Result:=s;
end;

function natural.digCant(): integer;
var
    aux,c,digi:integer;
begin
    aux:=valor;
    c:=0;
       while (aux<>0)do
         begin
           digi:=aux MOD 10;
           aux:=aux DIV 10;
           c:=c+1;
         end;
       result:=c;
end;

procedure natural.digIns(pos, dig: integer);
var
    aux,n,digi,i:integer;
begin
    n:= digCant()-pos+1;
    aux:=0;
    i:=0;
      while(i<n)do
        begin
          digi:=valor MOD 10;
          aux:=(aux * 10)+digi;
          i:=i+1;
        end;
      valor:=(valor * 10)+dig;
      while(aux <> 0)do
        begin
          digi:=aux MOD 10;
          aux:=aux DIV 10;
          valor:=(valor * 10)+digi;
        end;
end;

procedure natural.digEli(pos: integer);
var
   n,aux,digi,i:integer;
begin
   n:=digCant()-pos+1;
   aux:=0;
   i:=0;
     while(i<n)do
       begin
          digi:= valor MOD 10;
          valor:=valor DIV 10;
          aux:=(aux*10)+digi;
    i:=i+1;
  end;
  aux:=aux DIV 10;
  while (aux<>0) do
  begin
    digi:=aux MOD 10;
    aux:=aux DIV 10;
    valor:=(valor*10)+digi;

  end;
end;

function natural.digInv(): integer;
var
  dig,inv:integer;
begin
  inv:=0;
  while (valor<>0) do
  begin
    dig:=valor MOD 10;
    valor:= valor DIV 10;
    inv:=(inv*10)+dig;
  end;
   result:= inv;
end;

function natural.digSum(): integer;
var
   sum,dig:integer;
begin
   sum:=0;
  while ( valor<>0) do
    begin
      dig:=valor MOD 10;
      valor:=valor DIV 10;
      sum:=sum+dig;
    end;
   result:= sum;
end;

function natural.digPar(): integer;
var
  dig,cont:integer;
begin
  cont:=0;
  while ( valor<>0) do
  begin
    dig:=valor MOD 10;
    valor:=valor DIV 10;
    if (dig MOD 2)=0then
    begin
      cont:=cont+1;
    end;
  end;
  result:= cont;
end;

function natural.digImp(): integer;
var
  dig,cont:integer;
begin
  cont:=0;
  while ( valor<>0) do
  begin
    dig:=valor MOD 10;
    valor:=valor DIV 10;
    if (dig MOD 2)=1 then
    begin
      cont:=cont+1;
    end;
  end;
  result:= cont;
end;

function natural.digPrim(): integer;
var
  dig,c:integer;
begin
   c:=0;
  while (valor<>0) do
  begin
    dig:=valor MOD 10;
    valor:=valor DIV 10;
    if (dig=2) then
    begin
      c:=c+1;
    end;
    if (dig=3) then
    begin
      c:=c+1;
    end;
    if (dig=5) then
    begin
      c:=c+1;
    end;
    if (dig=7) then
    begin
      c:=c+1;
    end;
  end;
  result:=c;
end;

function natural.digMay(): integer;
var
  may,dig:integer;
begin
  may:=0;
  while (valor>0) do
  begin
    dig:=valor MOD 10;
    valor:=valor DIV 10;
    if (dig>may) then
    begin
      may:=dig;
    end;
  end;
  result:=may;
end;

function natural.digMen(): integer;
var
  men,dig:integer;
begin
  men:=9;
  while (valor>0) do
  begin
    dig:=valor MOD 10;
    valor:=valor DIV 10;
    if (dig<men) then
    begin
      men:=dig;
    end;
  end;
  result:=men;
end;

function natural.esCap(): string;
var
  dig,inv,aux:integer;
  cad:String;
begin
  inv:=0;
  cad:='';
  aux:=valor;
  while (valor<>0) do
  begin
    dig:=valor MOD 10;
    valor:= valor DIV 10;
    inv:=(inv*10)+dig;

  if (inv=aux) then
  begin
    cad:='ES CAPICUA';
  end
  else
  begin
    cad:='NO ES CAPICUA';
  end;

  end;
  result:=cad;
end;

function natural.esPar(): string;
var par:string;

begin
 par:='';
 if((valor mod 2)=0)then
 begin
  par:= 'ES PAR';
 end
 else
 begin
 par:='NO ES PAR';
 end;
   result:=par;
end;

function natural.esImpar(): string;
var impar:string;
begin
 impar:='';
 if((valor mod 2)<>0)then
 begin
 impar:= 'ES IMPAR';
 end
 else
 begin
 impar:= ' NO ES IMPAR';
 end;
  result:= impar
end;

function natural.esPrim(): string;
var
  aux,h,j:integer;
  cad:String;
begin
 cad:='';
 j:=0;
 aux:=valor;
 h:=valor;
 while (h>0) do
 begin
   if (aux MOD h )=0 then
   begin
     j:=j+1;
   end;
   h:=h-1;
 end;
 if (j=2) then
 begin
   cad:='ES PRIMO';
 end
 else
 begin
   cad:='NO ES PRIMO';
 end;
 result:=cad;
end;

function natural.aBin(): string;
var
  aux,dig:integer;
  cad:String;
begin
   cad:='';
  aux:=valor;
  while (aux<>0) do
  begin
    dig:=aux MOD 2;
    aux:=aux DIV 2;
   cad:=char(dig+48)+cad;
    result:= cad;
  end;
end;

function natural.aOct(): string;
var
  aux,dig:integer;
  cad:String;
begin
  cad:='';
  aux:=valor;
  while (aux<>0) do
  begin
    dig:=aux MOD 8;
    aux:=aux DIV 8;
    case(dig)of
     0..8:cad:=char(dig+48)+cad;
    end;
    result:= cad;
end;
  end;

function natural.aHexa(): string;
var
  aux,dig:integer;
  cad:String;
begin
   cad:='';
  aux:=valor;
  while (aux<>0) do
  begin
    dig:=aux MOD 16;
    aux:=aux DIV 16;
    case (dig) of
      0..9:cad:=char(dig+48)+cad;
      10..15:cad:=char(dig+55)+cad;

    end;
    result:= cad;
  end;
end;

function natural.aBaN(base: integer): string;
var aux, dig:integer;
    cad:string;
begin
  cad:='';
  aux:=valor;
    while (aux<>0) do
  begin
    dig:=aux MOD base;
    aux:=aux DIV base;
    case(dig)of
     0..9:cad:=char(dig+48)+cad;
    end;
    result:=cad;
 end;
end;

function natural.aRomano(): string;
var cad:string;
begin
 cad:= '';
 case (valor) of
 0..9:cad:=unirom(valor);
 10..99:cad:=decrom(valor);
 100..999:cad:= cenrom(valor);
 1000..3999:cad:= milrom(valor);
 else
   cad:='FUERA DE RANGO' ;
 end;
   result:= cad;
end;

function natural.UniRom(val: integer): String;
var uni:string;
begin
 uni:='';
 case(val ) of
 0:uni:='';
 1:uni:='I';
 2:uni:='II';
 3:uni:='III';
 4:uni:='IV';
 5:uni:='V';
 6:uni:='VI';
 7:uni:='VII';
 8:uni:='VIII';
 9:uni:='IX';
 end;
 result:= uni;
end;

function natural.DecRom(val: integer): String;
var uni,dec:string;
begin
 dec:='';
 uni:=unirom(val mod 10);
 case(val div 10) of
 1:dec:='X';
 2:dec:='XX';
 3:dec:='XXX';
 4:dec:='LX';
 5:dec:='L';
 6:dec:='LX';
 7:dec:='LXX';
 8:dec:='LXXX';
 9:dec:='XC';
  end;
 result:= dec+uni;
end;

function natural.CenRom(val: integer): String;
var dec,cen:string;
begin
 cen:='';
 dec:= decrom(val mod 100);
 case(val div 100 ) of
 1:cen:='C';
 2:cen:='CC';
 3:cen:='CCC';
 4:cen:='CD';
 5:cen:='D';
 6:cen:='DC';
 7:cen:='DC';
 8:cen:='DCCC';
 9:cen:='CM';
 end;
 result:=cen+dec;
end;

function natural.MilRom(val: integer): String;
var mil,cen:string;
begin
 mil:='';
 cen:= cenrom(val mod 1000);
 case(val div 1000) of
  1:mil:='M';
 2:mil:='MM';
 3:mil:='MMM';

 end;
 result:= mil+cen;
end;

function natural.unid(val: integer): string;
var uni:string;
begin
 uni:='';
 case (val )of

 0:uni:='CERO';
 1:uni:='UNO';
 2:uni:='DOS';
 3:uni:='TRES';
 4:uni:='CUATRO';
 5:uni:='CINCO';
 6:uni:='SEIS';
 7:uni:='SIETE';
 8:uni:='OCHO';
 9:uni:='NUEVE';

 end ;
  result:= uni;
end;

function natural.decen(val: integer): string;
var dece,helps:string;
begin
 dece:='';
 helps:= help(val mod 10);
  case(val div 10 )of

  2:dece:='VEINTE ';
  3:dece:='TREINTA ';
  4:dece:='CUARENTA ';
  5:dece:='CINCUENTA ';
  6:dece:='SESENTA ';
  7:dece:='SETENTA ';
  8:dece:='OCHENTA ';
  9:dece:='NOVENTA ';

  end;
      result:=dece + helps;
end;

function natural.cente(val: integer): string;
var dece,cen:string;
begin
 cen:='';
 dece:=decen(val mod 100);
 case(val div 100 )of
  1:cen:='CIEN';
  2:cen:='DOSCIENTOS ';
  3:cen:='TRESCIENTOS ';
  4:cen:='CUATROCIENTOS ';
  5:cen:='QUINIENTOS ';
  6:cen:='SEISCIENTOS ';
  7:cen:='SETECIENTOS ';
  8:cen:='OCHOCIENTOS ';
  9:cen:='NOVECIENTOS ';

 end;
 Result:= cen+dece;
end;

function natural.milli(val: integer): string;
var cen, mili:string;
begin
 mili:='';
 cen:=cente(val MOD 1000);
 case(val DIV 1000)of
  1:mili:='MIL ';
  2:mili:='DOS MIL ';
  3:mili:='TRES MIL ';
  4:mili:='CUATRO MIL ';
  5:mili:='CINCO MIL ';
  6:mili:='SEIS MIL ';
  7:mili:='SIETE MIL ';
  8:mili:='OCHO MIL ';
  9:mili:='NUEVE MIL ';
 end;
 result:= mili+cen;
end;
                       //
function natural.decem(val: integer): string;
var mil,decemi:string;
begin
 decemi:='';
 mil:=milli(val mod 10000);
 case(val div 10000 )of
  1:decemi:='DIEZ MIL';
  2:decemi:='VEINTE MIL';
  3:decemi:='TREINTA MIL';
  4:decemi:='CUARENTA MIL';
  5:decemi:='CINCUENTA MIL';
  6:decemi:='SESENTA MIL';
  7:decemi:='SETENTA MIL';
  8:decemi:='OCHENTA MIL';
  9:decemi:='NOVENTA MIL';

 end;
 result:=decemi+mil;
end;

function natural.centem(val: integer): string;
var cenmi,decemi:string;
begin
 cenmi:='';
 decemi:= decem(val mod 100000);
 case (val div 100000 )of
  1:cenmi:='CIEN MIL ';
  2:cenmi:='DOSCIENTOS MIL ';
  3:cenmi:='TRESCIENTOS MIL';
  4:cenmi:='CUATROCIENTOSMIL';
  5:cenmi:='QUINIENTOS MIL';
  6:cenmi:='SEISCIENTO SMIL';
  7:cenmi:='SIETECIENTOS MIL';
  8:cenmi:='OCHOCIENTOS MIL';
  9:cenmi:='NOVECIENTOS MIL';
 end;
 result:= cenmi+decemi;
end;

function natural.millon(val: integer): string;
var million,cenmi:string;
begin
 million:='';
 cenmi:= centem(val mod 100000);
 case(val div 1000000)of

  1:cenmi:='UN MILLON ';
 end;
 result:=million+cenmi;
end;

function natural.help(val: integer): string;
var helps,uni:string;
begin
 helps:='';
   uni:=unid(val);
   case(val ) of

  10:helps:='DIEZ ';
  11:helps:='ONCE ';
  12:helps:='DOCE ';
  13:helps:='TRECE ';
  14:helps:='CATORCE ';
  15:helps:='QUINCE ';
  16:helps:='DIECISEIS ';
  17:helps:='DIECISIETE ';
  18:helps:='DIECIOCHO ';
  19:helps:='DIECINUEVE ';
   end;
   result:=helps+uni;
end;

function natural.son(): string;
var cad:string;
begin
 cad:='';
 case(valor)of
  0..9:cad:=unid(valor);
  10..19:cad:=help(valor);
  20..99:cad:=decen(valor);
  100..999:cad:= cente(valor);
  1000..9999:cad:=milli(valor);
  10000..99999:cad:= decem(valor) ;
  100000..999999:cad:= centem(valor);
  1000000..9999999:cad:=millon(valor);
  else
    cad:= 'fuera de rango';
 end;
    result:= cad;
end;

procedure natural.Unir2num(n1: natural);
begin
valor:=(valor*(pot(10,n1.digCant())))+n1.valor;
end;

procedure natural.invertir();
var d,num:integer;
begin
 num:=0;
   while(valor>0)do begin
     d:=valor mod 10;
     valor:=valor div 10;
     num:=num*10+d;
   end;
   valor:=num;
end;
         //valor=101;
function natural.capicua(): boolean;
var  n1:natural;
begin
 n1:=natural.Crear();//n1.valor=0;
 n1.setValor(valor);  //n1.valor=valor;
 n1.invertir();       //n1.invertir=15
 result:=(n1.valor=valor);
end;

function natural.pot(b, e: integer): integer;
var r,I:integer;
begin
    r:=1;
    for i:=1 to e do begin
      r:=r*b;
    end;
    result:=r;
end;
//12821 ->18122
//181


procedure natural.exa1();
var i,masr,fr:integer;
begin
 masr:=elemasrepetido();
 fr:=frecuencia(masr);
 elimininar(masr);
 for i:=1 to fr do begin
    valor:=valor*10+masr;
 end;
end;
                            //ele=1
function natural.frecuencia(ele: integer): integer;
var n,d,c:integer;
begin
  n:=valor;
  d:=0; c:=0;
  while (n>0)do begin
     d:=n mod 10;
     n:=n div 10;
     if (d=ele)then
         c:=c+1;
  end;
  result:=c;
end;

function natural.elemasrepetido(): integer;
var n,fre,ele,d:integer;
begin
  n:=valor;
  fre:=frecuencia(n mod 10);
  ele:=n mod 10;
  while (n>0) do begin
     d:=n mod 10;
     n:=n div 10;
     if((frecuencia(d)>fre) or
     ((frecuencia(d)=fre) and (d >ele) ) ) then begin
       fre:=frecuencia(d);
       ele:=d;
     end;
  end;
  result:=ele;
end;

procedure natural.elimininar(ele: integer);
var n,num,d,a:integer;
begin
   num:=0;a:=1; n:=valor;
  while (n>0)do begin
   d:=n mod 10;
   n:=n div 10;
   if(d<>ele)then begin
     num:=d*a+num;
      a:=a*10;
   end;
  end;
  valor:=num;
end;

function natural.IsPrimo(): boolean;
var i,c:Integer;
begin
 c:=0;
  for i:=1 to valor do begin
      if(valor mod i=0)then
      c:=c+1;
  end;
  result:=(c=2);
end;

end.


