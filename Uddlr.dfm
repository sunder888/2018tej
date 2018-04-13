inherited Fddlr: TFddlr
  Left = 373
  Top = 237
  Caption = 'Fddlr'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 430
    inherited RzToolbar1: TRzToolbar
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
        BtnSecurity
        BtnError
        BtnDateView
        RzSpacer2
        BtnFirstRecord
        BtnPreviousRecord
        BtnNextRecord
        BtnLastRecord
        RzSpacer3
        BtnExit
        Panel2)
      inherited BtnPrint: TRzToolButton
        Visible = False
      end
      inherited BtnPrintPreview: TRzToolButton
        Visible = False
      end
      inherited BtnInsertRecord: TRzToolButton
        OnClick = BtnInsertRecordClick
      end
      inherited BtnDeleteRecord: TRzToolButton
        Visible = False
      end
      inherited BtnEdit: TRzToolButton
        OnClick = BtnEditClick
      end
      inherited BtnSave: TRzToolButton
        OnClick = BtnSaveClick
      end
      inherited BtnUndo: TRzToolButton
        OnClick = BtnUndoClick
      end
      inherited BtnDelete: TRzToolButton
        OnClick = BtnDeleteClick
      end
      inherited RzSpacer2: TRzSpacer
        Left = 672
      end
      inherited BtnFirstRecord: TRzToolButton
        Left = 4
        Top = 42
      end
      inherited BtnPreviousRecord: TRzToolButton
        Left = 64
        Top = 42
      end
      inherited BtnNextRecord: TRzToolButton
        Left = 124
        Top = 42
      end
      inherited BtnLastRecord: TRzToolButton
        Left = 184
      end
      inherited RzSpacer3: TRzSpacer
        Left = 244
      end
      inherited BtnExit: TRzToolButton
        Left = 252
      end
      object BtnSecurity: TRzToolButton
        Left = 492
        Top = 2
        Hint = 'Security'
        DisabledIndex = 81
        ImageIndex = 80
        Layout = blGlyphTop
        Caption = #23457#26680
        OnClick = BtnSecurityClick
      end
      object BtnError: TRzToolButton
        Left = 552
        Top = 2
        Hint = 'Error'
        DisabledIndex = 83
        ImageIndex = 82
        Layout = blGlyphTop
        Caption = #24323#23457
        OnClick = BtnErrorClick
      end
      object BtnDateView: TRzToolButton
        Left = 612
        Top = 2
        Hint = 'Date View'
        DisabledIndex = 85
        ImageIndex = 84
        Layout = blGlyphTop
        Caption = #27969#31243
        OnClick = BtnDateViewClick
      end
      object Panel2: TPanel
        Left = 312
        Top = 42
        Width = 185
        Height = 41
        BevelOuter = bvNone
        TabOrder = 0
        object RzButtonEdit2: TRzButtonEdit
          Left = 40
          Top = 8
          Width = 121
          Height = 20
          TabOrder = 0
          OnButtonClick = RzButtonEdit2ButtonClick
        end
      end
    end
    inherited RzPanel1: TRzPanel
      Height = 346
      inherited RzPanel2: TRzPanel
        Height = 145
        inherited Label3: TLabel
          Left = 105
          Top = 14
          Width = 48
          Caption = #21333' '#25454' '#21495
        end
        inherited Label2: TLabel
          Left = 415
          Top = 14
          Width = 48
          Caption = #26085'    '#26399
        end
        object Label1: TLabel [2]
          Left = 105
          Top = 42
          Width = 48
          Height = 12
          Caption = #26679#21697#27454#21495
        end
        object Label4: TLabel [3]
          Left = 415
          Top = 42
          Width = 48
          Height = 12
          Caption = #23458'    '#25143
        end
        object Label5: TLabel [4]
          Left = 105
          Top = 70
          Width = 48
          Height = 12
          Caption = #22823#36135#27454#21495
        end
        object Label6: TLabel [5]
          Left = 415
          Top = 70
          Width = 48
          Height = 12
          Caption = #21697'    '#21517
        end
        object Label7: TLabel [6]
          Left = 5
          Top = 9
          Width = 7
          Height = 12
          Font.Charset = GB2312_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel [7]
          Left = 198
          Top = 96
          Width = 36
          Height = 12
          Caption = #24453#23457#20154
        end
        object Label9: TLabel [8]
          Left = 390
          Top = 96
          Width = 36
          Height = 12
          Caption = #24037#33402#21592
        end
        object Label10: TLabel [9]
          Left = 272
          Top = 124
          Width = 48
          Height = 12
          Caption = #21333'    '#20215
        end
        object Label11: TLabel [10]
          Left = 464
          Top = 124
          Width = 48
          Height = 12
          Caption = #37329'    '#39069
        end
        object Label12: TLabel [11]
          Left = 104
          Top = 124
          Width = 48
          Height = 12
          Caption = #25968'    '#37327
        end
        inherited Edit1: TEdit
          Left = 185
          Top = 10
        end
        inherited Date: TRzDateTimeEdit
          Left = 505
          Top = 10
        end
        object RzEdit1: TRzEdit
          Left = 185
          Top = 38
          Width = 121
          Height = 20
          TabOrder = 2
        end
        object RzButtonEdit1: TRzButtonEdit
          Left = 505
          Top = 38
          Width = 121
          Height = 20
          TabOrder = 3
          OnEnter = RzButtonEdit1Enter
          OnExit = RzButtonEdit1Exit
          OnButtonClick = RzButtonEdit1ButtonClick
        end
        object CheckBox1: TCheckBox
          Left = 102
          Top = 94
          Width = 97
          Height = 17
          Caption = #26159#21542#26816#21697
          TabOrder = 4
        end
        object RzEdit2: TRzEdit
          Left = 185
          Top = 66
          Width = 121
          Height = 20
          TabOrder = 5
        end
        object RzEdit3: TRzEdit
          Left = 505
          Top = 66
          Width = 121
          Height = 20
          TabOrder = 6
        end
        object BitBtn1: TBitBtn
          Left = 573
          Top = 90
          Width = 75
          Height = 25
          Caption = #20108#32500#34920#23637#24320
          TabOrder = 7
          OnClick = BitBtn1Click
        end
        object ComboBox1: TRzComboBox
          Left = 240
          Top = 93
          Width = 113
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 8
          OnDropDown = ComboBox1DropDown
        end
        object RzEdit4: TRzEdit
          Left = 432
          Top = 93
          Width = 113
          Height = 20
          Enabled = False
          TabOrder = 9
        end
        object RzNumericEdit1: TRzNumericEdit
          Left = 360
          Top = 120
          Width = 65
          Height = 20
          TabOrder = 10
          IntegersOnly = False
          DisplayFormat = '0.00;(0.00)'
        end
        object RzNumericEdit3: TRzNumericEdit
          Left = 520
          Top = 120
          Width = 65
          Height = 20
          Enabled = False
          TabOrder = 11
          IntegersOnly = False
          DisplayFormat = '0.00;(0.00)'
        end
        object RzNumericEdit2: TRzNumericEdit
          Left = 184
          Top = 120
          Width = 65
          Height = 20
          Enabled = False
          TabOrder = 12
          IntegersOnly = False
          DisplayFormat = '0.00;(0.00)'
        end
      end
      inherited RzPanel3: TRzPanel
        Top = 145
        Height = 201
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 688
          Height = 201
          Align = alClient
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            DataController.DataSource = DataSource1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedItemChanged = cxGrid1DBTableView1FocusedItemChanged
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            end
            object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            end
            object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
  end
  object RzStatusBar1: TRzStatusBar [2]
    Left = 0
    Top = 430
    Width = 688
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 2
    object RzStatusPane1: TRzStatusPane
      Left = 0
      Top = 0
      Height = 19
      Align = alLeft
    end
    object RzStatusPane2: TRzStatusPane
      Left = 100
      Top = 0
      Height = 19
      Align = alLeft
    end
    object RzStatusPane3: TRzStatusPane
      Left = 200
      Top = 0
      Height = 19
      Align = alLeft
    end
  end
  inherited Qdj: TADOQuery
    Left = 449
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 232
    Top = 229
  end
  object ewbQuery: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 120
    Top = 317
  end
  object DataSource1: TDataSource
    DataSet = ewbQuery
    Left = 160
    Top = 317
  end
  object ADOQuery2: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 288
    Top = 229
  end
  object ADOQuery3: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 344
    Top = 229
  end
  object ADOQuery4: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 264
    Top = 301
  end
end
