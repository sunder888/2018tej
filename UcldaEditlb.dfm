inherited FcldaEditlb: TFcldaEditlb
  Caption = 'FcldaEditlb'
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
  inherited cxGrid1: TcxGrid
    Left = 169
    Width = 519
  end
  object dxDBTreeView1: TdxDBTreeView [3]
    Left = 0
    Top = 44
    Width = 169
    Height = 409
    ShowNodeHint = True
    SeparatedSt = ' - '
    RaiseOnError = True
    ReadOnly = True
    Indent = 19
    Align = alLeft
    ParentColor = False
    ParentCtl3D = False
    Ctl3D = False
    Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SelectedIndex = -1
    TabOrder = 3
    OnClick = dxDBTreeView1Click
  end
end
