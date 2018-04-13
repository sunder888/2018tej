inherited Fcylchbjm: TFcylchbjm
  Left = 542
  Top = 169
  Caption = 'Fcylchbjm'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPageControl1: TRzPageControl
    FixedDimension = 18
    inherited TabSheet1: TRzTabSheet
      Caption = #35760#24405
      object RzLabel1: TRzLabel
        Left = 104
        Top = 32
        Width = 48
        Height = 12
        Caption = #35746' '#21333' '#21495
      end
      object RzLabel2: TRzLabel
        Left = 104
        Top = 66
        Width = 48
        Height = 12
        Caption = #27454'    '#21495
      end
      object RzLabel3: TRzLabel
        Left = 104
        Top = 100
        Width = 48
        Height = 12
        Caption = #21697'    '#21517
      end
      object RzLabel4: TRzLabel
        Left = 104
        Top = 134
        Width = 48
        Height = 12
        Caption = #34892' '#26631' '#39064
      end
      object RzLabel5: TRzLabel
        Left = 104
        Top = 168
        Width = 48
        Height = 12
        Caption = #21015' '#26631' '#39064
      end
      object RzLabel7: TRzLabel
        Left = 104
        Top = 236
        Width = 48
        Height = 12
        Caption = #23545#24212#38454#27573
      end
      object RzLabel8: TRzLabel
        Left = 104
        Top = 270
        Width = 48
        Height = 12
        Caption = #25968'    '#37327
      end
      object RzLabel11: TRzLabel
        Left = 376
        Top = 237
        Width = 48
        Height = 12
        Caption = #27719#25253#26085#26399
      end
      object Label1: TLabel
        Left = 352
        Top = 8
        Width = 36
        Height = 12
        Caption = 'Label1'
        Visible = False
      end
      object RzEdit1: TRzEdit
        Left = 216
        Top = 28
        Width = 121
        Height = 20
        Enabled = False
        TabOrder = 0
      end
      object RzEdit2: TRzEdit
        Left = 216
        Top = 62
        Width = 121
        Height = 20
        Enabled = False
        TabOrder = 1
      end
      object RzEdit3: TRzEdit
        Left = 216
        Top = 96
        Width = 121
        Height = 20
        Enabled = False
        TabOrder = 2
      end
      object RzEdit4: TRzEdit
        Left = 216
        Top = 130
        Width = 121
        Height = 20
        Enabled = False
        TabOrder = 3
      end
      object RzEdit5: TRzEdit
        Left = 216
        Top = 164
        Width = 121
        Height = 20
        Enabled = False
        TabOrder = 4
      end
      object RzNumericEdit1: TRzNumericEdit
        Left = 216
        Top = 266
        Width = 65
        Height = 20
        TabOrder = 5
        DisplayFormat = '0.00;(0.00)'
      end
      object RzComboBox1: TRzComboBox
        Left = 216
        Top = 232
        Width = 121
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 6
      end
      object RzDateTimeEdit1: TRzDateTimeEdit
        Left = 456
        Top = 233
        Width = 121
        Height = 20
        EditType = etDate
        TabOrder = 7
      end
    end
  end
  inherited RzPanel1: TRzPanel
    inherited RzBitBtn1: TRzBitBtn
      OnClick = RzBitBtn1Click
    end
  end
end
