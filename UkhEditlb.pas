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
  zt:='����';
  Fkhedit:=TFkhedit.Create(Application);
  Fkhedit.ShowModal;
  Fkhedit.Free;
  RzToolButton4.Click;
end;

procedure TFkhEditlb.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  zt:='�޸�';

  if QEdit.FieldByName('�ͻ�����').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('�ͻ�����').AsString;
  end
  else
  begin
    ShowMessage('��ѡ���¼���޸ģ�');
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
    ShowMessage('��ѡ��ͻ���');
    Exit;
  end;

  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM xsdd where kh='+QuotedStr(QEdit.FieldByName('�ͻ�����').AsString));
    Open;

    if RecordCount>0 then
    begin
      Application.MessageBox('�ÿͻ��Ѿ�ʹ�ã�����ɾ��!!', '��ʾ', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if MessageBox(HANDLE,'���Ƿ�ȷ��ɾ������ͻ���','������ʾ',MB_OKCANCEL)=IDOK then
  begin
    with ADOQuery1 do
    begin

      Close;
      SQL.Clear;
      SQL.Add('delete from khda where khbm='+QuotedStr(QEdit.FieldByName('�ͻ�����').AsString));
      ExecSql;

      ShowMessage('ɾ�����');
    end;    // with

  end;

  RzToolButton4.Click; 
end;

end.
