inherited FkhEditlb: TFkhEditlb
  Left = 314
  Top = 168
  Caption = 'FkhEditlb'
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzToolbar1: TRzToolbar
    ToolbarControls = (
      RzToolButton1
      RzToolButton2
      RzToolButton3
      RzSpacer1
      RzToolButton4
      RzToolButton5
      RzSpacer2
      RzToolButton6)
    inherited RzToolButton1: TRzToolButton
      OnClick = RzToolButton1Click
    end
    inherited RzToolButton2: TRzToolButton
      OnClick = RzToolButton2Click
    end
    inherited RzToolButton3: TRzToolButton
      OnClick = RzToolButton3Click
    end
  end
end
