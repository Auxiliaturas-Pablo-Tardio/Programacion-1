unit UCVector;

interface
Uses SysUtils;

Const
    MaxE = 1024;

Type
    Vector = Class
      Private
             Dimension: Word;
             Elementos: Array[1..MaxE] of Real;
      Public
             Function Dim : Word;
             Procedure AddElement(e:Real);
             Procedure ModElement(p:word;e:Real);
             Procedure InsElement(p:word;e:Real);
             Procedure DelElement(p:word);
             Function getElement(p:word):Real;
             Function getAVG:Real;
             Function getMax:Real;
             Function NumElement(e:Real):Word;

    End;

implementation

{ Vector }

procedure Vector.AddElement(e: Real);
begin
     Inc(Dimension);
     Elementos[Dimension]:=e;
end;

procedure Vector.DelElement(p: word);
var
  I: Word;
begin
     if (p>0) and (p<=Dimension) then
     Begin
          for I := P to Dimension-1 do
              Elementos[I]:=Elementos[I+1];
          Dec(Dimension);
     End
     Else raise Exception.Create('Error posicion fuera de rango');
end;

function Vector.Dim: Word;
begin
      Result:=Dimension;
end;

function Vector.getAVG: Real;
Var
   I : Word;
   S : Real;
begin
     if Dimension>0 then
     Begin
         S:=0;
         for I := 1 to Dimension do
             S:=S+Elementos[I];
         Result:= S /  Dimension;
     End
     Else raise Exception.Create('Error vector vacio');
end;

function Vector.getElement(p: word): Real;
begin
      if (p>0) and (p<=Dimension) then
     Begin
          Result:=Elementos[p];
     End
     Else raise Exception.Create('Error posicion fuera de rango');
end;

function Vector.getMax: Real;
Var
    May : Real;
    I: Integer;
begin
     if Dimension>0 then
     Begin
         May:=Elementos[1];
         for I := 2 to Dimension do
             if Elementos[I]>May then
                May:=Elementos[I];
         Result:=May;
     End
     Else raise Exception.Create('Error vector vacio');
end;

procedure Vector.InsElement(p: word; e: Real);
var
  I: Word;
begin
      if (p>0) and (p<=Dimension) then
     Begin
          Inc(Dimension);
          for I := Dimension downto p+1 do
              Elementos[I]:=Elementos[I-1];
          Elementos[p]:=e;
     End
     Else raise Exception.Create('Error posicion fuera de rango');
end;

procedure Vector.ModElement(p: word; e: Real);
begin
     if (p>0) and (p<=Dimension) then
     Begin
          Elementos[p]:=e;
     End
     Else raise Exception.Create('Error posicion fuera de rango');
end;

function Vector.NumElement(e: Real): Word;
var
  I,c: Integer;
begin
     c:=0;
     for I := 1 to Dimension do
        if Elementos[I]=e then
           c:=c+1;
     Result:=c;
end;

end.
