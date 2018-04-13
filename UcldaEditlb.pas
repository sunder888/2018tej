unit UcldaEditlb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls, ComCtrls, dxtree, dxdbtree;

type
  TFcldaEditlb = class(TFBaseEditlb)
    dxDBTreeView1: TdxDBTreeView;
    procedure FormShow(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure dxDBTreeView1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcldaEditlb: TFcldaEditlb;

implementation

uses UDM, UGlobal, UcldaEdit;

{$R *.dfm}

procedure TFcldaEditlb.FormShow(Sender: TObject);
begin
  inherited;
  DM.QTree.Close;
  DM.QTree.SQL.Clear;
  DM.QTree.SQL.Add('SELECT flbm,flbm+''/''+flmc as flmc,ffl FROM chfl order by flbm');
  DM.QTree.Open;
  dxDBTreeView1.DataSource:=DM.STree;
  dxDBTreeView1.KeyField:='flbm';
  dxDBTreeView1.ListField:='flmc';
  dxDBTreeView1.ParentField:='ffl';
  //展开目录树
  dxDBTreeView1.FullExpand;

  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_clda');
    Open;
  end;//with

  inherited;
end;

procedure TFcldaEditlb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';

  SelSSQL:=dxDBTreeView1.Selected.Text;

  FcldaEdit:=TFcldaEdit.Create(Application);
  FcldaEdit.ShowModal;
  FcldaEdit.Free;
  RzToolButton4.Click;
end;

procedure TFcldaEditlb.RzToolButton2Click(Sender: TObject);
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

  FcldaEdit:=TFcldaEdit.Create(Application);
  FcldaEdit.ShowModal;
  FcldaEdit.Free;
  RzToolButton4.Click;
end;

procedure TFcldaEditlb.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if QEdit.FieldByName('id').AsString='' then
  begin
    ShowMessage('请选择产品！');
    Exit;
  end;

  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM boms where clbm='+QuotedStr(QEdit.FieldByName('材料编码').AsString));
    Open;

    if RecordCount>0 then
    begin
      Application.MessageBox('该存货已经使用，不可删除!!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if MessageBox(HANDLE,'您是否确认删除这个产品？','友情提示',MB_OKCANCEL)=IDOK then
  begin
    with ADOQuery1 do
    begin

      Close;
      SQL.Clear;
      SQL.Add('delete from clda where id='+QuotedStr(QEdit.FieldByName('id').AsString));
      ExecSql;

      ShowMessage('删除完成');
    end;    // with

  end;

  RzToolButton4.Click;    
end;

procedure TFcldaEditlb.dxDBTreeView1Click(Sender: TObject);
begin
  inherited;
  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_clda where 大类编码 like '+QuotedStr(GetStr(dxDBTreeView1.Selected.Text,'/',True)+'%'));
    Open;
  end;//with
end;

end.
