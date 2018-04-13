object Fjhsc: TFjhsc
  Left = 606
  Top = 281
  Width = 942
  Height = 535
  Caption = 'Fjhsc'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 926
    Height = 65
    Align = alTop
    Caption = #22522#26412#20449#24687
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 48
      Height = 12
      Caption = #35746' '#21333' '#21495
    end
    object Label2: TLabel
      Left = 361
      Top = 26
      Width = 6
      Height = 12
    end
    object Label6: TLabel
      Left = 216
      Top = 26
      Width = 6
      Height = 12
    end
    object Label3: TLabel
      Left = 512
      Top = 24
      Width = 6
      Height = 12
    end
    object Label10: TLabel
      Left = 16
      Top = 48
      Width = 6
      Height = 12
    end
    object RzButtonEdit1: TRzButtonEdit
      Left = 80
      Top = 22
      Width = 121
      Height = 20
      TabOrder = 0
      OnButtonClick = RzButtonEdit1ButtonClick
    end
    object BitBtn1: TBitBtn
      Left = 784
      Top = 20
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 416
    Width = 926
    Height = 80
    Align = alBottom
    Caption = #26126#32454
    TabOrder = 1
    object Label5: TLabel
      Left = 32
      Top = 30
      Width = 24
      Height = 12
      Caption = #25968#37327
    end
    object Label4: TLabel
      Left = 360
      Top = 24
      Width = 36
      Height = 12
      Caption = 'Label4'
      Visible = False
    end
    object Label7: TLabel
      Left = 432
      Top = 24
      Width = 36
      Height = 12
      Caption = 'Label7'
      Visible = False
    end
    object Label8: TLabel
      Left = 504
      Top = 24
      Width = 36
      Height = 12
      Caption = 'Label8'
      Visible = False
    end
    object Label9: TLabel
      Left = 568
      Top = 24
      Width = 36
      Height = 12
      Caption = 'Label9'
      Visible = False
    end
    object RzNumericEdit1: TRzNumericEdit
      Left = 64
      Top = 26
      Width = 65
      Height = 20
      TabOrder = 0
      IntegersOnly = False
      DisplayFormat = '0.00;(0.00)'
    end
    object BitBtn2: TBitBtn
      Left = 160
      Top = 24
      Width = 75
      Height = 25
      Caption = #30830#35748
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 59
      Width = 922
      Height = 19
      Panels = <
        item
          Width = 50
        end>
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 65
    Width = 926
    Height = 351
    Align = alClient
    TabOrder = 2
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
  object ADOQuery1: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 96
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 144
  end
  object ADOQuery2: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 96
    Top = 184
  end
  object ADOQuery3: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 240
    Top = 208
  end
  object ADOQuery4: TADOQuery
    Connection = DM.conn
    Parameters = <>
    Left = 296
    Top = 208
  end
end
