object FormClient: TFormClient
  Left = 455
  Top = 105
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'FormClient'
  ClientHeight = 625
  ClientWidth = 737
  Color = clBtnFace
  Constraints.MaxHeight = 664
  Constraints.MaxWidth = 753
  Constraints.MinHeight = 660
  Constraints.MinWidth = 745
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 456
    Top = 9
    Width = 75
    Height = 13
    Caption = 'PDU Size (byte)'
    Color = clBtnFace
    ParentColor = False
  end
  object Label63: TLabel
    Left = 456
    Top = 45
    Width = 178
    Height = 13
    Cursor = crHandPoint
    Caption = 'What'#39's the "smart connect" feature ?'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = [fsUnderline]
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
    OnClick = Label63Click
  end
  object Label64: TLabel
    Left = 456
    Top = 59
    Width = 244
    Height = 13
    Cursor = crHandPoint
    Caption = 'Which parameters should I use for the connection?'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = [fsUnderline]
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
    OnClick = Label64Click
  end
  object EdIp: TEdit
    Left = 8
    Top = 1
    Width = 98
    Height = 21
    TabOrder = 0
    Text = '172.19.33.18'
  end
  object BtnConnect: TButton
    Left = 8
    Top = 22
    Width = 98
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = BtnConnectClick
  end
  object BtnDisconnect: TButton
    Left = 8
    Top = 46
    Width = 98
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 2
    OnClick = BtnDisconnectClick
  end
  object EdPDUSize: TStaticText
    Left = 456
    Top = 26
    Width = 13
    Height = 17
    BorderStyle = sbsSingle
    Caption = ' 0'
    Color = 13434828
    ParentColor = False
    TabOrder = 3
    Transparent = False
  end
  object PageControl: TPageControl
    Left = 0
    Top = 71
    Width = 737
    Height = 531
    ActivePage = TabSheet6
    Align = alBottom
    Anchors = [akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Sans'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 4
    OnChange = PageControlChange
    object TabSheet6: TTabSheet
      Caption = 'System Info'
      ImageIndex = 9
      object Label65: TLabel
        Left = 18
        Top = 467
        Width = 613
        Height = 28
        Alignment = taCenter
        Caption = 
          'If TSAP Tab is used for the connection, The system Info is not c' +
          'alled automatically (you should press the button "Refresh Info")' +
          '.'#13#10'This because some PLC (S7200/LOGO) don'#39't offer these informat' +
          'ions.'
        Color = clBtnFace
        ParentColor = False
      end
      object GroupBox5: TGroupBox
        Left = 17
        Top = 295
        Width = 491
        Height = 168
        Caption = 'Communication Info'
        TabOrder = 2
        object Label44: TLabel
          Left = 10
          Top = 13
          Width = 98
          Height = 14
          Caption = 'Max PDU size (byte)'
          Color = clBtnFace
          ParentColor = False
        end
        object Label45: TLabel
          Left = 10
          Top = 45
          Width = 114
          Height = 14
          Caption = 'Max active connections'
          Color = clBtnFace
          ParentColor = False
        end
        object Label46: TLabel
          Left = 10
          Top = 77
          Width = 90
          Height = 14
          Caption = 'Max MPI rate (bps)'
          Color = clBtnFace
          ParentColor = False
        end
        object Label47: TLabel
          Left = 10
          Top = 109
          Width = 127
          Height = 14
          Caption = 'Max comm. bus rare (bps)'
          Color = clBtnFace
          ParentColor = False
        end
        object EdPdu: TEdit
          Left = 171
          Top = 9
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'NO INFO AVAILABLE'
        end
        object EdConnections: TEdit
          Left = 171
          Top = 41
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'NO INFO AVAILABLE'
        end
        object EdMpiRate: TEdit
          Left = 171
          Top = 73
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = 'NO INFO AVAILABLE'
        end
        object EdBusRate: TEdit
          Left = 171
          Top = 105
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = 'NO INFO AVAILABLE'
        end
      end
      object GroupBox6: TGroupBox
        Left = 16
        Top = 87
        Width = 492
        Height = 200
        Caption = 'Unit Info'
        TabOrder = 1
        object Label41: TLabel
          Left = 10
          Top = 13
          Width = 90
          Height = 14
          Caption = 'Module Type Name'
          Color = clBtnFace
          ParentColor = False
        end
        object Label42: TLabel
          Left = 10
          Top = 45
          Width = 66
          Height = 14
          Caption = 'Serial number'
          Color = clBtnFace
          ParentColor = False
        end
        object Label43: TLabel
          Left = 10
          Top = 77
          Width = 83
          Height = 14
          Caption = 'Vendor copyright'
          Color = clBtnFace
          ParentColor = False
        end
        object Label51: TLabel
          Left = 10
          Top = 109
          Width = 45
          Height = 14
          Caption = 'AS Name'
          Color = clBtnFace
          ParentColor = False
        end
        object Label52: TLabel
          Left = 10
          Top = 141
          Width = 64
          Height = 14
          Caption = 'Module Name'
          Color = clBtnFace
          ParentColor = False
        end
        object EdModuleTypeName: TEdit
          Left = 171
          Top = 9
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'NO INFO AVAILABLE'
        end
        object EdSerialNumber: TEdit
          Left = 171
          Top = 41
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'NO INFO AVAILABLE'
        end
        object EdCopyright: TEdit
          Left = 171
          Top = 73
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = 'NO INFO AVAILABLE'
        end
        object EdASName: TEdit
          Left = 171
          Top = 105
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = 'NO INFO AVAILABLE'
        end
        object EdModuleName: TEdit
          Left = 171
          Top = 137
          Width = 278
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = 'NO INFO AVAILABLE'
        end
      end
      object GroupBox7: TGroupBox
        Left = 16
        Top = 11
        Width = 492
        Height = 65
        Caption = 'Catalog'
        TabOrder = 0
        object Label40: TLabel
          Left = 10
          Top = 13
          Width = 55
          Height = 14
          Caption = 'Order code'
          Color = clBtnFace
          ParentColor = False
        end
        object Label36: TLabel
          Left = 330
          Top = 13
          Width = 37
          Height = 14
          Caption = 'Version'
          Color = clBtnFace
          ParentColor = False
        end
        object edOrderCode: TEdit
          Left = 139
          Top = 9
          Width = 174
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'NO INFO AVAILABLE'
        end
        object EdVersion: TEdit
          Left = 379
          Top = 9
          Width = 68
          Height = 22
          Alignment = taCenter
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Button13: TButton
        Left = 541
        Top = 437
        Width = 100
        Height = 25
        Caption = 'Refresh Info'
        TabOrder = 3
        OnClick = Button13Click
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Data read/write'
      object Label4: TLabel
        Left = 616
        Top = 8
        Width = 24
        Height = 14
        Caption = 'Area'
        Color = clBtnFace
        ParentColor = False
      end
      object LblDBNum: TLabel
        Left = 616
        Top = 48
        Width = 54
        Height = 14
        Caption = 'DB Number'
        Color = clBtnFace
        ParentColor = False
      end
      object Label5: TLabel
        Left = 616
        Top = 88
        Width = 23
        Height = 14
        Caption = 'Start'
        Color = clBtnFace
        ParentColor = False
      end
      object Label6: TLabel
        Left = 616
        Top = 128
        Width = 37
        Height = 14
        Caption = 'Amount'
        Color = clBtnFace
        ParentColor = False
      end
      object Label19: TLabel
        Left = 616
        Top = 174
        Width = 44
        Height = 14
        Caption = 'WordLen'
        Color = clBtnFace
        ParentColor = False
      end
      object LblArea: TLabel
        Left = 616
        Top = 226
        Width = 107
        Height = 26
        Alignment = taCenter
        Caption = 'Area and WordLen '#13#10'mismatch'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object DataGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 601
        Height = 502
        Align = alLeft
        ColCount = 17
        DefaultColWidth = 32
        DefaultRowHeight = 18
        DefaultDrawing = False
        RowCount = 4097
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentFont = False
        TabOrder = 0
        OnDrawCell = DataGridDrawCell
        OnExit = DataGridExit
        OnKeyPress = DataGridKeyPress
      end
      object CbArea: TComboBox
        Left = 616
        Top = 24
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'DB'
        OnChange = CbAreaChange
        Items.Strings = (
          'DB'
          'Digital Inputs'
          'Digital Outputs'
          'Merkers'
          'Timers'
          'Counters')
      end
      object EdDBNum: TEdit
        Left = 616
        Top = 64
        Width = 105
        Height = 22
        TabOrder = 2
        Text = '1'
        OnKeyPress = EdRackKeyPress
      end
      object EdStart: TEdit
        Left = 616
        Top = 104
        Width = 105
        Height = 22
        TabOrder = 3
        Text = '0'
        OnKeyPress = EdRackKeyPress
      end
      object EdAmount: TEdit
        Left = 616
        Top = 144
        Width = 105
        Height = 22
        TabOrder = 4
        Text = '1'
        OnKeyPress = EdRackKeyPress
      end
      object BtnRead: TButton
        Left = 616
        Top = 264
        Width = 105
        Height = 25
        Caption = 'Read'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = BtnReadClick
      end
      object BtnWrite: TButton
        Left = 616
        Top = 359
        Width = 105
        Height = 25
        Caption = 'Write'
        TabOrder = 8
        OnClick = BtnWriteClick
      end
      object BtnAsyncRead: TButton
        Left = 616
        Top = 295
        Width = 105
        Height = 25
        Caption = 'Async Read'
        TabOrder = 7
        OnClick = BtnAsyncReadClick
      end
      object BtnAsyncWrite: TButton
        Left = 616
        Top = 390
        Width = 105
        Height = 25
        Caption = 'Async Write'
        TabOrder = 9
        OnClick = BtnAsyncWriteClick
      end
      object CbWLen: TComboBox
        Left = 616
        Top = 190
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 5
        Text = 'S7WLByte'
        OnChange = CbAreaChange
        Items.Strings = (
          'S7WLBit'
          'S7WLByte'
          'S7WLChar'
          'S7WLWord'
          'S7WLInt'
          'S7WLDWord'
          'S7WLDInt'
          'S7WLReal'
          'S7WLDate'
          'S7WLTOD'
          'S7WLTime'
          'S7WLS5Time'
          'S7WLDT'
          'S7WLCounter'
          'S7WLTimer')
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Multi read/write'
      ImageIndex = 2
      DesignSize = (
        729
        502)
      object Label9: TLabel
        Left = 32
        Top = 24
        Width = 24
        Height = 14
        Caption = 'Area'
        Color = clBtnFace
        ParentColor = False
      end
      object Label10: TLabel
        Left = 140
        Top = 24
        Width = 54
        Height = 14
        Caption = 'DB Number'
        Color = clBtnFace
        ParentColor = False
      end
      object Label11: TLabel
        Left = 218
        Top = 24
        Width = 23
        Height = 14
        Caption = 'Start'
        Color = clBtnFace
        ParentColor = False
      end
      object Label12: TLabel
        Left = 277
        Top = 24
        Width = 21
        Height = 14
        Caption = 'Size'
        Color = clBtnFace
        ParentColor = False
      end
      object Label13: TLabel
        Left = 12
        Top = 41
        Width = 8
        Height = 16
        Caption = '1'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 12
        Top = 65
        Width = 8
        Height = 16
        Caption = '2'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 12
        Top = 89
        Width = 8
        Height = 16
        Caption = '3'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 12
        Top = 113
        Width = 8
        Height = 16
        Caption = '4'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 12
        Top = 137
        Width = 8
        Height = 16
        Caption = '5'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label18: TLabel
        Left = 325
        Top = 24
        Width = 47
        Height = 14
        Caption = 'Data read'
        Color = clBtnFace
        ParentColor = False
      end
      object Label20: TLabel
        Left = 12
        Top = 201
        Width = 8
        Height = 16
        Caption = '1'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label21: TLabel
        Left = 12
        Top = 225
        Width = 8
        Height = 16
        Caption = '2'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label22: TLabel
        Left = 12
        Top = 249
        Width = 8
        Height = 16
        Caption = '3'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label23: TLabel
        Left = 12
        Top = 273
        Width = 8
        Height = 16
        Caption = '4'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label24: TLabel
        Left = 12
        Top = 297
        Width = 8
        Height = 16
        Caption = '5'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label25: TLabel
        Left = 32
        Top = 179
        Width = 30
        Height = 14
        Caption = 'Result'
        Color = clBtnFace
        ParentColor = False
      end
      object Label53: TLabel
        Left = 325
        Top = 179
        Width = 96
        Height = 14
        Caption = 'Data write (fill char)'
        Color = clBtnFace
        ParentColor = False
      end
      object Label55: TLabel
        Left = 45
        Top = 349
        Width = 568
        Height = 56
        Alignment = taCenter
        Caption = 
          'These function can read/write multiple vars in the same call. Th' +
          'e limitation is that the total size cannot exceed the '#10'PDU size ' +
          'negotiated. The big advantage is that every var is indipendent f' +
          'rom each other (you can mix DB, Merkers ...).'#10'Up to 20 vars can ' +
          'be defined, in this demo, for simplicity we use only 5 items.'#10'Th' +
          'ere is no Async support for these functions since they are execu' +
          'ted in a single telegram exchange.'
        Color = clBtnFace
        ParentColor = False
        WordWrap = True
      end
      object Label38: TLabel
        Left = 486
        Top = 179
        Width = 69
        Height = 14
        Caption = 'ReadMultiVars'
        Color = clBtnFace
        ParentColor = False
      end
      object Label39: TLabel
        Left = 486
        Top = 263
        Width = 69
        Height = 14
        Caption = 'WriteMultiVars'
        Color = clBtnFace
        ParentColor = False
      end
      object ComboArea_1: TComboBox
        Left = 32
        Top = 40
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'DB'
        OnChange = CbAreaChange
        Items.Strings = (
          'DB'
          'Digital Inputs'
          'Digital Outputs'
          'Merkers'
          'Timers'
          'Counters')
      end
      object EdDBNum_1: TEdit
        Left = 144
        Top = 40
        Width = 53
        Height = 22
        TabOrder = 1
        Text = '1'
        OnKeyPress = EdRackKeyPress
      end
      object EdStart_1: TEdit
        Left = 204
        Top = 40
        Width = 53
        Height = 22
        TabOrder = 2
        Text = '0'
        OnKeyPress = EdRackKeyPress
      end
      object EdAmount_1: TEdit
        Left = 264
        Top = 40
        Width = 53
        Height = 22
        TabOrder = 3
        Text = '16'
        OnKeyPress = EdRackKeyPress
      end
      object EdData_1: TEdit
        Left = 323
        Top = 40
        Width = 405
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object ComboArea_2: TComboBox
        Left = 32
        Top = 64
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 5
        Text = 'DB'
        OnChange = CbAreaChange
        Items.Strings = (
          'DB'
          'Digital Inputs'
          'Digital Outputs'
          'Merkers'
          'Timers'
          'Counters')
      end
      object EdDBNum_2: TEdit
        Left = 144
        Top = 64
        Width = 53
        Height = 22
        TabOrder = 6
        Text = '2'
        OnKeyPress = EdRackKeyPress
      end
      object EdStart_2: TEdit
        Left = 204
        Top = 64
        Width = 53
        Height = 22
        TabOrder = 7
        Text = '0'
        OnKeyPress = EdRackKeyPress
      end
      object EdAmount_2: TEdit
        Left = 264
        Top = 64
        Width = 53
        Height = 22
        TabOrder = 8
        Text = '16'
        OnKeyPress = EdRackKeyPress
      end
      object EdData_2: TEdit
        Left = 323
        Top = 64
        Width = 405
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
      end
      object ComboArea_3: TComboBox
        Left = 32
        Top = 88
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 10
        Text = 'DB'
        OnChange = CbAreaChange
        Items.Strings = (
          'DB'
          'Digital Inputs'
          'Digital Outputs'
          'Merkers'
          'Timers'
          'Counters')
      end
      object EdDBNum_3: TEdit
        Left = 144
        Top = 88
        Width = 53
        Height = 22
        TabOrder = 11
        Text = '3'
        OnKeyPress = EdRackKeyPress
      end
      object EdStart_3: TEdit
        Left = 204
        Top = 88
        Width = 53
        Height = 22
        TabOrder = 12
        Text = '0'
        OnKeyPress = EdRackKeyPress
      end
      object EdAmount_3: TEdit
        Left = 264
        Top = 88
        Width = 53
        Height = 22
        TabOrder = 13
        Text = '16'
        OnKeyPress = EdRackKeyPress
      end
      object EdData_3: TEdit
        Left = 323
        Top = 88
        Width = 405
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 14
      end
      object ComboArea_4: TComboBox
        Left = 32
        Top = 112
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 15
        Text = 'DB'
        OnChange = CbAreaChange
        Items.Strings = (
          'DB'
          'Digital Inputs'
          'Digital Outputs'
          'Merkers'
          'Timers'
          'Counters')
      end
      object EdDBNum_4: TEdit
        Left = 144
        Top = 112
        Width = 53
        Height = 22
        TabOrder = 16
        Text = '4'
        OnKeyPress = EdRackKeyPress
      end
      object EdStart_4: TEdit
        Left = 204
        Top = 112
        Width = 53
        Height = 22
        TabOrder = 17
        Text = '0'
        OnKeyPress = EdRackKeyPress
      end
      object EdAmount_4: TEdit
        Left = 264
        Top = 112
        Width = 53
        Height = 22
        TabOrder = 18
        Text = '16'
        OnKeyPress = EdRackKeyPress
      end
      object EdData_4: TEdit
        Left = 323
        Top = 112
        Width = 405
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 19
      end
      object ComboArea_5: TComboBox
        Left = 32
        Top = 136
        Width = 105
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 20
        Text = 'DB'
        OnChange = CbAreaChange
        Items.Strings = (
          'DB'
          'Digital Inputs'
          'Digital Outputs'
          'Merkers'
          'Timers'
          'Counters')
      end
      object EdDBNum_5: TEdit
        Left = 144
        Top = 136
        Width = 53
        Height = 22
        TabOrder = 21
        Text = '5'
        OnKeyPress = EdRackKeyPress
      end
      object EdStart_5: TEdit
        Left = 204
        Top = 136
        Width = 53
        Height = 22
        TabOrder = 22
        Text = '0'
        OnKeyPress = EdRackKeyPress
      end
      object EdAmount_5: TEdit
        Left = 264
        Top = 136
        Width = 53
        Height = 22
        TabOrder = 23
        Text = '16'
        OnKeyPress = EdRackKeyPress
      end
      object EdData_5: TEdit
        Left = 323
        Top = 136
        Width = 405
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 24
      end
      object MultiReadBtn: TButton
        Left = 472
        Top = 195
        Width = 105
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Read'
        TabOrder = 30
        OnClick = MultiReadBtnClick
      end
      object MultiWriteBtn: TButton
        Left = 472
        Top = 280
        Width = 104
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Write'
        TabOrder = 31
        OnClick = MultiWriteBtnClick
      end
      object EdResult_1: TEdit
        Left = 32
        Top = 200
        Width = 248
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 25
      end
      object EdResult_2: TEdit
        Left = 32
        Top = 224
        Width = 248
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 26
      end
      object EdResult_3: TEdit
        Left = 32
        Top = 248
        Width = 248
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 27
      end
      object EdResult_4: TEdit
        Left = 32
        Top = 272
        Width = 248
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 28
      end
      object EdResult_5: TEdit
        Left = 32
        Top = 296
        Width = 248
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 29
      end
      object ChEd_1: TEdit
        Left = 323
        Top = 200
        Width = 41
        Height = 22
        TabOrder = 32
        Text = '$01'
      end
      object ChEd_2: TEdit
        Left = 323
        Top = 224
        Width = 41
        Height = 22
        TabOrder = 33
        Text = '$02'
      end
      object ChEd_3: TEdit
        Left = 323
        Top = 248
        Width = 41
        Height = 22
        TabOrder = 34
        Text = '$03'
      end
      object ChEd_4: TEdit
        Left = 323
        Top = 272
        Width = 41
        Height = 22
        TabOrder = 35
        Text = '$04'
      end
      object ChEd_5: TEdit
        Left = 323
        Top = 296
        Width = 41
        Height = 22
        TabOrder = 36
        Text = '$05'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Directory'
      ImageIndex = 3
      object GroupBox1: TGroupBox
        Left = 7
        Top = 9
        Width = 131
        Height = 308
        Caption = 'Blocks List'
        TabOrder = 0
        object Label26: TLabel
          Left = 8
          Top = 31
          Width = 15
          Height = 14
          Caption = 'OB'
          Color = clBtnFace
          ParentColor = False
        end
        object Label28: TLabel
          Left = 8
          Top = 53
          Width = 13
          Height = 14
          Caption = 'FB'
          Color = clBtnFace
          ParentColor = False
        end
        object Label29: TLabel
          Left = 8
          Top = 75
          Width = 13
          Height = 14
          Caption = 'FC'
          Color = clBtnFace
          ParentColor = False
        end
        object Label30: TLabel
          Left = 8
          Top = 96
          Width = 20
          Height = 14
          Caption = 'SFB'
          Color = clBtnFace
          ParentColor = False
        end
        object Label31: TLabel
          Left = 8
          Top = 118
          Width = 20
          Height = 14
          Caption = 'SFC'
          Color = clBtnFace
          ParentColor = False
        end
        object Label32: TLabel
          Left = 8
          Top = 140
          Width = 14
          Height = 14
          Caption = 'DB'
          Color = clBtnFace
          ParentColor = False
        end
        object Label27: TLabel
          Left = 58
          Top = 13
          Width = 28
          Height = 14
          Caption = 'Count'
          Color = clBtnFace
          ParentColor = False
        end
        object Label33: TLabel
          Left = 8
          Top = 162
          Width = 21
          Height = 14
          Caption = 'SDB'
          Color = clBtnFace
          ParentColor = False
        end
        object Label49: TLabel
          Left = 13
          Top = 190
          Width = 81
          Height = 39
          Alignment = taCenter
          Caption = 'DoubleClick '#10'item to List '#10'Blocks of Type'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
        object txtOB: TStaticText
          Left = 42
          Top = 30
          Width = 10
          Height = 18
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '0'
          Color = 13434828
          ParentColor = False
          TabOrder = 0
          Transparent = False
          OnDblClick = txtOBDblClick
        end
        object txtFB: TStaticText
          Left = 42
          Top = 52
          Width = 10
          Height = 18
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '0'
          Color = 13434828
          ParentColor = False
          TabOrder = 1
          Transparent = False
          OnDblClick = txtOBDblClick
        end
        object txtFC: TStaticText
          Left = 42
          Top = 74
          Width = 10
          Height = 18
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '0'
          Color = 13434828
          ParentColor = False
          TabOrder = 2
          Transparent = False
          OnDblClick = txtOBDblClick
        end
        object txtSFB: TStaticText
          Left = 42
          Top = 95
          Width = 10
          Height = 18
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '0'
          Color = 13434828
          ParentColor = False
          TabOrder = 3
          Transparent = False
          OnDblClick = txtOBDblClick
        end
        object txtSFC: TStaticText
          Left = 42
          Top = 117
          Width = 10
          Height = 18
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '0'
          Color = 13434828
          ParentColor = False
          TabOrder = 4
          Transparent = False
          OnDblClick = txtOBDblClick
        end
        object txtDB: TStaticText
          Left = 42
          Top = 139
          Width = 10
          Height = 18
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '0'
          Color = 13434828
          ParentColor = False
          TabOrder = 5
          Transparent = False
          OnDblClick = txtOBDblClick
        end
        object txtSDB: TStaticText
          Left = 42
          Top = 161
          Width = 10
          Height = 18
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '0'
          Color = 13434828
          ParentColor = False
          TabOrder = 6
          Transparent = False
          OnDblClick = txtOBDblClick
        end
        object BtnBlockList: TButton
          Left = 13
          Top = 254
          Width = 96
          Height = 25
          Caption = 'Blocks List'
          TabOrder = 7
          OnClick = BtnBlockListClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 327
        Top = 9
        Width = 270
        Height = 340
        Caption = 'Block Info'
        TabOrder = 2
        object cbBlock: TComboBox
          Left = 16
          Top = 5
          Width = 65
          Height = 22
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'OB'
          Items.Strings = (
            'OB'
            'FB'
            'FC'
            'DB'
            'SFB'
            'SFC'
            'SDB')
        end
        object EdBlkNum: TEdit
          Left = 96
          Top = 5
          Width = 65
          Height = 22
          TabOrder = 1
          Text = '1'
          OnKeyPress = EdRackKeyPress
        end
        object MemoBlk: TMemo
          Left = 16
          Top = 40
          Width = 241
          Height = 238
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object BlkInfoBtn: TButton
          Left = 161
          Top = 286
          Width = 96
          Height = 25
          Caption = 'Block Info'
          TabOrder = 3
          OnClick = BlkInfoBtnClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 155
        Top = 9
        Width = 158
        Height = 484
        Caption = 'List Blocks of Type'
        TabOrder = 1
        object LblDblClick: TLabel
          Left = 24
          Top = 366
          Width = 94
          Height = 26
          Alignment = taCenter
          Caption = 'DoubleClick item'#13#10'for Block Info'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object CbBot: TComboBox
          Left = 16
          Top = 5
          Width = 65
          Height = 22
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'OB'
          OnCloseUp = CbBotCloseUp
          Items.Strings = (
            'OB'
            'FB'
            'FC'
            'DB'
            'SFB'
            'SFC'
            'SDB')
        end
        object BoTBtn: TButton
          Left = 13
          Top = 402
          Width = 133
          Height = 25
          Caption = 'List Blocks of Type'
          TabOrder = 2
          OnClick = BoTBtnClick
        end
        object ListBot: TListBox
          Left = 16
          Top = 40
          Width = 121
          Height = 315
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          ScrollWidth = 119
          TabOrder = 1
          OnDblClick = ListBotDblClick
        end
        object AsBotBtn: TButton
          Left = 13
          Top = 433
          Width = 133
          Height = 25
          Caption = 'As List Blocks of Type'
          TabOrder = 3
          OnClick = AsBotBtnClick
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Block - Up/Download'
      ImageIndex = 10
      object Label48: TLabel
        Left = 7
        Top = 13
        Width = 52
        Height = 14
        Caption = 'Block Type'
        Color = clBtnFace
        ParentColor = False
      end
      object Label50: TLabel
        Left = 89
        Top = 13
        Width = 66
        Height = 14
        Caption = 'Block Number'
        Color = clBtnFace
        ParentColor = False
      end
      object lblUpld: TLabel
        Left = 7
        Top = 64
        Width = 95
        Height = 14
        Caption = 'Block Dump : 0 byte'
        Color = clBtnFace
        ParentColor = False
      end
      object lblNewNumber: TLabel
        Left = 505
        Top = 358
        Width = 92
        Height = 14
        Caption = 'New Block Number'
        Color = clBtnFace
        ParentColor = False
      end
      object Shape1: TShape
        Left = 370
        Top = 24
        Width = 112
        Height = 30
        Pen.Color = clRed
        Pen.Width = 12
      end
      object cbBlkType: TComboBox
        Left = 7
        Top = 29
        Width = 65
        Height = 22
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'OB'
        Items.Strings = (
          'OB'
          'FB'
          'FC'
          'DB'
          'SFB'
          'SFC'
          'SDB')
      end
      object EdNum: TEdit
        Left = 87
        Top = 29
        Width = 65
        Height = 22
        TabOrder = 1
        Text = '1'
        OnKeyPress = EdRackKeyPress
      end
      object MemoUpload: TMemo
        Left = 5
        Top = 82
        Width = 492
        Height = 311
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
        WordWrap = False
      end
      object UpBtn: TButton
        Left = 264
        Top = 399
        Width = 105
        Height = 25
        Caption = 'Upload'
        TabOrder = 3
        OnClick = UpBtnClick
      end
      object AsUpBtn: TButton
        Left = 374
        Top = 399
        Width = 105
        Height = 25
        Caption = 'Async Upload'
        TabOrder = 5
        OnClick = AsUpBtnClick
      end
      object ChkFull: TCheckBox
        Left = 165
        Top = 403
        Width = 72
        Height = 19
        Caption = 'Full Upload'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = ChkFullClick
      end
      object MemoBlkInfo: TMemo
        Left = 503
        Top = 82
        Width = 209
        Height = 243
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object EdNewNumber: TEdit
        Left = 505
        Top = 373
        Width = 65
        Height = 22
        TabOrder = 8
        Text = '1'
        OnKeyPress = EdRackKeyPress
      end
      object DnBtn: TButton
        Left = 505
        Top = 399
        Width = 105
        Height = 25
        Caption = 'Download'
        TabOrder = 9
        OnClick = DnBtnClick
      end
      object AsDnBtn: TButton
        Left = 616
        Top = 399
        Width = 105
        Height = 25
        Caption = 'Async Download'
        TabOrder = 10
        OnClick = AsDnBtnClick
      end
      object BlkSaveBtn: TButton
        Left = 264
        Top = 430
        Width = 104
        Height = 25
        Caption = 'Save to file'
        TabOrder = 6
        OnClick = BlkSaveBtnClick
      end
      object Button4: TButton
        Left = 505
        Top = 430
        Width = 107
        Height = 25
        Caption = 'Load from file'
        TabOrder = 11
        OnClick = Button4Click
      end
      object Button14: TButton
        Left = 374
        Top = 27
        Width = 105
        Height = 25
        Caption = 'Delete from AG'
        TabOrder = 12
        OnClick = Button14Click
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Block - DB Get/Fill'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label37: TLabel
        Left = 8
        Top = 16
        Width = 54
        Height = 14
        Caption = 'DB Number'
        Color = clBtnFace
        ParentColor = False
      end
      object LblDBDump: TLabel
        Left = 8
        Top = 64
        Width = 89
        Height = 14
        Caption = 'DB Dump : 0 bytes'
        Color = clBtnFace
        ParentColor = False
      end
      object EdDBNumGet: TEdit
        Left = 5
        Top = 32
        Width = 72
        Height = 22
        TabOrder = 0
        Text = '1'
        OnKeyPress = EdIDKeyPress
      end
      object MemoDB: TMemo
        Left = 5
        Top = 82
        Width = 492
        Height = 311
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
        WordWrap = False
      end
      object DBGetBtn: TButton
        Left = 283
        Top = 408
        Width = 104
        Height = 25
        Caption = 'DB Get'
        TabOrder = 2
        OnClick = DBGetBtnClick
      end
      object AsDBGetBtn: TButton
        Left = 393
        Top = 408
        Width = 104
        Height = 25
        Caption = 'Async DB Get'
        TabOrder = 3
        OnClick = AsDBGetBtnClick
      end
      object GroupBox10: TGroupBox
        Left = 522
        Top = 78
        Width = 181
        Height = 175
        Caption = 'DB Fill'
        TabOrder = 4
        object Label56: TLabel
          Left = 24
          Top = 24
          Width = 54
          Height = 14
          Caption = 'DB Number'
          Color = clBtnFace
          ParentColor = False
        end
        object Label57: TLabel
          Left = 116
          Top = 24
          Width = 38
          Height = 14
          Caption = 'Fill Char'
          Color = clBtnFace
          ParentColor = False
        end
        object EdDBFill: TEdit
          Left = 21
          Top = 40
          Width = 72
          Height = 22
          TabOrder = 0
          Text = '1'
          OnKeyPress = EdIDKeyPress
        end
        object EdFill: TEdit
          Left = 114
          Top = 40
          Width = 41
          Height = 22
          TabOrder = 1
          Text = '$FF'
        end
        object FillBtn: TButton
          Left = 38
          Top = 83
          Width = 105
          Height = 25
          Hint = 'DBFill()'
          Caption = 'Fill'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = FillBtnClick
        end
        object AsFillBtn: TButton
          Left = 38
          Top = 115
          Width = 105
          Height = 25
          Hint = 'AsDBFill()'
          Caption = 'Async Fill'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = AsFillBtnClick
        end
      end
    end
    object TabZSL: TTabSheet
      Caption = 'Read SZL'
      ImageIndex = 4
      object Label34: TLabel
        Left = 220
        Top = 16
        Width = 9
        Height = 14
        Caption = 'ID'
        Color = clBtnFace
        ParentColor = False
      end
      object Label35: TLabel
        Left = 308
        Top = 16
        Width = 26
        Height = 14
        Caption = 'Index'
        Color = clBtnFace
        ParentColor = False
      end
      object lblSZLdump: TLabel
        Left = 220
        Top = 64
        Width = 95
        Height = 14
        Caption = 'SZL Dump : 0 bytes'
        Color = clBtnFace
        ParentColor = False
      end
      object lblSZLCount: TLabel
        Left = 41
        Top = 63
        Width = 85
        Height = 14
        Caption = 'List of All SZL IDs'
        Color = clBtnFace
        ParentColor = False
      end
      object lblSZL: TLabel
        Left = 4
        Top = 400
        Width = 193
        Height = 26
        Alignment = taCenter
        Caption = 'DoubleClick item to get SZL'#13#10'(maybe Index should be changed)'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object ReadSZLBtn: TButton
        Left = 499
        Top = 408
        Width = 104
        Height = 25
        Caption = 'Read SZL'
        TabOrder = 5
        OnClick = ReadSZLBtnClick
      end
      object MemoSZL: TMemo
        Left = 221
        Top = 82
        Width = 492
        Height = 311
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 4
        WordWrap = False
      end
      object EdID: TEdit
        Left = 221
        Top = 32
        Width = 72
        Height = 22
        TabOrder = 2
        Text = '$0011'
        OnKeyPress = EdIDKeyPress
      end
      object EdIndex: TEdit
        Left = 309
        Top = 32
        Width = 72
        Height = 22
        TabOrder = 3
        Text = '$0000'
        OnKeyPress = EdIDKeyPress
      end
      object AsReadSZLBtn: TButton
        Left = 609
        Top = 408
        Width = 104
        Height = 25
        Caption = 'Async Read SZL'
        TabOrder = 6
        OnClick = AsReadSZLBtnClick
      end
      object lbSZL: TListBox
        Left = 40
        Top = 82
        Width = 121
        Height = 311
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        ScrollWidth = 119
        TabOrder = 1
        OnDblClick = lbSZLDblClick
      end
      object Button12: TButton
        Left = 48
        Top = 32
        Width = 101
        Height = 25
        Caption = 'Refresh List'
        TabOrder = 0
        OnClick = Button12Click
      end
    end
    object TabClock: TTabSheet
      Caption = 'Date/Time'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GrPGDateTime: TGroupBox
        Left = 16
        Top = 16
        Width = 305
        Height = 65
        Caption = 'PG/PC Date and time'
        TabOrder = 0
        object edPGDate: TEdit
          Left = 15
          Top = 8
          Width = 121
          Height = 22
          ReadOnly = True
          TabOrder = 0
        end
        object edPGTime: TEdit
          Left = 150
          Top = 8
          Width = 121
          Height = 22
          ReadOnly = True
          TabOrder = 1
        end
      end
      object ChkGetDateTime: TCheckBox
        Left = 16
        Top = 176
        Width = 150
        Height = 19
        Caption = 'Get date and time of PG/PC'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ChkGetDateTimeClick
      end
      object grAGDateTime: TGroupBox
        Left = 16
        Top = 96
        Width = 305
        Height = 65
        Caption = 'CPU Date and Time'
        Enabled = False
        TabOrder = 1
        object edAGDate: TEdit
          Left = 15
          Top = 7
          Width = 121
          Height = 22
          TabOrder = 0
        end
        object edAGTime: TEdit
          Left = 150
          Top = 7
          Width = 121
          Height = 22
          TabOrder = 1
        end
      end
      object Button7: TButton
        Left = 205
        Top = 216
        Width = 116
        Height = 25
        Caption = 'Set Date and Time'
        TabOrder = 3
        OnClick = Button7Click
      end
    end
    object TabControl: TTabSheet
      Caption = 'Control'
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox4: TGroupBox
        Left = 8
        Top = 9
        Width = 681
        Height = 136
        Caption = 'Unit status'
        TabOrder = 0
        object lblStatus: TLabel
          Left = 13
          Top = 8
          Width = 76
          Height = 19
          Alignment = taCenter
          Caption = 'Unknown'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Button9: TButton
          Left = 153
          Top = 8
          Width = 154
          Height = 25
          Caption = 'Stop'
          TabOrder = 2
          OnClick = Button9Click
        end
        object Button10: TButton
          Left = 153
          Top = 50
          Width = 154
          Height = 25
          Caption = 'Hot Restart'
          TabOrder = 3
          OnClick = Button10Click
        end
        object Button11: TButton
          Left = 153
          Top = 81
          Width = 154
          Height = 25
          Caption = 'Cold Restart'
          TabOrder = 4
          OnClick = Button11Click
        end
        object ChkStatusRefresh: TCheckBox
          Left = 13
          Top = 86
          Width = 88
          Height = 19
          Caption = 'Cyclic refresh'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = ChkStatusRefreshClick
        end
        object BtnStatus: TButton
          Left = 13
          Top = 50
          Width = 96
          Height = 25
          Caption = 'Get Status'
          Enabled = False
          TabOrder = 0
          OnClick = BtnStatusClick
        end
      end
      object GroupBox9: TGroupBox
        Left = 8
        Top = 171
        Width = 681
        Height = 174
        Caption = 'Misc'
        TabOrder = 1
        object Label8: TLabel
          Left = 18
          Top = 45
          Width = 62
          Height = 14
          Caption = 'Timeout (ms)'
          Color = clBtnFace
          ParentColor = False
        end
        object Label54: TLabel
          Left = 344
          Top = 28
          Width = 245
          Height = 14
          Caption = '<--These functions work only if the CPU is in STOP'
          Color = clBtnFace
          ParentColor = False
        end
        object EdTimeout: TEdit
          Left = 18
          Top = 64
          Width = 121
          Height = 22
          TabOrder = 0
          Text = '15000'
          OnKeyPress = EdRackKeyPress
        end
        object Button3: TButton
          Left = 153
          Top = 6
          Width = 154
          Height = 25
          Caption = 'Copy Ram to Rom'
          TabOrder = 1
          OnClick = Button3Click
        end
        object Button15: TButton
          Left = 153
          Top = 37
          Width = 154
          Height = 25
          Caption = 'Async Copy Ram to Rom'
          TabOrder = 2
          OnClick = Button15Click
        end
        object Button16: TButton
          Left = 153
          Top = 88
          Width = 154
          Height = 25
          Caption = 'Compress'
          TabOrder = 3
          OnClick = Button16Click
        end
        object Button17: TButton
          Left = 153
          Top = 119
          Width = 154
          Height = 25
          Caption = 'Async Compress'
          TabOrder = 4
          OnClick = Button17Click
        end
      end
    end
    object TabSecurity: TTabSheet
      Caption = 'Security'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button1: TButton
        Left = 497
        Top = 327
        Width = 97
        Height = 25
        Caption = 'Refresh Info'
        TabOrder = 2
        OnClick = Button1Click
      end
      object ChkSecurity: TCheckBox
        Left = 497
        Top = 304
        Width = 88
        Height = 19
        Caption = 'Cyclic refresh'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = ChkSecurityClick
      end
      object GroupBox8: TGroupBox
        Left = 12
        Top = 358
        Width = 582
        Height = 115
        Caption = 'Session Login/Logout'
        TabOrder = 3
        object EdPassword: TEdit
          Left = 20
          Top = 16
          Width = 153
          Height = 22
          PasswordChar = '*'
          TabOrder = 0
        end
        object Button5: TButton
          Left = 179
          Top = 13
          Width = 148
          Height = 25
          Caption = 'Set Session Password'
          TabOrder = 1
          OnClick = Button5Click
        end
        object Button8: TButton
          Left = 179
          Top = 48
          Width = 148
          Height = 25
          Caption = 'Clear Session Password'
          TabOrder = 2
          OnClick = Button8Click
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 729
        Height = 269
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object RG_sch_schal: TRadioGroup
          Left = 12
          Top = 8
          Width = 185
          Height = 108
          Caption = 'Selector Protection level'
          Items.Strings = (
            'Unknown'
            'Can Read/Write'
            'Can Read Only')
          TabOrder = 0
        end
        object RG_sch_par: TRadioGroup
          Left = 212
          Top = 8
          Width = 185
          Height = 108
          Caption = 'Params Protection level'
          Items.Strings = (
            'No Password'
            'Selector Password'
            'Write Password'
            'Read/Write Password')
          TabOrder = 1
        end
        object RG_sch_rel: TRadioGroup
          Left = 409
          Top = 8
          Width = 185
          Height = 108
          Caption = 'CPU Protection level'
          Items.Strings = (
            'Unknown'
            'Access Grant'
            'Read Only'
            'Read/Write Password')
          TabOrder = 2
        end
        object RG_bart_sch: TRadioGroup
          Left = 12
          Top = 132
          Width = 185
          Height = 124
          Caption = 'Selector position'
          Items.Strings = (
            'Unknown'
            'RUN'
            'RUN-P'
            'STOP'
            'MRES')
          TabOrder = 3
        end
        object RG_anl_sch: TRadioGroup
          Left = 213
          Top = 132
          Width = 185
          Height = 124
          Caption = 'Startup Switch'
          Items.Strings = (
            'Unknown / N.A.'
            'CRST'
            'WRST')
          TabOrder = 4
        end
      end
    end
  end
  object RGMode: TRadioGroup
    Left = 320
    Top = 1
    Width = 129
    Height = 70
    Caption = 'Async Mode'
    ItemIndex = 0
    Items.Strings = (
      'Polling'
      'Event'
      'Callback')
    TabOrder = 5
    OnClick = RGModeClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 602
    Width = 737
    Height = 23
    Panels = <
      item
        Width = 200
      end
      item
        Width = 75
      end
      item
        Width = 50
      end>
  end
  object PCC: TPageControl
    Left = 112
    Top = 1
    Width = 195
    Height = 71
    ActivePage = TabSheet2
    TabOrder = 7
    object TabSheet2: TTabSheet
      Caption = 'Rack/Slot'
      object Label2: TLabel
        Left = 97
        Top = 7
        Width = 23
        Height = 13
        Caption = 'Rack'
        Color = clBtnFace
        ParentColor = False
      end
      object Label3: TLabel
        Left = 145
        Top = 7
        Width = 18
        Height = 13
        Caption = 'Slot'
        Color = clBtnFace
        ParentColor = False
      end
      object Label62: TLabel
        Left = 4
        Top = 7
        Width = 54
        Height = 13
        Caption = 'Connect as'
        Color = clBtnFace
        ParentColor = False
      end
      object EdRack: TEdit
        Left = 94
        Top = 22
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '0'
        OnKeyPress = EdRackKeyPress
      end
      object EdSlot: TEdit
        Left = 136
        Top = 22
        Width = 41
        Height = 21
        TabOrder = 1
        Text = '2'
        OnKeyPress = EdRackKeyPress
      end
      object CBConnType: TComboBox
        Left = 4
        Top = 22
        Width = 76
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = 'PG'
        Items.Strings = (
          'PG'
          'OP'
          'S7 BASIC')
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'TSAP'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 53
      object Label58: TLabel
        Left = 42
        Top = 22
        Width = 6
        Height = 23
        Alignment = taCenter
        Caption = '.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label59: TLabel
        Left = 6
        Top = 7
        Width = 77
        Height = 13
        Caption = 'LOC TSAP (hex)'
        Color = clBtnFace
        ParentColor = False
      end
      object Label60: TLabel
        Left = 138
        Top = 22
        Width = 6
        Height = 23
        Alignment = taCenter
        Caption = '.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label61: TLabel
        Left = 102
        Top = 7
        Width = 78
        Height = 13
        Caption = 'REM TSAP (hex)'
        Color = clBtnFace
        ParentColor = False
      end
      object EdLocTsapHI: TEdit
        Left = 4
        Top = 22
        Width = 35
        Height = 21
        Alignment = taCenter
        TabOrder = 0
        Text = '02'
      end
      object EdLocTsapLO: TEdit
        Left = 48
        Top = 22
        Width = 37
        Height = 21
        Alignment = taCenter
        TabOrder = 1
        Text = '00'
      end
      object EdRemTsapHI: TEdit
        Left = 100
        Top = 22
        Width = 35
        Height = 21
        Alignment = taCenter
        TabOrder = 2
        Text = '02'
      end
      object EdRemTsapLO: TEdit
        Left = 144
        Top = 22
        Width = 37
        Height = 21
        Alignment = taCenter
        TabOrder = 3
        Text = '00'
      end
    end
  end
  object CBPing: TCheckBox
    Left = 567
    Top = 26
    Width = 81
    Height = 19
    Caption = 'Ping enabled'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object TimClock: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimClockTimer
    Left = 560
    Top = 184
  end
  object TimStatus: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimStatusTimer
    Left = 608
    Top = 184
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.*.mc7'
    Filter = 'mc7 file (*.mc7)|*.mc7'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofEnableSizing]
    Left = 656
    Top = 184
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '.*.mc7'
    Filter = 'mc7 file (*.mc7)|*.mc7'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 696
    Top = 184
  end
  object TimSecurity: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimSecurityTimer
    Left = 520
    Top = 184
  end
end
