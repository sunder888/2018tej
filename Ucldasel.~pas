unit Ucldasel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Buttons, Mask, RzEdit, ComCtrls, dxtree, dxdbtree, ADODB;

type
  TFcldasel = class(TFBaseSel)
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    RzEdit1: TRzEdit;
    BitBtn1: TBitBtn;
    dxDBTreeView1: TdxDBTreeView;
    QTree: TADOQuery;
    ADOQuery1: TADOQuery;
    STree: TDataSource;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dxDBTreeView1Click(Sender: TObject);
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
  Fcldasel: TFcldasel;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFcldasel.FormShow(Sender: TObject);
begin
  inherited;
  RzEdit1.Text:=SelSSQL; 

  QTree.Close;
  QTree.SQL.Clear;
  QTree.SQL.Add('SELECT flbm,flbm+''/''+flmc as flmc,ffl FROM chfl order by flbm');
  QTree.Open;
  dxDBTreeView1.DataSource:=STree;
  dxDBTreeView1.KeyField:='flbm';
  dxDBTreeView1.ListField:='flmc';
  dxDBTreeView1.ParentField:='ffl';
  //展开目录树
  dxDBTreeView1.FullExpand;

  BitBtn1.Click;
end;

procedure TFcldasel.BitBtn1Click(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_clda where (材料编码 like '+QuotedStr('%'+RzEdit1.Text+'%')+' or 材料名称 like '+QuotedStr('%'+RzEdit1.Text+'%')+')');
    if invsel='棉纱' then
      SQL.Add(' and 对应类型=''棉纱''');
    if invsel='外协面料' then
      SQL.Add(' and 对应类型=''外协面料''');
    Open;
  end;//with

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();
end;

procedure TFcldasel.dxDBTreeView1Click(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from V_clda where 大类编码 like '+QuotedStr(GetStr(dxDBTreeView1.Selected.Text,'/',True)+'%')+' and (材料编码 like '+QuotedStr('%'+RzEdit1.Text+'%')+' or 材料名称 like '+QuotedStr('%'+RzEdit1.Text+'%')+')');
    if invsel='棉纱' then
      SQL.Add(' and 对应类型=''棉纱''');

    if invsel='非棉纱' then
      SQL.Add(' and 对应类型<>''棉纱''');
    Open;
  end;//with

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();
end;

procedure TFcldasel.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SelSSQL:=ADOQuery1.FieldByName('材料编码').AsString;
  Close;
end;

end.
