unit unitProyecto01GUI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus ,PracticoU1Unit;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  objectoPractico:PracticoU1;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
var
  s:String;
begin
    s:=InputBox('Introduzca K','','');
    objectoPractico.ejercicio01(StrToInt(s));
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var r:Integer;
  n,m:String;
begin
   n:=InputBox('Introduzca N','','');
   m:=InputBox('Introduzca M','','');
r:=  objectoPractico.ejercico02(StrToInt(n),StrToInt(m));
ShowMessage(IntToStr(r));
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var r:Integer;
  n,m,lim:String;
begin
   n:=InputBox('Introduzca N','','');
   m:=InputBox('Introduzca M','','');
   lim:=InputBox('Introduzca Lim','','');
   r:=objectoPractico.ejercicio17Calculadora(StrToInt(n),StrToInt(m),StrToInt(lim));
  ShowMessage(IntToStr(r));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   objectoPractico:=PracticoU1.Create();
end;

end.

