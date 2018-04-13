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
    procedure ComDown(id,Field,Table:String); //下拉列表
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
    SQL.Add('SELECT [xz] as 新增,[xg] as 修改,[del] as 删除,[sc] as 输出,sh as 审核,kp as 开票,sk as 收款,yj as 移交,skmx as 收款明细,zf as 作废 FROM [dbo].[yhqx] where qxid in (select qxid from qxb where qxm='+QuotedStr(qxm)+') and yhid='+QuotedStr(yh));
    Open;

    result:=False;
    result:=FieldByName(xq).AsBoolean;
      

  end;
end;

function TFBase.MoneyConvert1(mmje:real): string;  //传入 实数 参数，函数返回转换得到的大写结果
const
  s1: string = '零一二三四五六七八九';
  s2: string = '  十十佰仟万拾佰仟亿拾佰仟万';
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
    Result := '零圆'
  else
    Result := StrTran(StrTran(dx, '亿万', '亿零'), '零', '');
  Result:=trim(Result);
end;


function TFBase.MoneyConvert(mmje:real): string;  //传入 实数 参数，函数返回转换得到的大写结果
const
  s1: string = '零壹贰叁肆伍陆柒捌玖';
  s2: string = '分角圆拾佰仟万拾佰仟亿拾佰仟万';
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
    dx := '负';
    mmje := -mmje;
  end;
  S := Format('%.0f', [mmje * 100]);
  Len := Length(S);
  for i := 1 to Len do
    dx := dx + Copy(s1, (Ord(S[i]) - Ord('0')) * 2 + 1, 2) + Copy(s2, (Len - i)* 2 + 1, 2);
  dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '零仟', '零'), '零佰','零'),'零拾', '零'), '零角', '零'), '零分', '整');
  dx := StrTran(StrTran(StrTran(StrTran(StrTran(dx, '零零', '零'), '零零','零'),'零亿', '亿'), '零万', '万'), '零圆', '圆');
  if dx = '整' then
    Result := '零圆整'
  else
    Result := StrTran(StrTran(dx, '亿万', '亿零'), '零整', '整');
end;

function TFBase.RoundFloat(f:double;i:integer):double;
var
  s:string;
  ef:extended;
begin
  s:='#.'+ StringOfChar('0',i);
  ef:=StrToFloat(FloatToStr(f));//防止浮点运算的误差
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

procedure TFBase.ComDown(id,Field,Table:String);//ComboBox下拉的选项
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

procedure TFBase.FormKeyPress(Sender: TObject; var Key: Char);//回车下移一个控件
begin
  if key=#13 then //判断是按执行键
    //if not (ActiveControl is TwwDBComboDlg) then
      
    {?? if not (ActiveControl is TDBGridEh) Then
    begin //不是在TDbgrid控件内
      //ShowMessage('下');
      key:=#0;
      perform(WM_NEXTDLGCTL,0,0);//移动到下一个控件
    end; }
      (* else
      if (ActiveControl is TDBGridEh) Then//是在 TDbgrid 控件内
      begin
        with TDBGridEh(ActiveControl) Do
          if Selectedindex<(FieldCount-1) then
            Selectedindex:=Selectedindex+1//移动到下一字段
          else Selectedindex:=0;
      end;  *)
end;

procedure TFBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

end.
