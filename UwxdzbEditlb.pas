unit UwxdzbEditlb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls;

type
  TFwxdzbEditlb = class(TFBaseEditlb)
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure cxGrid2DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FwxdzbEditlb: TFwxdzbEditlb;

implementation

uses UwxdzbEdit, UGlobal;

{$R *.dfm}

procedure TFwxdzbEditlb.FormShow(Sender: TObject);
begin

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 面料编码,面料名称,面料规格 from V_wxdzb group by 面料编码,面料名称,面料规格');
    Open;
  end;//with
  cxGrid2DBTableView1.ClearItems;
  cxGrid2DBTableView1.DataController.CreateAllItems();
  cxGrid2DBTableView1.ApplyBestFit();

  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_wxdzb');
    //Open;
  end;//with

  //inherited; 
end;

procedure TFwxdzbEditlb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';
  FwxdzbEdit:=TFwxdzbEdit.Create(Application);
  FwxdzbEdit.ShowModal;
  FwxdzbEdit.Free;
  RzToolButton4.Click;
end;

procedure TFwxdzbEditlb.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  zt:='修改';

  if QEdit.FieldByName('id').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('id').AsString;
  end
  else
  begin
    ShowMessage('请选择记录再修改！');
    Exit;
  end;  

  FwxdzbEdit:=TFwxdzbEdit.Create(Application);
  FwxdzbEdit.ShowModal;
  FwxdzbEdit.Free;
  RzToolButton4.Click;
end;

procedure TFwxdzbEditlb.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if QEdit.FieldByName('id').AsString='' then
  begin
    ShowMessage('请选择记录！');
    Exit;
  end;

 { with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM mfljh where gysbm='+QuotedStr(QEdit.FieldByName('供应商编码').AsString));
    Open;

    if RecordCount>0 then
    begin
      Application.MessageBox('该供应商已经使用，不可删除!!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if MessageBox(HANDLE,'您是否确认删除这个供应商？','友情提示',MB_OKCANCEL)=IDOK then
  begin
    with ADOQuery1 do
    begin

      Close;
      SQL.Clear;
      SQL.Add('delete from gysda where gysbm='+QuotedStr(QEdit.FieldByName('供应商编码').AsString));
      ExecSql;

      ShowMessage('删除完成');
    end;    // with

  end;}

  RzToolButton4.Click; 
end;

procedure TFwxdzbEditlb.cxGrid2DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_wxdzb where 面料编码='+QuotedStr(ADOQuery2.FieldByName('面料编码').AsString));
    Open;
  end;//with

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();  
end;

end.
