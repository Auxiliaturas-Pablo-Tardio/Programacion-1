unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCCadena, Vcl.Menus, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Longitud1: TMenuItem;
    CargarCadena1: TMenuItem;
    MostrarCadena1: TMenuItem;
    AdicionarCaracter1: TMenuItem;
    EliminarCaracter1: TMenuItem;
    InsertarCaracter1: TMenuItem;
    InvertirCaracteres1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    ContarPalabra1: TMenuItem;
    SiguientePalabra1: TMenuItem;
    Palabrademayorlongitud1: TMenuItem;
    Enesimapalabra1: TMenuItem;
    Edit2: TEdit;
    procedure Longitud1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdicionarCaracter1Click(Sender: TObject);
    procedure MostrarCadena1Click(Sender: TObject);
    procedure CargarCadena1Click(Sender: TObject);
    procedure ContarPalabra1Click(Sender: TObject);
    procedure SiguientePalabra1Click(Sender: TObject);
    procedure Palabrademayorlongitud1Click(Sender: TObject);
    procedure Enesimapalabra1Click(Sender: TObject);
  private
    { Private declarations }
    C : Cadena;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  k:Word;

implementation

{$R *.dfm}

procedure TForm1.AdicionarCaracter1Click(Sender: TObject);
begin
     C.AdChr(Edit1.Text[1]);
end;

procedure TForm1.CargarCadena1Click(Sender: TObject);
begin
    C.AdStr(Edit1.Text);
end;

procedure TForm1.ContarPalabra1Click(Sender: TObject);
begin
     Label1.Caption:='La cantidad de palabras es:'+InttoStr(C.countWord);
end;

procedure TForm1.Enesimapalabra1Click(Sender: TObject);
begin
     Label1.Caption:=C.nWord(StrToInt(Edit2.Text));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     C:=Cadena.Create;
     k:=1;
end;

procedure TForm1.Longitud1Click(Sender: TObject);
begin
     Label1.Caption:='La longitud es:'+IntToStr(C.Long);
end;

procedure TForm1.MostrarCadena1Click(Sender: TObject);
begin
     Label1.Caption:=C.toStr;
end;

procedure TForm1.Palabrademayorlongitud1Click(Sender: TObject);
begin
     Label1.Caption:=C.WordMay;
end;

procedure TForm1.SiguientePalabra1Click(Sender: TObject);
begin
     Label1.Caption:=C.NextWord(k);
end;

end.
