object frmTengzhou4: TfrmTengzhou4
  Left = 613
  Top = 332
  AlphaBlendValue = 120
  Caption = 'Zibo'
  ClientHeight = 1041
  ClientWidth = 1904
  Color = clWhite
  TransparentColorValue = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object BitBtn1: TBitBtn
    Left = 30
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Layout'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Tag = 1
    Left = 144
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Area1'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn4: TBitBtn
    Tag = 2
    Left = 265
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Area2'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn5: TBitBtn
    Tag = 3
    Left = 386
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Area3-4'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn6: TBitBtn
    Tag = 4
    Left = 507
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Area5-6'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn7: TBitBtn
    Tag = 5
    Left = 635
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Area7,9'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn8: TBitBtn
    Tag = 6
    Left = 749
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Aera8,10'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Tag = 7
    Left = 1409
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Arrow'
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object BitBtn10: TBitBtn
    Left = 1032
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Chevron'
    TabOrder = 8
    OnClick = BitBtn10Click
  end
  object BitBtn11: TBitBtn
    Tag = 7
    Left = 1283
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Edge'
    TabOrder = 9
    OnClick = BitBtn11Click
  end
  object BitBtn12: TBitBtn
    Tag = 7
    Left = 1535
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Test'
    TabOrder = 10
    OnClick = BitBtn12Click
  end
  object RxSave: TRxCheckBox
    Left = 1701
    Top = 998
    Width = 57
    Height = 19
    Caption = 'Save'
    TabOrder = 11
    WordWrap = True
    HorizontalAlignment = taLeftJustify
    VerticalAlignment = taAlignTop
    Style = vsNormal
  end
  object BitBtn13: TBitBtn
    Left = 1157
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Chevron'
    TabOrder = 12
    OnClick = BitBtn13Click
  end
  object BitBtn14: TBitBtn
    Tag = 7
    Left = 1791
    Top = 992
    Width = 108
    Height = 32
    Caption = 'Test'
    TabOrder = 13
    OnClick = BitBtn14Click
  end
  object cs: TCodeSiteLogger
    Destination = csDest
    Left = 1840
    Top = 784
  end
  object csDest: TCodeSiteDestination
    LogFile.LogByDateFormat = 'yyyymmdd'
    TCP.Host = 'localhost'
    TCP.Port = 3434
    TCP.RemoteDestinationString = 'Viewer'
    UDP.Host = 'localhost'
    UDP.Port = 3435
    UDP.RemoteDestinationString = 'Viewer'
    Left = 1840
    Top = 832
  end
end
