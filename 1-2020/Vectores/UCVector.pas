unit UCVector;

interface
const
      MaxE=1024;
Type
     Vector = Class
       Private
              Dimension:Word;
              Elementos : Array[1..MaxE] of Real;
       Public
              Function Dim:Word;
              Procedure AddElement( E:Real);
              Procedure InsElement( E:Real;P:Word);
              Procedure DelElement( P:Word);
              Procedure ModElement( P:Word;V:Real);
              Function GetElement(P:Word):Real;
              Function SumElement:Real;
              Function AvgElement:Real;
              Function BuscarElemento(EABuscar:Real):Boolean;
              Procedure borrarElemento(elem:Real);
              Function EncontrarPos(elem:Real):Word;
              Procedure segmentarParImpar();
              Function verificarIgualesRango(a,b:Word):Boolean;
               Function verificarOrdenRango(a,b:Word):Boolean;
               Function contarDiferentes():Word;
               Function contarDiferentesRango(a,b:Word):Word;
               Function elemMenorDePosicionesMult(m:Word): Real ;
               Function elemMenosRepetido():Real;
               Function frecuencia(elem:Real):Word;
     End;

implementation

{ Vector }

procedure Vector.AddElement(E: Real);
begin
     Inc(Dimension);
     Elementos[Dimension]:=E;
end;

function Vector.AvgElement: Real;
begin

end;

//Borrrar elemento de una posicion
procedure Vector.DelElement(P: Word);
var
  I: Word;
begin
     for I := P to Dimension-1 do
        Elementos[I]:=Elementos[I+1];

     Dec(Dimension);
end;

function Vector.Dim: Word;
begin
     Result:=Dimension;
end;

function Vector.GetElement(P: Word): Real;
begin
     Result:=Elementos[P];
end;

procedure Vector.InsElement(E: Real; P: Word);
var
  I: Word;
begin
     Inc(Dimension);
     for I := Dimension to P+1 do
        Elementos[I]:=Elementos[I-1];
     Elementos[P]:=E;
end;

procedure Vector.ModElement(P: Word; V: Real);
begin
     Elementos[P]:=V;
end;

function Vector.SumElement: Real;
Var
    s: Real;
    i: Word;
begin
     S:=0;
     for I := 1 to Dimension do
       S:=S+Elementos[i];
     Result:=S;
end;

Function Vector.BuscarElemento(eABuscar: Real):Boolean;
var
i: integer;
elemActual:Real;
b: Boolean;
begin
  i:=1;
  b:=false; //No encontre todavia
  while(i<=Dimension) and (b=false) do

  Begin
      elemActual:= Elementos[i];
      if(elemActual=eABuscar)then
      BEGIN
           b:=true; //Si lo encontre
      END;
    i:=i+1;

  End;
  Result:= b;

end;

Procedure Vector.borrarElemento(elem: Real);
var
posABorrar:Word;
begin
   //buscar la pos del elem a borrar
    posABorrar:=EncontrarPos(elem);
   //borrar elem en esa pos
    DelElement(posABorrar);
end;

Function Vector.EncontrarPos(elem: Real) :Word;
var
i: integer;
posEncontrada:Word;
elemActual:Real;
b: Boolean;
begin
  i:=1;
  b:=false; //No encontre todavia
  while(i<=Dimension) and (b=false) do

  Begin
      elemActual:= Elementos[i];
      if(elemActual=elem)then
      BEGIN
           b:=true; //Si lo encontre
           posEncontrada:=i;
      END;
    i:=i+1;

  End;
  Result:= posEncontrada;
End;


//Segmentacion de elementos
Procedure Vector.segmentarParImpar();
var
x :Real;   //Var aux
a,b :Word;          // Punteros
begin
a:=1;
b:=Dimension;
while (a<b) do
begin
    //parte de la izquierda - Pares
    while((Trunc(Elementos[a]) mod 2= 0) and (a<b))do
    begin
        a:=a+1;
    end;
    //parte derecha - Impares
    while ((Trunc(Elementos[b]) mod 2 =1) and (a<b)) do
    begin
      b:=b-1;
    end;
    //Intercambiar los Intrusoso
    x:=Elementos[a];
    Elementos[a]:=Elementos[b];
    Elementos[b]:=x;
    //Ignorar lo ya revisado
    a:=a+1;
    b:=b-1;
end;

end;

Function Vector.verificarIgualesRango(a: Word; b: Word):Boolean;
var
r :Real;
i :Word;
bandera : Boolean;
begin
      bandera:=true;    //indicara la respuesta
      r:=Elementos[a]; //Con esto comparamos los demas elementos
      i:=a+1;  //Es igual a a+1 para ignorar la referencia
      while (i<=b) and (bandera=true) do
      begin
         if(Elementos[i]<> r)then
            bandera:=false   ;
        i:=i+1;

      end;
 Result:=bandera;
end;

Function Vector.verificarOrdenRango(a: Word; b: Word) :Boolean;
var
actual :Real;
i: Word;
bandera: Boolean ;
begin
bandera:=true;
i:=a;
while (i<=b) and (bandera=true) do
begin
  if((Elementos[i+1]<Elementos[i]) and (i<b)) then
     bandera:=false;
  i:=i+1
end;
 Result :=bandera;
end;
Function Vector.contarDiferentes: Word;
var i:word;
 x:Real  ;
 vAux:  Vector;
begin
// construir la clase vector
  vAux:=Vector.Create;
  i:=1;
    while (i<=Dimension) do
    begin
    if(not vAux.BuscarElemento(Elementos[i]))  then
    begin
      vAux.AddElement(Elementos[i]);
    end;
     i:=i+1 ;
    end;
    Result:=vAux.Dimension;

end;

Function Vector.contarDiferentesRango(a: Word; b: Word):Word;

  var i:word;
 x:Real  ;
 vAux:  Vector;
begin
// construir la clase vector
  vAux:=Vector.Create;
  i:=a;
    while (i<=b) do
    begin
    if(not vAux.BuscarElemento(Elementos[i]))  then
    begin
      vAux.AddElement(Elementos[i]);
    end;
     i:=i+1 ;
    end;
    Result:=vAux.Dimension;


end;
Function Vector.elemMenorDePosicionesMult(m: Word): Real;
var
i :word;
menor :Real;
begin
i:=m;
menor := Elementos[m];
   while i<=Dimension do
   begin
      if(Elementos[i]<menor)then
        menor:=Elementos[i];

   i:=i+m
   end;
Result:=menor;
end;
Function Vector.elemMenosRepetido:Real;
var
i: Word;
elemActual,menor: Real;
begin
i:=1;

menor:=Elementos[1];
    while(i<=Dimension)do
    begin
    elemActual:=Elementos[i];
      if(frecuencia(elemActual)<frecuencia(menor)) then
        menor:= elemActual;
       i:=i+1
    end;
Result:=menor;
end;

Function Vector.frecuencia(elem: Real):Word;
var
  i: Integer;
  contador: Word;
begin
contador:=0;
 for i := 1 to Dimension do
  begin
    if(Elementos[i]=elem)  then
      contador:=contador+1;
  end;
Result:=contador
end;
end.
