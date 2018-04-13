unit Uwxlchbjm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, RzEdit, RzBtnEdt, RzCmboBx, Mask, RzLabel;

type
  TFwxlchbjm = class(TFBaseEdit)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
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
    RzComboBox1: TRzComboBox;
    RzLabel9: TRzLabel;
    RzButtonEdit1: TRzButtonEdit;
    RzLabel11: TRzLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    Label1: TLabel;
    RzEdit8: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fwxlchbjm: TFwxlchbjm;

implementation

uses UGlobal;

{$R *.dfm}

procedure TFwxlchbjm.FormShow(Sender: TObject);
begin
  inherited;
  RzDateTimeEdit1.Date:=Now();
  RzEdit1.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','������');
  RzEdit2.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','���ϱ���');
  RzEdit3.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','��������');
  RzEdit4.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','�ŷ�');
  RzEdit5.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','����');
  RzEdit6.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','��ɫ');
  RzEdit7.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','��Ӧ����');
  RzComboBox1.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','��Ӧ�׶�');
  RzButtonEdit1.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','��Ӧ�̱���')+'/'+GetFieldStr('V_mfljh_yt',SelSSQL,'id','��Ӧ��');
  RzEdit8.Text:=GetFieldStr('V_mfljh_yt',SelSSQL,'id','��ɴ����')+'/'+GetFieldStr('V_mfljh_yt',SelSSQL,'id','��ɴ����');

end;

procedure TFwxlchbjm.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFwxlchbjm.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if (RzNumericEdit1.Text='') or (RzNumericEdit1.Text='0.00') then
  begin
    ShowMessage('������������');
    Exit;
  end;

  if RzDateTimeEdit1.Text='' then
  begin
    ShowMessage('���������ڣ�');
    Exit;
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from wxlc where id=1');
    Open;
    Append;
    FieldByName('ddh').AsString:=RzEdit1.Text;
    FieldByName('dylx').AsString:=RzEdit7.Text;
    FieldByName('clbm').AsString:=RzEdit2.Text;
    FieldByName('mf').AsString:=RzEdit4.Text;
    FieldByName('kz').AsString:=RzEdit5.Text;
    FieldByName('ys').AsString:=RzEdit6.Text;
    FieldByName('sl').AsString:=RzNumericEdit1.Text;
    FieldByName('dyjd').AsString:=RzComboBox1.Text;
    FieldByName('gysbm').AsString:=GetStr(RzButtonEdit1.Text,'/',True);
    FieldByName('hbrq').AsString:=RzDateTimeEdit1.Text;
    FieldByName('lrrq').AsString:=DateTimeToStr(Date());
    FieldByName('lrr').AsString:=GName;
    FieldByName('msbm').AsString:=GetStr(RzEdit8.Text,'/',True);
    Post;
  end;

  Close;
end;

procedure TFwxlchbjm.RzComboBox1Change(Sender: TObject);
begin
  inherited;
  if (RzComboBox1.Text='֯��ƻ�') or (RzComboBox1.Text='Ⱦɫ�ƻ�') then
  begin
    RzEdit8.Text:='';
  end;
end;

end.
