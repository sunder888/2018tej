inherited Fcldasel: TFcldasel
  Left = 524
  Top = 219
  Caption = 'Fcldasel'
  ClientHeight = 446
  ClientWidth = 739
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 36
      Height = 12
      Caption = #20851#38190#23383
    end
    object RzEdit1: TRzEdit
      Left = 88
      Top = 12
      Width = 121
      Height = 20
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 240
      Top = 10
      Width = 75
      Height = 25
      Caption = #36807#28388
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 185
    Top = 41
    Width = 554
    Height = 405
    Align = alClient
    TabOrder = 2
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
  object dxDBTreeView1: TdxDBTreeView
    Left = 0
    Top = 41
    Width = 185
    Height = 405
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
  object QTree: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 80
    Top = 136
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 80
    Top = 208
  end
  object STree: TDataSource
    DataSet = QTree
    Left = 128
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 128
    Top = 208
  end
end
