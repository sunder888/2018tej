inherited Fjhsel: TFjhsel
  Caption = 'Fjhsel'
  PixelsPerInch = 96
  TextHeight = 12
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 678
    Height = 417
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
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 128
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 168
    Top = 56
  end
end
