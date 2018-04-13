unit UddSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ADODB;

type
  TFddSel = class(TFBaseSel)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
  FddSel: TFddSel;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFddSel.FormShow(Sender: TObject);
begin
  //inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_xsddsel where (大货款号 like '+QuotedStr('%'+SelSSQL+'%')+' or 品名 like '+QuotedStr('%'+SelSSQL+'%')+')');
    Open;
  end;//with

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();

  SelSSQL:='';
end;

procedure TFddSel.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SelSSQL:=ADOQuery1.FieldByName('单据号').AsString;
  Close;
end;

end.
