unit UCEnemigo;
interface
uses
Vcl.Graphics;
type
Enemigo=class

private
  posicionX: Integer;
  posicionY: Integer;
  imagen:TBitmap ;
  vida:boolean;
  public

    procedure setPosicion(x,y:Integer);  // Setter
    procedure setImagen(u:TbitMap);
    procedure vivo();
    procedure derrotado();
    function getX():Integer;
    function getY():Integer;
    function getImagen():TbitMap;
    function estaVivo():Boolean;
End;

implementation


{ Enemigo }

procedure Enemigo.derrotado;
begin
 vida:=false;
end;

function Enemigo.estaVivo: Boolean;
begin
Result:=vida;
end;

function Enemigo.getImagen: TbitMap;
begin
Result:=imagen;
end;

function Enemigo.getX: Integer;
begin
Result:=posicionX;
end;

function Enemigo.getY: Integer;
begin
Result:=posicionY;
end;

procedure Enemigo.setImagen(u: TbitMap);
begin
   imagen:= u;
end;

procedure Enemigo.setPosicion(x, y: Integer);
begin
   posicionX:=x;
   posicionY:=y;
end;

procedure Enemigo.vivo();
begin
  vida:=true;
end;


end.
