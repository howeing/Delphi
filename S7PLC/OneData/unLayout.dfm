object frmLayout: TfrmLayout
  Left = 0
  Top = 0
  Caption = 'frmLayout'
  ClientHeight = 879
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Microsoft YaHei'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object RxPanel1: TRxPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 879
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    TileImage = False
    object RxLabel1: TRxLabel
      Left = 48
      Top = 400
      Width = 49
      Height = 16
      Caption = 'RxLabel1'
    end
    object RxCalcEdit1: TRxCalcEdit
      Left = 16
      Top = 570
      Width = 121
      Height = 24
      NumGlyphs = 2
      TabOrder = 0
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 456
      Top = 680
      Width = 121
      Height = 24
      Ctl3D = True
      DisplayFormat = '0.00;0.00'
      ParentCtl3D = False
      TabOrder = 1
    end
    object ComboEdit1: TComboEdit
      Left = 456
      Top = 522
      Width = 121
      Height = 24
      ButtonHint = 'Click'
      DirectInput = False
      NumGlyphs = 1
      TabOrder = 2
      Text = 'ComboEdit1'
    end
    object FilenameEdit1: TFilenameEdit
      Left = 456
      Top = 560
      Width = 121
      Height = 24
      NumGlyphs = 1
      TabOrder = 3
      Text = 'FilenameEdit1'
    end
    object DirectoryEdit1: TDirectoryEdit
      Left = 456
      Top = 600
      Width = 121
      Height = 24
      NumGlyphs = 1
      TabOrder = 4
      Text = 'DirectoryEdit1'
    end
    object DateEdit1: TDateEdit
      Left = 456
      Top = 642
      Width = 121
      Height = 24
      NumGlyphs = 2
      TabOrder = 5
    end
    object RxCheckBox1: TRxCheckBox
      Left = 40
      Top = 312
      Width = 97
      Height = 17
      Caption = 'RxCheckBox1'
      TabOrder = 6
      WordWrap = True
      HorizontalAlignment = taLeftJustify
      VerticalAlignment = taAlignTop
      Style = vsNormal
    end
    object RxRadioButton1: TRxRadioButton
      Left = 40
      Top = 335
      Width = 113
      Height = 17
      Caption = 'RxRadioButton1'
      TabOrder = 7
      WordWrap = True
      HorizontalAlignment = taLeftJustify
      VerticalAlignment = taAlignTop
      Style = vsNormal
    end
    object RxAnimBitBtn1: TRxAnimBitBtn
      Left = 248
      Top = 343
      Width = 75
      Height = 25
      Caption = 'RxAnimBitBtn1'
      TabOrder = 8
      OnClick = RxAnimBitBtn1Click
      Animated = False
      Interval = 100
      AnimOrientation = agoHorizontal
    end
    object RxSpinEdit1: TRxSpinEdit
      Left = 456
      Top = 343
      Width = 121
      Height = 24
      Value = 2.000000000000000000
      TabOrder = 9
    end
    object RxTimeEdit1: TRxTimeEdit
      Left = 456
      Top = 439
      Width = 192
      Height = 21
      TabOrder = 10
      UseDockManager = True
      Time = 0.015266203703703700
      Minutes = 21
      Seconds = 59
      object DBDateTimeEditEh2: TDBDateTimeEditEh
        Left = 198
        Top = 8
        Width = 107
        Height = 24
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 3
        Visible = True
      end
    end
    object RxDice1: TRxDice
      Left = 48
      Top = 432
      Width = 66
      Height = 66
      Enabled = False
      Rotate = False
      ShowFocus = False
      TabOrder = 11
      Value = 4
    end
    object RxAnimBitBtn2: TRxAnimBitBtn
      Left = 248
      Top = 312
      Width = 75
      Height = 25
      Caption = 'RxAnimBitBtn2'
      TabOrder = 12
      OnClick = RxAnimBitBtn2Click
      Animated = False
      Interval = 100
      AnimOrientation = agoHorizontal
    end
    object RxAnimBitBtn3: TRxAnimBitBtn
      Left = 48
      Top = 600
      Width = 75
      Height = 25
      Caption = 'Dice'
      TabOrder = 13
      OnClick = RxAnimBitBtn3Click
      Animated = False
      Interval = 100
      AnimOrientation = agoHorizontal
    end
    object DBEditEh1: TDBEditEh
      Left = 48
      Top = 232
      Width = 121
      Height = 24
      DynProps = <>
      EditButtons = <>
      TabOrder = 14
      Text = 'DBEditEh1'
      Visible = True
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 48
      Top = 184
      Width = 121
      Height = 24
      DecimalPlaces = 0
      DynProps = <>
      EditButtons = <>
      TabOrder = 15
      Visible = True
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 48
      Top = 144
      Width = 121
      Height = 24
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 16
      Visible = True
    end
    object DatePicker1: TDatePicker
      Left = 456
      Top = 384
      Date = 44083.000000000000000000
      DateFormat = 'yyyy/M/d'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 17
    end
    object CalendarPicker1: TCalendarPicker
      Left = 456
      Top = 474
      Height = 32
      CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
      CalendarHeaderInfo.DaysOfWeekFont.Height = -13
      CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
      CalendarHeaderInfo.DaysOfWeekFont.Style = []
      CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.Font.Color = clWindowText
      CalendarHeaderInfo.Font.Height = -20
      CalendarHeaderInfo.Font.Name = 'Segoe UI'
      CalendarHeaderInfo.Font.Style = []
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      TextHint = 'select a date'
    end
    object RxDice2: TRxDice
      Left = 48
      Top = 498
      Width = 66
      Height = 66
      Enabled = False
      Rotate = False
      ShowFocus = False
      TabOrder = 19
      Value = 4
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 456
      Top = 718
      Width = 121
      Height = 24
      TabOrder = 20
    end
  end
  object RxTimerList1: TRxTimerList
    Active = True
    Left = 200
    Top = 176
    object RxTimerEvent1: TRxTimerEvent
      Enabled = False
      Interval = 1
      OnTimer = RxTimerEvent1Timer
    end
  end
  object cs: TCodeSiteLogger
    Destination = csDest
    Left = 504
    Top = 48
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
    Left = 552
    Top = 48
  end
  object PythonEngine1: TPythonEngine
    AutoLoad = False
    DllName = 'python37.dll'
    DllPath = 'C:\Users\hao.zhao\Anaconda3'
    APIVersion = 1013
    RegVersion = '3.7'
    UseLastKnownVersion = False
    Left = 288
    Top = 96
  end
end
