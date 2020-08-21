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
               Function convertirALiteral() :String  ;
               Function convertirDigALiteral(d,pos,dAnt :Cardinal;var pTotal:string) :String;
               Function unidadLit(d: Cardinal):String;
               Function decLit(d,dAnt:Cardinal;var pTotal:String) :String;
               Function centLit(d:Cardinal):string;
               Procedure eliminarS(a,b:integer;var pTotal:String);
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
// ---------Pasar un numero a literal
//separo el numero
//lo paso a la funcion literal
Function Numero.convertirALiteral :string;
var
c,nAux,d,dAnt:Cardinal;
p: String;

begin
p:='';
c:=0 ;
nAux:=Valor;
dAnt:=0;
 c:=1;
if nAux=0 then
p:='cero';
  while(nAux>0) do
      begin
      d:=  nAux mod 10 ;


      
      p:=convertirDigALiteral(d,c,dAnt,p)+' '+p;
      dAnt:=d;
      c:=c+1 ;
      nAux:= nAux div 10 ;
  end;


Result:=p;
end;

Function Numero.convertirDigALiteral(d: Cardinal; pos: Cardinal; dAnt: Cardinal;var pTotal:string):String ;
var p :String;
begin
p:='';
  case pos of
        1: p:=unidadLit(d);
        2: p:=decLit(d,dAnt,pTotal);
        3: p:=centLit(d);
        4: case d of

            1:p:='mil';
            2..9:p:=unidadLit(d)+'mil';
           end;
        5: case d of
            0:p:='';
            1..9:p:=decLit(d,dAnt,pTotal)+'';
        end;
        6: case d of
            0:p:='';
            1..9:p:=centLit(d)+'';
        end;
        7: case d of
            1:p:='millon';
            2..9:p:=unidadLit(d)+'millones';
           end;
        8: p:=decLit(d,dAnt,pTotal)+'';
        9: p:=centLit(d) +'';

  end;
Result:=p;
end;

 Function Numero.unidadLit(d: Cardinal) :string;
 var p:string;
 begin
 p:='';
           case d of
            1: p:='uno';
            2: p:='dos';
            3: p:='tres';
            4: p:='cuatro';
            5: p:='cinco';
            6: p:='seis';
            7: p:='siete';
            8: p:='ocho';
            9: p:='nueve';
           end;
 Result:=p;
 end;

 Function Numero.decLit(d: Cardinal; dAnt: Cardinal;var pTotal:string): string;
 var p:String   ;

begin
p:='';
            case d of
              1: case dAnt of
                    0: p:='diez';
                    1: begin
                    p:='once';
                    pTotal:=pTotal.Substring(3);
                    end;
                    2: begin
                    p:='doce' ;
                    pTotal:=pTotal.Substring(3);
                    end;
                    3: begin
                    p:='trece';
                    pTotal:=pTotal.Substring(4);
                    end;
                    4: begin
                    p:='catorce';
                    pTotal:=pTotal.Substring(6);
                    end ;
                    5: begin
                    p:='quince';
                    pTotal:=pTotal.Substring(5);
                    end;
                    6..9:p:='dieci'
                   end;

              2: begin
                  case dAnt of
                    0: p:='veinte';
                    1..9: p:='veinti'
                   end;

                end;
              3: p:='treinta';
              4: p:='cuarenta';
              5: p:='cincuenta';
              6: p:='sesenta';
              7: p:='setenta';
              8: p:='ochenta';
              9: p:='noventa';
             end;
             if((d>=3) and (d<=9) and (dAnt>0))then     //if del conector
              p:=p+' '+'y';

            Result:=p;
end;

Function Numero.centLit(d: Cardinal):string;
var p:string;
begin

  p:='' ;
            case d of
                1:p:='ciento';
                2:p:='doscientos';
                3: p:='trescientos ';
                4: p:='cuatroscientos ';
                5: p:='quinientos ';
                6: p:='seiscientos ';
                7: p:='setescientos ';
                8: p:='ochocientos ';
                9: p:='novecientos ';
            end;

  Result:=p;
end;

procedure Numero.eliminarS(a: Integer; b: Integer; var pTotal:string) ;
begin
 pTotal:=pTotal.Substring(b+1);
end;
end.

