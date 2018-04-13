object Fxtsz: TFxtsz
  Left = 656
  Top = 186
  Width = 532
  Height = 359
  Caption = 'Fxtsz'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 497
    Height = 305
    Caption = #36873#39033
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 32
      Width = 48
      Height = 12
      Caption = #21333#20301#21517#31216
    end
    object RzEdit1: TRzEdit
      Left = 144
      Top = 29
      Width = 273
      Height = 20
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 144
      Top = 264
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 272
      Top = 264
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = BitBtn2Click
      Kind = bkClose
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 24
    Top = 280
  end
  object OpenDialog1: TOpenDialog
    Left = 64
    Top = 280
  end
  object SaveDialog1: TSaveDialog
    Left = 112
    Top = 280
  end
end
