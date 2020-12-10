unit ComputadoraDesign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UCComputadora;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    computadoraLaptopASUS,compuLENOVO : Computadora;
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var s : String;
begin
 s:=compuLENOVO.mostrarPantalla()+computadoraLaptopASUS.mostrarPantalla();
 ShowMessage(s);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin

computadoraLaptopASUS:= Computadora.Create; //Constructor
computadoraLaptopASUS.setMonitor('ASUS Monitor');
compuLENOVO:=Computadora.Create;
 compuLENOVO.setMonitor('Monitor pequeño');
 end;
end.
