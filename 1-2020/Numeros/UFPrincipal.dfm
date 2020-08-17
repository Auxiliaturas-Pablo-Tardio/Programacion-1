object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'NUMEROS'
  ClientHeight = 389
  ClientWidth = 592
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
    Left = 40
    Top = 48
    Width = 85
    Height = 13
    Caption = 'Valor del Numero:'
  end
  object Edit1: TEdit
    Left = 40
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 200
    Top = 128
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object ObtenerValor1: TMenuItem
        Caption = 'Obtener Valor'
        OnClick = ObtenerValor1Click
      end
      object CambiarValor1: TMenuItem
        Caption = 'Cambiar Valor'
        OnClick = CambiarValor1Click
      end
      object ContarDigitos1: TMenuItem
        Caption = 'Contar Digitos'
        OnClick = ContarDigitos1Click
      end
      object CovertiraBinario1: TMenuItem
        Caption = 'Covertir a Binario'
        OnClick = CovertiraBinario1Click
      end
      object CovertiraHexadecimal1: TMenuItem
        Caption = 'Covertir a Hexadecimal'
      end
      object ConvertiraBinario21: TMenuItem
        Caption = 'Convertir a Binario 2'
        OnClick = ConvertiraBinario21Click
      end
      object ImprimirDigBinprehexa1: TMenuItem
        Caption = 'Imprimir Dig Bin pre hexa'
        OnClick = ImprimirDigBinprehexa1Click
      end
      object Unidadaliteral1: TMenuItem
        Caption = 'Unidad a literal'
        OnClick = Unidadaliteral1Click
      end
    end
  end
end
