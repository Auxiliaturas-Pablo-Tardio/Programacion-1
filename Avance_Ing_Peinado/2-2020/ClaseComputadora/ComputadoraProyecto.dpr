program ComputadoraProyecto;

uses
  Vcl.Forms,
  ComputadoraDesign in 'ComputadoraDesign.pas' {Form1},
  UCComputadora in 'UCComputadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
