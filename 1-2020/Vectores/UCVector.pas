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

end.
