unit UBaseEditlb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBase, StdCtrls, ComCtrls, RzButton, ExtCtrls, RzPanel, RzSplit,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, DB,
  ADODB,cxExportGrid4Link, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData;

type
  TFBaseEditlb = class(TFBase)
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzSpacer1: TRzSpacer;
    RzToolButton4: TRzToolButton;
    RzToolButton5: TRzToolButton;
    RzSpacer2: TRzSpacer;
    RzToolButton6: TRzToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    QEdit: TADOQuery;
    QSource: TDataSource;
    ADOQuery1: TADOQuery;
    procedure RzToolButton6Click(Sender: TObject);
    procedure RzToolButton4Click(Sender: TObject);
    procedure RzToolButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function ssj(biao,ziduan,xiangmu,zhi:String):String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaseEditlb: TFBaseEditlb;

implementation

uses UDM;

{$R *.dfm}

procedure TFBaseEditlb.RzToolButton6Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFBaseEditlb.RzToolButton4Click(Sender: TObject);
begin
  inherited;
  QEdit.Close;
  QEdit.Open;
end;

procedure TFBaseEditlb.RzToolButton5Click(Sender: TObject);
begin
  inherited;
  cxGrid1.Font.Charset:=DEFAULT_CHARSET;
  if DM.RzSaveDialog1.Execute then
  begin
    ExportGrid4ToEXCEL(DM.RzSaveDialog1.FileName+'.xls',cxGrid1,True,True);
  end;

end;

procedure TFBaseEditlb.FormShow(Sender: TObject);
var
  i:Integer;
begin
  inherited;

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();

  for i := 0 to cxGrid1DBTableView1.DataController.DataSet.FieldCount - 1 do
  begin
    if cxGrid1DBTableView1.Columns[i].Caption='id' then
      cxGrid1DBTableView1.Columns[i].Visible:=False;
  end;

end;

function TFBaseEditlb.ssj(biao,ziduan,xiangmu,zhi:String):String;
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from '+biao+' where '+ziduan+' ='+QuotedStr(zhi));
    Open;

    if RecordCount>0 then
    begin
      result:=xiangmu;
    end
    else
      result:='';
  end;
end;

end.
