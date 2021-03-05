unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,UCMatriz,
  Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    SGMatriz: TStringGrid;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    CargarMatriz1: TMenuItem;
    MostrarMatriz1: TMenuItem;
    CargarRandomico1: TMenuItem;
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure CargarMatriz1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MostrarMatriz1Click(Sender: TObject);
    procedure CargarRandomico1Click(Sender: TObject);
  private
    { Private declarations }
    M : Matriz;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.CargarMatriz1Click(Sender: TObject);
Var
    i,j : Word;
begin
      M.Redimensionar(SGMatriz.RowCount,SGMatriz.ColCount);
      for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            M.ModElement(I,J,StrToFloat(SGMatriz.Cells[J-1,I-1]));
end;

procedure TfrmPrincipal.CargarRandomico1Click(Sender: TObject);
Var
    i,j : Word;
begin
      Randomize;
      M.Redimensionar(SGMatriz.RowCount,SGMatriz.ColCount);
      for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            M.ModElement(I,J,Random(100));

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
      M := Matriz.Create;
end;

procedure TfrmPrincipal.MostrarMatriz1Click(Sender: TObject);
Var
    i,j : Word;
begin
      SGMatriz.RowCount:=M.Filas;
      SGMatriz.ColCount:=M.Columnas;
      for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            SGMatriz.Cells[J-1,I-1]:=FloatToStr(M.ObtElement(I,J));

end;

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
     SGMatriz.ColCount:=ScrollBar1.Position;
end;

procedure TfrmPrincipal.ScrollBar2Change(Sender: TObject);
begin
     SGMatriz.RowCount:=ScrollBar2.Position;
end;

end.
