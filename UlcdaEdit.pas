unit UlcdaEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, Mask, RzEdit, RzLabel;

type
  TFlcdaEdit = class(TFBaseEdit)
    RzLabel2: TRzLabel;
    RzEdit1: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlcdaEdit: TFlcdaEdit;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFlcdaEdit.FormShow(Sender: TObject);
begin
  inherited;
  Label1.Caption:=zt;
  Label2.Caption:=SelSSQL;  

  if zt='新增' then
  begin
    RzEdit1.Text:='';

    RzEdit1.SetFocus;
  end;

  if zt='修改' then
  begin
    RzEdit1.Enabled:=True;

    with DM.QRead do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from lcda where id='+QuotedStr(SelSSQL));
      Open;

      RzEdit1.Text:=FieldByName('lcda').AsString;

    end;    // with
  end;
end;

procedure TFlcdaEdit.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if RzEdit1.Text='' then
  begin
    MessageBox(0,'流程名称不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit1.SetFocus;
    Exit;
  end;

  if  Label1.Caption='新增' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM lcda where lcda ='+QuotedStr(RzEdit1.Text));
      Open;
      
      if RecordCount=0 then
      else
      begin
        MessageBox(0,'流程名称已经存在！！','注意',MB_OK+MB_ICONINFORMATION);
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
      SQL.Add('SELECT * FROM lcda where id ='+QuotedStr(Label2.Caption));
      Open;

      Edit;
    end;    // with
  end;

  ADOQuery1.FieldByName('lcda').AsString:=RzEdit1.Text;

  ADOQuery1.Post;

  if zt='新增' then
  begin
    RzEdit1.Text:='';
  end;

  if zt='修改' then
  begin
    Close;
  end; 
end;

end.
