unit UgysEditlb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, DB, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls, StdCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData;

type
  TFgysEditlb = class(TFBaseEditlb)
    procedure FormShow(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FgysEditlb: TFgysEditlb;

implementation

uses UgysEdit, UGlobal, UDM;

{$R *.dfm}

procedure TFgysEditlb.FormShow(Sender: TObject);
begin
  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_gysda');
    Open;
  end;//with

  inherited; 
end;

procedure TFgysEditlb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';
  Fgysedit:=TFgysedit.Create(Application);
  Fgysedit.ShowModal;
  Fgysedit.Free;
  RzToolButton4.Click;
end;

procedure TFgysEditlb.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  zt:='修改';

  if QEdit.FieldByName('供应商编码').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('供应商编码').AsString;
  end
  else
  begin
    ShowMessage('请选择记录再修改！');
    Exit;
  end;  

  Fgysedit:=TFgysedit.Create(Application);
  Fgysedit.ShowModal;
  Fgysedit.Free;
  RzToolButton4.Click;
end;

procedure TFgysEditlb.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if QEdit.FieldByName('id').AsString='' then
  begin
    ShowMessage('请选择供应商！');
    Exit;
  end;

  with DM.QRead do
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

  end;

  RzToolButton4.Click; 
end;

end.
