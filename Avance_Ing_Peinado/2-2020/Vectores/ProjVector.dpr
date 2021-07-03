program ProjVector;

uses
  Vcl.Forms,
  PVector in 'PVector.pas' {Form1},
  UCVector in 'UCVector.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
