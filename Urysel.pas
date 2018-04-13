unit Urysel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseSel, StdCtrls, RzCmboBx, DB, ADODB, RzButton;

type
  TFrysel = class(TFBaseSel)
    ComboBox1: TRzComboBox;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    procedure ComboBox1DropDown(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frysel: TFrysel;

implementation

uses UGlobal;

{$R *.dfm}

procedure TFrysel.ComboBox1DropDown(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    ComboBox1.Items.Clear;
    Close;
    SQL.Clear;
    SQL.Add('select yhbm+''/''+yhxm as zhi from yhb');
    Open;

    while not Eof do
    begin
      ComboBox1.Items.Add(FieldByName('zhi').AsString);
      Next;
    end;
  end;
end;

procedure TFrysel.RzBitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrysel.RzBitBtn1Click(Sender: TObject);
begin
  inherited;
  //SelSSQL
  if ComboBox1.Text='' then
  begin
    ShowMessage('«Î—°‘Ò»À‘±£°');
  end
  else
  begin
    SelSSQL:=ComboBox1.Text;
    Close;
  end;
end;

end.
