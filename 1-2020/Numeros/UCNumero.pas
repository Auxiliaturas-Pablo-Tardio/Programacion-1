unit UCNumero;

interface
uses Math, System.SysUtils;
Type
      Numero = Class
        Private
               Valor : Cardinal;
        Public
               Function getValor : Cardinal;
               Procedure setValor(V:Cardinal);
               Function countDigit:Byte;
               Function isPar: Boolean;
               Procedure delDigito(P:Byte);
               Function toBin:String;
               Function toBin2:String;
               Function toHex:String;
               Function digitoBinAHexa(stringBinaria:String): String;
               Function convertirALetraHexa(valor:Integer)  :String;

      End;

implementation

{ Numero }

function Numero.countDigit: Byte;
Var
   c: Byte;
   n : cardinal;
begin
     c:=1;
     n:=Valor;
     while n>9 do
     begin
          n:=n div 10;
          c:=c+1;
     end;
     result:=c;

     //result:= Trunc(log10(Valor))+1;

end;

procedure Numero.delDigito(P: Byte);
begin

end;

function Numero.getValor: Cardinal;
begin
     Result:=Valor;
end;

function Numero.isPar: Boolean;
begin
     if Valor mod 2=0 then
        Result:=True
     else Result:=False;

     //Result:=(Valor mod 2)=0;
end;

procedure Numero.setValor(V: Cardinal);
begin
     Valor:= V;
end;

function Numero.toBin: String;
Const
     Dig ='01';
Var
   n : Cardinal;
   r : String;
   d : Byte;
begin
     n:=Valor;r:='';
     while N>0 do
     begin
          d:= N mod 2;
          r:= Dig[d+1] + r;
          N:= N Div 2;
     end;
     Result:=r;
end;

//  Menos de 4 digitos, ya no corta
// No hace conversion a hexadecimal

function Numero.toHex: String;
Var
  binario: String;
  digitoHexa: String;
  longitud: Integer;
  stringResultado:String;
begin
  binario:= toBin2();      //Tenemos en binario el numero
  longitud:=binario.Length   ;
  stringResultado:='';
  while(longitud>=4) do
  begin

      digitoHexa:=binario.Substring(longitud-4,4);
      //Convertir a hexa
       digitoHexa:=digitoBinAHexa(digitoHexa) ;
       stringResultado:=digitoHexa+stringResultado;
       longitud:=longitud-4;
  end;
  longitud:=binario.Length   ;
  if(longitud mod 4<>0) then
  begin
       digitoHexa:=binario.Substring(0,longitud mod 4);
       digitoHexa:=digitoBinAHexa(digitoHexa);
        stringResultado:=digitoHexa+stringResultado;
  end ;

    Result:= stringResultado;
end;




function  Numero.digitoBinAHexa( stringBinaria:String):String;
Var
indice,exponente,numeroBinario,base, resultado,digito,acumulador: integer;
  stringResultado: String;

Begin
      indice:=  stringBinaria.Length;
      exponente:=0;
      base:=2;
       acumulador:=0;
      //-------------
      while(indice>=1)do
      Begin
        numeroBinario :=  StrToInt(stringBinaria[indice]);     //1
        resultado:= trunc(Power(base,exponente)) ;
        digito:=numeroBinario*resultado;
        acumulador :=acumulador+digito;
        //para seguir el ciclo
          indice:=indice-1;
          exponente:=exponente+1;
      End;
      if((acumulador>=10) and (acumulador <=15))then
      Begin
           //Funcion que si esta entre 10 y 15 convierta a letras en hexadecimal
           stringResultado:=convertirALetraHexa(acumulador) ;
      End
       else
       begin
        stringResultado:=IntToStr(acumulador);
       end;



    Result:= stringResultado;

End;



function Numero.convertirALetraHexa(valor:Integer) :String ;
Var
valorAsciiDecimal:Integer ;
letra:String;
Begin
letra:='' ;
valorAsciiDecimal:=valor+55;   //Transformamos a valor ascii nuestro numero de entrada
 letra:=letra+Char(valorAsciiDecimal);
Result:=letra;
End;

//-----------------------------------------

 function Numero.toBin2: String;
 Var
      numeroAux: Cardinal;
      residuo: String;
      acumulador: String;
begin
     acumulador:='';
     numeroAux:=Valor;
      while(numeroAux>0)do
      begin
         residuo:=IntToStr(numeroAux mod 2); // '1'
         acumulador:=residuo+acumulador;
         numeroAux:= numeroAux div 2;

      end;
      Result:= acumulador
end;
end.
