unit Uxtsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls, RzPanel, Mask, RzEdit;

type
  TFxtsz = class(TForm)
    ADOQuery1: TADOQuery;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RzEdit1: TRzEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fxtsz: TFxtsz;

implementation

uses UDM;

{$R *.dfm}

procedure TFxtsz.FormShow(Sender: TObject);
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from xtsz where xmm=''单位名称''');
    Open;

    RzEdit1.Text:=FieldByName('xmz').AsString;
  end;    // with
end;

procedure TFxtsz.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFxtsz.BitBtn1Click(Sender: TObject);
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from xtsz where xmm=''单位名称''');
    Open;
    Edit;
    FieldByName('xmz').AsString:=RzEdit1.Text;
    Post;
  end;    // with

  Close;
end;

end.
