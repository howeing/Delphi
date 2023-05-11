object ParamsConnectInfo: TParamsConnectInfo
  Left = 264
  Top = 274
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Info about connection params'
  ClientHeight = 381
  ClientWidth = 726
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
    Width = 726
    Height = 312
    Cursor = crHelp
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    Font.Quality = fqDraft
    Lines.Strings = (
      'CPU S7 300/400/1200/1500/WinAC - Use Rack/Slot TAB'
      ''
      '"Connect as" is the Connection Type, [PG/OP/S7 Basic].'
      'Each one is good enough.'
      ''
      'S7300  : Rack 0 - Slot 2'
      
        'S7400  : Depends on the hardware configuration (Rack 0 - Slot 3 ' +
        'should be good)'
      'S71200 : Rack 0 - Slot 0'
      'S71500 : Rack 0 - Slot 0'
      'WinAC  : Rack 0 - Slot See the Station Configuration.'
      ''
      ''
      'CPU S7200/LOGO 0BA7/LOGO 8 - Use TSAP TAB'
      ''
      'S7200  : LocTSAP 4D.57 - RemTSAP 4D.57 (or 02.00 - 02.00)'
      'LOGO   : Depends on Tools->Ethernet Connections of LOGOComfort.')
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
