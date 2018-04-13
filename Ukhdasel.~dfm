inherited Fkhdasel: TFkhdasel
  Left = 422
  Top = 161
  Caption = 'Fkhdasel'
  ClientHeight = 401
  ClientWidth = 605
  PixelsPerInch = 96
  TextHeight = 12
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 605
    Height = 401
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
    Left = 136
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 184
    Top = 80
  end
end
