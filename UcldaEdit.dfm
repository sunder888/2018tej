inherited FcldaEdit: TFcldaEdit
  Left = 593
  Top = 123
  Caption = 'FcldaEdit'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPageControl1: TRzPageControl
    FixedDimension = 18
    inherited TabSheet1: TRzTabSheet
      object Label3: TLabel
        Left = 200
        Top = 16
        Width = 48
        Height = 12
        Caption = #26448#26009#32534#30721
      end
      object Label4: TLabel
        Left = 200
        Top = 54
        Width = 48
        Height = 12
        Caption = #26448#26009#21517#31216
      end
      object Label5: TLabel
        Left = 200
        Top = 132
        Width = 48
        Height = 12
        Caption = #26448#26009#35268#26684
      end
      object Label6: TLabel
        Left = 200
        Top = 170
        Width = 48
        Height = 12
        Caption = #22823#31867#21517#31216
      end
      object Label7: TLabel
        Left = 200
        Top = 208
        Width = 48
        Height = 12
        Caption = #23545#24212#31867#22411
      end
      object Label8: TLabel
        Left = 200
        Top = 94
        Width = 48
        Height = 12
        Caption = #21333'    '#20301
      end
      object RzEdit1: TRzEdit
        Left = 264
        Top = 12
        Width = 121
        Height = 20
        TabOrder = 0
      end
      object RzEdit2: TRzEdit
        Left = 264
        Top = 50
        Width = 121
        Height = 20
        TabOrder = 1
      end
      object RzEdit3: TRzEdit
        Left = 264
        Top = 128
        Width = 121
        Height = 20
        TabOrder = 2
      end
      object RzComboBox1: TRzComboBox
        Left = 264
        Top = 166
        Width = 121
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 3
        OnChange = RzComboBox1Change
        OnDropDown = RzComboBox1DropDown
      end
      object RzEdit4: TRzEdit
        Left = 264
        Top = 204
        Width = 121
        Height = 20
        Enabled = False
        TabOrder = 4
        OnChange = RzEdit4Change
      end
      object RzPageControl2: TRzPageControl
        Left = 0
        Top = 232
        Width = 607
        Height = 131
        ActivePage = TabSheet4
        Align = alBottom
        ParentColor = False
        TabIndex = 0
        TabOrder = 5
        FixedDimension = 18
        object TabSheet2: TRzTabSheet
          TabVisible = False
          Caption = #32463#38144#38754#26009
          object RzCheckBox1: TRzCheckBox
            Left = 32
            Top = 16
            Width = 67
            Height = 15
            Caption = #26159#21542#24425#26465
            State = cbUnchecked
            TabOrder = 0
            WordWrap = True
          end
        end
        object TabSheet3: TRzTabSheet
          TabVisible = False
          Caption = #22806#21327#38754#26009
          object Label1: TLabel
            Left = 32
            Top = 16
            Width = 48
            Height = 12
            Caption = #23545#24212#26825#32433
          end
          object Label2: TLabel
            Left = 32
            Top = 48
            Width = 48
            Height = 12
            Caption = #26825#32433#20844#24335
          end
          object RzButtonEdit1: TRzButtonEdit
            Left = 104
            Top = 16
            Width = 121
            Height = 20
            TabOrder = 0
            OnEnter = RzButtonEdit1Enter
            OnExit = RzButtonEdit1Exit
            OnButtonClick = RzButtonEdit1ButtonClick
          end
          object RzNumericEdit1: TRzNumericEdit
            Left = 160
            Top = 48
            Width = 65
            Height = 20
            TabOrder = 1
            IntegersOnly = False
            DisplayFormat = '0.00;(0.00)'
          end
        end
        object TabSheet4: TRzTabSheet
          Caption = #20854#20182
        end
      end
      object RzEdit5: TRzEdit
        Left = 264
        Top = 90
        Width = 121
        Height = 20
        TabOrder = 6
      end
    end
  end
  inherited RzPanel1: TRzPanel
    inherited RzBitBtn1: TRzBitBtn
      Top = 19
      OnClick = RzBitBtn1Click
    end
    inherited RzBitBtn2: TRzBitBtn
      Top = 19
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 57
    Top = 107
  end
end
