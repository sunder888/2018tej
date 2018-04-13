inherited Flcsz: TFlcsz
  Left = 604
  Top = 319
  Caption = 'Flcsz'
  ClientHeight = 255
  ClientWidth = 512
  PixelsPerInch = 96
  TextHeight = 12
  object RzGroupBox2: TRzGroupBox
    Left = 0
    Top = 0
    Width = 512
    Height = 190
    Align = alTop
    Caption = #27969#31243#35774#32622
    TabOrder = 1
    object RzRapidFireButton3: TRzRapidFireButton
      Left = 472
      Top = 50
      Width = 23
      Height = 22
      Caption = #19978
      OnClick = RzRapidFireButton3Click
    end
    object RzRapidFireButton4: TRzRapidFireButton
      Left = 472
      Top = 114
      Width = 23
      Height = 22
      Caption = #19979
      OnClick = RzRapidFireButton4Click
    end
    object Label1: TLabel
      Left = 24
      Top = 152
      Width = 48
      Height = 12
      Caption = #35746#21333#21495#65306
    end
    object Label2: TLabel
      Left = 80
      Top = 152
      Width = 6
      Height = 12
    end
    object RzListBox1: TRzListBox
      Left = 279
      Top = 11
      Width = 177
      Height = 169
      ItemHeight = 12
      TabOrder = 0
    end
    object RzButton4: TRzButton
      Left = 190
      Top = 82
      Caption = '>>'
      TabOrder = 1
      OnClick = RzButton4Click
    end
    object RzComboBox2: TRzComboBox
      Left = 16
      Top = 85
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 2
      OnDropDown = RzComboBox2DropDown
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 190
    Width = 512
    Height = 65
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 2
    object RzBitBtn1: TRzBitBtn
      Left = 288
      Top = 18
      Caption = #30830#23450
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 408
      Top = 18
      Caption = #21462#28040
      TabOrder = 1
      OnClick = RzBitBtn2Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 112
    Top = 24
  end
end
