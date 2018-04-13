unit Udhjh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, RzLabel, RzEdit, RzBtnEdt, Mask;

type
  TFdhjh = class(TFBaseEdit)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzEdit6: TRzEdit;
    RzButtonEdit1: TRzButtonEdit;
    RzNumericEdit1: TRzNumericEdit;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzLabel10: TRzLabel;
    RzEdit7: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1Enter(Sender: TObject);
    procedure RzButtonEdit1Exit(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdhjh: TFdhjh;

implementation

uses UGlobal, Ukhdasel, Ugysdasel, UDM;

{$R *.dfm}

procedure TFdhjh.FormShow(Sender: TObject);
begin
  inherited;
  RzDateTimeEdit1.Date:=Now();
  RzEdit1.Text:=GetFieldStr('V_ddbommx',SelSSQL,'id','订单号');
  RzEdit2.Text:=GetFieldStr('V_ddbommx',SelSSQL,'id','材料编码');
  RzEdit3.Text:=GetFieldStr('V_ddbommx',SelSSQL,'id','材料名称');
  RzEdit4.Text:=GetFieldStr('V_ddbommx',SelSSQL,'id','门幅');
  RzEdit5.Text:=GetFieldStr('V_ddbommx',SelSSQL,'id','克重');
  RzEdit6.Text:=GetFieldStr('V_ddbommx',SelSSQL,'id','颜色');
  RzEdit7.Text:=GetFieldStr('V_ddbommx',SelSSQL,'id','对应类型');
end;

procedure TFdhjh.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  SelSSQL:=RzButtonEdit1.Text;

  FgysdaSel:=TFgysdaSel.Create(Application);
  FgysdaSel.ShowModal;
  FgysdaSel.Free;

  RzButtonEdit1.Text:=SelSSQL;
end;

procedure TFdhjh.RzButtonEdit1Enter(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=GetStr(RzButtonEdit1.Text,'/',True);
end;

procedure TFdhjh.RzButtonEdit1Exit(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=RzButtonEdit1.Text+'/'+GetFieldStr('V_gysda',RzButtonEdit1.Text,'供应商编码','供应商名称');
end;

procedure TFdhjh.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if GetStr(RzButtonEdit1.Text,'/',True)='' then
  begin
    ShowMessage('请选择供应商！');
    Exit;
  end;

  if (RzNumericEdit1.Text='') or (RzNumericEdit1.Text='0.00') then
  begin
    ShowMessage('请输入数量！');
    Exit;
  end;

  if RzDateTimeEdit1.Text='' then
  begin
    ShowMessage('请输入日期！');
    Exit;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from mfljh where id=1');
    Open;
    Append;
    FieldByName('ddh').AsString:=RzEdit1.Text;
    FieldByName('dylx').AsString:=RzEdit7.Text;
    FieldByName('clbm').AsString:=RzEdit2.Text;
    FieldByName('mf').AsString:=RzEdit4.Text;
    FieldByName('kz').AsString:=RzEdit5.Text;
    FieldByName('ys').AsString:=RzEdit6.Text;
    FieldByName('sl').AsString:=RzNumericEdit1.Text;
    FieldByName('dyjd').AsString:='订货';
    FieldByName('gysbm').AsString:=GetStr(RzButtonEdit1.Text,'/',True);
    FieldByName('jhdhrq').AsString:=RzDateTimeEdit1.Text;
    FieldByName('lrrq').AsString:=DateTimeToStr(Date());
    FieldByName('lrr').AsString:=GName;
    Post;
  end;

  Close;
end;

procedure TFdhjh.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
