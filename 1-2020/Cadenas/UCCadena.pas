unit UCCadena;

interface
uses Sysutils;
Const
     MaxC=1024;
Type
    Cadena = Class
      Private
             Longitud : Word;
             Caracteres: Array[1..MaxC] of Char;
      Public
            Function Long:Word;
            Procedure AdChr(c:char);
            Procedure AdStr(s:String);
            Procedure DelChr(p:word);
            Procedure InsChr(p:word; c:char);
            Procedure Invert;
            Function  toStr:String;
            Function countWord:word;
            Function getWord(p:word):String;
            Function NextWord( var i: Word):String;
            Function WordMay:String;
            Function nWord( p:word):String;
            Function calcularExpresion() :String;
            Function sacarExpresion(i,f:Integer):String;
            Function calcularParentesis(expresion:String):Integer;
            Function sacarSgteExpresion(var i: Integer) :String;
            Function sumaDeCadenaFloat():Float32;
            Function sumarFloat():Float32;
            Function reemplazar(cadena: String):String;
            Function sacarMayorEdad(): Integer;
            Function siguienteTiempo(fechaActualS :String; var it :Word):String;
            Function calcularEdad(dia,mes,año,da,ma,aa:Integer):Word;
    End;

implementation

{ Cadena }

procedure Cadena.AdChr(c: char);
begin
     Inc(Longitud);
     Caracteres[Longitud]:=c;
end;

procedure Cadena.AdStr(s: String);
var
  I: Integer;
begin
     Longitud:=Length(s);
     for I := 1 to Longitud do
        Caracteres[i]:=s[i];
end;

function Cadena.countWord: word;
var
   i,c : word;
begin
     i:=1;c:=1;
     while i<Longitud do
     begin
           if not (Caracteres[i] in [' ',',']) and (Caracteres[i+1] in [' ',',']) then
              c:=c+1;
           i:=i+1;
     end;
     Result:=c;

end;

procedure Cadena.DelChr(p: word);
var
  I: Word;
begin
     for I := p to Longitud-1 do
        Caracteres[i]:=Caracteres[i+1];
     Dec(Longitud);
end;

function Cadena.getWord(p: word): String;
begin

end;

procedure Cadena.InsChr(p: word; c: char);
var
  I: Word;
begin
     Inc(Longitud);
     for I := Longitud downto p+1 do
        Caracteres[I]:=Caracteres[p-1];
     Caracteres[p]:=c;

end;

procedure Cadena.Invert;
Var
  i,f : Word;
  c : Char;
begin
     i:=1;f:=Longitud;
     while i<f do
     Begin
          c:=Caracteres[i];
          Caracteres[i]:=Caracteres[f];
          Caracteres[f]:=c;
          inc(i);dec(f);
     End;
end;

function Cadena.Long: Word;
begin
     Result:=Longitud;
end;

function Cadena.NextWord(var i: Word): String;
Var
    p:String;
begin
      while (i<=Longitud) And (Caracteres[i] in [' ',',']) do
         i:=i+1;
      p:='';
      while (i<=Longitud) And not (Caracteres[i] in [' ',',']) do
      begin
            p:=p+Caracteres[i];
         i:=i+1;
      end;
      Result:=p;
end;

function Cadena.nWord(p: word): String;
Var
    pal : String;
    i : word;
begin
     if (P>0)And(P<=countWord) then
     Begin
           i:=1; pal:='';
           while P>0 do
           begin
                pal:=NextWord(i);
                p:=p-1;
           end;
           Result:=pal;
     End
     Else raise Exception.Create('Error numero de palabra es erroneo');
end;

function Cadena.toStr: String;
var
  I: Integer;
  s: String;
begin
      s:='';
      for I := 1 to Longitud do
        s:=s+Caracteres[i];
      Result:=s;
end;

function Cadena.WordMay: String;
Var
    ml,i: Word;
    p,pl:String;
begin
     i:=1; pl:='';ml:=0;
     while i<Longitud do
     begin
         p:=NextWord(i);
         if Length(p)>ml then
         begin
               ml:=Length(p);
               pl:=p;
         end;
     end;
     Result:=pl;
end;

Function Cadena.calcularExpresion:String;
Var
cadenaCopia : Array[1..MaxC] of char  ;
numeros :Array  of char  ;
expresionString: String;
i,f,numParentesis: Integer;
begin

i:=1;
  while (not(Caracteres[i] in ['0','1','2','3','4','5','6','7','8','9'])) do
  begin
    i:=i+1;
  end;
  f:=i+1;
  //cuando salga del ciclo ya estara el indice en un numero
  while (not (Caracteres[f]  in ['0','1','2','3','4','5','6','7','8','9'])) do
  begin
    f:=f+1;
  end;
  expresionString:=sacarExpresion(i,f);
   numParentesis:=calcularParentesis(expresionString) ;

    while(f<=(Longitud-2))do
    begin
          f:=f+1;
         expresionString:=IntToStr(numParentesis)+ sacarSgteExpresion(f);     //'3*3'
         numParentesis:=calcularParentesis(expresionString) ;
    end;

     Result:=IntToStr(numParentesis);
