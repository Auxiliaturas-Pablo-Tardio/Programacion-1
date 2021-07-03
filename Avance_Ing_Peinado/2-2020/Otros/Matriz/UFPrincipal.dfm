object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'MATRIZ'
  ClientHeight = 577
  ClientWidth = 763
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
  object SGMatriz: TStringGrid
    Left = 24
    Top = 32
    Width = 705
    Height = 265
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 24
    Top = 289
    Width = 705
    Height = 31
    Max = 128
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 724
    Top = 32
    Width = 31
    Height = 288
    Kind = sbVertical
    Max = 128
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 2
    OnChange = ScrollBar2Change
  end
  object MainMenu1: TMainMenu
    Left = 288
    Top = 448
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object CargarMatriz1: TMenuItem
        Caption = 'Cargar Matriz'
        OnClick = CargarMatriz1Click
      end
      object CargarRandomico1: TMenuItem
        Caption = 'Cargar Randomico'
        OnClick = CargarRandomico1Click
      end
      object MostrarMatriz1: TMenuItem
        Caption = 'Mostrar Matriz'
        OnClick = MostrarMatriz1Click
      end
    end
  end
end
