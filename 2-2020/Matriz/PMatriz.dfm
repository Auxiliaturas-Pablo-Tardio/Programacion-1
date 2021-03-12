object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 389
  ClientWidth = 705
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
    Left = 43
    Top = 80
    Width = 230
    Height = 145
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Cargar: TButton
    Left = 88
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cargar'
    TabOrder = 1
    OnClick = CargarClick
  end
  object VerDescargar: TButton
    Left = 185
    Top = 264
    Width = 75
    Height = 25
    Caption = 'VerDescargar'
    TabOrder = 2
    OnClick = VerDescargarClick
  end
  object StringGrid2: TStringGrid
    Left = 336
    Top = 80
    Width = 225
    Height = 136
    TabOrder = 3
  end
  object Cargar2: TButton
    Left = 368
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Cargar2'
    TabOrder = 4
    OnClick = Cargar2Click
  end
  object Descargar: TButton
    Left = 486
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Descargar'
    TabOrder = 5
    OnClick = DescargarClick
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 24
    object Ejercicios1: TMenuItem
      Caption = 'Ejercicios'
      object ContarUnicos1: TMenuItem
        Caption = 'Contar Unicos'
        OnClick = ContarUnicos1Click
      end
      object ContarUnicosParam1: TMenuItem
        Caption = 'Contar Unicos Param'
        OnClick = ContarUnicosParam1Click
      end
      object SumarMatricesEnla11: TMenuItem
        Caption = 'Sumar Matrices En la 1'
        OnClick = SumarMatricesEnla11Click
      end
    end
  end
end
