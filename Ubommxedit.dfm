inherited Fbommxedit: TFbommxedit
  Left = 444
  Top = 194
  Caption = 'Fbommxedit'
  ClientHeight = 443
  ClientWidth = 708
  PixelsPerInch = 96
  TextHeight = 12
  object ComboBox1: TComboBox
    Left = 96
    Top = 88
    Width = 145
    Height = 20
    Style = csDropDownList
    ItemHeight = 12
    TabOrder = 1
    Visible = False
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 708
    Height = 190
    Align = alTop
    Caption = #39068#33394
    TabOrder = 2
    object RzRapidFireButton1: TRzRapidFireButton
      Left = 624
      Top = 54
      Width = 23
      Height = 22
      Caption = #19978
      OnClick = RzRapidFireButton1Click
    end
    object RzRapidFireButton2: TRzRapidFireButton
      Left = 624
      Top = 110
      Width = 23
      Height = 22
      Caption = #19979
      OnClick = RzRapidFireButton2Click
    end
    object RzListBox1: TRzListBox
      Left = 103
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 0
    end
    object RzListBox2: TRzListBox
      Left = 431
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 1
    end
    object RzButton1: TRzButton
      Left = 318
      Top = 54
      Caption = '>>'
      TabOrder = 2
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 318
      Top = 110
      Caption = '<<'
      TabOrder = 3
      OnClick = RzButton2Click
    end
    object ComboBox2: TComboBox
      Left = 24
      Top = 80
      Width = 57
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 4
      OnChange = ComboBox2Change
      Items.Strings = (
        #34892
        #21015)
    end
    object CheckBox1: TCheckBox
      Left = 24
      Top = 56
      Width = 65
      Height = 17
      Caption = #39068#33394
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 0
    Top = 190
    Width = 708
    Height = 190
    Align = alTop
    Caption = #23610#30721
    TabOrder = 3
    object RzRapidFireButton3: TRzRapidFireButton
      Left = 624
      Top = 50
      Width = 23
      Height = 22
      Caption = #19978
      OnClick = RzRapidFireButton3Click
    end
    object RzRapidFireButton4: TRzRapidFireButton
      Left = 624
      Top = 114
      Width = 23
      Height = 22
      Caption = #19979
      OnClick = RzRapidFireButton4Click
    end
    object RzListBox3: TRzListBox
      Left = 103
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 0
    end
    object RzListBox4: TRzListBox
      Left = 431
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 1
    end
    object RzButton3: TRzButton
      Left = 318
      Top = 50
      Caption = '>>'
      TabOrder = 2
      OnClick = RzButton3Click
    end
    object RzButton4: TRzButton
      Left = 318
      Top = 114
      Caption = '<<'
      TabOrder = 3
      OnClick = RzButton4Click
    end
    object ComboBox3: TComboBox
      Left = 24
      Top = 80
      Width = 57
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 4
      OnChange = ComboBox3Change
      Items.Strings = (
        #34892
        #21015)
    end
    object CheckBox2: TCheckBox
      Left = 24
      Top = 56
      Width = 57
      Height = 17
      Caption = #23610#30721
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 380
    Width = 708
    Height = 63
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 4
    object Label2: TLabel
      Left = 0
      Top = 48
      Width = 6
      Height = 12
      Visible = False
    end
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
    object Edit1: TEdit
      Left = 72
      Top = 21
      Width = 337
      Height = 20
      TabOrder = 2
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 22
      Width = 57
      Height = 17
      Caption = #37096#20301
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 56
    Top = 152
  end
  object AQuery: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 304
    Top = 152
  end
end
