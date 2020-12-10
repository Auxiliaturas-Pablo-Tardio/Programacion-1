object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 315
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 80
    Top = 32
    Width = 353
    Height = 169
    FixedCols = 0
    FixedRows = 0
    Options = [goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 32
    object Matrices1: TMenuItem
      Caption = 'Matrices'
      object Cargar1: TMenuItem
        Caption = 'Cargar'
        OnClick = Cargar1Click
      end
      object mostrarMatriz1: TMenuItem
        Caption = 'mostrar Matriz'
        OnClick = mostrarMatriz1Click
      end
    end
    object Practico1: TMenuItem
      Caption = 'Practico'
      object N01SeriePrimos1: TMenuItem
        Caption = '01 Serie Primos'
        OnClick = N01SeriePrimos1Click
      end
    end
  end
end
