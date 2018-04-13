unit UGlobal;

interface

var
  GId:String;//操作员ID
  GName:String;//操作员姓名
  Gdwmc:String;//单位名称
  SelSSQL,SelSSQL1,SelSSQL2,SelSSQL3,sflb:String;//修改界面使用的过渡语句
  xzSSQL:String;//选择界面使用的过渡语句
  xz:Boolean;//是否回写回去
  zt,fph:String;//状态,发票号
  lx:String;//全部还是药品
  jqm,htcl:String;//机器名
  invsel,xlk:String;//存货过滤

  function bu(yuan:String;shu:Integer):String;//前面加0
  function GetHzPy(const AHzStr: string): string;//取字的拼音首字母
  function GetStr(yuan,ge:String;qian:Boolean):String;//以"/"为分隔取字段的前后
  function bmtomc(Table,Fieldbm,Fieldmc,bm,mc:String):String;//编码变成编码加名称
  function ComputerName: string;//取得机器名称
  //单据类别分 进货单1   销售单2
  //收发标志 1为收 0为发

implementation

uses UDM, SysUtils,Windows;

//取得机器名称
function ComputerName: string; 
  var  
  FStr: PChar;  
  FSize: Cardinal; 
begin  
  FSize := 255;  
  GetMem(FStr, FSize);  
  Windows.GetComputerName(FStr, FSize); 
  Result := FStr;  
  FreeMem(FStr); 
end;

function bmtomc(Table,Fieldbm,Fieldmc,bm,mc:String):String;
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from '+Table+' where '+Fieldbm+'='+QuotedStr(bm)+' or '+Fieldmc+'='+QuotedStr(mc));
    Open;
    //ShowMessage(inttostr(RecordCount)) ;
    if RecordCount=1 then
      Result:=FieldByName(Fieldbm).AsString+'/'+FieldByName(Fieldmc).AsString
    else
      Result:='';
  end;    // with
end;

function GetStr(yuan,ge:String;qian:Boolean):String;
var
  i:Integer;
begin
  i:=pos(ge,yuan);
  if qian then
    result:=copy(yuan,0,i-1)
  else
    result:=copy(yuan,i+1,length(yuan)-1);
end;

function bu(yuan:String;shu:Integer):String;
var
  i:Integer;
begin
  for i := 1 to shu-length(yuan) do
    yuan:= '0'+yuan;
  result:=yuan;
end;

function GetHzPy(const AHzStr: string): string;
const
  ChinaCode: array[0..25, 0..1] of Integer = ((1601, 1636), (1637, 1832), (1833, 2077),
    (2078, 2273), (2274, 2301), (2302, 2432), (2433, 2593), (2594, 2786), (9999, 0000),
    (2787, 3105), (3106, 3211), (3212, 3471), (3472, 3634), (3635, 3722), (3723, 3729),
    (3730, 3857), (3858, 4026), (4027, 4085), (4086, 4389), (4390, 4557), (9999, 0000),
    (9999, 0000), (4558, 4683), (4684, 4924), (4925, 5248), (5249, 5589));
var
  i, j, HzOrd: integer;
begin
  i := 1;
  while i <= Length(AHzStr) do
  begin
    if (AHzStr[i] >= #160) and (AHzStr[i + 1] >= #160) then
    begin
      HzOrd := (Ord(AHzStr[i]) - 160) * 100 + Ord(AHzStr[i + 1]) - 160;
      for j := 0 to 25 do
      begin
        if (HzOrd >= ChinaCode[j][0]) and (HzOrd <= ChinaCode[j][1]) then
        begin
          Result := Result + char(byte('a') + j);
          break;
        end;
      end;
      Inc(i);
    end
    else Result := Result + AHzStr[i];
    Inc(i);
  end;
end;



end.
