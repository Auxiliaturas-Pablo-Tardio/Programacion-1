object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'VECTORES'
  ClientHeight = 438
  ClientWidth = 591
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
  object SGVector: TStringGrid
    Left = 32
    Top = 24
    Width = 521
    Height = 49
    ColCount = 1
    DefaultColWidth = 32
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 32
    Top = 79
    Width = 521
    Height = 17
    Max = 128
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 200
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object CargarVector1: TMenuItem
        Caption = 'Cargar Vector'
        OnClick = CargarVector1Click
      end
      object MostrarVector1: TMenuItem
        Caption = 'Mostrar Vector'
        OnClick = MostrarVector1Click
      end
      object Obtenerdimension1: TMenuItem
        Caption = 'Obtener dimension'
      end
      object AdicionarElemento1: TMenuItem
        Caption = 'Adicionar Elemento'
      end
      object InsertarElemento1: TMenuItem
        Caption = 'Insertar Elemento'
      end
      object EliminarElemento1: TMenuItem
        Caption = 'Eliminar Elemento'
      end
      object ModificarElemento1: TMenuItem
        Caption = 'Modificar Elemento'
      end
      object ObtenerElemento1: TMenuItem
        Caption = 'Obtener Elemento'
      end
      object SumarElementos1: TMenuItem
        Caption = 'Sumar Elementos'
      end
      object PromediodeElementos1: TMenuItem
        Caption = 'Promedio de Elementos'
      end
    end
  end
end
