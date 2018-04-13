unit UBaseEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, ExtCtrls, RzPanel, RzCmboBx, Mask, RzEdit,
  RzLabel, RzTabs, DB, ADODB;

type
  TFBaseEdit = class(TForm)
    ComboBox: TComboBox;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    ADOQuery1: TADOQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ComDown(id,Field,Table:String); //下拉列表
    function GetFieldStr(Table,Get,GetField,ResultField:String):String;
    function GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;
  end;

var
  FBaseEdit: TFBaseEdit;

implementation

uses UDM;

{$R *.dfm}

function TFBaseEdit.GetFieldStr(Table,Get,GetField,ResultField:String):String;
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select '+ResultField+' from '+Table+' where '+GetField+' = '+QuotedStr(Get));
    Open;
    result:=FieldByName(ResultField).AsString;
  end;    // with
end;

function TFBaseEdit.GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select '+ResultField+' from '+Table+' where '+GetField+' = '+QuotedStr(Get));
    Open;
    result:=FieldByName(ResultField).AsFloat;
  end;    // with
end;

procedure TFBaseEdit.ComDown(id,Field,Table:String);//ComboBox下拉的选项
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select '+id+','+Field+' from '+ Table);
    //ShowMessage('select '+Field+' from'+ Table);
    Open;
    ComboBox.Items.Clear;
    First;
  end;    // with

  with ComboBox do
  begin
    Clear;
    while not DM.QRead.Eof do
    begin
      //ShowMessage(DM.QRead.fieldByName('name').AsString);
      ComboBox.Items.Add(DM.QRead.fieldByName(id).AsString+'/'+DM.QRead.fieldByName(Field).AsString);
      //ShowMessage(DM.QRead.fieldByName(id).AsString+'/'+DM.QRead.fieldByName(Field).AsString);
      DM.QRead.Next;
    end;    // while
  end;    // with
end;

procedure TFBaseEdit.FormKeyPress(Sender: TObject; var Key: Char);//回车下移一个控件
begin
  if Key = #13 then
  begin
    key := #0;
    self.Perform(CM_DialogKey, VK_TAB, 0);
  end;
end;

procedure TFBaseEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFBaseEdit.RzBitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
