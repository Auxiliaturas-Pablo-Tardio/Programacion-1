unit UCMatriz;

interface
Const
      MaxF=1024;
      MaxC=1024;
Type
Matriz=Class
      Private
            filas,
            columnas: Word;
            celdas: Array[1..MaxF,1..MaxC] of Real;
      Public
            //Getters Obtienen Valores
             Function getFilas:Word;
             Function getColumnas: Word;
             Function getCelda(fila:word; col:word):Real;
            // Function obtenerMatriz: Real;
            //Setters Modificar Valores
            Procedure setCelda(elem:Real;fila:word; col:word);
            Procedure setFilas(filaNueva: word);
            Procedure setColumnas(colNueva:Word);
            Procedure Redimensionar(filaNueva,ColumnaNueva:Word);
            Procedure addFilas();
            Procedure addColumna();
            Procedure deleteFilas();
            Procedure deleteColumna();
            Function seriePrimosMatriz():Real;
            Function esPrimoElNumero(numReal:Real):Boolean;
End;

implementation
Function Matriz.getFilas;
begin
  Result:= filas;
end;
procedure Matriz.addColumna;
begin

end;

procedure Matriz.addFilas;
begin

end;

procedure Matriz.deleteColumna;
begin

end;

procedure Matriz.deleteFilas;
begin

end;

function Matriz.esPrimoElNumero(numReal: Real): Boolean;
var num,c,cDivisibles:word;

b:boolean;
begin
cDivisibles:=0;
 num:=Trunc(numReal); //RealToInt
  c:= 1;
  while(c<=num)do
  begin

    if((num mod c) = 0)   then
    cDivisibles:=cDivisibles+1;

    c:=c+1;
  end;
  if (cDivisibles=2) or (cDivisibles=1) then
    begin
      b:=true;
    end
  else
   b:=false;
   Result:=b;
end;

procedure Matriz.Redimensionar(filaNueva, ColumnaNueva: Word);
begin

end;



function Matriz.seriePrimosMatriz: Real;
var
fi,ci :word;
esPositivo: Boolean;
acumulador, elementoActual: Real;
begin
acumulador:=0;
fi:= getFilas();

  // true = +
   // false = -
   esPositivo:= false;
  while (fi>0) do
  begin
    ci:=getColumnas();
    while ci>0 do
    begin
    elementoActual:=celdas[ci,fi];
      // sacar primos y acumular serie
      if(esPrimoElNumero(elementoActual))then
      begin
          if(esPositivo) then
          begin
             esPositivo:=false;
          end
          else
          begin
            elementoActual:=elementoActual*(-1);
            esPositivo:=true;
          end;
           acumulador:=elementoActual+acumulador;
      end;
      ci:=ci-1;
    end;
    fi:=fi-1;
  end;

Result:=acumulador;
end;

procedure Matriz.setCelda(elem: Real; fila, col: word);
begin
 celdas[col][fila]:=elem;
end;

procedure Matriz.setColumnas(colNueva: Word);
begin
    columnas:=colNueva  ;
end;

procedure Matriz.setFilas(filaNueva: word);
begin
   filas:=filaNueva;
end;

function Matriz.getCelda(fila, col: word): Real;
begin
    Result:=celdas[col][fila];
end;

Function Matriz.getColumnas;
begin
     Result:= columnas;
end;

end.
