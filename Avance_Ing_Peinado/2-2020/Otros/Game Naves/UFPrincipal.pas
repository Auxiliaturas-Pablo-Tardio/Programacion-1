unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,JPEG,PNGImage,UCMatrizEne, UCEnemigo,
  MMSystem;

type
  TfrmPrincipal = class(TForm)
    Timer1: TTimer;
    TimerEnemigos: TTimer;
    Label2: TLabel;
    timerExplosion: TTimer;
    procedure FormDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure TimerEnemigosTimer(Sender: TObject);
    procedure calcularDireccion();
    procedure verificarImpactoBala();
    procedure timerExplosionTimer(Sender: TObject);
  private
    { Private declarations }
    Der,Izq,Arb,Abj,Dis,impacto : Boolean;
   // Avion : TPNGObject;
   Avion,Bala,imagenEnemigo,explosionImg : TBitmap;
   Fondo : TJPEGImage;
   X,Y,BX,BY,IX,IY  : Integer;
   misEnemigos: MatrizEne;
   cMovEne:integer;
   DireccionFutura:String;
   cDerrotados:Integer;
  public
    { Public declarations }
     procedure mostrarEnemigos();
  end;

var
  frmPrincipal: TfrmPrincipal;
  K: Integer;


implementation

{$R *.dfm}

procedure TfrmPrincipal.calcularDireccion;
var x:String;
begin
if(cMovEne=16) then
begin
  cMovEne:=0;
  misEnemigos.setDireccionMovimiento('ABAJO');
end;

if( misEnemigos.getDireccionMovimiento()='ABAJO') THEN
BEGIN
if (cMovEne=1) then
begin
   cMovEne:=0;
  misEnemigos.setDireccionMovimiento(direccionFutura);
  if (direccionFutura='IZQUIERDA') then
    begin
      direccionFutura:='DERECHA';
    end
    else if (direccionFutura='DERECHA') then
    direccionFutura:='IZQUIERDA';
   //Ver a que lado ir si izquierda o derecha
end;
END;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
IX:=0;
IY:=0;
    impacto:=false;
      sndPlaySound('E:\sounds effect\canciones Fondos descargados de Youtube\y2mate.com - Teminite  MDK  Space Invaders.wav'
      ,SND_ASYNC);
      cDerrotados:=0;
      DireccionFutura:='IZQUIERDA';
     K:=10;
     cMovEne:=0;
     Bala:=TBitMap.Create;
     Bala.LoadFromFile('Bala.bmp');
     Bala.Transparent := True;
     Bala.TransParentColor := Bala.canvas.pixels[1,1];
     Bala.TransparentMode := tmAuto;
     Avion:=TBitMap.Create;
     Avion.LoadFromFile('Avion.bmp');    //explode.bmp
     explosionImg:=TBitmap.Create;
     explosionImg.LoadFromFile('explode.bmp');

     Avion.Transparent := True;
     Avion.TransParentColor := Avion.canvas.pixels[1,1];
     Avion.TransparentMode := tmAuto;
     X:=(Screen.Width-Avion.Width) Div 2;
     Y:=(Screen.Height-Avion.Height);
    // Fondo := TJPEGImage.Create;
     //Fondo.LoadFromFile('Fondo.jpg');
     // Creamos los enemigos

     imagenEnemigo:=TBitMap.Create;
     imagenEnemigo.LoadFromFile('SPACE_ENEMIGO.bmp');
     misEnemigos:=MatrizEne.Create;
     misEnemigos.createEnemigos();
     misEnemigos.setDireccionMovimiento('DERECHA');
     mostrarEnemigos();

end;

procedure TfrmPrincipal.FormDblClick(Sender: TObject);
begin
      Application.Terminate;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case key of

          37: Izq:=True;
          39: Der:=True;
        //  38:Arb:=True;

         // 40: Abj:=True;
          32: Begin BY:=Y-Bala.Height;BX:=X+((Avion.Width-Bala.Width) div 2);End;
      end;
end;

procedure TfrmPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case key of
          37: Izq:=False;
          39: Der:=False;
          38: Arb:=False;
          40: Abj:=False;
          32:
          Begin
          Dis:=True;
          sndPlaySound(
          'E:\sounds effect\The Essential Retro Video Game Sound Effects Collection [512 sounds]\The Essential Retro Video Game Sound Effects Collection [512 sounds] By Juhani Junkala\Explosions\Shortest\sfx_exp_shortest_soft9.wav'
          ,SND_ASYNC);

          End;
      end;
end;

procedure TfrmPrincipal.FormPaint(Sender: TObject);
var filas,cols :Integer;
  i: Integer;
  j: Integer;
 enemigoActual:Enemigo;

begin
cols:=misEnemigos.getCols();
filas:=misEnemigos.getFilas();
      //Canvas.StretchDraw(Rect(0,0,Screen.Width,Screen.Height),Fondo);
      If Dis Then Canvas.Draw(BX,BY,Bala);
      Canvas.Draw(X,Y,Avion);

      if impacto then
       Canvas.Draw(IX,IY,explosionImg);
       for i := 1 to filas do
      begin

        for j := 1 to cols do
          begin
             enemigoActual:=misEnemigos.getEnemigo(i,j);
              //pregunto si el enemigo esta vivo
              if enemigoActual.estaVivo then
                  Canvas.Draw(enemigoActual.getX(),enemigoActual.getY(),enemigoActual.getImagen());
          end;


      end;
end;

