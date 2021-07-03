object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CADENA'
  ClientHeight = 524
  ClientWidth = 673
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
  object Label1: TLabel
    Left = 184
    Top = 64
    Width = 4
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Agency FB'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 128
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 344
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 160
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Longitud1: TMenuItem
        Caption = 'Longitud'
        OnClick = Longitud1Click
      end
      object CargarCadena1: TMenuItem
        Caption = 'Cargar Cadena'
        OnClick = CargarCadena1Click
      end
      object MostrarCadena1: TMenuItem
        Caption = 'Mostrar Cadena'
        OnClick = MostrarCadena1Click
      end
      object AdicionarCaracter1: TMenuItem
        Caption = 'Adicionar Caracter'
        OnClick = AdicionarCaracter1Click
      end
      object EliminarCaracter1: TMenuItem
        Caption = 'Eliminar Caracter'
      end
      object InsertarCaracter1: TMenuItem
        Caption = 'Insertar Caracter'
      end
      object InvertirCaracteres1: TMenuItem
        Caption = 'Invertir Caracteres'
      end
      object ContarPalabra1: TMenuItem
        Caption = 'Contar Palabra'
        OnClick = ContarPalabra1Click
      end
      object SiguientePalabra1: TMenuItem
        Caption = 'Siguiente Palabra'
        OnClick = SiguientePalabra1Click
      end
      object Palabrademayorlongitud1: TMenuItem
        Caption = 'Palabra de mayor longitud'
        OnClick = Palabrademayorlongitud1Click
      end
      object Enesimapalabra1: TMenuItem
        Caption = 'Enesima palabra'
        OnClick = Enesimapalabra1Click
      end
    end
  end
end
