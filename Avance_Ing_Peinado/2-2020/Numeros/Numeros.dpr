program Numeros;

uses
  Vcl.Forms,
  UFormNumeros in 'UFormNumeros.pas' {Form1},
  UCNumeros in 'UCNumeros.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
