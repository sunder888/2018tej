unit Uwxlchb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBase, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, Buttons, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzButton, Mask, RzEdit,
  RzBtnEdt, RzLabel, ExtCtrls, RzPanel;

type
  TFwxlchb = class(TFBase)
    ComboBox1: TComboBox;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RzButtonEdit1: TRzButtonEdit;
    RzBitBtn1: TRzBitBtn;
    RzPanel2: TRzPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    RzPanel3: TRzPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    RzPanel4: TRzPanel;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fwxlchb: TFwxlchb;

implementation

uses UddSel, UDM, UGlobal, Uwxlchbjm;

{$R *.dfm}

procedure TFwxlchb.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  SelSSQL:=RzButtonEdit1.Text;
  FddSel:=TFddSel.Create(Application);
  FddSel.ShowModal;
  FddSel.Free;

  RzButtonEdit1.Text:=SelSSQL;

  Label1.Caption:=SelSSQL;
  Label2.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','dhkh');
  Label3.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','pm');
  //Label13.Caption:=GetFieldStr(uf+'..inventory',SelSSQL,'cinvcode','bComsume');
  //ShowMessage(copy(SelSSQL,1,3));
  
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select SUM(sl) as sl from xsdds where djh='+QuotedStr(Label1.Caption));
    Open;

    Label4.Caption:=FieldByName('sl').AsString;
  end;
end;

procedure TFwxlchb.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if Label1.Caption='' then
  begin
    ShowMessage('选择订单有误，请重新选择！');
    Exit;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_mfljh_yt where (对应阶段 <>''订货'') and 订单号='+QuotedStr(Label1.Caption));
    Open;

    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems();
    cxGrid1DBTableView1.ApplyBestFit();     
  end;
end;

procedure TFwxlchb.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i:Integer;
  cl:TcxGridDBColumn;
begin
  inherited;
  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_wxlc where 订单号='+QuotedStr(Label1.Caption)+' and 材料编码='+QuotedStr(ADOQuery1.FieldByName('材料编码').AsString)+' and 门幅='+QuotedStr(ADOQuery1.FieldByName('门幅').AsString)+' and 克重='+QuotedStr(ADOQuery1.FieldByName('克重').AsString)+' and 颜色='+QuotedStr(ADOQuery1.FieldByName('颜色').AsString)+' and 对应阶段='+QuotedStr(ADOQuery1.FieldByName('对应阶段').AsString));
    Open;

    Screen.Cursor :=  crHourGlass;
    cxGrid2DBTableView1.BeginUpdate;
    try
      cxGrid2DBTableView1.ClearItems;
      cxGrid2DBTableView1.DataController.Summary.FooterSummaryItems.Clear;
      for i := 0 to cxGrid2DBTableView1.DataController.DataSet.FieldCount - 1 do
      begin
        cl  :=  cxGrid2DBTableView1.CreateColumn;
        cl.DataBinding.FieldName :=
            cxGrid2DBTableView1.DataController.DataSet.Fields[i].FieldName;
        if cxGrid2DBTableView1.DataController.DataSet.Fields[i] is TNumericField then
        begin
          TNumericField(cxGrid2DBTableView1.DataController.DataSet.Fields[i])
              .DisplayFormat  :=  '#,##0.00';
          cl.Width := 80;
          cl.Summary.FooterKind := sksum;
        end
        else if cxGrid2DBTableView1.DataController.DataSet.Fields[i] is TStringField then
          cl.Width := 100
        else
          cl.Width := 80;
        cl.HeaderAlignmentHorz :=  taCenter;
      end;  //if
    finally
      cxGrid2DBTableView1.EndUpdate;
      Screen.Cursor := crDefault;
    end; 
  end;

  BitBtn1.Enabled:=True;

end;

procedure TFwxlchb.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1.Enabled:=False;
end;

procedure TFwxlchb.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if ADOQuery1.FieldByName('id').AsString<>'' then
  begin
    SelSSQL:=ADOQuery1.FieldByName('id').AsString;
  end
  else
  begin
    ShowMessage('请选择记录再操作！');
    Exit;
  end;

  xlk:='采购棉纱计划,织造计划,染色计划';  

  Fwxlchbjm:=TFwxlchbjm.Create(Application);
  Fwxlchbjm.ShowModal;
  Fwxlchbjm.Free;
end;

end.
