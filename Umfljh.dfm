inherited Fmfljh: TFmfljh
  Left = 447
  Top = 190
  Caption = 'Fmfljh'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 16
      Top = 14
      Width = 36
      Height = 12
      Caption = #35746#21333#21495
    end
    object Label1: TLabel
      Left = 360
      Top = 14
      Width = 6
      Height = 12
    end
    object Label2: TLabel
      Left = 448
      Top = 14
      Width = 6
      Height = 12
    end
    object Label3: TLabel
      Left = 550
      Top = 14
      Width = 6
      Height = 12
    end
    object Label4: TLabel
      Left = 624
      Top = 14
      Width = 6
      Height = 12
    end
    object RzButtonEdit1: TRzButtonEdit
      Left = 72
      Top = 10
      Width = 121
      Height = 20
      TabOrder = 0
      OnButtonClick = RzButtonEdit1ButtonClick
    end
    object RzBitBtn1: TRzBitBtn
      Left = 232
      Top = 8
      Caption = #26597#35810
      TabOrder = 1
      OnClick = RzBitBtn1Click
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 41
    Width = 385
    Height = 412
    Align = alLeft
    BorderOuter = fsNone
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 385
      Height = 412
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGrid1DBTableView1CellClick
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
  end
  object RzPanel3: TRzPanel
    Left = 385
    Top = 41
    Width = 303
    Height = 412
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 3
    object cxGrid2: TcxGrid
      Left = 0
      Top = 0
      Width = 303
      Height = 328
      Align = alClient
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource2
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object RzPanel4: TRzPanel
      Left = 0
      Top = 328
      Width = 303
      Height = 84
      Align = alBottom
      BorderOuter = fsNone
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 42
        Top = 30
        Width = 87
        Height = 25
        Caption = #32463#38144#38754#26009#21450#36741#26009
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 186
        Top = 30
        Width = 75
        Height = 25
        Caption = #22806#21327#38754#26009
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 64
    Top = 113
  end
  object ADOQuery2: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 473
    Top = 113
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 120
    Top = 105
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 537
    Top = 113
  end
end
