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
  object Button1: TButton
    Left = 360
    Top = 112
    Width = 75
    Height = 25
    Caption = 'setString'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 163
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 346
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
  end
  object Button2: TButton
    Left = 193
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Obtener'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 56
    Top = 128
    Width = 75
    Height = 25
    Caption = 'SgtePalabra'
    TabOrder = 4
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object Ejercicios1: TMenuItem
      Caption = 'Ejercicios'
      object AMayuscula1: TMenuItem
        Caption = 'A Mayuscula'
        OnClick = AMayuscula1Click
      end
      object aMin1: TMenuItem
        Caption = 'a Min'
        OnClick = aMin1Click
      end
      object ContarPalabras1: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = ContarPalabras1Click
      end
      object VerifVocalRepetida1: TMenuItem
        Caption = 'VerifVocalRepetida'
        OnClick = VerifVocalRepetida1Click
      end
      object EliminarPalabra1: TMenuItem
        Caption = 'EliminarPalabra'
        OnClick = EliminarPalabra1Click
      end
      object Eliminarpalabrasvocrepetid1: TMenuItem
        Caption = 'Eliminar palabras voc repetid'
        OnClick = Eliminarpalabrasvocrepetid1Click
      end
    end
  end
end
