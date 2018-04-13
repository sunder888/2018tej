unit UBaseSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBase, StdCtrls, ComCtrls, Grids, DBGridEh;

type
  TFBaseSel = class(TForm)
    ComboBox: TComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ComDown(id,Field,Table:String); //下拉列表
  end;

var
  FBaseSel: TFBaseSel;

implementation

uses
  UGlobal, UDM;

{$R *.dfm}

procedure TFBaseSel.ComDown(id,Field,Table:String);
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

procedure TFBaseSel.FormShow(Sender: TObject);
begin
  inherited;
  XZ:=False;
end;

end.
