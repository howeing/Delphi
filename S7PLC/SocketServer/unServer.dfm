object frmServer: TfrmServer
  Left = 0
  Top = 0
  Caption = 'Server Socket'
  ClientHeight = 321
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 678
    Height = 321
    Align = alClient
    TabOrder = 0
    object RxLabelStatus: TRxLabel
      Left = 99
      Top = 16
      Width = 6
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RxLabelContent: TRxLabel
      Left = 99
      Top = 48
      Width = 6
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RxLabel1: TRxLabel
      Left = 40
      Top = 16
      Width = 43
      Height = 16
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RxLabel2: TRxLabel
      Left = 42
      Top = 48
      Width = 51
      Height = 16
      Caption = 'Content:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ShapeStatus: TShape
      Left = 268
      Top = 187
      Width = 20
      Height = 20
      Shape = stCircle
    end
    object btnConnect: TButton
      Left = 164
      Top = 185
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnConnectClick
    end
    object RxRichEditSend: TRxRichEdit
      Left = 42
      Top = 89
      Width = 583
      Height = 65
      DrawEndPage = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btnSend: TButton
      Left = 550
      Top = 185
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 2
      OnClick = btnSendClick
    end
    object RxSpinEditPort: TRxSpinEdit
      Left = 268
      Top = 216
      Width = 75
      Height = 24
      Value = 18725.000000000000000000
      TabOrder = 3
      OnChange = RxSpinEditPortChange
    end
    object btnDisconnect: TButton
      Left = 164
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 4
      OnClick = btnDisconnectClick
    end
    object rdoTcp: TRxRadioButton
      Left = 54
      Top = 188
      Width = 51
      Height = 18
      Caption = 'TCP'
      Checked = True
      TabOrder = 5
      TabStop = True
      WordWrap = True
      HorizontalAlignment = taLeftJustify
      VerticalAlignment = taAlignTop
      Style = vsNormal
    end
    object rdoUdp: TRadioButton
      Left = 54
      Top = 220
      Width = 51
      Height = 17
      Caption = 'UDP'
      TabOrder = 6
    end
  end
  object ServerTcp: TServerSocket
    Active = False
    Port = 5269
    ServerType = stNonBlocking
    OnListen = ServerTcpListen
    OnClientConnect = ServerTcpClientConnect
    OnClientDisconnect = ServerTcpClientDisconnect
    OnClientRead = ServerTcpClientRead
    Left = 504
    Top = 24
  end
  object cs: TCodeSiteLogger
    Destination = csDest
    Left = 608
    Top = 16
  end
  object csDest: TCodeSiteDestination
    Viewer.Active = True
    LogFile.LogByDateFormat = 'yyyymmdd'
    TCP.Host = 'localhost'
    TCP.Port = 3434
    TCP.RemoteDestinationString = 'Viewer'
    UDP.Host = 'localhost'
    UDP.Port = 3435
    UDP.RemoteDestinationString = 'Viewer'
    Left = 584
    Top = 16
  end
  object ServerUdp: TIdUDPServer
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = ServerUdpUDPRead
    Left = 424
    Top = 24
  end
  object IdUDPClient1: TIdUDPClient
    Port = 0
    Left = 336
    Top = 8
  end
end
