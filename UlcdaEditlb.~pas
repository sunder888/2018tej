unit UlcdaEditlb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls;

type
  TFlcdaEditlb = class(TFBaseEditlb)
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
  FlcdaEditlb: TFlcdaEditlb;

implementation

uses UlcdaEdit, UGlobal;

{$R *.dfm}

procedure TFlcdaEditlb.FormShow(Sender: TObject);
begin
  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_lcda');
    Open;
  end;//with

  inherited;
end;

procedure TFlcdaEditlb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';
  Flcdaedit:=TFlcdaedit.Create(Application);
  Flcdaedit.ShowModal;
  Flcdaedit.Free;
  RzToolButton4.Click;
end;

procedure TFlcdaEditlb.RzToolButton2Click(Sender: TObject);
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

  Flcdaedit:=TFlcdaedit.Create(Application);
  Flcdaedit.ShowModal;
  Flcdaedit.Free;
  RzToolButton4.Click;
end;

procedure TFlcdaEditlb.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if QEdit.FieldByName('id').AsString='' then
  begin
    ShowMessage('请选择流程！');
    Exit;
  end;

  if MessageBox(HANDLE,'您是否确认删除这个流程？','友情提示',MB_OKCANCEL)=IDOK then
  begin
    with ADOQuery1 do
    begin

      Close;
      SQL.Clear;
      SQL.Add('delete from lcda where id='+QuotedStr(QEdit.FieldByName('id').AsString));
      ExecSql;

      ShowMessage('删除完成');
    end;    // with

  end;

  RzToolButton4.Click; 
end;

end.
