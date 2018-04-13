inherited FgysEdit: TFgysEdit
  Left = 243
  Top = 143
  Caption = 'FgysEdit'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPageControl1: TRzPageControl
    FixedDimension = 18
    inherited TabSheet1: TRzTabSheet
      object RzLabel1: TRzLabel
        Left = 37
        Top = 30
        Width = 60
        Height = 12
        Caption = #20379#24212#21830#32534#30721
      end
      object RzLabel2: TRzLabel
        Left = 37
        Top = 60
        Width = 60
        Height = 12
        Caption = #20379#24212#21830#21517#31216
      end
      object RzLabel3: TRzLabel
        Left = 37
        Top = 91
        Width = 60
        Height = 12
        Caption = #20379#24212#21830#31616#30721
      end
      object RzLabel4: TRzLabel
        Left = 37
        Top = 122
        Width = 60
        Height = 12
        Caption = #20379#24212#21830#22320#22336
      end
      object RzLabel5: TRzLabel
        Left = 37
        Top = 153
        Width = 72
        Height = 12
        Caption = #20379#24212#21830#32852#31995#20154
      end
      object RzLabel6: TRzLabel
        Left = 37
        Top = 185
        Width = 60
        Height = 12
        Caption = #20379#24212#21830#30005#35805
      end
      object RzCheckBox1: TRzCheckBox
        Left = 111
        Top = 222
        Width = 67
        Height = 15
        Caption = #26159#21542#20572#29992
        State = cbUnchecked
        TabOrder = 0
        WordWrap = True
      end
      object RzEdit1: TRzEdit
        Left = 111
        Top = 27
        Width = 111
        Height = 20
        TabOrder = 1
      end
      object RzEdit2: TRzEdit
        Left = 111
        Top = 57
        Width = 111
        Height = 20
        TabOrder = 2
      end
      object RzEdit3: TRzEdit
        Left = 111
        Top = 89
        Width = 111
        Height = 20
        TabOrder = 3
      end
      object RzEdit4: TRzEdit
        Left = 111
        Top = 119
        Width = 318
        Height = 20
        TabOrder = 4
      end
      object RzEdit5: TRzEdit
        Left = 111
        Top = 150
        Width = 111
        Height = 20
        TabOrder = 5
      end
      object RzEdit6: TRzEdit
        Left = 111
        Top = 182
        Width = 111
        Height = 20
        TabOrder = 6
      end
    end
  end
  inherited RzPanel1: TRzPanel
    inherited RzBitBtn1: TRzBitBtn
      OnClick = RzBitBtn1Click
    end
  end
  inherited ADOQuery1: TADOQuery
    Left = 33
    Top = 308
  end
end
