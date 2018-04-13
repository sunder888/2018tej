unit UCpass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TFCpass = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCpass: TFCpass;

implementation

uses UDM;

{$R *.dfm}

procedure TFCpass.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

//更改密码
procedure TFCpass.BitBtn1Click(Sender: TObject);
begin
  if trim(Edit1.Text)=trim(Edit2.Text) then
  begin
    DM.QRead.Edit;
    DM.QRead.FieldByName('yhmm').AsString:=trim(Edit1.Text);
    DM.QRead.Post;
    Close;
  end
  else
    Application.MessageBox('输入口令不一致，请再试一次!!', '警告', MB_OK + MB_ICONWARNING);
end;

procedure TFCpass.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    self.Perform(CM_DialogKey, VK_TAB, 0);
  end;
end;

end.
