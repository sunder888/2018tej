inherited FwxdzbEdit: TFwxdzbEdit
  Left = 237
  Top = 126
  Caption = 'FwxdzbEdit'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPageControl1: TRzPageControl
    FixedDimension = 18
    inherited TabSheet1: TRzTabSheet
      object Label1: TLabel
        Left = 207
        Top = 143
        Width = 48
        Height = 12
        Caption = #23545#24212#26825#32433
      end
      object Label2: TLabel
        Left = 207
        Top = 183
        Width = 48
        Height = 12
        Caption = #26825#32433#20844#24335
      end
      object Label3: TLabel
        Left = 207
        Top = 103
        Width = 48
        Height = 12
        Caption = #22806#21327#38754#26009
      end
      object Label4: TLabel
        Left = 207
        Top = 223
        Width = 48
        Height = 12
        Caption = #26825#32433#27604#20363
      end
      object RzButtonEdit1: TRzButtonEdit
        Left = 279
        Top = 139
        Width = 121
        Height = 20
        TabOrder = 0
        OnEnter = RzButtonEdit1Enter
        OnExit = RzButtonEdit1Exit
        OnButtonClick = RzButtonEdit1ButtonClick
      end
      object RzNumericEdit1: TRzNumericEdit
        Left = 335
        Top = 179
        Width = 65
        Height = 20
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object RzButtonEdit2: TRzButtonEdit
        Left = 279
        Top = 99
        Width = 121
        Height = 20
        TabOrder = 2
        OnEnter = RzButtonEdit2Enter
        OnExit = RzButtonEdit2Exit
        OnButtonClick = RzButtonEdit2ButtonClick
      end
      object RzNumericEdit2: TRzNumericEdit
        Left = 335
        Top = 219
        Width = 65
        Height = 20
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
    end
  end
  inherited RzPanel1: TRzPanel
    Height = 37
    inherited RzBitBtn1: TRzBitBtn
      OnClick = RzBitBtn1Click
    end
  end
  object StatusBar1: TStatusBar [3]
    Left = 0
    Top = 422
    Width = 611
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end
