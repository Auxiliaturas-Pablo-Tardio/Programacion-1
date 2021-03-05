object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 320
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 120
    Top = 64
    Width = 320
    Height = 120
    TabOrder = 0
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Cargar: TButton
    Left = 104
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Cargar'
    TabOrder = 1
    OnClick = CargarClick
  end
  object VerDescargar: TButton
    Left = 288
    Top = 248
    Width = 75
    Height = 25
    Caption = 'VerDescargar'
    TabOrder = 2
    OnClick = VerDescargarClick
  end
end
