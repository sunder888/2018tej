unit Ulcsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, RzButton, RzPanel, RzCmboBx, StdCtrls, RzLstBox,
  Buttons, RzSpnEdt, ExtCtrls, DB, ADODB;

type
  TFlcsz = class(TFBaseSel)
    RzGroupBox2: TRzGroupBox;
    RzRapidFireButton3: TRzRapidFireButton;
    RzRapidFireButton4: TRzRapidFireButton;
    RzListBox1: TRzListBox;
    RzButton4: TRzButton;
    RzComboBox2: TRzComboBox;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    procedure RzButton4Click(Sender: TObject);
    procedure RzRapidFireButton3Click(Sender: TObject);
    procedure RzRapidFireButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzComboBox2DropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flcsz: TFlcsz;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFlcsz.RzButton4Click(Sender: TObject);
begin
  inherited;
  RzListBox1.Items.add(RzComboBox2.Text);
end;

procedure TFlcsz.RzRapidFireButton3Click(Sender: TObject);
var
  IndexCount, SelectedIndex: Integer;
begin
  try
    if RzListBox1 = nil then Exit;
    IndexCount := RzListBox1.Items.Count;
    if IndexCount = 0 then Exit;
    SelectedIndex := RzListBox1.ItemIndex;
    if SelectedIndex = -1 then Exit;

      if (SelectedIndex - 1) < 0 then Exit;
      RzListBox1.Items.Move(SelectedIndex, (SelectedIndex - 1));
      RzListBox1.ItemIndex := SelectedIndex - 1;
      RzListBox1.Selected[SelectedIndex - 1] := True;


  except

  end;
end;

procedure TFlcsz.RzRapidFireButton4Click(Sender: TObject);
var
  IndexCount, SelectedIndex: Integer;
begin
  try
    if RzListBox1 = nil then Exit;
    IndexCount := RzListBox1.Items.Count;
    if IndexCount = 0 then Exit;
    SelectedIndex := RzListBox1.ItemIndex;
    if SelectedIndex = -1 then Exit;

      if (SelectedIndex + 1) > (IndexCount -1) then Exit;
      RzListBox1.Items.Move(SelectedIndex, (SelectedIndex + 1));
      RzListBox1.ItemIndex := SelectedIndex + 1;
      RzListBox1.Selected[SelectedIndex + 1] := True;

  except

  end;
end;

procedure TFlcsz.FormShow(Sender: TObject);
begin
  inherited;
  Label2.Caption:=SelSSQL;

  RzListBox1.Items.Clear;
  
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from ddlc where ddh='+QuotedStr(Label2.Caption)+' order by px');
    Open;

    First;
    while not Eof do
    begin
      RzListBox1.Items.Add(FieldByName('lc').AsString);

      Next;
    end;
  end;
end;

procedure TFlcsz.RzBitBtn1Click(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  SelSSQL:='';
  for i:=0 to RzListBox1.Items.Count-1 do
  begin
    if i=RzListBox1.Items.Count-1 then
      SelSSQL:=SelSSQL+RzListBox1.Items[i]
    else
      SelSSQL:=SelSSQL+RzListBox1.Items[i]+',';
  end;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from  ddlc where ddh='+QuotedStr(Label2.Caption));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select * from ddlc where ddh='+QuotedStr(Label2.Caption));
    Open;    
    SelSSQL:='';
    for i:=0 to RzListBox1.Items.Count-1 do
    begin
      if i=RzListBox1.Items.Count-1 then
        SelSSQL:=SelSSQL+RzListBox1.Items[i]
      else
        SelSSQL:=SelSSQL+RzListBox1.Items[i]+',';
      Append;
      FieldByName('ddh').AsString:=Label2.Caption;
      FieldByName('px').AsInteger:=i;
      FieldByName('lc').AsString:=RzListBox1.Items[i];
      Post;
    end;
    

    Close;
    SQL.Clear;
    SQL.Add('update bom set lc='+QuotedStr(SelSSQL)+' where ddh='+QuotedStr(Label2.Caption));
    ExecSQL;

  end;

  Close;
end;

procedure TFlcsz.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFlcsz.RzComboBox2DropDown(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT  DISTINCT [lcda] FROM [lcda] order by lcda');
    Open;

    RzComboBox2.Items.Clear;
    First;
    while not Eof do
    begin
      RzComboBox2.Items.Add(FieldByName('lcda').AsString);

      Next;
    end;
  end;
end;

end.
