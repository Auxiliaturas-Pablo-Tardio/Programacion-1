unit segundoForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,UCadena;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Cargar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CargarClick(Sender: TObject);
  private

  public
   cad:cadena;
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.CargarClick(Sender: TObject);
 var s:string;
begin
  cad:=cad.crear();
  s:=inputBox('','','');
  cad.cargarString(s);
end;

procedure TForm2.Button1Click(Sender: TObject);
 var s:string;
begin
   s:=cad.toString();
    ShowMessage(s);
end;

end.

