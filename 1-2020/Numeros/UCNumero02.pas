unit UCNumero02;

interface
uses Math, System.SysUtils;
Type
      Numero = Class
        Private
               Valor : Cardinal;
    procedure decenaLiteral(var p: string; dig: Cardinal; digAnterior: Integer);
    procedure centenaLiteral(var p: string; dig: Cardinal; digAnterior: Integer);
    procedure addConectorDecena(digAnterior: Integer; var p: string);
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
               Function getDigitoConvertido(dig:Cardinal;digAnterior:integer;pos:integer) : String;
               procedure unidadesLiteral(var p:string;dig:Cardinal;digAnterior:integer); 
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

function Numero.convertirALiteral() :String;
var
nAux:Cardinal;
p :string;
dig: Cardinal;
pos: integer;
digAnterior:Cardinal ;
begin
   p:='';
   nAux:=Valor;
   pos:=1;
   digAnterior:=0;
   while nAux>0 do
   begin
       dig:=nAux mod 10;
       p:=getDigitoConvertido(dig,digAnterior,pos)+p;
       if(p='Ciento ')then
       p:='cien';
       pos:=pos+1 ;
       digAnterior:=dig;
       nAux:=nAux div 10;
       
   end;
   Result:=p;
end;
function Numero.getDigitoConvertido
( dig:Cardinal; digAnterior:integer;pos:integer):String;
var p:string;
begin
p:='';
    case pos of
    1:unidadesLiteral(p,dig,digAnterior);
    2: decenaLiteral(p, dig, digAnterior);
  
    3: centenaLiteral(p, dig, digAnterior);
    4: begin
      unidadesLiteral(p,dig,digAnterior);
      p:=p+'mil '
      end;
    5: begin
      decenaLiteral(p,dig,digAnterior);
      p:=p+'mil '
      end;
    6: begin
      centenaLiteral(p,dig,digAnterior);
      p:=p+'mil '
      end;
               
      

    end;
    
Result:=p;
end;

procedure Numero.unidadesLiteral
(var p: string; dig: Cardinal; digAnterior: Integer);
begin
      
         case dig of
             0:p:='';
             1:p:='Uno';
             2:p:='Dos';
             3:p:='Tres';
             4:p:='Cuatro';
             5:p:='Cinco';
             6:p:='Seis';
             7:p:='Siete';
             8:p:='Ocho';
             9:p:='Nueve';
             
         end;
end;

procedure Numero.addConectorDecena(digAnterior: Integer; var p: string);
begin
  case digAnterior of
    0:
      p := p + ' ';
    1..9:
      p := p + ' y ';
  end;
end;

procedure Numero.centenaLiteral(var p: string; dig: Cardinal; digAnterior: Integer);
begin

    case dig of
      1:
        begin
          case digAnterior of
            0..9:
              p := 'Ciento';
          end;
        end;
      2:
        p := 'Doscientos';
      3:
        p := 'Trescientos';
      4:
        p := 'Cuatrocientos';
      5:
        p := 'Quinientos';
      6:
        p := 'Seiscientos';
      7:
        p := 'Setecientos';
      8:
        p := 'Ochecientos';
      9:
        p := 'Novecientos';
    end;
  p:=p+' ';
end;


procedure Numero.decenaLiteral(var p: string; dig: Cardinal; digAnterior: Integer);
begin
  begin
    case dig of
      1:
        begin
          case digAnterior of
            0:
              p := 'diez';
          end;
        end;
      2:
        begin
          case digAnterior of
            0:
              p := 'Veinte';
            1..9:
              p := 'Veinti';
          end;
        end;
      3:begin
        p := 'Treinta';
      addConectorDecena(digAnterior, p);
      end;

      4:begin
          p := 'Cuarenta';
          addConectorDecena(digAnterior, p);
        end;
      5:begin
        p := 'Cincuenta';
        addConectorDecena(digAnterior, p);
        end;
      6:begin
        p := 'Sesenta';
        addConectorDecena(digAnterior, p);
        end;

      7: begin
         p := 'Setenta';
        addConectorDecena(digAnterior, p);
        end;

      8:  begin
         p := 'Ochenta';
        addConectorDecena(digAnterior, p);
        end;

      9:  begin
        p := 'Noventa';
        addConectorDecena(digAnterior, p);
        end;

    end;
  end;
end;
end.

