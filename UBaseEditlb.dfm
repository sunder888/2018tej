inherited FBaseEditlb: TFBaseEditlb
  Left = 475
  Caption = 'FBaseEditlb'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 688
    Height = 44
    Images = DM.ImageList3
    RowHeight = 40
    ButtonLayout = blGlyphTop
    ButtonWidth = 60
    ButtonHeight = 40
    ShowButtonCaptions = True
    TextOptions = ttoShowTextLabels
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 1
    VisualStyle = vsGradient
    ToolbarControls = (
      RzToolButton1
      RzToolButton2
      RzToolButton3
      RzSpacer1
      RzToolButton4
      RzToolButton5
      RzSpacer2
      RzToolButton6)
    object RzToolButton1: TRzToolButton
      Left = 4
      Top = 2
      ImageIndex = 0
      Layout = blGlyphTop
      Caption = #22686#21152
    end
    object RzToolButton2: TRzToolButton
      Left = 64
      Top = 2
      ImageIndex = 1
      Layout = blGlyphTop
      Caption = #20462#25913
    end
    object RzToolButton3: TRzToolButton
      Left = 124
      Top = 2
      ImageIndex = 2
      Layout = blGlyphTop
      Caption = #21024#38500
    end
    object RzSpacer1: TRzSpacer
      Left = 184
      Top = 10
    end
    object RzToolButton4: TRzToolButton
      Left = 192
      Top = 2
      ImageIndex = 4
      Layout = blGlyphTop
      Caption = #21047#26032
      OnClick = RzToolButton4Click
    end
    object RzToolButton5: TRzToolButton
      Left = 252
      Top = 2
      ImageIndex = 6
      Layout = blGlyphTop
      Caption = #36755#20986
      OnClick = RzToolButton5Click
    end
    object RzSpacer2: TRzSpacer
      Left = 312
      Top = 10
    end
    object RzToolButton6: TRzToolButton
      Left = 320
      Top = 2
      ImageIndex = 5
      Layout = blGlyphTop
      Caption = #36864#20986
      OnClick = RzToolButton6Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 44
    Width = 688
    Height = 409
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = QSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object QEdit: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 144
    Top = 104
  end
  object QSource: TDataSource
    DataSet = QEdit
    Left = 184
    Top = 104
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 144
    Top = 144
  end
end
