object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmPrincipal'
  ClientHeight = 552
  ClientWidth = 780
  Color = clBlack
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 33
  object Label2: TLabel
    Left = 48
    Top = 56
    Width = 15
    Height = 33
    Caption = '0'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveBorder
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 640
    Top = 400
  end
  object TimerEnemigos: TTimer
    Interval = 100
    OnTimer = TimerEnemigosTimer
    Left = 640
    Top = 312
  end
  object timerExplosion: TTimer
    Enabled = False
    Interval = 400
    OnTimer = timerExplosionTimer
    Left = 512
    Top = 280
  end
end
