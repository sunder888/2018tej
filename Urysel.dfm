inherited Frysel: TFrysel
  Left = 333
  Top = 165
  Caption = 'Frysel'
  ClientHeight = 130
  ClientWidth = 316
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 53
    Top = 36
    Width = 48
    Height = 12
    Caption = #20154#21592#36873#25321
  end
  inherited ComboBox: TComboBox
    Left = 0
    Top = 96
  end
  object ComboBox1: TRzComboBox
    Left = 117
    Top = 32
    Width = 145
    Height = 20
    Style = csDropDownList
    ItemHeight = 12
    TabOrder = 1
    OnDropDown = ComboBox1DropDown
  end
  object RzBitBtn1: TRzBitBtn
    Left = 69
    Top = 72
    Caption = #30830#35748
    TabOrder = 2
    OnClick = RzBitBtn1Click
  end
  object RzBitBtn2: TRzBitBtn
    Left = 173
    Top = 72
    Caption = #21462#28040
    TabOrder = 3
    OnClick = RzBitBtn2Click
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Top = 64
  end
end
