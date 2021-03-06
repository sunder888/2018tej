inherited FBaseOperation: TFBaseOperation
  Left = 437
  Top = 202
  Caption = 'FBaseOperation'
  ClientHeight = 449
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 449
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object RzToolbar1: TRzToolbar
      Left = 0
      Top = 0
      Width = 688
      Height = 84
      AutoStyle = False
      Images = DM.ImageList1
      RowHeight = 40
      ButtonLayout = blGlyphTop
      ButtonWidth = 60
      ButtonHeight = 40
      ShowButtonCaptions = True
      TextOptions = ttoShowTextLabels
      BorderInner = fsButtonUp
      BorderOuter = fsButtonUp
      BorderSides = [sdTop]
      BorderWidth = 0
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      ToolbarControls = (
        BtnPrint
        BtnPrintPreview
        RzSpacer1
        BtnInsertRecord
        BtnDelete
        BtnEdit
        BtnSave
        BtnUndo
        BtnDeleteRecord
        RzSpacer2
        BtnFirstRecord
        BtnPreviousRecord
        BtnNextRecord
        BtnLastRecord
        RzSpacer3
        BtnExit)
      object BtnPrint: TRzToolButton
        Left = 4
        Top = 2
        Hint = 'Print'
        DisabledIndex = 35
        ImageIndex = 34
        Layout = blGlyphTop
        Caption = #25171#21360
      end
      object BtnPrintPreview: TRzToolButton
        Left = 64
        Top = 2
        Hint = 'Print Preview'
        DisabledIndex = 37
        ImageIndex = 36
        Layout = blGlyphTop
        Caption = #39044#35272
      end
      object RzSpacer1: TRzSpacer
        Left = 124
        Top = 10
        Grooved = True
      end
      object BtnInsertRecord: TRzToolButton
        Left = 132
        Top = 2
        Hint = 'Insert Record'
        DisabledIndex = 39
        ImageIndex = 38
        Layout = blGlyphTop
        Caption = #26032#21333
      end
      object BtnDeleteRecord: TRzToolButton
        Left = 432
        Top = 2
        Hint = 'Delete Record'
        DisabledIndex = 41
        ImageIndex = 40
        Layout = blGlyphTop
        Caption = #21024#34892
        OnClick = BtnDeleteRecordClick
      end
      object BtnEdit: TRzToolButton
        Left = 252
        Top = 2
        Hint = 'Edit'
        DisabledIndex = 43
        ImageIndex = 42
        Layout = blGlyphTop
        Caption = #20462#25913
      end
      object BtnSave: TRzToolButton
        Left = 312
        Top = 2
        Hint = 'Save'
        DisabledIndex = 45
        ImageIndex = 44
        Layout = blGlyphTop
        Caption = #20445#23384
      end
      object BtnUndo: TRzToolButton
        Left = 372
        Top = 2
        Hint = 'Undo'
        DisabledIndex = 47
        ImageIndex = 46
        Layout = blGlyphTop
        Caption = #25918#24323
      end
      object BtnDelete: TRzToolButton
        Left = 192
        Top = 2
        Hint = 'Delete'
        DisabledIndex = 49
        ImageIndex = 48
        Layout = blGlyphTop
        Caption = #21024#38500
      end
      object RzSpacer2: TRzSpacer
        Left = 492
        Top = 10
        Grooved = True
      end
      object BtnFirstRecord: TRzToolButton
        Left = 500
        Top = 2
        Hint = 'First Record'
        DisabledIndex = 51
        ImageIndex = 50
        Layout = blGlyphTop
        Caption = #39318#24352
        OnClick = BtnFirstRecordClick
      end
      object BtnPreviousRecord: TRzToolButton
        Left = 560
        Top = 2
        Hint = 'Previous Record'
        DisabledIndex = 53
        ImageIndex = 52
        Layout = blGlyphTop
        Caption = #19978#24352
        OnClick = BtnPreviousRecordClick
      end
      object BtnNextRecord: TRzToolButton
        Left = 620
        Top = 2
        Hint = 'Next Record'
        DisabledIndex = 55
        ImageIndex = 54
        Layout = blGlyphTop
        Caption = #19979#24352
        OnClick = BtnNextRecordClick
      end
      object BtnLastRecord: TRzToolButton
        Left = 4
        Top = 42
        Hint = 'Last Record'
        DisabledIndex = 57
        ImageIndex = 56
        Layout = blGlyphTop
        Caption = #26411#24352
        OnClick = BtnLastRecordClick
      end
      object RzSpacer3: TRzSpacer
        Left = 64
        Top = 50
        Grooved = True
      end
      object BtnExit: TRzToolButton
        Left = 72
        Top = 42
        Hint = 'Exit'
        DisabledIndex = 59
        ImageIndex = 58
        Layout = blGlyphTop
        Caption = #36864#20986
        OnClick = BtnExitClick
      end
    end
    object RzPanel1: TRzPanel
      Left = 0
      Top = 84
      Width = 688
      Height = 365
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 1
      object RzPanel2: TRzPanel
        Left = 0
        Top = 0
        Width = 688
        Height = 41
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 36
          Height = 12
          Caption = #21333#25454#21495
        end
        object Label2: TLabel
          Left = 406
          Top = 15
          Width = 36
          Height = 12
          Caption = #26085'  '#26399
        end
        object Edit1: TEdit
          Left = 56
          Top = 16
          Width = 121
          Height = 20
          TabOrder = 0
        end
        object Date: TRzDateTimeEdit
          Left = 448
          Top = 11
          Width = 121
          Height = 20
          EditType = etDate
          TabOrder = 1
        end
      end
      object RzPanel3: TRzPanel
        Left = 0
        Top = 41
        Width = 688
        Height = 324
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 1
      end
    end
  end
  object Qdj: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 505
    Top = 8
  end
end
