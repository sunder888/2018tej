unit UgysEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, Mask, RzEdit, RzLabel, RzRadChk;

type
  TFgysEdit = class(TFBaseEdit)
    RzCheckBox1: TRzCheckBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
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
  FgysEdit: TFgysEdit;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFgysEdit.FormShow(Sender: TObject);
begin
  inherited;
  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit1.Enabled:=True;
    RzEdit1.Color:=clWhite;
    RzEdit2.Text:='';
    RzEdit3.Text:='';
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
      SQL.Add('select * from gysda where gysbm='+QuotedStr(SelSSQL));
      Open;

      RzEdit1.Text:=FieldByName('gysbm').AsString;
      RzEdit2.Text:=FieldByName('gysmc').AsString;
      RzEdit3.Text:=FieldByName('gysjm').AsString;
      RzEdit4.Text:=FieldByName('gysdz').AsString;
      RzEdit5.Text:=FieldByName('gyslxr').AsString;
      RzEdit6.Text:=FieldByName('gysdh').AsString;
      //RzComboBox1.Text:=FieldByName('ssxm').AsString;
      if FieldByName('sfty').AsBoolean=true then
        RzCheckBox1.Checked:=True
      else
        RzCheckBox1.Checked:=False;        

    end;    // with
  end;
end;

procedure TFgysEdit.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if RzEdit1.Text='' then
  begin
    MessageBox(0,'供应商编码不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit1.SetFocus;
    Exit;
  end;

  if RzEdit2.Text='' then
  begin
    MessageBox(0,'供应商名称不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit2.SetFocus;
    Exit;
  end;

  if RzEdit1.Enabled=True then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM gysda where gysbm ='+QuotedStr(RzEdit1.Text));
      Open;
      
      if RecordCount=0 then
      else
      begin
        MessageBox(0,'供应商编码已经存在！！','注意',MB_OK+MB_ICONINFORMATION);
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
      SQL.Add('SELECT * FROM gysda where gysbm ='+QuotedStr(RzEdit1.Text));
      Open;

      Edit;
    end;    // with
  end;

  ADOQuery1.FieldByName('gysbm').AsString:=RzEdit1.Text;
  ADOQuery1.FieldByName('gysmc').AsString:=RzEdit2.Text;
  ADOQuery1.FieldByName('gysjm').AsString:=RzEdit3.Text;
  ADOQuery1.FieldByName('gysdz').AsString:=RzEdit4.Text;
  ADOQuery1.FieldByName('gyslxr').AsString:=RzEdit5.Text;
  ADOQuery1.FieldByName('gysdh').AsString:=RzEdit6.Text;
  ADOQuery1.FieldByName('sfty').AsBoolean:=RzCheckBox1.Checked;
  ADOQuery1.Post;

  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit1.Enabled:=True;
    RzEdit1.Color:=clWhite;
    RzEdit2.Text:='';
    RzEdit3.Text:='';
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
