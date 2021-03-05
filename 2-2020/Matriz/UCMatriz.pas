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


end.
