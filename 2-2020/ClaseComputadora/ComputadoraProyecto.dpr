program ComputadoraProyecto;

uses
  Vcl.Forms,
  Computadora in 'Computadora.pas' {Form1},
  UCComputadorasaa in 'UCComputadorasaa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
