object FCpass: TFCpass
  Left = 175
  Top = 226
  BorderStyle = bsDialog
  Caption = #35774#32622#25805#20316#21592#21475#20196
  ClientHeight = 127
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 50
    Top = 19
    Width = 48
    Height = 12
    Caption = #26032#21475#20196#65306
  end
  object Label2: TLabel
    Left = 26
    Top = 51
    Width = 72
    Height = 12
    Caption = #30830#23450#26032#21475#20196#65306
  end
  object Edit1: TEdit
    Left = 106
    Top = 15
    Width = 121
    Height = 20
    PasswordChar = '*'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 106
    Top = 47
    Width = 121
    Height = 20
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 45
    Top = 89
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 141
    Top = 89
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
