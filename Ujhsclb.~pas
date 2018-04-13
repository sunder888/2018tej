unit Ujhsclb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls, ComCtrls;

type
  TFjhsclb = class(TFBaseEditlb)
    StatusBar1: TStatusBar;
    StatusBar2: TStatusBar;
    StatusBar3: TStatusBar;
    StatusBar4: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fjhsclb: TFjhsclb;

implementation

uses Ujhsc, UGlobal;

{$R *.dfm}

procedure TFjhsclb.FormShow(Sender: TObject);
begin
  StatusBar4.Panels[0].Text:=lx;

  with QEdit do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select * from V_jhb where 类型='+QuotedStr(StatusBar4.Panels[0].Text));

    Open;
  end;//with

  inherited;
end;

procedure TFjhsclb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';

  lx:=StatusBar4.Panels[0].Text;

  Fjhsc:=TFjhsc.Create(Application);
  Fjhsc.ShowModal;
  Fjhsc.Free;
  RzToolButton4.Click;
end;

procedure TFjhsclb.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  zt:='修改';

  if QEdit.FieldByName('订单号').AsString<>'' then
  begin
    SelSSQL:=QEdit.FieldByName('订单号').AsString;
    SelSSQL1:=QEdit.FieldByName('类型').AsString;
  end
  else
  begin
    ShowMessage('请选择记录再修改！');
    Exit;
  end;  

  Fjhsc:=TFjhsc.Create(Application);
  Fjhsc.ShowModal;
  Fjhsc.Free;
  RzToolButton4.Click;
end;

procedure TFjhsclb.RzToolButton4Click(Sender: TObject);
begin
  inherited;
  QEdit.Close;
  QEdit.Open;
end;

procedure TFjhsclb.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  //补
end;

end.
