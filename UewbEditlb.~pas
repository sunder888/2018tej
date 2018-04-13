unit UewbEditlb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls;

type
  TFewbEditlb = class(TFBaseEditlb)
    procedure FormShow(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FewbEditlb: TFewbEditlb;

implementation

uses UewbEdit, UGlobal;

{$R *.dfm}

procedure TFewbEditlb.FormShow(Sender: TObject);
begin
  with QEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_ewbda');
    Open;
  end;//with

  inherited; 
end;

procedure TFewbEditlb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';
  Fewbedit:=TFewbedit.Create(Application);
  Fewbedit.ShowModal;
  Fewbedit.Free;
  SelSSQL:='';
  RzToolButton4.Click;
end;

procedure TFewbEditlb.RzToolButton2Click(Sender: TObject);
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

  Fewbedit:=TFewbedit.Create(Application);
  Fewbedit.ShowModal;
  Fewbedit.Free;
  RzToolButton4.Click;
end;

end.
