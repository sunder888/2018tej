unit Ubomlr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls, ComCtrls;

type
  TFbomlr = class(TFBaseEditlb)
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    BtnSecurity: TRzToolButton;
    procedure FormShow(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure BtnSecurityClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbomlr: TFbomlr;

implementation

uses Ubomlredit, UGlobal, Ulcsz;

{$R *.dfm}

procedure TFbomlr.FormShow(Sender: TObject);
begin

  with QEdit do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select * from V_bom');

    Open;
  end;//with

  inherited;
end;

procedure TFbomlr.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='����';

  Fbomlredit:=TFbomlredit.Create(Application);
  Fbomlredit.ShowModal;
  Fbomlredit.Free;
  RzToolButton4.Click;
end;

procedure TFbomlr.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  zt:='�޸�';

  if QEdit.FieldByName('������').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('������').AsString;
  end
  else
  begin
    ShowMessage('��ѡ���¼���޸ģ�');
    Exit;
  end;  

  Fbomlredit:=TFbomlredit.Create(Application);
  Fbomlredit.ShowModal;
  Fbomlredit.Free;
  RzToolButton4.Click;
end;

procedure TFbomlr.RzToolButton4Click(Sender: TObject);
begin
  inherited;
  QEdit.Close;
  QEdit.Open;
end;

procedure TFbomlr.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  if QEdit.FieldByName('������').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('������').AsString;
  end
  else
  begin
    ShowMessage('��ѡ���¼��ɾ����');
    Exit;
  end;  

  if MessageBox(HANDLE,'���Ƿ����Ҫɾ����','������ʾ',MB_OKCANCEL)=IDOK then 
  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from bom where ddh='+QuotedStr(SelSSQL));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('delete from boms where ddh='+QuotedStr(SelSSQL));
    ExecSQL;
  end;

  RzToolButton4.Click;
end;

procedure TFbomlr.BtnSecurityClick(Sender: TObject);
begin
  inherited;
  if QEdit.FieldByName('������').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('������').AsString;
  end
  else
  begin
    ShowMessage('��ѡ���¼�ٱ༭��');
    Exit;
  end;  

  Flcsz:=TFlcsz.Create(Application);
  Flcsz.ShowModal;
  Flcsz.Free;

  RzToolButton4.Click;
end;

end.