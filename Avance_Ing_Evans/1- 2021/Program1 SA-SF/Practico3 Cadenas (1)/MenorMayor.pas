Program MenorMayor(output);
var a,b,x :integer;
begin
    readln(a);
    readln(b);
    if(a>b) then
    begin
        x:=b;
        b:=a;
        a:=x;
    end;
    if (a=b) then
    begin
        a:=a+5;
        b:=b+10;
    end;
  writeln('La variable a es ');
  writeln(a);
  writeln('la variable b es: ');
  writeln(b);
  readln;
end.
