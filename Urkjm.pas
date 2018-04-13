unit Urkjm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, RzEdit, RzBtnEdt, RzCmboBx, Mask, RzLabel;

type
  TFrkjm = class(TFBaseEdit)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel8: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzEdit6: TRzEdit;
    RzNumericEdit1: TRzNumericEdit;
    RzLabel10: TRzLabel;
    RzEdit7: TRzEdit;
    RzLabel11: TRzLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    Label1: TLabel;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frkjm: TFrkjm;

implementation

uses UGlobal;

{$R *.dfm}

procedure TFrkjm.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrkjm.RzBitBtn1Click(Sender: TObject);
begin

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
    SQL.Add('select * from mflrk where id=1');
    Open;
    Append;
    FieldByName('ddh').AsString:=RzEdit1.Text;
    FieldByName('dylx').AsString:=RzEdit7.Text;
    FieldByName('clbm').AsString:=RzEdit2.Text;
    FieldByName('mf').AsString:=RzEdit4.Text;
    FieldByName('kz').AsString:=RzEdit5.Text;
    FieldByName('ys').AsString:=RzEdit6.Text;
    FieldByName('sl').AsString:=RzNumericEdit1.Text;
    FieldByName('rkrq').AsString:=RzDateTimeEdit1.Text;
    FieldByName('lrrq').AsString:=DateTimeToStr(Date());
    FieldByName('lrr').AsString:=GName;
    FieldByName('jhbsid').AsString:=Label1.Caption;
    Post;
  end;

  Close;
end;

procedure TFrkjm.FormShow(Sender: TObject);
begin
  inherited;
  Label1.Caption:=SelSSQL;

  RzDateTimeEdit1.Date:=Now();
  RzEdit1.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','订单号');
  //RzEdit2.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','材料编码');
  RzEdit3.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','材料名称');
  //RzEdit4.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','门幅');
  //RzEdit5.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','克重');
  //RzEdit6.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','颜色');
  RzEdit7.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','对应类型');
end;

end.
