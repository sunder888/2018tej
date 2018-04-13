unit UewbEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, Mask, RzEdit;

type
  TFewbEdit = class(TFBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FewbEdit: TFewbEdit;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFewbEdit.FormShow(Sender: TObject);
begin
  inherited;
  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit2.Text:='';
    RzEdit3.Text:='';
    RzEdit4.Text:='';
    RzEdit5.Text:='';

    RzEdit1.SetFocus;
  end;

  if zt='修改' then
  begin
    with DM.QRead do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ewbda where id='+QuotedStr(SelSSQL));
      Open;

      RzEdit1.Text:=FieldByName('ewbfl').AsString;
      RzEdit2.Text:=FieldByName('ewbda').AsString;
      RzEdit3.Text:=FieldByName('sh').AsString;
      RzEdit4.Text:=FieldByName('yin').AsString;
      RzEdit5.Text:=FieldByName('ri').AsString;

      CheckBox1.Checked:=FieldByName('sfys').AsBoolean;
    end;    // with
  end;
end;

procedure TFewbEdit.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if RzEdit1.Text='' then
  begin
    MessageBox(0,'二维表分类不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit1.SetFocus;
    Exit;
  end;

  if RzEdit2.Text='' then
  begin
    MessageBox(0,'二维表档案不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit2.SetFocus;
    Exit;
  end;

  if CheckBox1.Checked then
  begin
    if RzEdit3.Text='' then
    begin
      MessageBox(0,'色号不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
      RzEdit3.SetFocus;
      Exit;
    end;
  end;

  if SelSSQL='' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ewbda where ewbfl ='+QuotedStr(RzEdit1.Text)+' and ewbda='+QuotedStr(RzEdit2.Text));
      Open;
      
      if RecordCount=0 then
      else
      begin
        MessageBox(0,'该记录已经存在！！','注意',MB_OK+MB_ICONINFORMATION);
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
      SQL.Add('SELECT * FROM ewbda where id ='+SelSSQL);
      Open;

      Edit;
    end;    // with
  end;

  ADOQuery1.FieldByName('ewbfl').AsString:=RzEdit1.Text;
  ADOQuery1.FieldByName('ewbda').AsString:=RzEdit2.Text;
  ADOQuery1.FieldByName('sh').AsString:=RzEdit3.Text;
  ADOQuery1.FieldByName('yin').AsString:=RzEdit4.Text;
  ADOQuery1.FieldByName('ri').AsString:=RzEdit5.Text;
  ADOQuery1.FieldByName('sfys').AsBoolean:=CheckBox1.Checked;
  ADOQuery1.Post;

  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit2.Text:='';
    RzEdit3.Text:='';
    RzEdit4.Text:='';
    RzEdit5.Text:='';
  end;

  if zt='修改' then
  begin
    Close;
  end; 
end;

procedure TFewbEdit.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
    GroupBox1.Visible:=True;
    RzEdit1.Text:='颜色';
    RzEdit1.Enabled:=False;
  end
  else
  begin
    GroupBox1.Visible:=False;
    RzEdit1.Text:='';
    RzEdit1.Enabled:=True;    
  end;
end;

end.
