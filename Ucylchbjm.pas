unit Ucylchbjm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, RzEdit, RzBtnEdt, RzCmboBx, Mask, RzLabel;

type
  TFcylchbjm = class(TFBaseEdit)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel11: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzNumericEdit1: TRzNumericEdit;
    RzComboBox1: TRzComboBox;
    RzDateTimeEdit1: TRzDateTimeEdit;
    Label1: TLabel;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcylchbjm: TFcylchbjm;

implementation

uses UGlobal;

{$R *.dfm}

procedure TFcylchbjm.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFcylchbjm.FormShow(Sender: TObject);
var
  stl:Tstringlist;
  i:Integer;
begin
  inherited;
  Label1.Caption:=SelSSQL;

  RzDateTimeEdit1.Date:=Now();
  RzEdit1.Text:=GetFieldStr('V_xsdds',SelSSQL,'id','订单号');
  RzEdit2.Text:=GetFieldStr('V_xsdds',SelSSQL,'id','款号');
  RzEdit3.Text:=GetFieldStr('V_xsdds',SelSSQL,'id','品名');
  RzEdit4.Text:=GetFieldStr('V_xsdds',SelSSQL,'id','行标题');
  RzEdit5.Text:=GetFieldStr('V_xsdds',SelSSQL,'id','列标题');

  RzComboBox1.Items.Clear;
  stl:= Tstringlist.Create();
  stl.Delimiter:=',';
  stl.CommaText:=xlk;
  for i:=0 to stl.Count-1 do
  begin
    RzComboBox1.Items.Add(stl.Strings[i]);
  end;

  RzComboBox1.ItemIndex:=0;
end;

procedure TFcylchbjm.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
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
    SQL.Add('select * from cylc where id=1');
    Open;
    Append;
    FieldByName('ddh').AsString:=RzEdit1.Text;
    FieldByName('kh').AsString:=RzEdit2.Text;
    FieldByName('pm').AsString:=RzEdit3.Text;
    FieldByName('hbt').AsString:=RzEdit4.Text;
    FieldByName('lbt').AsString:=RzEdit5.Text;
    
    FieldByName('sl').AsString:=RzNumericEdit1.Text;
    FieldByName('dyjd').AsString:=RzComboBox1.Text;
    FieldByName('hbrq').AsString:=RzDateTimeEdit1.Text;
    FieldByName('lrrq').AsString:=DateTimeToStr(Date());
    FieldByName('lrr').AsString:=GName;
    FieldByName('xsddsid').AsString:=Label1.Caption;
    Post;
  end;

  Close;
end;

end.
