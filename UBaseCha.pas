unit UBaseCha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBase, StdCtrls, ComCtrls, ToolWin, RzPanel, RzButton, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,cxExportGrid4Link,
  dxPSCore, dxPScxCommon, dxPScxGridLnk, DB, ADODB,
 cxGridBandedTableView,
  cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridDBBandedTableView, cxTextEdit, cxCalc, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns;


type
  TFBaseCha = class(TFBase)
    RzToolbar1: TRzToolbar;
    BtnPrint: TRzToolButton;
    BtnExport: TRzToolButton;
    RzSpacer1: TRzSpacer;
    BtnFind: TRzToolButton;
    RzSpacer2: TRzSpacer;
    BtnExit: TRzToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    procedure ToolButton16Click(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaseCha: TFBaseCha;

implementation

uses UDM;

{$R *.dfm}

procedure TFBaseCha.ToolButton16Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFBaseCha.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFBaseCha.BtnExportClick(Sender: TObject);
begin
  inherited;
  cxGrid1.Font.Charset:=DEFAULT_CHARSET;
  if DM.RZSaveDialog1.Execute then
  begin
    ExportGrid4ToEXCEL(DM.RZSaveDialog1.FileName+'.xls',cxGrid1,True,True);
  end;

end;

procedure TFBaseCha.BtnPrintClick(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.Preview(); 
end;

procedure TFBaseCha.BtnFindClick(Sender: TObject);
var
  i:Integer;
  cl:TcxGridDBColumn;
begin
  inherited;
  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();

  Screen.Cursor :=  crHourGlass;
  cxGrid1DBTableView1.BeginUpdate;
  try
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.Summary.FooterSummaryItems.Clear;
    for i := 0 to cxGrid1DBTableView1.DataController.DataSet.FieldCount - 1 do
    begin
      cl  :=  cxGrid1DBTableView1.CreateColumn;
      cl.DataBinding.FieldName :=
          cxGrid1DBTableView1.DataController.DataSet.Fields[i].FieldName;

      if i=0 then
      begin
        cl.Summary.FooterFormat:='¼ÆÊý£º';
        cl.Summary.FooterKind := skCount;
      end;

      if i=1 then
      begin
        cl.Summary.FooterKind := skCount;
      end;

      if cxGrid1DBTableView1.DataController.DataSet.Fields[i] is TNumericField then
      begin
        TNumericField(cxGrid1DBTableView1.DataController.DataSet.Fields[i])
            .DisplayFormat  :=  '#,##0.00';
        cl.Width := 80;
        cl.Summary.FooterKind := sksum;
      end
      else if cxGrid1DBTableView1.DataController.DataSet.Fields[i] is TStringField then
        cl.Width := 100
      else
        cl.Width := 80;
      cl.HeaderAlignmentHorz :=  taCenter;
    end;  //if
  finally
    cxGrid1DBTableView1.EndUpdate;
    Screen.Cursor := crDefault;
  end;

  for i := 0 to cxGrid1DBTableView1.DataController.DataSet.FieldCount - 1 do
  begin
    if cxGrid1DBTableView1.Columns[i].Caption='id' then
      cxGrid1DBTableView1.Columns[i].Visible:=False;
  end;

end;

end.
