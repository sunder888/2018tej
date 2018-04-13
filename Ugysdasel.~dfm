inherited Fgysdasel: TFgysdasel
  Left = 358
  Top = 122
  Caption = 'Fgysdasel'
  ClientHeight = 397
  ClientWidth = 596
  PixelsPerInch = 96
  TextHeight = 12
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 596
    Height = 397
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = cxGrid1DBTableView1CellDblClick
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 184
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 136
    Top = 80
  end
end
