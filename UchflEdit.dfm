inherited Fchfledit: TFchfledit
  Left = 533
  Top = 132
  Width = 695
  Caption = 'Fchfledit'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPageControl1: TRzPageControl
    Left = 169
    Top = 44
    Width = 510
    Height = 340
    Align = alClient
    FixedDimension = 18
    inherited TabSheet1: TRzTabSheet
      object Label1: TLabel
        Left = 176
        Top = 92
        Width = 48
        Height = 12
        Caption = #20998#31867#32534#30721
      end
      object Label2: TLabel
        Left = 176
        Top = 136
        Width = 48
        Height = 12
        Caption = #20998#31867#21517#31216
      end
      object Label3: TLabel
        Left = 176
        Top = 180
        Width = 24
        Height = 12
        Caption = #31867#22411
      end
      object RzEdit1: TRzEdit
        Left = 240
        Top = 88
        Width = 121
        Height = 20
        TabOrder = 0
        OnChange = RzEdit1Change
      end
      object RzEdit2: TRzEdit
        Left = 240
        Top = 132
        Width = 121
        Height = 20
        TabOrder = 1
      end
      object RzComboBox1: TRzComboBox
        Left = 240
        Top = 176
        Width = 121
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 2
        Items.Strings = (
          #32463#38144#38754#26009
          #22806#21327#38754#26009
          #36741#26009
          #26825#32433)
      end
      object BitBtn1: TBitBtn
        Left = 288
        Top = 240
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 3
        OnClick = BitBtn1Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  inherited RzPanel1: TRzPanel
    Top = 384
    Width = 679
    Height = 57
    Align = alBottom
    Visible = False
    inherited RzBitBtn1: TRzBitBtn
      Left = 440
    end
    inherited RzBitBtn2: TRzBitBtn
      Left = 560
    end
  end
  object dxDBTreeView1: TdxDBTreeView [3]
    Left = 0
    Top = 44
    Width = 169
    Height = 340
    ShowNodeHint = True
    SeparatedSt = ' - '
    RaiseOnError = True
    ReadOnly = True
    Indent = 19
    Align = alLeft
    ParentColor = False
    Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SelectedIndex = -1
    TabOrder = 3
    OnClick = dxDBTreeView1Click
  end
  object RzToolbar1: TRzToolbar [4]
    Left = 0
    Top = 0
    Width = 679
    Height = 44
    Images = DM.ImageList3
    RowHeight = 40
    ButtonLayout = blGlyphTop
    ButtonWidth = 60
    ButtonHeight = 40
    ShowButtonCaptions = True
    TextOptions = ttoCustom
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 4
    VisualStyle = vsGradient
    ToolbarControls = (
      RzToolButton1
      RzToolButton2
      RzToolButton3
      RzToolButton4
      RzToolButton5)
    object RzToolButton1: TRzToolButton
      Left = 4
      Top = 2
      ImageIndex = 0
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #26032#22686
      OnClick = RzToolButton1Click
    end
    object RzToolButton2: TRzToolButton
      Left = 64
      Top = 2
      ImageIndex = 1
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarShowCaption = False
      Caption = #20462#25913
      OnClick = RzToolButton2Click
    end
    object RzToolButton3: TRzToolButton
      Left = 124
      Top = 2
      ImageIndex = 2
      Layout = blGlyphTop
      Caption = #21024#38500
      OnClick = RzToolButton3Click
    end
    object RzToolButton4: TRzToolButton
      Left = 184
      Top = 2
      ImageIndex = 4
      Layout = blGlyphTop
      Caption = #21047#26032
      OnClick = RzToolButton4Click
    end
    object RzToolButton5: TRzToolButton
      Left = 244
      Top = 2
      ImageIndex = 5
      Layout = blGlyphTop
      Caption = #36864#20986
      OnClick = RzToolButton5Click
    end
  end
end
