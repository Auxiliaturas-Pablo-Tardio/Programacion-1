unit UnitFormArchivoTexto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  StdCtrls, ExtCtrls, UArchivoTexto,UArchivoFicheroReal;

type

  { TForm1 }

  TForm1 = class(TForm)
    CrearArchivo: TButton;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    procedure CrearArchivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
  private
    at:Texto;
    archivoR:ArchivoReal;
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

procedure TForm1.MenuItem5Click(Sender: TObject);
var s:string;
begin
  s:=InputBox('Escriba el nuevo nombre','','');
  at.renombrar(s);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
 // at.renombrar('misReales');
  ShowMessage('PorTransferirReales');

  archivoR:=at.transferirRealesAArchivoReal();


end;

procedure TForm1.MenuItem7Click(Sender: TObject);
var s:string;
begin
s:=archivoR.mostrarDatos(5);
Memo1.Append(s);
//Memo1.SelText:=s;
end;

end.

