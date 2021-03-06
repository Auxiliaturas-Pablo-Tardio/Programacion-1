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

end.
