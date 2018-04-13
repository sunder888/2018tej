unit UchflEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, ComCtrls, dxtree, dxdbtree, Buttons, RzCmboBx, Mask, RzEdit;

type
  TFchfledit = class(TFBaseEdit)
    dxDBTreeView1: TdxDBTreeView;
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RzToolButton5: TRzToolButton;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzComboBox1: TRzComboBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure RzToolButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBTreeView1Click(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton2Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure RzEdit1Change(Sender: TObject);
    procedure RzToolButton5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LiuLan;
    procedure XinZen;
    procedure XiuGai;
    procedure DataToFrom;
  public
    { Public declarations }
  end;

var
  Fchfledit: TFchfledit;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFchfledit.RzToolButton4Click(Sender: TObject);
begin
  DM.QTree.Close;
  DM.QTree.SQL.Clear;
  DM.QTree.SQL.Add('SELECT flbm,flbm+''/''+flmc as flmc,ffl FROM chfl order by flbm');
  DM.QTree.Open;
  dxDBTreeView1.DataSource:=DM.STree;
  dxDBTreeView1.KeyField:='flbm';
  dxDBTreeView1.ListField:='flmc';
  dxDBTreeView1.ParentField:='ffl';
  //展开目录树
  dxDBTreeView1.FullExpand;
  Liulan;
end;

procedure TFchflEdit.LiuLan;
begin
  RzEdit1.Enabled:=False;
  RzEdit2.Enabled:=False;
  BitBtn1.Enabled:=False;
  RzComboBox1.Enabled:=False;
end;

procedure TFchflEdit.XinZen;
begin
  RzEdit1.Enabled:=True;
  RzEdit2.Enabled:=True;
  BitBtn1.Enabled:=True;
  RzComboBox1.Enabled:=True;

  RzEdit1.Text:='';
  RzEdit2.Text:='';  
end;

procedure TFchflEdit.XiuGai;
begin
  RzEdit1.Enabled:=False;
  RzEdit2.Enabled:=True;
  BitBtn1.Enabled:=True;
  RzComboBox1.Enabled:=True;
end;

procedure TFchflEdit.DataToFrom;
begin
  if dxDBTreeView1.Selected.Text<>'' then
  begin
    Liulan;
    RzEdit1.Text:=GetStr(dxDBTreeView1.Selected.Text,'/',True);
    RzEdit2.Text:=GetStr(dxDBTreeView1.Selected.Text,'/',False);
    //ShowMessage(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text));
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='经销面料' then
      RzComboBox1.ItemIndex:=0;
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='外协面料' then
      RzComboBox1.ItemIndex:=1;
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='辅料' then
      RzComboBox1.ItemIndex:=2;
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='棉纱' then
      RzComboBox1.ItemIndex:=3;
  end;
end;

procedure TFchfledit.FormShow(Sender: TObject);
begin
  inherited;
  RzToolButton4.Click;
  Liulan;
end;

procedure TFchfledit.dxDBTreeView1Click(Sender: TObject);
begin
  inherited;
  DataToFrom;
end;

procedure TFchfledit.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  XinZen;
end;

procedure TFchfledit.RzToolButton2Click(Sender: TObject);
begin
  inherited;
  XiuGai;
end;

procedure TFchfledit.RzToolButton3Click(Sender: TObject);
begin
  inherited;
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM inventory where cinvccode='+QuotedStr(RzEdit1.Text));
    Open;

    if RecordCount>0 then
    begin
      Application.MessageBox('该分类已经使用，不可删除!!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM chfl where flbm like '+QuotedStr(RzEdit1.Text+'%'));
    Open;

    if RecordCount>1 then
    begin
      Application.MessageBox('该分类有下级，不可删除!!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
      

    if messagedlg('是否真要删除此条数据？',mtwarning,[mbyes,mbcancel],0)=mryes then
      try
        Close;
        SQL.Clear;
        SQL.Add('delete from chfl where flbm='+QuotedStr(RzEdit1.Text));
        Execsql;
      except
        messagedlg('删除数据时出错！',mterror,[mbok],0);
      end;

  end;

  RzToolButton4.Click;
end;

procedure TFchfledit.RzEdit1Change(Sender: TObject);
begin
  inherited;
  if length(RzEdit1.Text)>2 then
  begin
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='经销面料' then
      RzComboBox1.ItemIndex:=0;
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='外协面料' then
      RzComboBox1.ItemIndex:=1;
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='辅料' then
      RzComboBox1.ItemIndex:=2;
    if GetStr(bmtomc('chfl','flbm','lx',RzEdit1.Text,RzEdit1.Text),'/',False)='棉纱' then
      RzComboBox1.ItemIndex:=3;
  end;  
end;

procedure TFchfledit.RzToolButton5Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFchfledit.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if RzEdit1.Text='' then
  begin
    MessageBox(0,'产品分类编码不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit1.SetFocus;
    Exit;
  end;

  if RzEdit2.Text='' then
  begin
    MessageBox(0,'产品分类名称不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit2.SetFocus;
    Exit;
  end;

  if pos('/',RzEdit2.Text)<>0 then
  begin
    ShowMessage('产品分类名称中不能有/');
    Exit;
  end;

  if Round(length(RzEdit1.Text)/2)<>length(RzEdit1.Text)/2 then
  begin
    ShowMessage('产品分类编码的长度必须为2的倍数');
    Exit;
  end;

  if RzComboBox1.Text='' then
  begin
    ShowMessage('分类类型不能为空！');
    Exit;
  end;

  if RzEdit1.Enabled=True then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from chfl where flbm='+QuotedStr(RzEdit1.Text));
      Open;

      if RecordCount>0 then
      begin
        ShowMessage('已经存在相同编码分类！');
        Exit;
      end;  

      if length(RzEdit1.Text)<>2 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from chfl where flbm='+QuotedStr(copy(RzEdit1.Text,0,length(RzEdit1.Text)-2)));
        Open;

        if RecordCount=0 then
        begin
          ShowMessage('产品编码的上级编码不存在，请检查！');
          Exit;
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from chfl where flbm=''1''');
      Open;
      Append;
      FieldByName('flbm').AsString:=RzEdit1.Text;
      FieldByName('flmc').AsString:=RzEdit2.Text;
      FieldByName('ffl').AsString:=copy(RzEdit1.Text,0,length(RzEdit1.Text)-2);
      FieldByName('lx').AsString:=RzComboBox1.Text;
      Post;
    end;    // with
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from chfl where flbm='+QuotedStr(RzEdit1.Text));
      Open;
      Edit;
      FieldByName('flmc').AsString:=RzEdit2.Text;
      FieldByName('lx').AsString:=RzComboBox1.Text;
      Post;
    end;
  end;

  RzToolButton4.Click;
end;

end.
