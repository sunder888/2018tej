unit Ujhsel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ADODB;

type
  TFjhsel = class(TFBaseSel)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
  Fjhsel: TFjhsel;

implementation

uses UGlobal;

{$R *.dfm}

procedure TFjhsel.FormShow(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_jhsel where 类型='+QuotedStr(lx)+' and (订单号 like '+QuotedStr('%'+SelSSQL+'%')+' or 名称 like '+QuotedStr('%'+SelSSQL+'%')+')');
    Open;
  end;//with

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();

  SelSSQL:='';
end;

procedure TFjhsel.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SelSSQL:=ADOQuery1.FieldByName('id').AsString;
  Close;
end;

end.
