inherited Fewbzk: TFewbzk
  Left = 377
  Top = 101
  Caption = 'Fewbzk'
  ClientHeight = 442
  ClientWidth = 727
  PixelsPerInch = 96
  TextHeight = 12
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 727
    Height = 190
    Align = alTop
    Caption = #21015#26631#39064
    TabOrder = 1
    object RzRapidFireButton1: TRzRapidFireButton
      Left = 688
      Top = 54
      Width = 23
      Height = 22
      Caption = #19978
      OnClick = RzRapidFireButton1Click
    end
    object RzRapidFireButton2: TRzRapidFireButton
      Left = 688
      Top = 110
      Width = 23
      Height = 22
      Caption = #19979
      OnClick = RzRapidFireButton2Click
    end
    object RzListBox1: TRzListBox
      Left = 167
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 0
      OnDblClick = RzListBox1DblClick
    end
    object RzListBox2: TRzListBox
      Left = 495
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 1
      OnDblClick = RzListBox2DblClick
    end
    object RzButton1: TRzButton
      Left = 382
      Top = 54
      Caption = '>>'
      TabOrder = 2
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 382
      Top = 110
      Caption = '<<'
      TabOrder = 3
      OnClick = RzButton2Click
    end
    object RzComboBox1: TRzComboBox
      Left = 16
      Top = 85
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 4
      OnChange = RzComboBox1Change
      OnDropDown = RzComboBox1DropDown
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 0
    Top = 190
    Width = 727
    Height = 190
    Align = alTop
    Caption = #34892#26631#39064
    TabOrder = 2
    object RzRapidFireButton3: TRzRapidFireButton
      Left = 688
      Top = 50
      Width = 23
      Height = 22
      Caption = #19978
      OnClick = RzRapidFireButton3Click
    end
    object RzRapidFireButton4: TRzRapidFireButton
      Left = 688
      Top = 114
      Width = 23
      Height = 22
      Caption = #19979
      OnClick = RzRapidFireButton4Click
    end
    object RzListBox3: TRzListBox
      Left = 167
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 0
      OnDblClick = RzListBox3DblClick
    end
    object RzListBox4: TRzListBox
      Left = 495
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 1
      OnDblClick = RzListBox4DblClick
    end
    object RzButton3: TRzButton
      Left = 382
      Top = 50
      Caption = '>>'
      TabOrder = 2
      OnClick = RzButton3Click
    end
    object RzButton4: TRzButton
      Left = 382
      Top = 114
      Caption = '<<'
      TabOrder = 3
      OnClick = RzButton4Click
    end
    object RzComboBox2: TRzComboBox
      Left = 16
      Top = 85
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 4
      OnChange = RzComboBox2Change
      OnDropDown = RzComboBox2DropDown
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 380
    Width = 727
    Height = 62
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 3
    object RzBitBtn1: TRzBitBtn
      Left = 456
      Top = 18
      Caption = #30830#23450
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 560
      Top = 18
      Caption = #21462#28040
      TabOrder = 1
      OnClick = RzBitBtn2Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 56
    Top = 152
  end
end
