unit Uqxsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBase, StdCtrls, ComCtrls, DB, ADODB, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Buttons, ExtCtrls, DBCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxCheckBox;

type
  TFqxsz = class(TFBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fqxsz: TFqxsz;

implementation

uses UDM, UGlobal;

{$R *.dfm}

procedure TFqxsz.BitBtn1Click(Sender: TObject);
begin
  inherited;
  with ADOQuery1 do
  begin
    Edit;
    FieldByName('yhmm').AsString:='';
    Post;
  end;    // with
end;

procedure TFqxsz.FormShow(Sender: TObject);
begin
  inherited;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TFqxsz.ComboBox1DropDown(Sender: TObject);
begin
  inherited;
  with DM.QRead  do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from yhb where yhbm<>''admin''');
    Open;

    First;
    ComboBox1.Items.Clear;
    while not eof do
    begin
      ComboBox1.Items.Add(FieldByName('yhbm').AsString+'/'+FieldByName('yhxm').AsString);

      Next;
    end;    // while
  end;    // with
end;

procedure TFqxsz.BitBtn3Click(Sender: TObject);
begin
  inherited;
  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT qxid as 编号,qxm AS 权限名称, sfqx AS 查看 FROM V_yhqx where yhid ='+QuotedStr(GetStr(ComboBox1.Text,'/',True))+' order by qxid');
    Open;
  end;    // with

end;

procedure TFqxsz.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if GetStr(ComboBox1.Text,'/',True)='admin' then
  begin
    ShowMessage('不可以初始admin');
    Exit;
  end;

  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from yhqx where yhid='+QuotedStr(GetStr(ComboBox1.Text,'/',True)));
    ExecSql;

    Close;
    SQL.Clear;
    SQL.Add('insert into yhqx(yhid,qxid,sfqx)(SELECT CAST('+QuotedStr(GetStr(ComboBox1.Text,'/',True))+' AS varchar) AS yhid,qxid,0 as sfyq from yhqx where yhid=''admin'' and qxid not like ''0%'')');
    ExecSql;
  end;    // with

  ShowMessage('初始完成，请点击显示权限！');
end;

procedure TFqxsz.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if ADOQuery1.FieldByName('用户编码').AsString='' then
  begin
    ShowMessage('请先选择用户！');
    Exit;
  end;

  if ADOQuery1.FieldByName('用户编码').AsString='admin' then
  begin
    ShowMessage('不可以删除admin！');
    Exit;
  end;

  if MessageBox(HANDLE,'您是否确认删除这个用户？','友情提示',MB_OKCANCEL)=IDOK then
  begin
    with ADOQuery1 do
    begin
      Delete;
    end;    // with
  end;
end;

procedure TFqxsz.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  Edit1.Enabled:=False;

  Edit1.Text:=ADOQuery1.FieldByName('用户编码').AsString;
  Edit2.Text:=ADOQuery1.FieldByName('用户姓名').AsString;
end;

procedure TFqxsz.BitBtn6Click(Sender: TObject);
begin
  inherited;
  Edit1.Enabled:=True;

  Edit1.Text:='';
  Edit2.Text:='';
end;

procedure TFqxsz.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if Edit1.Enabled=True then
  begin
    //新增
    DM.QRead.Close;
    DM.QRead.SQL.Clear;
    DM.QRead.SQL.Add('select * from yhb where yhbm='+QuotedStr(Edit1.Text));
    DM.QRead.Open;
    if DM.QRead.RecordCount>0 then
    begin
      ShowMessage('用户编码已经存在，无法新增！');
    end
    else
    begin
      DM.QRead.Close;
      DM.QRead.SQL.Clear;
      DM.QRead.SQL.Add('select * from yhb where yhbm='+QuotedStr(Edit1.Text));
      DM.QRead.Open;
      DM.QRead.Append;
      DM.QRead.FieldByName('yhbm').AsString:=Edit1.Text;
      DM.QRead.FieldByName('yhxm').AsString:=Edit2.Text;
      DM.QRead.FieldByName('yhmm').AsString:='';
      DM.QRead.Post;

      ADOQuery1.Close;
      ADOQuery1.Open;
    end;
  end
  else
  begin
    //修改
    ADOQuery1.Edit;
    ADOQuery1.FieldByName('用户姓名').AsString:=Edit2.Text;
    ADOQuery1.Post;
  end;
end;

procedure TFqxsz.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
    ADOQuery2.First;
    while not ADOQuery2.Eof do
    begin
      ADOQuery2.Edit;
      ADOQuery2.FieldByName('查看').AsBoolean:=True;
      ADOQuery2.Post;
      ADOQuery2.Next;
    end;
  end
  else
  begin
    ADOQuery2.First;
    while not ADOQuery2.Eof do
    begin
      ADOQuery2.Edit;
      ADOQuery2.FieldByName('查看').AsBoolean:=False;
      ADOQuery2.Post;
      ADOQuery2.Next;
    end;
  end;
end;

end.
