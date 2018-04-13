unit Ugysdasel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFgysdasel = class(TFBaseSel)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fgysdasel: TFgysdasel;

implementation

uses UGlobal;

{$R *.dfm}

procedure TFgysdasel.FormShow(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_gysda where 供应商编码 like '+QuotedStr('%'+SelSSQL+'%')+' or 供应商名称 like '+QuotedStr('%'+SelSSQL+'%'));
    Open; 
  end;

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit(); 
end;

procedure TFgysdasel.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SelSSQL:=ADOQuery1.FieldByName('供应商编码').AsString;
  Close;
end;

end.
