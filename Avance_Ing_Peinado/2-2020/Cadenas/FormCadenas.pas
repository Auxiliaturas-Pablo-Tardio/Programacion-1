unit FormCadenas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,UCCadenas;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    MainMenu1: TMainMenu;
    Button3: TButton;
    Ejercicios1: TMenuItem;
    AMayuscula1: TMenuItem;
    aMin1: TMenuItem;
    ContarPalabras1: TMenuItem;
    VerifVocalRepetida1: TMenuItem;
    EliminarPalabra1: TMenuItem;
    Eliminarpalabrasvocrepetid1: TMenuItem;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AMayuscula1Click(Sender: TObject);
    procedure aMin1Click(Sender: TObject);
    procedure ContarPalabras1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure VerifVocalRepetida1Click(Sender: TObject);
    procedure EliminarPalabra1Click(Sender: TObject);
    procedure Eliminarpalabrasvocrepetid1Click(Sender: TObject);
  private
    { Private declarations }
    miCadena: Cadena;
  public
    { Public declarations }
     contaPal:word;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AMayuscula1Click(Sender: TObject);
begin
miCadena.AMayuscula();
end;

procedure TForm1.aMin1Click(Sender: TObject);
begin
miCadena.AMinuscula();
end;

//Cargar la cadena
procedure TForm1.Button1Click(Sender: TObject);
var
s:string;
c: char;
begin
s:=Edit2.Text;
//c:=s.Chars[0];
miCadena.setString(s);
end;

//Obtener la cadena
procedure TForm1.Button2Click(Sender: TObject);
begin
Edit1.Text:=miCadena.getCadena;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
ShowMessage(miCadena.sgtePalabra(contaPal));
end;

procedure TForm1.ContarPalabras1Click(Sender: TObject);
 var miRes :word;
begin
miRes:=miCadena.contarPalabras();
ShowMessage('El numero de palabras es: '+IntToStr(miRes));
end;

procedure TForm1.EliminarPalabra1Click(Sender: TObject);
var s:string;
begin
s:=InputBox('','','');
miCadena.eliminarPalabra(s);
end;

procedure TForm1.Eliminarpalabrasvocrepetid1Click(Sender: TObject);
begin
miCadena.eliminarPalabrasVocalRepetida;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
miCadena:=Cadena.Create;
contaPal:=1;
end;

procedure TForm1.VerifVocalRepetida1Click(Sender: TObject);
var
cad: string;
b:boolean;
begin
  cad:=miCadena.getCadena();
  b:=miCadena.esVocalRepetida(cad);
  if(b)then
  begin
    ShowMessage('esta repetida')  ;
  end
  else
     ShowMessage('NO esta repetida')   ;
end;

end.