procedure TfrmPrincipal.mostrarEnemigos;
var filas,cols :Integer;
  i: Integer;
  j: Integer;
  xCad,yCad:String;
  enemigoActual:Enemigo;
  cadenaEnemigos:StrinG;
  enemigoImagen:TBitMap;
begin
cols:=misEnemigos.getCols();
filas:=misEnemigos.getFilas();
cadenaEnemigos:='';
    for i := 1 to filas do
      begin

        for j := 1 to cols do
          begin
            enemigoActual:=misEnemigos.getEnemigo(i,j);
            xCad:=IntToStr(enemigoActual.getX());
            yCad:=IntToStr(enemigoActual.getY());
           // enemigoImagen:=TBitMap.Create;
           // enemigoImagen.LoadFromFile('SPACE_ENEMIGO.bmp');
             cadenaEnemigos:=cadenaEnemigos+ 'X: '+xCad+','+'Y: '+ yCad;

          end;
           cadenaEnemigos:=cadenaEnemigos+'\n' ;

      end;
 ShowMessage(cadenaEnemigos);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
     //Shape1.Left:=Shape1.Left+K;
     //if (Shape1.Left>Screen.Width-Shape1.Width) or (Shape1.Left<1) then   K:=K*-1;
     if Izq  then
     begin
     if(X>0) then
     X:=X-10;
     end;
     if Der  then
     begin
     if((X+Avion.Width)<frmPrincipal.Width) then
     X:=X+10;
     end;
     if Arb  then Y:=Y-10;
     if Abj  then Y:=Y+10;
     if Dis  then BY:=BY-10;
     verificarImpactoBala();
     Repaint;



end;

procedure TfrmPrincipal.TimerEnemigosTimer(Sender: TObject);
var filas,cols :Integer;
  i: Integer;
  j: Integer;
 enemigoActual:Enemigo;
 mov:String;

begin
cols:=misEnemigos.getCols();
filas:=misEnemigos.getFilas();
      //Canvas.StretchDraw(Rect(0,0,Screen.Width,Screen.Height),Fondo);
cMovEne:= cMovEne+1;
calcularDireccion();
//if(cMovEne=5)then
//begin
 // enemigoActual:=misEnemigos.getEnemigo(3,3);
 // enemigoActual.derrotado;
//end;
     //if(misEnemigos.getYUltVivo>=Screen.Height)then
     if(misEnemigos.getYUltVivo>=frmPrincipal.ClientHeight)then
     begin
       TimerEnemigos.Enabled:=false;
       ShowMessage('Has perdido');

     end;

       for i := 1 to filas do
      begin

        for j := 1 to cols do
          begin
           enemigoActual:=misEnemigos.getEnemigo(i,j);
           mov:=misEnemigos.getDireccionMovimiento();
           if(mov='DERECHA')then
              enemigoActual.setPosicion(enemigoActual.getX+25,enemigoActual.getY);
            if mov='IZQUIERDA' then
              enemigoActual.setPosicion(enemigoActual.getX-25,enemigoActual.getY);
            if mov='ABAJO' then
             enemigoActual.setPosicion(enemigoActual.getX,enemigoActual.getY+50);
           begin

           end;
             
              // Definir hacia donde esta yendo los enemigos (Direccion) LISTO
              // mueve a la derecha los enemigos LISTO              
              // Definir limites por la izquierda  y derecha
              //definir el movimiento para abajo  LISTO
              // defnir el movimiento a la izquierda LISTO
              // Defnir cuando se pierde
          end;

      end;
end;

procedure TfrmPrincipal.timerExplosionTimer(Sender: TObject);
begin
impacto:=false;
timerExplosion.Enabled:=false;
end;

procedure TfrmPrincipal.verificarImpactoBala;
var filas,cols :Integer;
  i: Integer;
  j: Integer;
 enemigoActual:Enemigo;
 puntoFinX,puntoFinY:integer;

begin
cols:=misEnemigos.getCols();
filas:=misEnemigos.getFilas();
      //Canvas.StretchDraw(Rect(0,0,Screen.Width,Screen.Height),Fondo);

   for i := 1 to filas do
      begin

        for j := 1 to cols do
          begin
             enemigoActual:=misEnemigos.getEnemigo(i,j);
             puntoFinX:=enemigoActual.getImagen().Width+enemigoActual.getX;
             puntoFinY:=enemigoActual.getImagen().Height+enemigoActual.getY;

             if ((BY>=enemigoActual.getY) and (BY<=puntoFinY)
              and (BX>=enemigoActual.getX) and (BX <=PuntoFinX))  then
              begin

                if enemigoActual.estaVivo then
                  begin
                    enemigoActual.derrotado();
                    impacto:=true;
                    IX:=BX;
                    IY:=BY;
                    Repaint();
                    timerExplosion.Enabled:=true;
                     sndPlaySound('E:\sounds effect\The Essential Retro Video Game Sound Effects Collection [512 sounds]\The Essential Retro Video Game Sound Effects Collection [512 sounds] By Juhani Junkala\Explosions\Short\sfx_exp_short_hard3.wav'
                      ,SND_ASYNC);
                    // Reiniciar Posicion de bala y desactivar el modo de disparo

                    Dis:=false;
                    BY:=-50;
                    BX:=-50;

                    cDerrotados:= cDerrotados+1;
                    Label2.Caption:=IntToStr(cDerrotados);
                    //ShowMessage('Eliminado uno');
                  end;
              end;

          end;


      end;

end;

end.
