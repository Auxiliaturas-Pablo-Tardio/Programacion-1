object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 505
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
    Left = 176
    Top = 80
    Width = 50
    Height = 13
    Caption = 'Mi Numero'
  end
  object Label2: TLabel
    Left = 376
    Top = 80
    Width = 36
    Height = 13
    Caption = 'Mi Base'
  end
  object Edit1: TEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 344
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 16
    object SettersyGetters1: TMenuItem
      Caption = 'Setters y Getters'
      object getValor1: TMenuItem
        Caption = 'getValor'
        OnClick = getValor1Click
      end
      object setValor1: TMenuItem
        Caption = 'setValor'
        OnClick = setValor1Click
      end
    end
    object Numero21: TMenuItem
      Break = mbBarBreak
      Caption = 'Numero 2'
      object setValor2: TMenuItem
        Caption = 'setValor'
        OnClick = setValor2Click
      end
      object GetValor2: TMenuItem
        Caption = 'GetValor'
        OnClick = GetValor2Click
      end
    end
    object Ejercicios1: TMenuItem
      Caption = 'Ejercicios'
      object Sumadedigitos1: TMenuItem
        Caption = 'Suma de digitos'
        OnClick = Sumadedigitos1Click
      end
      object N02DecimalaBaseN1: TMenuItem
        Caption = '02 Decimal a Base N'
        OnClick = N02DecimalaBaseN1Click
      end
      object N02v2DecimalaBaseN1: TMenuItem
        Caption = '02 v2 Decimal a Base N'
        OnClick = N02v2DecimalaBaseN1Click
      end
    end
  end
end
