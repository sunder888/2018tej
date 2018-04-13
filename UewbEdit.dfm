inherited FewbEdit: TFewbEdit
  Left = 387
  Top = 146
  Caption = 'FewbEdit'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPageControl1: TRzPageControl
    FixedDimension = 18
    inherited TabSheet1: TRzTabSheet
      object Label1: TLabel
        Left = 187
        Top = 104
        Width = 60
        Height = 12
        Caption = #20108#32500#34920#20998#31867
      end
      object Label2: TLabel
        Left = 187
        Top = 160
        Width = 60
        Height = 12
        Caption = #20108#32500#34920#26723#26696
      end
      object RzEdit1: TRzEdit
        Left = 275
        Top = 100
        Width = 121
        Height = 20
        TabOrder = 0
      end
      object RzEdit2: TRzEdit
        Left = 275
        Top = 156
        Width = 121
        Height = 20
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
        Left = 424
        Top = 101
        Width = 97
        Height = 17
        Caption = #26159#21542#39068#33394
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object GroupBox1: TGroupBox
        Left = 192
        Top = 200
        Width = 241
        Height = 129
        Caption = #39068#33394
        TabOrder = 3
        Visible = False
        object Label3: TLabel
          Left = 24
          Top = 24
          Width = 24
          Height = 12
          Caption = #33394#21495
        end
        object Label4: TLabel
          Left = 24
          Top = 60
          Width = 24
          Height = 12
          Caption = #33521#25991
        end
        object Label5: TLabel
          Left = 24
          Top = 96
          Width = 24
          Height = 12
          Caption = #26085#25991
        end
        object RzEdit3: TRzEdit
          Left = 88
          Top = 20
          Width = 121
          Height = 20
          TabOrder = 0
        end
        object RzEdit4: TRzEdit
          Left = 88
          Top = 56
          Width = 121
          Height = 20
          TabOrder = 1
        end
        object RzEdit5: TRzEdit
          Left = 88
          Top = 92
          Width = 121
          Height = 20
          TabOrder = 2
        end
      end
    end
  end
  inherited RzPanel1: TRzPanel
    inherited RzBitBtn1: TRzBitBtn
      OnClick = RzBitBtn1Click
    end
  end
end
