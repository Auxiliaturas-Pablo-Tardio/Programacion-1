unit unitFormCadena;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,UCadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonDesc: TButton;
    ButtonCargar: TButton;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    procedure ButtonCargarClick(Sender: TObject);
    procedure ButtonDescClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
  private

  public
     cad,cadA,cadB:cadena;

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonCargarClick(Sender: TObject);
begin
  cad.cargarTodo();
end;

procedure TForm1.ButtonDescClick(Sender: TObject);
begin
  Edit1.Text:=cad.descargarToString();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cad:=Cadena.Create;
  cad:=cadena.crear;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var pal:string;
begin
   pal:=InputBox('int. palabra','','');

         cada:=cadena.Create;
            cadb:=cadena.Create;
      cada:=cadena.crear;
      cadb:=cadena.crear;

    cad.separarCadDePal(pal,cadA,cadB);
    ShowMessage(cadA.descargarToString());
      ShowMessage(cadB.descargarToString());
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var pos:integer;
begin
  pos:=StrToInt(InputBox('intrduzca pos','',''));
       cada:=cadena.Create;
          cadb:=cadena.Create;
    cada:=cadena.crear;
    cadb:=cadena.crear;

  cad.separarCadDePos(pos,cadA,cadB);
  ShowMessage(cadA.descargarToString());
    ShowMessage(cadB.descargarToString());
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var pal:string;
    posi:integer;
begin
    pal:=InputBox('int. palabra','','');
    posi:=cad.getUltPosDePalabra(pal);
    ShowMessage(IntToStr(posi));


end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
    cad.ocultarInvirtiendo();
end;

end.

