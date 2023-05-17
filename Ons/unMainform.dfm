object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLayout: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Align = alClient
    TabOrder = 0
    object pnlTop: TPanel
      Left = 216
      Top = 8
      Width = 185
      Height = 41
      Caption = 'pnlTop'
      TabOrder = 0
    end
    object pnlBottom: TPanel
      Left = 216
      Top = 248
      Width = 185
      Height = 41
      Caption = 'pnlBottom'
      TabOrder = 1
    end
    object pnlLeft: TPanel
      Left = 8
      Top = 120
      Width = 185
      Height = 41
      Caption = 'pnlLeft'
      TabOrder = 2
    end
    object pnlRight: TPanel
      Left = 442
      Top = 120
      Width = 185
      Height = 41
      Caption = 'pnlRight'
      TabOrder = 3
    end
    object btnAction: TButton
      Left = 280
      Top = 129
      Width = 75
      Height = 25
      Caption = 'btnAction'
      TabOrder = 4
      OnClick = btnActionClick
    end
  end
end
