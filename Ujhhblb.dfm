inherited Fjhhblb: TFjhhblb
  Left = 201
  Top = 205
  Caption = 'Fjhhblb'
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
      Visible = False
    end
  end
  inherited cxGrid1: TcxGrid
    Height = 390
  end
  object StatusBar4: TStatusBar [3]
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end
