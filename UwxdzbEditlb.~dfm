inherited FwxdzbEditlb: TFwxdzbEditlb
  Left = 403
  Top = 122
  Caption = 'FwxdzbEditlb'
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
    Left = 250
    Width = 438
  end
  object cxGrid2: TcxGrid [3]
    Left = 0
    Top = 44
    Width = 250
    Height = 409
    Align = alLeft
    TabOrder = 3
    object cxGrid2DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGrid2DBTableView1CellClick
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 112
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 152
    Top = 200
  end
end
