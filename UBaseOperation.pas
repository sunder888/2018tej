unit UBaseOperation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBase, StdCtrls, ComCtrls, Grids, DBGridEh, ExtCtrls, ToolWin,
  DB, ADODB, RzPanel, RzButton, Mask, RzEdit;

type
  TFBaseOperation = class(TFBase)
    Panel1: TPanel;
    Qdj: TADOQuery;
    RzToolbar1: TRzToolbar;
    BtnPrint: TRzToolButton;
    BtnPrintPreview: TRzToolButton;
    RzSpacer1: TRzSpacer;
    BtnInsertRecord: TRzToolButton;
    BtnDeleteRecord: TRzToolButton;
    BtnEdit: TRzToolButton;
    BtnSave: TRzToolButton;
    BtnUndo: TRzToolButton;
    BtnDelete: TRzToolButton;
    RzSpacer2: TRzSpacer;
    BtnFirstRecord: TRzToolButton;
    BtnPreviousRecord: TRzToolButton;
    BtnNextRecord: TRzToolButton;
    BtnLastRecord: TRzToolButton;
    RzSpacer3: TRzSpacer;
    BtnExit: TRzToolButton;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    Edit1: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    RzPanel3: TRzPanel;
    Date: TRzDateTimeEdit;
    procedure BtnDeleteRecordClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnFirstRecordClick(Sender: TObject);
    procedure BtnLastRecordClick(Sender: TObject);
    procedure BtnPreviousRecordClick(Sender: TObject);
    procedure BtnNextRecordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaseOperation: TFBaseOperation;
  djlx,dqdh:String;

implementation

uses UDM;

{$R *.dfm}

procedure TFBaseOperation.BtnDeleteRecordClick(Sender: TObject);
begin
  inherited;
  if messagedlg('是否真要删除此行？',mtwarning,[mbyes,mbcancel],0)=mryes then
    try
      Qdj.Delete;
    except
      messagedlg('删除此行时出错！',mterror,[mbok],0);
    end;
end;

procedure TFBaseOperation.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFBaseOperation.BtnFirstRecordClick(Sender: TObject);
begin
  inherited;
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select min(djbm) as djbm from sfjl where lxbm='+QuotedStr(djlx));
    Open;
    dqdh:=FieldByName('djbm').AsString;
  end;    // with
end;

procedure TFBaseOperation.BtnLastRecordClick(Sender: TObject);
begin
  inherited;
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(djbm) as djbm from sfjl where lxbm='+QuotedStr(djlx));
    Open;
    dqdh:=FieldByName('djbm').AsString;
  end;    // wit
end;

procedure TFBaseOperation.BtnPreviousRecordClick(Sender: TObject);
begin
  inherited;
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(djbm) as djbm from sfjl where lxbm='+QuotedStr(djlx)+' and djbm<'+QuotedStr(dqdh));
    Open;
    dqdh:=FieldByName('djbm').AsString;
  end;    // with
end;

procedure TFBaseOperation.BtnNextRecordClick(Sender: TObject);
begin
  inherited;
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select min(djbm) as djbm from sfjl where lxbm='+QuotedStr(djlx)+' and djbm>'+QuotedStr(dqdh));
    Open;
    dqdh:=FieldByName('djbm').AsString;
  end;    // with
end;

end.
