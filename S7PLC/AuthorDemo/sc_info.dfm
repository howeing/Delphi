object SmartConnectInfo: TSmartConnectInfo
  Left = 280
  Top = 273
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Info about smartconnect'
  ClientHeight = 381
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 671
    Height = 312
    Cursor = crHelp
    Align = alTop
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Sans'
    Font.Style = []
    Lines.Strings = (
      
        'Snap7Client uses "smart connect" feature to avoid the TCP connec' +
        'tion timeout when a PLC is off or '
      'unwired.'
      
        'First the PLC is pinged. Then, if the ping result is ok, the TCP' +
        ' connection is performed.'
      ''
      
        'Under Windows this is accomplished using the system library "iph' +
        'lpapi.dll", if it is not available (very '
      
        'rare case) a raw socket is created, and, in this case, under Vis' +
        'ta/Windows 7/Windows 8 you need '
      'administrative priviledges.'
      ''
      
        'During the initialization, the library checks if the ping can be' +
        ' performed trying the above methods.'
      
        'If all they fail, the ping will not be performed by any client c' +
        'reated, and they will try to connect directly.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 296
    Top = 336
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 11
    TabOrder = 1
  end
end
