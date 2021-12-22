unit UnitFormArchivoTexto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  StdCtrls, UArchivoTexto;

type

  { TForm1 }

  TForm1 = class(TForm)
    CrearArchivo: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    procedure CrearArchivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    at:Texto;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  at:=Texto.crear('ArchivoPorDefecto','txt');
  at.cerrar();
end;

procedure TForm1.CrearArchivoClick(Sender: TObject);
var s:string;
begin
  s:=InputBox('Introduzca nombre del archivo','','');
  at:=Texto.crear(s,'txt');
  at.cerrar();
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var at2:Texto;
begin
   at2:=at.copiar();
   ShowMessage('Copiado exitosamente a: '+at2.getNombreCompleto());
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  at.eliminar();
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var at2:Texto;
begin
  at2:=at.copiarInvertido();
end;

end.

