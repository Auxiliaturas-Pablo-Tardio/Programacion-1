unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,JPEG,PNGImage;

type
  TfrmPrincipal = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    procedure FormDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    Der,Izq,Arb,Abj,Dis : Boolean;
   // Avion : TPNGObject;
   Avion,Bala : TBitmap;
   Fondo : TJPEGImage;
   X,Y,BX,BY  : Integer;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  K: Integer;


implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     K:=10;
     Bala:=TBitMap.Create;
     Bala.LoadFromFile('Bala.bmp');
     Bala.Transparent := True;
     Bala.TransParentColor := Bala.canvas.pixels[1,1];
     Bala.TransparentMode := tmAuto;
     Avion:=TBitMap.Create;
     Avion.LoadFromFile('Avion.bmp');
     Avion.Transparent := True;
     Avion.TransParentColor := Avion.canvas.pixels[1,1];
     Avion.TransparentMode := tmAuto;
     X:=(Screen.Width-Avion.Width) Div 2;
     Y:=(Screen.Height-Avion.Height);
     Fondo := TJPEGImage.Create;
     Fondo.LoadFromFile('Fondo.jpg');
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
          38: Arb:=True;
          40: Abj:=True;
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
          32: Dis:=True;
      end;
end;

procedure TfrmPrincipal.FormPaint(Sender: TObject);
begin
      //Canvas.StretchDraw(Rect(0,0,Screen.Width,Screen.Height),Fondo);
      If Dis Then Canvas.Draw(BX,BY,Bala);
      Canvas.Draw(X,Y,Avion);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
     //Shape1.Left:=Shape1.Left+K;
     //if (Shape1.Left>Screen.Width-Shape1.Width) or (Shape1.Left<1) then   K:=K*-1;
     if Izq  then X:=X-10;
     if Der  then X:=X+10;
     if Arb  then Y:=Y-10;
     if Abj  then Y:=Y+10;
     if Dis  then BY:=BY-10;

     Repaint;

end;

end.
