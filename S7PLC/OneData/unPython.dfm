object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 879
  ClientWidth = 1449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PythonEngine1: TPythonEngine
    AutoLoad = False
    DllName = 'python37.dll'
    DllPath = 'C:\Users\hao.zhao\Anaconda3'
    APIVersion = 1013
    RegVersion = '3.7'
    UseLastKnownVersion = False
    Left = 112
    Top = 48
  end
  object FDManager1: TFDManager
    ConnectionDefFileAutoLoad = False
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 256
    Top = 24
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=family_db'
      'User_Name=root'
      'Password=masterkey'
      'Pooled=True'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Left = 352
    Top = 40
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 8.0\lib\libmysql.dll'
    Left = 320
    Top = 128
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 464
    Top = 136
  end
end
