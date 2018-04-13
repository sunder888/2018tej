unit Ujhhblb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEditlb, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzPanel, RzButton, ExtCtrls,
  StdCtrls, ComCtrls;

type
  TFjhhblb = class(TFBaseEditlb)
    StatusBar4: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fjhhblb: TFjhhblb;

implementation

uses UGlobal, Ujhhbedit;

{$R *.dfm}

procedure TFjhhblb.FormShow(Sender: TObject);
begin
  StatusBar4.Panels[0].Text:=lx;

  with QEdit do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select * from V_jhbhb where 类型='+QuotedStr(StatusBar4.Panels[0].Text));

    Open;
  end;//with

  inherited;
end;

procedure TFjhhblb.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  zt:='新增';

  lx:=StatusBar4.Panels[0].Text;

  Fjhhbedit:=TFjhhbedit.Create(Application);
  Fjhhbedit.ShowModal;
  Fjhhbedit.Free;
  RzToolButton4.Click;
end;

procedure TFjhhblb.RzToolButton4Click(Sender: TObject);
begin
  inherited;
  QEdit.Close;
  QEdit.Open;
end;

end.
