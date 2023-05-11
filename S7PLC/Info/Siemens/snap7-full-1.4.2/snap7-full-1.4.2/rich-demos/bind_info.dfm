object BindErrortInfo: TBindErrortInfo
  Left = 467
  Top = 267
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Info about server start error'
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Sans'
    Font.Style = []
    Lines.Strings = (
      'If you got a start error, most likely :'
      ''
      '-Windows'
      
        'In this computer is installed Step 7 which has a service listeni' +
        'ng on port 102 (the IsoTCP port).'
      'You can temporarily disable this service, to run this demo.'
      ''
      'Open a command prompt and type'
      'net stop fsf  (in win32)'
      'or'
      'net stop 424 (in win64)'
      ''
      'To re enable it run net start....'
      ''
      '-Unix'
      'You need root rights to bind a socket to the port 102'
      ''
      'try '
      'sudo ./clientdemo')
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
