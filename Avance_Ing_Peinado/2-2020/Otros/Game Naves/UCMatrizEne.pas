unit UCMatrizEne;

interface
uses UCEnemigo,Vcl.Graphics;
type
MatrizEne=class

   const NroEnemCols=11;
    const NroEnemFilas=5;
    const PuntoDeOrigenX=250;
    const PuntoDeOrigenY=100;
    const separacionX=110;
    const separacionY=110;

private
   direccionMovimiento:string;
   Casillas :Array[1..NroEnemFilas,1..NroEnemCols] of Enemigo;
public
   procedure createEnemigos();
   function getEnemigo(filas,cols:word):Enemigo;
   function getCols():Integer;
   function getFilas():Integer;
   function getDireccionMovimiento():String;
   procedure setDireccionMovimiento(nuevaDireccion:String);
   function buscarEnemigoPorPosicion(posX,posY:Integer):Enemigo;
   function getYUltVivo():Integer;
end;

implementation


{ MatrizEne }

function MatrizEne.buscarEnemigoPorPosicion(posX, posY: Integer): Enemigo;
var
  i,j,i2: Integer;
  j2: Integer;
  enemigoActual,enemigoVacio:Enemigo;

begin
 for i := 1 to NroEnemFilas do
  begin
    for j := 1 to NroEnemCols do
    begin
       enemigoActual:=Casillas[i,j];
       if((posX=enemigoActual.getX) AND (posY=enemigoActual.getY)) then
          Result:= enemigoActual;
    end;
  end;

enemigoVacio:=Enemigo.Create;
enemigoVacio.vivo();
Result:=EnemigoVacio;
end;

procedure MatrizEne.createEnemigos;
var i,j,cxc,cyf:word;
ene: Enemigo;
imagenEnemigo:TBitMap;
begin
direccionMovimiento:='';
cxc:= PuntoDeOrigenX;
cyf:= PuntoDeOrigenY;
    for i := 1 to NroEnemFilas do
      begin
          for j := 1 to NroEnemCols do
          begin
              // Aqui ya estoy en mi enemigo actual

               ene:=Enemigo.Create();
               ene.setPosicion(cxc,cyf);
               ene.vivo();
               imagenEnemigo:=TBitMap.Create;
                imagenEnemigo.LoadFromFile('SPACE_ENEMIGO.bmp');
                ene.setImagen(imagenEnemigo);
               cxc:=cxc+separacionX;
               Casillas[i,j]:=ene;

          end;
          cxc:=PuntoDeOrigenX;
          cyf:=cyf+separaciony;
      end;
end;

function MatrizEne.getCols: Integer;
begin
Result:=NroEnemCols;
end;

function MatrizEne.getDireccionMovimiento: String;
begin
Result:=direccionMovimiento;
end;

function MatrizEne.getEnemigo(filas, cols:word): Enemigo;
begin
   Result:=Casillas[filas,cols];
end;

function MatrizEne.getFilas: Integer;
begin
      Result:=NroEnemFilas;
end;



function MatrizEne.getYUltVivo: Integer;
var i,j:integer;
eneActual:Enemigo;
encontro:boolean;
puntoFinY:integer;
begin
encontro:=false;
    i:=NroEnemFilas;
    j:=NroEnemCols;
    eneActual:=Enemigo.Create;

    while  ((i>=1) and not encontro)do
    begin
      j:=NroEnemCols;
       while ((j>=1) and not encontro) do
        begin
          eneActual:=Casillas[i,j];
          if(eneActual.estaVivo) then
          begin
             encontro:=true;

          end;


          j:=j-1;
        end;
      i:=i-1 ;
    end;
     puntoFinY:=eneActual.getImagen().Height+eneActual.getY;
    Result:=puntoFinY;
end;

procedure MatrizEne.setDireccionMovimiento(nuevaDireccion: String);
begin
direccionMovimiento:=nuevaDireccion;
end;

end.
