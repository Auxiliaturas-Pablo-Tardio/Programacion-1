unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,UCNumero, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    ObtenerValor1: TMenuItem;
    CambiarValor1: TMenuItem;
    ContarDigitos1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    CovertiraBinario1: TMenuItem;
    CovertiraHexadecimal1: TMenuItem;
    ConvertiraBinario21: TMenuItem;
    ImprimirDigBinprehexa1: TMenuItem;
    Unidadaliteral1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ObtenerValor1Click(Sender: TObject);
    procedure CambiarValor1Click(Sender: TObject);
    procedure ContarDigitos1Click(Sender: TObject);
    procedure CovertiraBinario1Click(Sender: TObject);
    procedure ConvertiraBinario21Click(Sender: TObject);
    procedure ImprimirDigBinprehexa1Click(Sender: TObject);
    procedure Unidadaliteral1Click(Sender: TObject);
  private
    { Private declarations }
    N : Numero;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CambiarValor1Click(Sender: TObject);
begin
     N.setValor(StrToInt(Edit1.Text));
end;

procedure TForm1.ContarDigitos1Click(Sender: TObject);
begin
     Label1.Caption:='La cantidad de digitos es:'+IntToStr(N.countDigit);
end;

procedure TForm1.ConvertiraBinario21Click(Sender: TObject);
begin

ShowMessage(N.toBin2);
end;

procedure TForm1.CovertiraBinario1Click(Sender: TObject);
begin
     Label1.Caption:='Binario:'+N.toBin;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      N := Numero.Create;
end;

procedure TForm1.ImprimirDigBinprehexa1Click(Sender: TObject);
begin
ShowMessage(N.toHex());

end;

procedure TForm1.ObtenerValor1Click(Sender: TObject);
begin
      Label1.Caption:='El valor del numero es:'+IntToStr(N.getValor);
end;

procedure TForm1.Unidadaliteral1Click(Sender: TObject);
begin
      ShowMessage(N.convertirALiteral());
end;

end.
