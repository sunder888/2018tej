unit UBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Wwdotdot, StdCtrls;

type
  TFBase = class(TForm)
    ComboBox: TComboBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ComDown(id,Field,Table:String); //�����б�
    function GetFieldStr(Table,Get,GetField,ResultField:String):String;
    function GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;
    function RoundFloat(f:double;i:integer):double;
    function MoneyConvert(mmje:real): string;
    function MoneyConvert1(mmje:real): string;
    function qx(yh,qxm,xq:String):Boolean;
  end;

var
  FBase: TFBase;

implementation

uses UDM;

{$R *.dfm}

function TFBase.qx(yh,qxm,xq:String):Boolean;
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT [xz] as ����,[xg] as �޸�,[del] as ɾ��,[sc] as ���,sh as ���,kp as ��Ʊ,sk as �տ�,yj as �ƽ�,skmx as �տ���ϸ,zf as ���� FROM [dbo].[yhqx] where qxid in (select qxid from qxb where qxm='+QuotedStr(qxm)+') and yhid='+QuotedStr(yh));
    Open;

    result:=False;
    result:=FieldByName(xq).AsBoolean;
      

  end;
end;

function TFBase.MoneyConvert1(mmje:real): string;  //���� ʵ�� ��������������ת���õ��Ĵ�д���
const
  s1: string = '��һ�����������߰˾�';
  s2: string = '  ʮʮ��Ǫ��ʰ��Ǫ��ʰ��Ǫ��';
  function StrTran(const S, s1, s2: string): string;
  begin
    Result := StringReplace(S, s1, s2, [rfReplaceAll]);
  end;
var
  S, dx: string;
  i, Len: Integer;
begin
  S := Format('%.0f', [mmje]);
  Len := Length(S);
  for i := 1 to Len do
    dx := dx + Copy(s1, (Ord(S[i]) - Ord('0')) * 2 + 1, 2) + Copy(s2, (Len - i)* 2 + 1, 2);
  if dx = '' then
    Result := '��Բ'
  else
    Result := StrTran(StrTran(dx, '����', '����'), '��', '');
  Result:=trim(Result);
end;


function TFBase.MoneyConvert(mmje:real): string;  //���� ʵ�� ��������������ת���õ��Ĵ�д���
const
  s1: string = '��Ҽ��������½��ƾ�';
  s2: string = '�ֽ�Բʰ��Ǫ��ʰ��Ǫ��ʰ��Ǫ��';
  function StrTran(const S, s1, s2: string): string;
  begin
    Result := StringReplace(S, s1, s2, [rfReplaceAll]);
  end;
var
  S, dx: string;
  i, Len: Integer;
begin
  if mmje < 0 then
  begin
    dx := '��';
    mmje := -mmje;
  end;
  S := Format('%.0f', [mmje * 100]);
  Len := Length(S);
  for i := 1 to Len do
    dx := dx + Copy(s1, (Ord(S[i]) - Ord('0')) * 2 + 1, 2) + Copy(s2, (Len - i)* 2 + 1, 2);
  dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '��Ǫ', '��'), '���','��'),'��ʰ', '��'), '���', '��'), '���', '��');
  dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '����', '��'), '����','��'),'����', '��'), '����', '��'), '��Բ', 'Բ');
  if dx = '��' then
    Result := '��Բ��'
  else
    Result := StrTran(StrTran(dx, '����', '����'), '����', '��');
end;

function TFBase.RoundFloat(f:double;i:integer):double;
var
  s:string;
  ef:extended;
begin
  s:='#.'+ StringOfChar('0',i);
  ef:=StrToFloat(FloatToStr(f));//��ֹ������������
  result:=StrToFloat(FormatFloat(s,ef));
end;

function TFBase.GetFieldStr(Table,Get,GetField,ResultField:String):String;
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

function TFBase.GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;
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

procedure TFBase.ComDown(id,Field,Table:String);//ComboBox������ѡ��
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

procedure TFBase.FormKeyPress(Sender: TObject; var Key: Char);//�س�����һ���ؼ�
begin
  if key=#13 then //�ж��ǰ�ִ�м�
    //if not (ActiveControl is TwwDBComboDlg) then
      
    {?? if not (ActiveControl is TDBGridEh) Then
    begin //������TDbgrid�ؼ���
      //ShowMessage('��');
      key:=#0;
      perform(WM_NEXTDLGCTL,0,0);//�ƶ�����һ���ؼ�
    end; }
      (* else
      if (ActiveControl is TDBGridEh) Then//���� TDbgrid �ؼ���
      begin
        with TDBGridEh(ActiveControl) Do
          if Selectedindex<(FieldCount-1) then
            Selectedindex:=Selectedindex+1//�ƶ�����һ�ֶ�
          else Selectedindex:=0;
      end;  *)
end;

procedure TFBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

end.
