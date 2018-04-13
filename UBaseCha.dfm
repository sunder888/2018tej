inherited FBaseCha: TFBaseCha
  Left = 576
  Top = 171
  Caption = 'FBaseCha'
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
      BtnPrint
      BtnExport
      RzSpacer1
      BtnFind
      RzSpacer2
      BtnExit)
    object BtnPrint: TRzToolButton
      Left = 4
      Top = 2
      DisabledIndex = 55
      ImageIndex = 54
      Layout = blGlyphTop
      Caption = #25171#21360
      OnClick = BtnPrintClick
    end
    object BtnExport: TRzToolButton
      Left = 64
      Top = 2
      DisabledIndex = 59
      ImageIndex = 58
      Layout = blGlyphTop
      Caption = #36755#20986
      OnClick = BtnExportClick
    end
    object RzSpacer1: TRzSpacer
      Left = 124
      Top = 10
    end
    object BtnFind: TRzToolButton
      Left = 132
      Top = 2
      DisabledIndex = 61
      ImageIndex = 60
      Layout = blGlyphTop
      Caption = #26597#35810
      OnClick = BtnFindClick
    end
    object RzSpacer2: TRzSpacer
      Left = 192
      Top = 10
    end
    object BtnExit: TRzToolButton
      Left = 200
      Top = 2
      DisabledIndex = 63
      ImageIndex = 62
      Layout = blGlyphTop
      Caption = #36864#20986
      OnClick = BtnExitClick
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
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #35745#25968#65306
          Kind = skCount
          Column = cxGrid1DBTableView1DBColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    Version = 0
    Left = 120
    Top = 72
    object dxComponentPrinter1Link1: TdxGridReportLink
      Component = cxGrid1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
    Top = 216
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 192
    Top = 216
  end
end
