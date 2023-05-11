object FrmServer: TFrmServer
  Left = 230
  Top = 126
  Caption = 'Server Demo'
  ClientHeight = 643
  ClientWidth = 815
  Color = clBtnFace
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 362
    Width = 815
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Color = clMedGray
    ParentColor = False
  end
  object Log: TMemo
    Left = 0
    Top = 365
    Width = 815
    Height = 255
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object SB: TStatusBar
    Left = 0
    Top = 620
    Width = 815
    Height = 23
    Panels = <
      item
        Width = 80
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 362
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 14
      Top = 3
      Width = 66
      Height = 13
      Caption = 'Local Address'
      Color = clBtnFace
      ParentColor = False
    end
    object StartBtn: TButton
      Left = 14
      Top = 62
      Width = 97
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = StartBtnClick
    end
    object EdIP: TEdit
      Left = 14
      Top = 22
      Width = 97
      Height = 21
      TabOrder = 1
      Text = '0.0.0.0'
    end
    object StopBtn: TButton
      Left = 14
      Top = 102
      Width = 97
      Height = 25
      Caption = 'Stop'
      TabOrder = 2
      OnClick = StopBtnClick
    end
  end
  object PC: TPageControl
    Left = 129
    Top = 0
    Width = 686
    Height = 362
    ActivePage = TabSheet1
    Align = alClient
    Constraints.MinHeight = 308
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Log Mask'
      object Label2: TLabel
        Left = 8
        Top = 314
        Width = 24
        Height = 13
        Caption = 'Mask'
        Color = clBtnFace
        ParentColor = False
      end
      object lblMask: TLabel
        Left = 56
        Top = 314
        Width = 73
        Height = 14
        AutoSize = False
        Caption = '$00000000'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object List: TCheckListBox
        Left = 8
        Top = 18
        Width = 660
        Height = 287
        BorderStyle = bsNone
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        Items.Strings = (
          '  evcServerStarted       : $00000001'
          '  evcServerStopped       : $00000002'
          '  evcListenerCannotStart : $00000004'
          '  evcClientAdded         : $00000008'
          '  evcClientRejected      : $00000010'
          '  evcClientNoRoom        : $00000020'
          '  evcClientException     : $00000040'
          '  evcClientDisconnected  : $00000080'
          '  evcClientTerminated    : $00000100'
          '  evcClientsDropped      : $00000200'
          '  evcReserved_0400       : $00000400'
          '  evcReserved_0800       : $00000800'
          '  evcReserved_1000       : $00001000'
          '  evcReserved_2000       : $00002000'
          '  evcReserved_4000       : $00004000'
          '  evcReserved_8000       : $00008000'
          '  evcPDUincoming         : $00010000'
          '  evcDataRead            : $00020000'
          '  evcDataWrite           : $00040000'
          '  evcNegotiatePDU        : $00080000'
          '  evcReadSZL             : $00100000'
          '  evcClock               : $00200000'
          '  evcUpload              : $00400000'
          '  evcDirectory           : $00800000'
          '  evcSecurity            : $01000000'
          '  evcControl             : $02000000'
          '  evcReserved_04000000   : $04000000'
          '  evcReserved_08000000   : $08000000'
          '  evcReserved_10000000   : $10000000'
          '  evcReserved_20000000   : $20000000'
          '  evcReserved_40000000   : $40000000'
          '  evcReserved_80000000   : $80000000')
        ParentFont = False
        TabOrder = 0
        OnClick = ListClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'DB 1'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoDB1: TMemo
        Left = 0
        Top = 0
        Width = 680
        Height = 332
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'DB 2'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoDB2: TMemo
        Left = 0
        Top = 0
        Width = 680
        Height = 332
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'DB 3'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MemoDB3: TMemo
        Left = 0
        Top = 0
        Width = 680
        Height = 332
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object EvtTimer: TTimer
    Interval = 100
    OnTimer = EvtTimerTimer
    Left = 88
    Top = 240
  end
  object LogTimer: TTimer
    Interval = 10
    OnTimer = LogTimerTimer
    Left = 24
    Top = 240
  end
end
