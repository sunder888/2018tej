inherited FlcdaEdit: TFlcdaEdit
  Left = 1006
  Top = 264
  Caption = 'FlcdaEdit'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPageControl1: TRzPageControl
    FixedDimension = 18
    inherited TabSheet1: TRzTabSheet
      object RzLabel2: TRzLabel
        Left = 37
        Top = 68
        Width = 48
        Height = 12
        Caption = #27969#31243#21517#31216
      end
      object RzEdit1: TRzEdit
        Left = 127
        Top = 65
        Width = 111
        Height = 20
        TabOrder = 0
      end
    end
  end
  inherited RzPanel1: TRzPanel
    object Label1: TLabel [0]
      Left = 32
      Top = 24
      Width = 6
      Height = 12
      Visible = False
    end
    object Label2: TLabel [1]
      Left = 120
      Top = 24
      Width = 6
      Height = 12
      Visible = False
    end
    inherited RzBitBtn1: TRzBitBtn
      OnClick = RzBitBtn1Click
    end
  end
end
