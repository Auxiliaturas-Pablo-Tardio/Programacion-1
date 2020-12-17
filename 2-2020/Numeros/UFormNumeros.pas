unit UFormNumeros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCNumeros, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    SettersyGetters1: TMenuItem;
    getValor1: TMenuItem;
    setValor1: TMenuItem;
    Numero21: TMenuItem;
    setValor2: TMenuItem;
    GetValor2: TMenuItem;
    Ejercicios1: TMenuItem;
    Sumadedigitos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure getValor1Click(Sender: TObject);
    procedure setValor1Click(Sender: TObject);
    procedure setValor2Click(Sender: TObject);
    procedure GetValor2Click(Sender: TObject);
    procedure Sumadedigitos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    numero1,numero2 : Numero;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
       numero1:=Numero.Create;
       numero2:=Numero.Create;
end;

procedure TForm1.getValor1Click(Sender: TObject);
var n: cardinal;
begin
    n:= numero1.getValor();
    ShowMessage(IntToStr(n));
end;

procedure TForm1.GetValor2Click(Sender: TObject);
begin
ShowMessage(IntToStr(numero2.getValor));
end;

procedure TForm1.setValor1Click(Sender: TObject);
var n : cardinal;
begin

    numero1.setValor(250);
end;

procedure TForm1.setValor2Click(Sender: TObject);
begin
    numero2.setValor(400);
end;

procedure TForm1.Sumadedigitos1Click(Sender: TObject);
var n :cardinal;
begin
n:=numero1.sumaDeDig();
   ShowMessage(IntToStr(n));
end;

end.
