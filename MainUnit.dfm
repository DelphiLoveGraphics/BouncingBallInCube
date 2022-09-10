object DrawForm: TDrawForm
  Left = 0
  Top = 0
  Caption = 'Draw'
  ClientHeight = 477
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 707
    Height = 477
    Align = alClient
    TabOrder = 0
    object ImgDraw: TImage
      Left = 3
      Top = 8
      Width = 513
      Height = 417
    end
  end
  object TimerDraw: TTimer
    Interval = 20
    OnTimer = TimerDrawTimer
    Left = 344
    Top = 248
  end
end
