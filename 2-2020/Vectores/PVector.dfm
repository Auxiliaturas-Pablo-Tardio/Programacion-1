object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 283
  ClientWidth = 564
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
    Left = 64
    Top = 88
    Width = 433
    Height = 65
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
    RowHeights = (
      24)
  end
  object Button1: TButton
    Left = 168
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Cargar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Descargar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 8
    object Ejercicios1: TMenuItem
      Caption = 'Ejercicios'
      object ordenar1: TMenuItem
        Caption = 'ordenar'
        OnClick = ordenar1Click
      end
      object SelectionSort1: TMenuItem
        Caption = 'SelectionSort'
        OnClick = SelectionSort1Click
      end
      object SelectionSortSubFunciones1: TMenuItem
        Caption = 'SelectionSortSubFunciones'
        OnClick = SelectionSortSubFunciones1Click
      end
      object BubbleSortRango1: TMenuItem
        Caption = 'BubbleSort Rango'
        OnClick = BubbleSortRango1Click
      end
      object SelectionSortSaltos1: TMenuItem
        Caption = 'SelectionSort Saltos'
        OnClick = SelectionSortSaltos1Click
      end
      object EliminarConRango1: TMenuItem
        Caption = 'Eliminar Con Rango'
        OnClick = EliminarConRango1Click
      end
      object Eliminar1: TMenuItem
        Caption = 'Eliminar'
        OnClick = Eliminar1Click
      end
    end
  end
end
