unit UcldaEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, Mask, RzEdit, RzCmboBx, RzRadChk, RzBtnEdt;

type
  TFcldaEdit = class(TFBaseEdit)
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzComboBox1: TRzComboBox;
    RzEdit4: TRzEdit;
    RzPageControl2: TRzPageControl;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    RzCheckBox1: TRzCheckBox;
    RzButtonEdit1: TRzButtonEdit;
    RzNumericEdit1: TRzNumericEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ADOQuery2: TADOQuery;
    TabSheet4: TRzTabSheet;
    Label8: TLabel;
    RzEdit5: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzEdit4Change(Sender: TObject);
    procedure RzComboBox1DropDown(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1Exit(Sender: TObject);
    procedure RzButtonEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcldaEdit: TFcldaEdit;

implementation

uses UDM, UGlobal, Ucldasel;

{$R *.dfm}


procedure TFcldaEdit.FormShow(Sender: TObject);
begin
  inherited;
  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit1.Enabled:=True;
    RzEdit1.Color:=clWhite;
    RzEdit2.Text:='';
    RzEdit3.Text:='';
    RzComboBox1.Items.Clear;
    RzCheckBox1.Checked:=False;
    RzButtonEdit1.Text:='';
    RzNumericEdit1.Text:='0.00';

    RzEdit1.SetFocus;
  end;

  if zt='修改' then
  begin
    RzEdit1.Enabled:=False;
    RzEdit2.SetFocus;

    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from clda where id='+QuotedStr(SelSSQL));
      Open;

      RzEdit1.Text:=FieldByName('clbm').AsString;
      RzEdit2.Text:=FieldByName('clmc').AsString;
      RzEdit3.Text:=FieldByName('clgg').AsString;
      RzComboBox1.Items.Clear;
      RzComboBox1.Items.Add(FieldByName('clddbm').AsString+'/'+GetFieldStr('chfl',FieldByName('clddbm').AsString,'flbm','flmc'));
      RzComboBox1.ItemIndex:=0;
      RzEdit4.Text:=FieldByName('dylx').AsString;

      if FieldByName('sfct').AsBoolean=true then
        RzCheckBox1.Checked:=True
      else
        RzCheckBox1.Checked:=False;

      RzButtonEdit1.Text:=FieldByName('dyms').AsString+'/'+GetFieldStr('clda',FieldByName('dyms').AsString,'clbm','clmc');
      RzNumericEdit1.Text:=FieldByName('msgs').AsString;
      RzEdit5.Text:=FieldByName('dw').AsString;
    end;    // with
  end;
end;

procedure TFcldaEdit.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if RzEdit1.Text='' then
  begin
    MessageBox(0,'材料编码不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit1.SetFocus;
    Exit;
  end;

  if RzEdit2.Text='' then
  begin
    MessageBox(0,'材料名称不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit2.SetFocus;
    Exit;
  end;

  if RzComboBox1.Text='' then
  begin
    MessageBox(0,'大类名称不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit2.SetFocus;
    Exit;
  end;

  if RzEdit5.Text='' then
  begin
    MessageBox(0,'单位不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzEdit5.SetFocus;
    Exit;
  end;  

  if RzEdit1.Enabled=True then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM clda where clbm ='+QuotedStr(RzEdit1.Text));
      Open;
      
      if RecordCount=0 then
      else
      begin
        MessageBox(0,'材料编码已经存在！！','注意',MB_OK+MB_ICONINFORMATION);
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
      SQL.Add('SELECT * FROM clda where clbm ='+QuotedStr(RzEdit1.Text));
      Open;

      Edit;
    end;    // with
  end;

  ADOQuery1.FieldByName('clbm').AsString:=RzEdit1.Text;
  ADOQuery1.FieldByName('clmc').AsString:=RzEdit2.Text;
  ADOQuery1.FieldByName('clgg').AsString:=RzEdit3.Text;
  ADOQuery1.FieldByName('clddbm').AsString:=GetStr(RzComboBox1.Text,'/',True);
  ADOQuery1.FieldByName('dylx').AsString:=RzEdit4.Text;
  ADOQuery1.FieldByName('sfct').AsBoolean:=RzCheckBox1.Checked;
  ADOQuery1.FieldByName('dyms').AsString:=GetStr(RzButtonEdit1.Text,'/',True);
  ADOQuery1.FieldByName('msgs').AsString:=RzNumericEdit1.Text;
  ADOQuery1.FieldByName('dw').AsString:=RzEdit5.Text;
  ADOQuery1.Post;

  if zt='新增' then
  begin
    RzEdit1.Text:='';
    RzEdit1.Enabled:=True;
    RzEdit2.Text:='';
    RzEdit3.Text:='';
    RzEdit4.Text:='';
    RzCheckBox1.Checked:=False;
    RzComboBox1.Items.Clear;
    RzButtonEdit1.Text:='';
    RzNumericEdit1.Text:='0.00';
  end;

  if zt='修改' then
  begin
    Close;
  end; 
end;

procedure TFcldaEdit.RzEdit4Change(Sender: TObject);
begin
  inherited;
  if RzEdit4.Text='辅料' then
  begin
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=True;
    RzPageControl2.ActivePage:=TabSheet4;
  end;
  if RzEdit4.Text='棉纱' then
  begin
    TabSheet2.TabVisible:=False;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=True;
    RzPageControl2.ActivePage:=TabSheet4;
  end;
  if RzEdit4.Text='经销面料' then
  begin
    TabSheet2.TabVisible:=True;
    TabSheet3.TabVisible:=False;
    TabSheet4.TabVisible:=False;
    RzPageControl2.ActivePage:=TabSheet2;
  end;
  if RzEdit4.Text='外协面料' then
  begin
    //TabSheet2.TabVisible:=False;
    //TabSheet3.TabVisible:=True;
    //TabSheet4.TabVisible:=False;
    //RzPageControl2.ActivePage:=TabSheet3;
  end; 

end;

procedure TFcldaEdit.RzComboBox1DropDown(Sender: TObject);
begin
  inherited;
  RzComboBox1.Items.Clear;
  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from chfl order by flbm');
    Open;

    while not Eof do
    begin
      RzComboBox1.Items.Add(FieldByName('flbm').AsString+'/'+FieldByName('flmc').AsString); 

      Next;
    end; 
  end;
end;

procedure TFcldaEdit.RzComboBox1Change(Sender: TObject);
begin
  inherited;
  RzEdit4.Text:=GetFieldStr('chfl',GetStr(RzComboBox1.Text,'/',True),'flbm','lx');
end;

procedure TFcldaEdit.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  invsel:='棉纱';
  SelSSQL:=RzButtonEdit1.Text;

  FcldaSel:=TFcldaSel.Create(Application);
  FcldaSel.ShowModal;
  FcldaSel.Free;

  RzButtonEdit1.Text:=SelSSQL;
end;

procedure TFcldaEdit.RzButtonEdit1Exit(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=RzButtonEdit1.Text+'/'+GetFieldStr('V_clda',RzButtonEdit1.Text,'材料编码','材料名称');
end;

procedure TFcldaEdit.RzButtonEdit1Enter(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=GetStr(RzButtonEdit1.Text,'/',True);
end;

end.