end;

Function Cadena.sacarExpresion(i: Integer; f: Integer):String ;
Var
cad:String;

begin
cad:='';
   while(i<=f)do
   begin
       cad:=cad+Caracteres[i];
       i:=i+1;
   end;
   Result:=  cad;
end;

Function Cadena.calcularParentesis(expresion: string):Integer ;
var
a,b,c :Integer;
begin

         //2+1
         //2*1
         //2-1
         //2/1
 a:=StrToInt(expresion[1]);
 b:=StrToInt(expresion[3]);
 if(expresion[2] in ['+'])then
 begin
    c:=a+b;
 end;
 if(expresion[2] in ['-'])then
 begin
    c:=a-b;
 end;
 if(expresion[2] in ['*'])then
 begin
    c:=a*b;
 end;
 if(expresion[2] in ['/'])then
 begin
    c:=a div b;
 end;

 Result:=c;
end;


Function Cadena.sacarSgteExpresion(var i: Integer) :String;
var
numeros: Array of char;
stringDerecha: String;
begin
   stringDerecha:='';
numeros:=['0','1','2','3','4','5','6','7','8','9'];
 while (not (Caracteres[i]  in ['0','1','2','3','4','5','6','7','8','9']) and (i< Longitud)) do
  begin
    i:=i+1;
  end;
   stringDerecha:= stringDerecha+Caracteres[i-1]+Caracteres[i];
   Result:=  stringDerecha
end;


Function Cadena.sumaDeCadenaFloat:Float32;
var
acumulador :Float64;
valorFloat: Float64  ;
expresion: String;
i : Word;
begin
  acumulador:=0;
  i:=1;
  while (i< Longitud) do
  begin

       valorFloat:=  StrToFloat('12.55');
       acumulador:=acumulador+valorFloat;
  end;
  Result:= acumulador;
end;

Function Cadena.sumarFloat:Float32;
var
i :Word;
palabra:String;
numeroFloat:Float32;
acum: Float32;
begin
  i:=1;
  acum:=0;
   while (i<=Longitud ) do
   begin
      palabra:=NextWord(i); // '14.5'
      palabra:=reemplazar(palabra) ;   //'14,5'
      numeroFloat:=StrToFloat(palabra);
      acum:=acum+numeroFloat;
   end;
   Result:=acum;
end;
Function Cadena.reemplazar(cadena:String):String;
var
i:Integer;
b:Boolean;
begin
i:=0;
b:=false;
  while(i<=Length(cadena)) and(b=false) do
  Begin
     if(cadena[i]='.')then
     begin
        cadena[i]:=',';
        b:=true;
     end;
     Inc(i);
  end;
  Result:=cadena;
end;
Function Cadena.sacarMayorEdad;
var
i,it,edad,edadMayor:Word;
dia,mes,año:Integer;
fechaActualS:string;
begin
   i:=1;
       fechaActualS:=NextWord(i) ;
        it:=1;
        dia:=StrToInt(siguienteTiempo(fechaActualS,it)) ;

        mes:=StrToInt(siguienteTiempo(fechaActualS,it));

        año:=StrToInt(siguienteTiempo(fechaActualS,it))  ;

         //Calculamos la edad
         edadMayor:=calcularEdad(dia,mes,año,16,08,2020);
   while i<=Longitud do
   begin
        fechaActualS:=NextWord(i) ;
        it:=1;
        dia:=StrToInt(siguienteTiempo(fechaActualS,it)) ;

        mes:=StrToInt(siguienteTiempo(fechaActualS,it));

        año:=StrToInt(siguienteTiempo(fechaActualS,it))  ;

         //Calculamos la edad

         edad:=calcularEdad(dia,mes,año,16,08,2020);
         //Calculamos el menor
         if(edad>edadMayor)then
          edadMayor:=edad;

   end;

   Result:=edadMayor
end;

Function Cadena.siguienteTiempo(fechaActualS: string; var it: Word) :String;
var
    p:String;
begin
      while (it<=fechaActualS.Length) And (fechaActualS[it] in ['/']) do
         it:=it+1;
      p:='';
      while (it<=fechaActualS.Length) And not (fechaActualS[it] in ['/']) do
      begin
            p:=p+fechaActualS[it];
         it:=it+1;
      end;
      Result:=p;
end;

Function Cadena.calcularEdad
(dia: Integer; mes: Integer; año: Integer;
 da: Integer; ma: Integer; aa: Integer) :Word;
 var
 diaPreg,mesPreg,añoPreg,añoCumplido:Word ;
begin
     diaPreg:=da-dia;
     mesPreg:=ma-mes;
     añoPreg:=aa-año;
     if(mesPreg>0) then
        añoCumplido:=añoPreg ;
     if(mesPreg=0)then
     begin
         if(diaPreg>0)then
            añoCumplido:=añoPreg-1;
         if(diaPreg=0) then
           añoCumplido:=añoPreg;

     end;
     if mesPreg<0 then
      añoCumplido:=añoPreg-1;

      Result:=añoCumplido;
end;
end.
