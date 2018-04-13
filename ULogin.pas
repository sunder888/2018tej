unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,UGlobal, ExtCtrls, jpeg,INIFiles;

type
  TFLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Dec(Str: string): string;
  public
    { Public declarations }
    Ssa,Syh:String;
  end;

var
  FLogin: TFLogin;
  Times:integer;
const 
   XorKey: array[0..7] of Byte = ($B2, $09, $BB, $55, $93, $6D, $44, $47); //�ַ��������� 

implementation

uses
  UDM, UMain, UCpass;

{$R *.dfm}


function TFLogin.Dec(Str: string): string; //�ַ����ܺ���
var 
   i, j: Integer; 
begin 
   Result := ''; 
   j := 0; 
   for i := 1 to Length(Str) div 2 do 
   begin 
      Result := Result + Char(StrToInt('$' + Copy(Str, i * 2 - 1, 2)) xor XorKey[j]); 
      j := (j + 1) mod 8; 
   end; 
end; 

//���Ĵ����С
procedure TFLogin.BitBtn5Click(Sender: TObject);
var
  Temp:String;
begin
  DM.Conn.Connected:=False;
  Temp:=Edit2.Text;

  DM.Conn.ConnectionString:='Provider=SQLOLEDB.1;Password='+Ssa+';Persist Security Info=False;User ID=jf;Initial Catalog=jfdata;Data Source='+Edit2.Text+';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';
                                                                      
  Try
    Dm.Conn.Connected:=true;
    FLogin.Height:=150;
  Except
    MessageBox(Application.handle,'������������ȷ���߁Gʧ!!!',pchar('��Ϣ����'),mb_IconInformation+mb_OK);
  End;
end;

procedure TFLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    self.Perform(CM_DialogKey, VK_TAB, 0);
  end;
end;

procedure TFLogin.FormShow(Sender: TObject);
var
  IniFile:TInifile;
begin
  IniFile:=TiniFile.Create(ExtractFilePath(Paramstr(0))+'path.ini');
  Edit2.Text:=IniFile.ReadString('���','·��','');
  Ssa:=IniFile.ReadString('���','sa','');
  Edit3.Text:=IniFile.ReadString('���','�û�','');
  Ssa:=Dec(Ssa);

  IniFile.Free;
end;

procedure TFLogin.Label3Click(Sender: TObject);
begin
  
  jqm:=ComputerName();

  DM.Conn.Connected:=False;
  if Edit2.Text<>'' then
  begin
    DM.Conn.ConnectionString:='Provider=SQLOLEDB.1;Password='+Ssa+';Persist Security Info=False;User ID=jf;Initial Catalog=jfdata;Data Source='+Edit2.Text+';Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';

    Try
      Dm.Conn.Connected:=true;
    Except
      MessageBox(Application.handle,'������������ȷ���߁Gʧ!!!',pchar('��Ϣ����'),mb_IconInformation+mb_OK);
    End;
  end
  else
    MessageBox(Handle,'���������÷���������','ע��',MB_OK);

  Edit3.SetFocus;

  Times:=Times+1;
  With DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From yhb Where (yhxm='+QuotedStr(Edit3.Text)+' or yhbm='+QuotedStr(Edit3.Text)+') and yhmm= '+QuotedStr(Edit1.Text));
    Open;

    if RecordCount=1 then
    begin
      if CheckBox1.Checked then
      begin
        Application.CreateForm(TFCpass, FCpass);
        FCpass.ShowModal;
        FCpass.Free;
      end;

      GId:=FieldByName('yhbm').AsString;

      Modalresult:=1;
    end
    else
    begin
      if times=3 then
      begin
        //showmessage('�Ƿ��û�����һ���˳�ϵͳ');
        Messagebox(handle,'�Ƿ��û�����һ���˳�ϵͳ','',0);
        Modalresult:=0;
        Application.Terminate;
      end;
      ShowMessage('���棡�����������');
      Edit1.Text:='';
      Edit1.SetFocus;
      Modalresult:=0;
    end;
  end;
end;

procedure TFLogin.Label4Click(Sender: TObject);
begin
  ModalResult:=0;
  Close;
end;

procedure TFLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  //if key=#13 then

end;

end.
