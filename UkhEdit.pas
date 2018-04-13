unit UkhEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, Mask, RzEdit, RzRadChk, RzLabel;

type
  TFkhEdit = class(TFBaseEdit)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzCheckBox1: TRzCheckBox;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    RzEdit6: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FkhEdit: TFkhEdit;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFkhEdit.FormShow(Sender: TObject);
begin
  inherited;
  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit1.Enabled:=True;
    RzEdit1.Color:=clWhite;
    RzEdit2.Text:='';
    RzEdit4.Text:='';
    RzEdit5.Text:='';
    RzEdit6.Text:='';
    RzCheckBox1.Checked:=False;

    RzEdit1.SetFocus;
  end;

  if zt='修改' then
  begin
    RzEdit1.Enabled:=False;
    RzEdit1.Color:=clBtnFace;
    RzEdit2.SetFocus;

    with DM.QRead do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from khda where khbm='+QuotedStr(SelSSQL));
      Open;

      RzEdit1.Text:=FieldByName('khbm').AsString;
      RzEdit2.Text:=FieldByName('khmc').AsString;
      RzEdit4.Text:=FieldByName('khdz').AsString;
      RzEdit5.Text:=FieldByName('khdybm').AsString;
      RzEdit6.Text:=FieldByName('khdyywy').AsString;
      //RzComboBox1.Text:=FieldByName('ssxm').AsString;
      if FieldByName('sfty').AsBoolean=true then
        RzCheckBox1.Checked:=True
      else
        RzCheckBox1.Checked:=False;        

    end;    // with
  end;
end;

procedure TFkhEdit.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if RzEdit1.Text='' then
  begin
    MessageBox(0,'客户编码不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit1.SetFocus;
    Exit;
  end;

  if RzEdit2.Text='' then
  begin
    MessageBox(0,'客户名称不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit2.SetFocus;
    Exit;
  end;

  if RzEdit1.Enabled=True then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM khda where khbm ='+QuotedStr(RzEdit1.Text));
      Open;
      
      if RecordCount=0 then
      else
      begin
        MessageBox(0,'客户编码已经存在！！','注意',MB_OK+MB_ICONINFORMATION);
        RzEdit1.SetFocus;
        Exit;
      end;
      Append;
    end;    // with
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM khda where khbm ='+QuotedStr(RzEdit1.Text));
      Open;

      Edit;
    end;    // with
  end;

  ADOQuery1.FieldByName('khbm').AsString:=RzEdit1.Text;
  ADOQuery1.FieldByName('khmc').AsString:=RzEdit2.Text;
  ADOQuery1.FieldByName('khdz').AsString:=RzEdit4.Text;
  ADOQuery1.FieldByName('khdybm').AsString:=RzEdit5.Text;
  ADOQuery1.FieldByName('khdyywy').AsString:=RzEdit6.Text;
  ADOQuery1.FieldByName('sfty').AsBoolean:=RzCheckBox1.Checked;
  ADOQuery1.Post;

  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit1.Enabled:=True;
    RzEdit1.Color:=clWhite;
    RzEdit2.Text:='';
    RzEdit4.Text:='';
    RzEdit5.Text:='';
    RzEdit6.Text:='';
    RzCheckBox1.Checked:=False;
  end;

  if zt='修改' then
  begin
    Close;
  end; 
end;

end.
