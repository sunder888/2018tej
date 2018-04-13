unit UkhEditlb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls;

type
  TFkhEditlb = class(TFBaseEditlb)
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
  FkhEditlb: TFkhEditlb;

implementation

uses UkhEdit, UGlobal, UDM;

{$R *.dfm}

procedure TFkhEditlb.FormShow(Sender: TObject);
begin
  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_khda');
    Open;
  end;//with

  inherited; 
end;

procedure TFkhEditlb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';
  Fkhedit:=TFkhedit.Create(Application);
  Fkhedit.ShowModal;
  Fkhedit.Free;
  RzToolButton4.Click;
end;

procedure TFkhEditlb.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  zt:='修改';

  if QEdit.FieldByName('客户编码').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('客户编码').AsString;
  end
  else
  begin
    ShowMessage('请选择记录再修改！');
    Exit;
  end;  

  Fkhedit:=TFkhedit.Create(Application);
  Fkhedit.ShowModal;
  Fkhedit.Free;
  RzToolButton4.Click;
end;

procedure TFkhEditlb.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if QEdit.FieldByName('id').AsString='' then
  begin
    ShowMessage('请选择客户！');
    Exit;
  end;

  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM xsdd where kh='+QuotedStr(QEdit.FieldByName('客户编码').AsString));
    Open;

    if RecordCount>0 then
    begin
      Application.MessageBox('该客户已经使用，不可删除!!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if MessageBox(HANDLE,'您是否确认删除这个客户？','友情提示',MB_OKCANCEL)=IDOK then
  begin
    with ADOQuery1 do
    begin

      Close;
      SQL.Clear;
      SQL.Add('delete from khda where khbm='+QuotedStr(QEdit.FieldByName('客户编码').AsString));
      ExecSql;

      ShowMessage('删除完成');
    end;    // with

  end;

  RzToolButton4.Click; 
end;

end.
