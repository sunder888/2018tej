unit Ujhhbedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, Mask, RzEdit, RzBtnEdt, RzButton, ExtCtrls,
  RzPanel, RzCmboBx, RzLabel, RzTabs, DB, ADODB, ComCtrls;

type
  TFjhhbedit = class(TFBaseSel)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel11: TRzLabel;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzNumericEdit1: TRzNumericEdit;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzButtonEdit1: TRzButtonEdit;
    RzEdit1: TRzEdit;
    RzLabel6: TRzLabel;
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    StatusBar1: TStatusBar;
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetFieldStr(Table,Get,GetField,ResultField:String):String;
  end;

var
  Fjhhbedit: TFjhhbedit;

implementation

uses Ujhsel, UGlobal, UDM;

{$R *.dfm}

function TFjhhbedit.GetFieldStr(Table,Get,GetField,ResultField:String):String;
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select '+ResultField+' from '+Table+' where '+GetField+' = '+QuotedStr(Get));
    Open;
    result:=FieldByName(ResultField).AsString;
  end;    // with
end;

procedure TFjhhbedit.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  lx:=StatusBar1.Panels[0].Text;

  SelSSQL:=RzButtonEdit1.Text;
  FjhSel:=TFjhSel.Create(Application);
  FjhSel.ShowModal;
  FjhSel.Free;

  RzButtonEdit1.Text:=SelSSQL;

  if SelSSQL<>'' then
  begin
    Label1.Caption:=SelSSQL;
    RzEdit1.Text:=GetFieldStr('V_jhsel',SelSSQL,'id','订单号');
    //RzEdit2.Text:=GetFieldStr('V_jhsel',SelSSQL,'id','pm');
    RzEdit3.Text:=GetFieldStr('V_jhsel',SelSSQL,'id','名称');
    RzEdit4.Text:=GetFieldStr('V_jhsel',SelSSQL,'id','颜色');
    RzEdit5.Text:=GetFieldStr('V_jhsel',SelSSQL,'id','尺码');

  end;
end;

procedure TFjhhbedit.FormShow(Sender: TObject);
begin
  inherited;
  RzDateTimeEdit1.Date:=Now();
  StatusBar1.Panels[0].Text:=lx;
end;

procedure TFjhhbedit.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFjhhbedit.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from jhbhb where id=1');
    Open;

    Append;
    FieldByName('rq').AsDateTime:=RzDateTimeEdit1.Date;
    FieldByName('jhid').AsString:=Label1.Caption;
    FieldByName('sl').AsString:=RzNumericEdit1.Text;
    FieldByName('lrr').AsString:=GName;
    FieldByName('lrsj').AsDateTime:=Now();
    Post; 
  end;

  ShowMessage('保存完成');
  Close;
end;

end.
