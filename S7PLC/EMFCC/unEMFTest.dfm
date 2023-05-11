object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 809
  ClientWidth = 1212
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
  object PaintBox1: TPaintBox
    Left = 40
    Top = 32
    Width = 769
    Height = 441
  end
  object PaintBox2: TPaintBox
    Left = 747
    Top = 479
    Width = 457
    Height = 314
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 725
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 137
    Top = 725
    Width = 75
    Height = 25
    Caption = 'BitBtn2'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object CheckBox1: TCheckBox
    Left = 218
    Top = 729
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 321
    Top = 725
    Width = 75
    Height = 25
    Caption = 'BitBtn3'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
end
