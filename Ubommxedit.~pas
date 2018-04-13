unit Ubommxedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, DB, ADODB, RzButton, RzPanel, RzCmboBx,
  RzLstBox, Buttons, RzSpnEdt, ExtCtrls;

type
  TFbommxedit = class(TFBaseSel)
    ComboBox1: TComboBox;
    RzGroupBox1: TRzGroupBox;
    RzRapidFireButton1: TRzRapidFireButton;
    RzRapidFireButton2: TRzRapidFireButton;
    RzListBox1: TRzListBox;
    RzListBox2: TRzListBox;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzGroupBox2: TRzGroupBox;
    RzRapidFireButton3: TRzRapidFireButton;
    RzRapidFireButton4: TRzRapidFireButton;
    RzListBox3: TRzListBox;
    RzListBox4: TRzListBox;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label2: TLabel;
    AQuery: TADOQuery;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton4Click(Sender: TObject);
    procedure RzRapidFireButton1Click(Sender: TObject);
    procedure RzRapidFireButton2Click(Sender: TObject);
    procedure RzRapidFireButton3Click(Sender: TObject);
    procedure RzRapidFireButton4Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fbommxedit: TFbommxedit;

implementation

uses UGlobal, UDM;

{$R *.dfm}

procedure TFbommxedit.FormShow(Sender: TObject);
begin
  inherited;
  Label2.Caption:=SelSSQL;
  SelSSQL1:='sunder';
  SelSSQL2:='sunder';
  SelSSQL3:='sunder';  
end;

procedure TFbommxedit.ComboBox2Change(Sender: TObject);
var
  stl:Tstringlist;
  i:Integer;
begin
  inherited;
  if ComboBox2.Text='行' then
  begin
    AQuery.Close;
    AQuery.SQL.Clear;
    AQuery.SQL.Add('select * from xsdd where djh='+QuotedStr(Label2.Caption));
    AQuery.Open;
    SelSSQL:=AQuery.FieldByName('hbt').AsString;

    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=SelSSQL;

    RzListBox1.Items.Clear;
    for i:=0 to stl.Count-1 do
    begin
      RzListBox1.Items.Add(stl.Strings[i]); 
    end;
  end;

  if ComboBox2.Text='列' then
  begin
    AQuery.Close;
    AQuery.SQL.Clear;
    AQuery.SQL.Add('select * from xsdd where djh='+QuotedStr(Label2.Caption));
    AQuery.Open;
    SelSSQL:=AQuery.FieldByName('lbt').AsString;

    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=SelSSQL;

    RzListBox1.Items.Clear;
    for i:=0 to stl.Count-1 do
    begin
      RzListBox1.Items.Add(stl.Strings[i]);
    end;
  end;
end;

procedure TFbommxedit.ComboBox3Change(Sender: TObject);
var
  stl:Tstringlist;
  i:Integer;
begin
  inherited;
  if ComboBox3.Text='行' then
  begin
    AQuery.Close;
    AQuery.SQL.Clear;
    AQuery.SQL.Add('select * from xsdd where djh='+QuotedStr(Label2.Caption));
    AQuery.Open;
    SelSSQL:=AQuery.FieldByName('hbt').AsString;

    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=SelSSQL;

    RzListBox3.Items.Clear;
    for i:=0 to stl.Count-1 do
    begin
      RzListBox3.Items.Add(stl.Strings[i]);
    end;
  end;

  if ComboBox3.Text='列' then
  begin
    AQuery.Close;
    AQuery.SQL.Clear;
    AQuery.SQL.Add('select * from xsdd where djh='+QuotedStr(Label2.Caption));
    AQuery.Open;
    SelSSQL:=AQuery.FieldByName('lbt').AsString;

    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=SelSSQL;

    RzListBox3.Items.Clear;
    for i:=0 to stl.Count-1 do
    begin
      RzListBox3.Items.Add(stl.Strings[i]);
    end;
  end;
end;

procedure TFbommxedit.RzButton1Click(Sender: TObject);
begin
  inherited;
  RzListBox2.Items.add(RzListBox1.Items[RzListBox1.itemindex]);
  RzListBox1.DeleteSelected;
end;

procedure TFbommxedit.RzButton2Click(Sender: TObject);
begin
  inherited;
  RzListBox1.Items.add(RzListBox2.Items[RzListBox2.itemindex]);
  RzListBox2.DeleteSelected;
end;

procedure TFbommxedit.RzButton3Click(Sender: TObject);
begin
  inherited;
  RzListBox4.Items.add(RzListBox3.Items[RzListBox3.itemindex]);
  RzListBox3.DeleteSelected;
end;

procedure TFbommxedit.RzButton4Click(Sender: TObject);
begin
  inherited;
  RzListBox3.Items.add(RzListBox4.Items[RzListBox4.itemindex]);
  RzListBox4.DeleteSelected;
end;

procedure TFbommxedit.RzRapidFireButton1Click(Sender: TObject);
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

procedure TFbommxedit.RzRapidFireButton2Click(Sender: TObject);
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

procedure TFbommxedit.RzRapidFireButton3Click(Sender: TObject);
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

procedure TFbommxedit.RzRapidFireButton4Click(Sender: TObject);
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

procedure TFbommxedit.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  SelSSQL1:='sunder';
  SelSSQL2:='sunder';
  SelSSQL3:='sunder';
  Close;
end;

procedure TFbommxedit.RzBitBtn1Click(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if CheckBox1.Checked then
  begin
    SelSSQL1:='';
    for i:=0 to RzListBox2.Items.Count-1 do
    begin
      if i=RzListBox2.Items.Count-1 then
        SelSSQL1:=SelSSQL1+RzListBox2.Items[i]
      else
        SelSSQL1:=SelSSQL1+RzListBox2.Items[i]+',';
    end;
  end
  else
    SelSSQL1:='sunder';

  if CheckBox2.Checked then
  begin
    SelSSQL2:='';
    for i:=0 to RzListBox4.Items.Count-1 do
    begin
      if i=RzListBox4.Items.Count-1 then
        SelSSQL2:=SelSSQL2+RzListBox4.Items[i]
      else
        SelSSQL2:=SelSSQL2+RzListBox4.Items[i]+',';
    end;
  end
  else
    SelSSQL2:='sunder';

  if CheckBox3.Checked then
  begin
    SelSSQL3:=Edit1.Text;
  end
  else
    SelSSQL3:='sunder';

  Close;
end;

end.
