program PCadenas;

uses
  Vcl.Forms,
  FormCadenas in 'FormCadenas.pas' {Form1},
  UCCadenas in 'UCCadenas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
