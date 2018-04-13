unit UwxdzbEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseEdit, DB, ADODB, RzButton, ExtCtrls, RzPanel, RzTabs,
  StdCtrls, RzEdit, Mask, RzBtnEdt, ComCtrls;

type
  TFwxdzbEdit = class(TFBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    RzButtonEdit1: TRzButtonEdit;
    RzNumericEdit1: TRzNumericEdit;
    Label3: TLabel;
    RzButtonEdit2: TRzButtonEdit;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    RzNumericEdit2: TRzNumericEdit;
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1Enter(Sender: TObject);
    procedure RzButtonEdit1Exit(Sender: TObject);
    procedure RzButtonEdit2ButtonClick(Sender: TObject);
    procedure RzButtonEdit2Enter(Sender: TObject);
    procedure RzButtonEdit2Exit(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FwxdzbEdit: TFwxdzbEdit;

implementation

uses Ucldasel, UGlobal;

{$R *.dfm}

procedure TFwxdzbEdit.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  invsel:='棉纱';
  SelSSQL:=RzButtonEdit1.Text;

  FcldaSel:=TFcldaSel.Create(Application);
  FcldaSel.ShowModal;
  FcldaSel.Free;

  RzButtonEdit1.Text:=SelSSQL;
end;

procedure TFwxdzbEdit.RzButtonEdit1Enter(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=GetStr(RzButtonEdit1.Text,'/',True);
end;

procedure TFwxdzbEdit.RzButtonEdit1Exit(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=RzButtonEdit1.Text+'/'+GetFieldStr('V_clda',RzButtonEdit1.Text,'材料编码','材料名称');
end;

procedure TFwxdzbEdit.RzButtonEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  invsel:='外协面料';
  SelSSQL:=RzButtonEdit2.Text;

  FcldaSel:=TFcldaSel.Create(Application);
  FcldaSel.ShowModal;
  FcldaSel.Free;

  RzButtonEdit2.Text:=SelSSQL;
end;

procedure TFwxdzbEdit.RzButtonEdit2Enter(Sender: TObject);
begin
  inherited;
  RzButtonEdit2.Text:=GetStr(RzButtonEdit2.Text,'/',True);
end;

procedure TFwxdzbEdit.RzButtonEdit2Exit(Sender: TObject);
begin
  inherited;
  RzButtonEdit2.Text:=RzButtonEdit2.Text+'/'+GetFieldStr('V_clda',RzButtonEdit2.Text,'材料编码','材料名称');
end;

procedure TFwxdzbEdit.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  if RzButtonEdit2.Text='' then
  begin
    MessageBox(0,'外协面料不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzButtonEdit2.SetFocus;
    Exit;
  end;

  if RzButtonEdit1.Text='' then
  begin
    MessageBox(0,'对应棉纱不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzButtonEdit1.SetFocus;
    Exit;
  end;

  if  RzNumericEdit1.Text='0.00' then
  begin
    MessageBox(0,'棉纱公式不能为空！！','注意',MB_OK+MB_ICONINFORMATION);
    RzNumericEdit1.SetFocus;
    Exit;
  end;

  if (RzNumericEdit2.Value=0) or (RzNumericEdit2.Value>100) then
  begin
    MessageBox(0,'棉纱比例不能为0或大于100！！','注意',MB_OK+MB_ICONINFORMATION);
    RzNumericEdit1.SetFocus;
    Exit;
  end;

  if zt='新增' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM wxdzb where mlbm ='+QuotedStr(GetStr(RzButtonEdit2.Text,'/',True))+' and msbm='+QuotedStr(GetStr(RzButtonEdit1.Text,'/',True)));
      Open;
      
      if RecordCount=0 then
      else
      begin
        MessageBox(0,'对照表已经存在！！','注意',MB_OK+MB_ICONINFORMATION);
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
      SQL.Add('SELECT * FROM wxdzb where id='+QuotedStr(StatusBar1.Panels[0].Text));
      Open;

      Edit;
    end;    // with
  end;

  ADOQuery1.FieldByName('msbm').AsString:=GetStr(RzButtonEdit1.Text,'/',True);
  ADOQuery1.FieldByName('mlbm').AsString:=GetStr(RzButtonEdit2.Text,'/',True);
  ADOQuery1.FieldByName('msgs').AsString:=RzNumericEdit1.Text;
  ADOQuery1.FieldByName('msbl').AsString:=RzNumericEdit2.Text;

  ADOQuery1.Post;

  if zt='新增' then
  begin
    RzButtonEdit1.Text:='';
    RzButtonEdit2.Text:='';
    RzNumericEdit1.Text:='0.00';
  end;

  if zt='修改' then
  begin
    Close;
  end; 
end;

procedure TFwxdzbEdit.FormShow(Sender: TObject);
begin
  inherited;
  StatusBar1.Panels[0].Text:=SelSSQL;

  if zt='新增' then
  begin
    RzButtonEdit1.Text:='';
    RzButtonEdit2.Text:='';
    RzNumericEdit1.Text:='0.00';

    RzButtonEdit1.SetFocus;
  end;

  if zt='修改' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM wxdzb where id='+QuotedStr(StatusBar1.Panels[0].Text));
      Open;

      RzButtonEdit1.Text:=FieldByName('mlbm').AsString+'/'+GetFieldStr('clda',FieldByName('mlbm').AsString,'clbm','clmc');
      RzButtonEdit2.Text:=FieldByName('msbm').AsString+'/'+GetFieldStr('clda',FieldByName('msbm').AsString,'clbm','clmc');
      RzNumericEdit1.Text:=FieldByName('msgs').AsString;
      RzNumericEdit2.Text:=FieldByName('msbl').AsString;
    end;
  end;

end;

end.
