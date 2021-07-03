unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,UCVector, Vcl.Menus;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Promedio1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Promedio1Click(Sender: TObject);
  private
    { Private declarations }
    X : Vector;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    X:=Vector.Create;
end;

procedure TForm1.Promedio1Click(Sender: TObject);
begin
     X.getAVG;
end;

end.
