unit UCMatriz;

interface
Type
      Matriz=Class
       const MaxC=1024;
        const MaxF=1024;
        Private

        //
        Cols:Word;
        filas:Word;
        Elemento:Array[1..MaxF,1..MaxC] of Real;

        public
          procedure setElemento(fila,columna:Word;elem:Real);
          procedure  redimensionar(fila:Word;columna:Word);
          function getCols():Word;
          function getFilas():Word;
          procedure addFilas(nroFilas:Word);
          procedure addColumnas(nroColumnas:Word);
          function getElemento(fila,columna:Word):Real;
          function contarUnicos():word;
           function contarUnicosParamFin(ff,cf:Word):word;
          function esUnico(eleVerif:Real): boolean;
          function esUnicoParam(ff,cf:word;eleVerif:Real):boolean;
          procedure sumarAMiMatriz(otraMatriz:Matriz);
      End;

implementation

{ Matriz }

procedure Matriz.addColumnas(nroColumnas: Word);
begin
   Cols:=Cols+nroColumnas ;
end;

procedure Matriz.addFilas(nroFilas: Word);
begin
      Filas:=Filas+nroFilas ;
end;

function Matriz.contarUnicos: word;
var i,j,c:word ;
begin
c:=0;
   for i := 1 to filas do
   begin
        for j := 1 to Cols do
           begin
                // estamos listos para sacar el elemento actual
                if (esUnico(Elemento[j,i])) then
                begin
                  c:=c+1;
                end;
           end;
   end;

   Result:=c;

end;

function Matriz.contarUnicosParamFin(ff, cf: Word): word;
var i,j,c:word ;
begin
c:=0;
if((ff<=filas) and(cf<=cols)) then
begin
   for i := 1 to ff do
   begin
        for j := 1 to cf do
           begin
                // estamos listos para sacar el elemento actual
                if (esUnicoParam(ff,cf,Elemento[j,i])) then
                begin
                  c:=c+1;
                end;
           end;
   end;

   Result:=c;
end
else
  //Devolver excepcion
   Result:=0;
end;

function Matriz.esUnico(eleVerif: Real): boolean;
var
  i,j,c: Integer;
  b:Boolean ;
begin
  c:=0;
  b:=true;
     for i := 1 to filas do
      begin
         for j := 1 to Cols do
            if(elemento[j,i]=eleVerif)then
              c:=c+1;
      end;
     if(c=1)then
     begin
     b:=true;
     end
     else
     b:=false ;

    Result:= b;
end;

function Matriz.esUnicoParam(ff, cf: word; eleVerif: Real): boolean;


var
  i,j,c: Integer;
  b:Boolean ;
begin
  c:=0;
  b:=true;
     for i := 1 to ff do
      begin
         for j := 1 to cf do
            if(elemento[j,i]=eleVerif)then
              c:=c+1;
      end;
     if(c=1)then
     begin
     b:=true;
     end
     else
     b:=false ;

    Result:= b;

end;

function Matriz.getCols: Word;
begin
 Result:=  Cols;
end;

function Matriz.getElemento(fila, columna: Word): Real;
begin
  Result:=Elemento[columna,fila];
end;

function Matriz.getFilas: Word;
begin
 Result:=Filas;
end;

procedure Matriz.redimensionar(fila, columna: Word);
begin
  filas:=fila;
  Cols:=columna;
end;

procedure Matriz.setElemento(fila, columna: Word; elem: Real);
begin
if ((fila<=Filas) and (columna<=Cols))  then
      Elemento[columna,fila]:=elem;
end;


procedure Matriz.sumarAMiMatriz(otraMatriz: Matriz);
var
  i: Integer;
  j: Integer;
begin
if( (filas=otraMatriz.getFilas()) and (Cols=otraMatriz.getCols())) then
begin
  for i := 1 to filas do
      begin
        for j := 1 to Cols do
        begin
              //aqui ya tenemos el elemento actual
               Elemento[j,i]:=Elemento[j,i]+otraMatriz.getElemento(i,j);
        end;
      end;
end
else
// Levantar una excepcion
end;

end.
