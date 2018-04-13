unit Uewbzk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, ExtCtrls, RzPanel, RzButton, RzLstBox,
  RzCmboBx, DB, ADODB, Buttons, RzSpnEdt;

type
  TFewbzk = class(TFBaseSel)
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzListBox1: TRzListBox;
    RzListBox2: TRzListBox;
    RzListBox3: TRzListBox;
    RzListBox4: TRzListBox;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    RzComboBox1: TRzComboBox;
    RzComboBox2: TRzComboBox;
    ADOQuery1: TADOQuery;
    RzRapidFireButton1: TRzRapidFireButton;
    RzRapidFireButton2: TRzRapidFireButton;
    RzRapidFireButton3: TRzRapidFireButton;
    RzRapidFireButton4: TRzRapidFireButton;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzComboBox1DropDown(Sender: TObject);
    procedure RzComboBox2DropDown(Sender: TObject);
    procedure RzComboBox1Change(Sender: TObject);
    procedure RzComboBox2Change(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton4Click(Sender: TObject);
    procedure RzRapidFireButton1Click(Sender: TObject);
    procedure RzRapidFireButton2Click(Sender: TObject);
    procedure RzRapidFireButton3Click(Sender: TObject);
    procedure RzRapidFireButton4Click(Sender: TObject);
    procedure RzListBox1DblClick(Sender: TObject);
    procedure RzListBox2DblClick(Sender: TObject);
    procedure RzListBox3DblClick(Sender: TObject);
    procedure RzListBox4DblClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fewbzk: TFewbzk;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFewbzk.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFewbzk.RzComboBox1DropDown(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT distinct [ewbfl] as ewbfl FROM [ewbda] where ewbfl=''颜色''');
    Open;

    RzComboBox1.Items.Clear;
    while not eof do
    begin
      RzComboBox1.Items.Add(FieldByName('ewbfl').AsString);

      Next;
    end;
  end;
end;

procedure TFewbzk.RzComboBox2DropDown(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT distinct [ewbfl] as ewbfl FROM [ewbda] where ewbfl<>''颜色''');
    Open;

    RzComboBox2.Items.Clear;
    while not eof do
    begin
      RzComboBox2.Items.Add(FieldByName('ewbfl').AsString);

      Next;
    end;
  end;
end;

procedure TFewbzk.RzComboBox1Change(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    RzListBox1.Items.Clear;
    RzListBox2.Items.Clear;

    Close;
    SQL.Clear;
    SQL.Add('select * from ewbda where ewbfl='+QuotedStr(RzComboBox1.Text)+' order by ewbda');
    Open;

    //showmessage(FieldByName('sfys').AsString);

    while not eof do
    begin
      if FieldByName('sfys').AsBoolean=True then
        RzListBox1.Items.Add(FieldByName('sh').AsString+FieldByName('ewbda').AsString+FieldByName('yin').AsString+FieldByName('ri').AsString)
      else
        RzListBox1.Items.Add(FieldByName('ewbda').AsString);

      Next;
    end;
  end;
end;

procedure TFewbzk.RzComboBox2Change(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    RzListBox3.Items.Clear;
    RzListBox4.Items.Clear;

    Close;
    SQL.Clear;
    SQL.Add('select * from ewbda where ewbfl='+QuotedStr(RzComboBox2.Text)+' order by ewbda');
    Open;

    while not eof do
    begin
      if FieldByName('sfys').AsBoolean=True then
        RzListBox3.Items.Add(FieldByName('sh').AsString+FieldByName('ewbda').AsString+FieldByName('yin').AsString+FieldByName('ri').AsString)
      else
        RzListBox3.Items.Add(FieldByName('ewbda').AsString);

      Next;
    end;
  end;
end;

procedure TFewbzk.RzButton1Click(Sender: TObject);
begin
  inherited;
  RzListBox2.Items.add(RzListBox1.Items[RzListBox1.itemindex]);
  RzListBox1.DeleteSelected;
end;

procedure TFewbzk.RzButton2Click(Sender: TObject);
begin
  inherited;
  RzListBox1.Items.add(RzListBox2.Items[RzListBox2.itemindex]);
  RzListBox2.DeleteSelected;
end;

procedure TFewbzk.RzButton3Click(Sender: TObject);
begin
  inherited;
  RzListBox4.Items.add(RzListBox3.Items[RzListBox3.itemindex]);
  RzListBox3.DeleteSelected;
end;

procedure TFewbzk.RzButton4Click(Sender: TObject);
begin
  inherited;
  RzListBox3.Items.add(RzListBox4.Items[RzListBox4.itemindex]);
  RzListBox4.DeleteSelected;
end;

procedure TFewbzk.RzRapidFireButton1Click(Sender: TObject);
var
  IndexCount, SelectedIndex: Integer;
begin
  try
    if RzListBox2 = nil then Exit;
    IndexCount := RzListBox2.Items.Count;
    if IndexCount = 0 then Exit;
    SelectedIndex := RzListBox2.ItemIndex;
    if SelectedIndex = -1 then Exit;

      if (SelectedIndex - 1) < 0 then Exit;
      RzListBox2.Items.Move(SelectedIndex, (SelectedIndex - 1));
      RzListBox2.ItemIndex := SelectedIndex - 1;
      RzListBox2.Selected[SelectedIndex - 1] := True;


  except

  end;
end;

procedure TFewbzk.RzRapidFireButton2Click(Sender: TObject);
var
  IndexCount, SelectedIndex: Integer;
begin
  try
    if RzListBox2 = nil then Exit;
    IndexCount := RzListBox2.Items.Count;
    if IndexCount = 0 then Exit;
    SelectedIndex := RzListBox2.ItemIndex;
    if SelectedIndex = -1 then Exit;

      if (SelectedIndex + 1) > (IndexCount -1) then Exit;
      RzListBox2.Items.Move(SelectedIndex, (SelectedIndex + 1));
      RzListBox2.ItemIndex := SelectedIndex + 1;
      RzListBox2.Selected[SelectedIndex + 1] := True;

  except

  end;
end;

procedure TFewbzk.RzRapidFireButton3Click(Sender: TObject);
var
  IndexCount, SelectedIndex: Integer;
begin
  try
    if RzListBox4 = nil then Exit;
    IndexCount := RzListBox4.Items.Count;
    if IndexCount = 0 then Exit;
    SelectedIndex := RzListBox4.ItemIndex;
    if SelectedIndex = -1 then Exit;

      if (SelectedIndex - 1) < 0 then Exit;
      RzListBox4.Items.Move(SelectedIndex, (SelectedIndex - 1));
      RzListBox4.ItemIndex := SelectedIndex - 1;
      RzListBox4.Selected[SelectedIndex - 1] := True;


  except

  end;
end;

procedure TFewbzk.RzRapidFireButton4Click(Sender: TObject);
var
  IndexCount, SelectedIndex: Integer;
begin
  try
    if RzListBox4 = nil then Exit;
    IndexCount := RzListBox4.Items.Count;
    if IndexCount = 0 then Exit;
    SelectedIndex := RzListBox2.ItemIndex;
    if SelectedIndex = -1 then Exit;

      if (SelectedIndex + 1) > (IndexCount -1) then Exit;
      RzListBox4.Items.Move(SelectedIndex, (SelectedIndex + 1));
      RzListBox4.ItemIndex := SelectedIndex + 1;
      RzListBox4.Selected[SelectedIndex + 1] := True;

  except

  end;
end;

procedure TFewbzk.RzListBox1DblClick(Sender: TObject);
begin
  inherited;
  RzButton1.Click;
end;

procedure TFewbzk.RzListBox2DblClick(Sender: TObject);
begin
  inherited;
  RzButton2.Click;
end;

procedure TFewbzk.RzListBox3DblClick(Sender: TObject);
begin
  inherited;
  RzButton3.Click;
end;

procedure TFewbzk.RzListBox4DblClick(Sender: TObject);
begin
  inherited;
  RzButton4.Click;
end;

procedure TFewbzk.RzBitBtn1Click(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if RzListBox2.Items.Count=0 then
  begin
    ShowMessage('列标题没有选择！');
    Exit;
  end;

  if RzListBox4.Items.Count=0 then
  begin
    ShowMessage('行标题没有选择！');
    Exit;
  end;

  SelSSQL1:=RzComboBox2.Text;
  //开始列标题
  SelSSQL2:='';
  for i:=0 to RzListBox2.Items.Count-1 do
  begin
    if i=RzListBox2.Items.Count-1 then
      SelSSQL2:=SelSSQL2+RzListBox2.Items[i]
    else
      SelSSQL2:=SelSSQL2+RzListBox2.Items[i]+',';
  end;

  //开始行标题
  SelSSQL3:='';
  for i:=0 to RzListBox4.Items.Count-1 do
  begin
    if i=RzListBox4.Items.Count-1 then
      SelSSQL3:=SelSSQL3+RzListBox4.Items[i]
    else
      SelSSQL3:=SelSSQL3+RzListBox4.Items[i]+',';
  end;

  Close;

end;

end.
