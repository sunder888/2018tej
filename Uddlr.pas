unit Uddlr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBaseOperation, DB, ADODB, Mask, RzEdit, StdCtrls, RzPanel,
  RzButton, ExtCtrls, RzBtnEdt, Buttons, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzStatus, RzCmboBx;

type
  TFddlr = class(TFBaseOperation)
    Label1: TLabel;
    RzEdit1: TRzEdit;
    RzButtonEdit1: TRzButtonEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    BitBtn1: TBitBtn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    RzStatusBar1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    RzStatusPane2: TRzStatusPane;
    ADOQuery1: TADOQuery;
    RzStatusPane3: TRzStatusPane;
    ewbQuery: TADOQuery;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    ADOQuery2: TADOQuery;
    Panel2: TPanel;
    RzButtonEdit2: TRzButtonEdit;
    ADOQuery3: TADOQuery;
    BtnSecurity: TRzToolButton;
    BtnError: TRzToolButton;
    Label7: TLabel;
    Label8: TLabel;
    ADOQuery4: TADOQuery;
    BtnDateView: TRzToolButton;
    Label9: TLabel;
    ComboBox1: TRzComboBox;
    RzEdit4: TRzEdit;
    Label10: TLabel;
    Label11: TLabel;
    RzNumericEdit1: TRzNumericEdit;
    RzNumericEdit3: TRzNumericEdit;
    RzNumericEdit2: TRzNumericEdit;
    Label12: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnInsertRecordClick(Sender: TObject);
    procedure BtnUndoClick(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1Enter(Sender: TObject);
    procedure RzButtonEdit1Exit(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure RzButtonEdit2ButtonClick(Sender: TObject);
    procedure BtnFirstRecordClick(Sender: TObject);
    procedure BtnLastRecordClick(Sender: TObject);
    procedure BtnPreviousRecordClick(Sender: TObject);
    procedure BtnNextRecordClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSecurityClick(Sender: TObject);
    procedure BtnErrorClick(Sender: TObject);
    procedure BtnDateViewClick(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure liulan;
    procedure xinzen;
    procedure xiugai;
  public
    { Public declarations }
  end;

var
  Fddlr: TFddlr;

implementation

uses Uewbzk, UGlobal, UDM, Ukhdasel, Ulcsz, Urysel;

{$R *.dfm}

procedure TFddlr.liulan;
begin
  cxGrid1DBTableView1.Columns[0].Visible:=False;
  //cxGrid1DBTableView1DBColumn2.Options.Editing:=False;
  cxGrid1DBTableView1.Columns[1].Options.Editing:=False;  

  //浏览状态
  Edit1.Enabled:=False;
  Date.Enabled:=False;
  RzEdit1.Enabled:=False;
  RzEdit2.Enabled:=False;
  RzEdit3.Enabled:=False;
  RzButtonEdit1.Enabled:=False;
  BitBtn1.Enabled:=False;
  CheckBox1.Enabled:=False;
  cxGrid1DBTableView1.OptionsData.Editing:=False;

  ComboBox1.Enabled:=False;

  BtnPrint.Enabled:=True;
  BtnPrintPreview.Enabled:=True;
  BtnInsertRecord.Enabled:=True;
  BtnSave.Enabled:=False;
  BtnUndo.Enabled:=False;
  BtnFirstRecord.Enabled:=True;
  BtnPreviousRecord.Enabled:=True;
  BtnNextRecord.Enabled:=True;
  BtnLastRecord.Enabled:=True;

  RzNumericEdit1.Enabled:=False;
  //RzNumericEdit2.Enabled:=False;
  //RzNumericEdit3.Enabled:=False;
  //RzNumericEdit4.Enabled:=False;

end;

procedure TFddlr.xinzen;
begin
  cxGrid1DBTableView1.Columns[0].Visible:=True;
  //cxGrid1DBTableView1DBColumn2.Options.Editing:=False;
  cxGrid1DBTableView1.Columns[1].Options.Editing:=True;  

  //新增状态
  Edit1.Enabled:=True;
  Date.Enabled:=True;
  RzEdit1.Enabled:=True;
  RzEdit2.Enabled:=True;
  RzEdit3.Enabled:=True;
  RzButtonEdit1.Enabled:=True;
  BitBtn1.Enabled:=True;
  CheckBox1.Enabled:=True;
  cxGrid1DBTableView1.OptionsData.Editing:=True;

  ComboBox1.Enabled:=True;

  BtnPrint.Enabled:=False;
  BtnPrintPreview.Enabled:=False;
  BtnInsertRecord.Enabled:=False;
  BtnSave.Enabled:=True;
  BtnUndo.Enabled:=True;
  BtnFirstRecord.Enabled:=False;
  BtnPreviousRecord.Enabled:=False;
  BtnNextRecord.Enabled:=False;
  BtnLastRecord.Enabled:=False;
  BtnDateView.Enabled:=False;

  RzNumericEdit1.Enabled:=True;
  //RzNumericEdit2.Enabled:=True;
  //RzNumericEdit3.Enabled:=True;
  //RzNumericEdit4.Enabled:=True;
end;

procedure TFddlr.xiugai;
begin
  cxGrid1DBTableView1.Columns[0].Visible:=True;
  //cxGrid1DBTableView1DBColumn2.Options.Editing:=False;
  cxGrid1DBTableView1.Columns[1].Options.Editing:=True;  

  //修改状态
  Edit1.Enabled:=False;
  Date.Enabled:=True;
  RzEdit1.Enabled:=True;
  RzEdit2.Enabled:=True;
  RzEdit3.Enabled:=True;
  RzButtonEdit1.Enabled:=True;
  BitBtn1.Enabled:=True;
  CheckBox1.Enabled:=True;
  cxGrid1DBTableView1.OptionsData.Editing:=True;

  ComboBox1.Enabled:=True;

  BtnPrint.Enabled:=False;
  BtnPrintPreview.Enabled:=False;
  BtnInsertRecord.Enabled:=False;
  BtnSave.Enabled:=True;
  BtnUndo.Enabled:=True;
  BtnFirstRecord.Enabled:=False;
  BtnPreviousRecord.Enabled:=False;
  BtnNextRecord.Enabled:=False;
  BtnLastRecord.Enabled:=False;
  BtnDateView.Enabled:=False;

  RzNumericEdit1.Enabled:=True;
  //RzNumericEdit2.Enabled:=True;
  //RzNumericEdit3.Enabled:=True;
  //RzNumericEdit4.Enabled:=True;
end;

procedure TFddlr.BitBtn1Click;
var
  stl:Tstringlist;
  i:integer;
  cl:TcxGridDBColumn;
begin
  inherited;
  Fewbzk:=TFewbzk.Create(Application);
  Fewbzk.ShowModal;
  Fewbzk.Free;

  if (SelSSQL1='') or (SelSSQL2='') or (SelSSQL3='') then
  begin
    ShowMessage('请重新选择二维表！');
    Exit;
  end;

  RzStatusPane1.Caption:=SelSSQL1;
  RzStatusPane2.Caption:=SelSSQL2;
  RzStatusPane3.Caption:=SelSSQL3;

  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[tmp_'+jqm+'_ewb]'') AND type in (N''U''))');
    SQL.Add(' DROP TABLE [dbo].[tmp_'+jqm+'_ewb]');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add(' CREATE TABLE [dbo].[tmp_'+jqm+'_ewb]( ');
    SQL.Add(' [id] [int] IDENTITY(1,1) NOT NULL, ');
    SQL.Add(' CONSTRAINT [PK_tmp_'+jqm+'_ewb] PRIMARY KEY CLUSTERED  ');
    SQL.Add(' (  ');
    SQL.Add(' [id] ASC   ');
    SQL.Add(' )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] ');
    SQL.Add(' ) ON [PRIMARY]');
    ExecSQL;

    //开始行标题
    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=RzStatusPane3.Caption;

    Close;
    SQL.Clear;
    SQL.Add('alter table tmp_'+jqm+'_ewb add '+(RzStatusPane1.Caption)+' varchar(50)');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select * from tmp_'+jqm+'_ewb');
    Open;

    for i:=0 to stl.Count-1 do
    begin
      Append;
      FieldByName(RzStatusPane1.Caption).AsString:=stl.Strings[i];
      Post;
    end;

    //开始列标题
    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=RzStatusPane2.Caption;
    for i:=0 to stl.Count-1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('alter table tmp_'+jqm+'_ewb add '+stl.Strings[i]+' float');
      ExecSQL; 
      //showmessage((stl.Strings[i]));

      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_ewb set '+stl.Strings[i]+' =0');
      ExecSQL;
    end;
    Close;
    SQL.Clear;
    SQL.Add('alter table tmp_'+jqm+'_ewb add '+'合计'+' float');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('update tmp_'+jqm+'_ewb set 合计 =0');
    ExecSQL;
  end;

  ewbQuery.Close;
  ewbQuery.SQL.Clear;
  ewbQuery.SQL.Add('select * from tmp_'+jqm+'_ewb');
  ewbQuery.Open;

  Screen.Cursor :=  crHourGlass;
  cxGrid1DBTableView1.BeginUpdate;
  try
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.Summary.FooterSummaryItems.Clear;
    for i := 0 to cxGrid1DBTableView1.DataController.DataSet.FieldCount - 1 do
    begin
      cl  :=  cxGrid1DBTableView1.CreateColumn;
      cl.DataBinding.FieldName :=
          cxGrid1DBTableView1.DataController.DataSet.Fields[i].FieldName;
      if cxGrid1DBTableView1.DataController.DataSet.Fields[i] is TNumericField then
      begin
        TNumericField(cxGrid1DBTableView1.DataController.DataSet.Fields[i])
            .DisplayFormat  :=  '#,##0.00';
        cl.Width := 80;
        cl.Summary.FooterKind := sksum;
      end
      else if cxGrid1DBTableView1.DataController.DataSet.Fields[i] is TStringField then
        cl.Width := 100
      else
        cl.Width := 80;
      cl.HeaderAlignmentHorz :=  taCenter;
    end;  //if
  finally
    cxGrid1DBTableView1.EndUpdate;
    Screen.Cursor := crDefault;
  end;

  cxGrid1DBTableView1.Columns[0].Visible:=False;
  //cxGrid1DBTableView1DBColumn2.Options.Editing:=False;
  cxGrid1DBTableView1.Columns[1].Options.Editing:=False;
end;

procedure TFddlr.BtnInsertRecordClick(Sender: TObject);
var
  Year, Month,Day:Word;
  dh:Integer;
begin
  inherited;
  xinzen;
  Edit1.Text:='';
  Date.Date:=Now();
  RzEdit1.Text:='';
  RzEdit2.Text:='';
  RzEdit3.Text:='';
  RzButtonEdit1.Text:='';
  CheckBox1.Checked:=False;
  ewbQuery.Active:=False;
  BitBtn1.Enabled:=True;
  //RzNumericEdit1.IntValue:=0;
  //RzNumericEdit2.IntValue:=0;
  //RzNumericEdit3.IntValue:=0;
  //RzNumericEdit4.IntValue:=0;

  //取单据号
  with ADOQuery1 do
  begin
    DecodeDate(Date.Date, Year, Month, Day);

    Close;
    SQL.Clear;
    SQL.Add('select max(right(djh,3)) as djh from xsdd where LEFT(RIGHT(djh,9),6) ='+QuotedStr(inttostr(Year)+bu(inttostr(Month),2)));
    Open;


    if FieldByName('djh').AsString='' then
      dh:=0
    else
      dh:=StrToInt(FieldByName('djh').AsString);
    dh:=dh+1;

    Edit1.Text:='TRJ'+inttostr(Year)+bu(inttostr(Month),2)+bu(IntToStr(dh),3);
  end;    // with
end;

procedure TFddlr.BtnUndoClick(Sender: TObject);
begin
  inherited;
  Edit1.Text:='';
  Date.Date:=Now();
  RzEdit1.Text:='';
  RzEdit2.Text:='';
  RzEdit3.Text:='';
  RzButtonEdit1.Text:='';
  CheckBox1.Checked:=False;
  ewbQuery.Active:=False;

  BtnLastRecord.Click;
end;

procedure TFddlr.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  SelSSQL:=RzButtonEdit1.Text;

  FkhdaSel:=TFkhdaSel.Create(Application);
  FkhdaSel.ShowModal;
  FkhdaSel.Free;

  RzButtonEdit1.Text:=SelSSQL;
end;

procedure TFddlr.RzButtonEdit1Enter(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=GetStr(RzButtonEdit1.Text,'/',True);
end;

procedure TFddlr.RzButtonEdit1Exit(Sender: TObject);
begin
  inherited;
  RzButtonEdit1.Text:=RzButtonEdit1.Text+'/'+GetFieldStr('V_khda',RzButtonEdit1.Text,'客户编码','客户名称');
end;

procedure TFddlr.BtnSaveClick(Sender: TObject);
var
  stl:Tstringlist;
  Year, Month,Day:Word;
  dh,i:Integer;
begin
  inherited;
  try
    ewbQuery.Post;
  except

  end;

  if (ComboBox1.Text='') or (ComboBox1.Text='/') then
  begin
    ShowMessage('待审人不能为空！');
    ComboBox1.SetFocus;
    Exit;
  end;

  if RzEdit2.Text='' then
  begin
    ShowMessage('大货款号不能为空！');
    RzEdit2.SetFocus;
    Exit;
  end;

  if RzEdit3.Text='' then
  begin
    ShowMessage('品名不能为空！');
    RzEdit3.SetFocus;
    Exit;
  end;  

  with ADOQuery1 do
  begin
    if Edit1.Enabled then
    begin
      //取新订单号
      DecodeDate(Date.Date, Year, Month, Day);

      Close;
      SQL.Clear;
      SQL.Add('select max(right(djh,3)) as djh from xsdd where LEFT(RIGHT(djh,9),6) ='+QuotedStr(inttostr(Year)+bu(inttostr(Month),2)));
      Open;

      if FieldByName('djh').AsString='' then
        dh:=0
      else
        dh:=StrToInt(FieldByName('djh').AsString);
      dh:=dh+1;

      Edit1.Text:='TRJ'+inttostr(Year)+bu(inttostr(Month),2)+bu(IntToStr(dh),3);
    end;
    
    Close;
    SQL.Clear;
    SQL.Add('select * from xsdd where djh=''1''');
    Open;
    Append;
    FieldByName('djh').AsString:=Edit1.Text;
    FieldByName('rq').AsDateTime:=Date.Date;
    FieldByName('ypkh').AsString:=RzEdit1.Text;
    FieldByName('kh').AsString:=GetStr(RzButtonEdit1.Text,'/',True);
    FieldByName('dhkh').AsString:=RzEdit2.Text;
    FieldByName('pm').AsString:=RzEdit3.Text;
    FieldByName('jp').AsBoolean:=CheckBox1.Checked;
    FieldByName('hbtbt').AsString:=RzStatusPane1.Caption;
    FieldByName('hbt').AsString:=RzStatusPane3.Caption;
    FieldByName('lbt').AsString:=RzStatusPane2.Caption;
    FieldByName('zdr').AsString:=GName;
    //FieldByName('fc').AsString:=RzNumericEdit1.Text;
    //FieldByName('rs').AsString:=RzNumericEdit2.Text;
    //FieldByName('zs').AsString:=RzNumericEdit3.Text;
    //FieldByName('zb').AsString:=RzNumericEdit4.Text;
    Post;

    Close;
    SQL.Clear;
    SQL.Add('delete from spxx where djlx=''订单审核'' and djh='+QuotedStr(Edit1.Text));
    ExecSQL;
    Close;
    SQL.Clear;
    SQL.Add('select * from spxx where djh='+QuotedStr(Edit1.Text));
    Open;
    Append;
    FieldByName('djlx').AsString:='订单审核';
    FieldByName('djh').AsString:=Edit1.Text;
    FieldByName('dsrbm').AsString:=GetStr(ComboBox1.Text,'/',True);
    FieldByName('dsr').AsString:=GetStr(ComboBox1.Text,'/',False);
    Post;

    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=RzStatusPane2.Caption;    
    Close;
    SQL.Clear;
    SQL.Add('update tmp_'+jqm+'_ewb set 合计=');
      for i:=0 to stl.Count-1 do
      begin
        if i=0 then
          SQL.Add(' '+stl.Strings[i])
        else
          SQL.Add(' +'+stl.Strings[i]);
      end;
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select * from tmp_'+jqm+'_ewb');
    Open; 
    First;
    while not Eof do
    begin
      stl:= Tstringlist.Create();
      stl.Delimiter:=',';
      stl.CommaText:=RzStatusPane2.Caption;

      for i:=0 to stl.Count-1 do
      begin
        ADOQuery2.Close;
        ADOQuery2.SQL.Clear;
        ADOQuery2.SQL.Add('select * from xsdds where djh=''1''');
        ADOQuery2.Open;
        ADOQuery2.Append;
        ADOQuery2.FieldByName('djh').AsString:=Edit1.Text;
        ADOQuery2.FieldByName('hbt').AsString:=FieldByName(RzStatusPane1.Caption).AsString;
        ADOQuery2.FieldByName('lbt').AsString:=stl.Strings[i];
        ADOQuery2.FieldByName('sl').AsString:=FieldByName(stl.Strings[i]).AsString;
        ADOQuery2.Post;
      end;

      Next;       
    end;
  end;

  ShowMessage('保存成功！');
  RzButtonEdit2.Text:=Edit1.Text;
  RzButtonEdit2.Button.Click;
end;

procedure TFddlr.cxGrid1DBTableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
var
  stl:Tstringlist;
  i:Integer;
begin
  inherited;
  try
    ewbQuery.Post;

    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=RzStatusPane2.Caption;

    ewbQuery.Edit;
    ewbQuery.FieldByName('合计').AsFloat:=0;
    for i:=0 to stl.Count-1 do
    begin
      ewbQuery.FieldByName('合计').AsFloat:=ewbQuery.FieldByName('合计').AsFloat+ewbQuery.FieldByName(stl.Strings[i]).AsFloat;
    end;

    ewbQuery.Post;
  except

  end;
end;

procedure TFddlr.RzButtonEdit2ButtonClick(Sender: TObject);
var
  stl:Tstringlist;
  i:integer;
  cl:TcxGridDBColumn;
begin
  inherited;
  with ADOQuery1 do
  begin 
    Close;
    SQL.Clear;
    SQL.Add('select * from xsdd where djh='+QuotedStr(RzButtonEdit2.Text));
    Open;

    if RecordCount=0 then
    begin
      ShowMessage('未找到对应的单据！');
      Exit;
    end;

    Edit1.Text:=FieldByName('djh').AsString;
    Date.Date:=FieldByName('rq').AsDateTime;
    RzEdit1.Text:=FieldByName('ypkh').AsString;
    RzButtonEdit1.Text:=FieldByName('kh').AsString+'/'+GetFieldStr('V_khda',FieldByName('kh').AsString,'客户编码','客户名称');
    RzEdit2.Text:=FieldByName('dhkh').AsString;
    RzEdit3.Text:=FieldByName('pm').AsString;
    CheckBox1.Checked:=FieldByName('jp').AsBoolean;
    RzStatusPane1.Caption:=FieldByName('hbtbt').AsString;
    RzStatusPane3.Caption:=FieldByName('hbt').AsString;
    RzStatusPane2.Caption:=FieldByName('lbt').AsString;
    //RzNumericEdit1.Text:=FieldByName('fc').AsString;
    //RzNumericEdit2.Text:=FieldByName('rs').AsString;
    //RzNumericEdit3.Text:=FieldByName('zs').AsString;
    //RzNumericEdit4.Text:=FieldByName('zb').AsString;

    //FieldByName('zdr').AsString:=GName;

    Close;
    SQL.Clear;
    SQL.Add('select * from spxx where djlx=''订单审核'' and djh='+QuotedStr(RzButtonEdit2.Text));
    Open;

    ComboBox1.Items.Clear;
    ComboBox1.Items.Add(FieldByName('dsrbm').AsString+'/'+FieldByName('dsr').AsString);
    ComboBox1.ItemIndex:=0;

    if FieldByName('shr').AsString='' then
    begin
      Label7.Caption:='未审核';
      BtnSecurity.Enabled:=True;
      BtnError.Enabled:=False;
      BtnEdit.Enabled:=True;
      BtnDelete.Enabled:=True;
      BtnDateView.Enabled:=False;
    end
    else
    begin
      Label7.Caption:=FieldByName('shr').AsString+'已审核';
      BtnSecurity.Enabled:=False;
      BtnError.Enabled:=True;
      BtnEdit.Enabled:=False;
      BtnDelete.Enabled:=False;
      BtnDateView.Enabled:=True;
    end;

    Close;
    SQL.Clear;
    SQL.Add(' IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[tmp_'+jqm+'_ewb]'') AND type in (N''U''))');
    SQL.Add(' DROP TABLE [dbo].[tmp_'+jqm+'_ewb]');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add(' CREATE TABLE [dbo].[tmp_'+jqm+'_ewb]( ');
    SQL.Add(' [id] [int] IDENTITY(1,1) NOT NULL, ');
    SQL.Add(' CONSTRAINT [PK_tmp_'+jqm+'_ewb] PRIMARY KEY CLUSTERED  ');
    SQL.Add(' (  ');
    SQL.Add(' [id] ASC   ');
    SQL.Add(' )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] ');
    SQL.Add(' ) ON [PRIMARY]');
    ExecSQL;

    //开始行标题
    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=RzStatusPane3.Caption;

    Close;
    SQL.Clear;
    SQL.Add('alter table tmp_'+jqm+'_ewb add '+(RzStatusPane1.Caption)+' varchar(50)');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select * from tmp_'+jqm+'_ewb');
    Open;

    for i:=0 to stl.Count-1 do
    begin
      Append;
      FieldByName(RzStatusPane1.Caption).AsString:=stl.Strings[i];
      Post;
    end;

    //开始列标题
    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=RzStatusPane2.Caption;
    for i:=0 to stl.Count-1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('alter table tmp_'+jqm+'_ewb add '+stl.Strings[i]+' float');
      ExecSQL; 
      //showmessage((stl.Strings[i]));

      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_ewb set '+stl.Strings[i]+' =0');
      ExecSQL;
    end;
    Close;
    SQL.Clear;
    SQL.Add('alter table tmp_'+jqm+'_ewb add '+'合计'+' float');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('update tmp_'+jqm+'_ewb set 合计 =0');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select * from xsdds where djh='+QuotedStr(RzButtonEdit2.Text));
    Open;
    First;
    while not Eof do
    begin
      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add('update tmp_'+jqm+'_ewb set '+FieldByName('lbt').AsString+'='+FieldByName('sl').AsString+' where '+RzStatusPane1.Caption+'='+QuotedStr(FieldByName('hbt').AsString));
      ADOQuery2.ExecSQL;

      Next;
    end;

    stl:= Tstringlist.Create();
    stl.Delimiter:=',';
    stl.CommaText:=RzStatusPane2.Caption;    
    Close;
    SQL.Clear;
    SQL.Add('update tmp_'+jqm+'_ewb set 合计=');
      for i:=0 to stl.Count-1 do
      begin
        if i=0 then
          SQL.Add(' '+stl.Strings[i])
        else
          SQL.Add(' +'+stl.Strings[i]);
      end;
    ExecSQL;    
  end;

  ewbQuery.Close;
  ewbQuery.SQL.Clear;
  ewbQuery.SQL.Add('select * from tmp_'+jqm+'_ewb');
  ewbQuery.Open;

  Screen.Cursor :=  crHourGlass;
  cxGrid1DBTableView1.BeginUpdate;
  try
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.Summary.FooterSummaryItems.Clear;
    for i := 0 to cxGrid1DBTableView1.DataController.DataSet.FieldCount - 1 do
    begin
      cl  :=  cxGrid1DBTableView1.CreateColumn;
      cl.DataBinding.FieldName :=
          cxGrid1DBTableView1.DataController.DataSet.Fields[i].FieldName;
      if cxGrid1DBTableView1.DataController.DataSet.Fields[i] is TNumericField then
      begin
        TNumericField(cxGrid1DBTableView1.DataController.DataSet.Fields[i])
            .DisplayFormat  :=  '#,##0.00';
        cl.Width := 80;
        cl.Summary.FooterKind := sksum;
      end
      else if cxGrid1DBTableView1.DataController.DataSet.Fields[i] is TStringField then
        cl.Width := 100
      else
        cl.Width := 80;
      cl.HeaderAlignmentHorz :=  taCenter;
    end;  //if
  finally
    cxGrid1DBTableView1.EndUpdate;
    Screen.Cursor := crDefault;
  end;

  Liulan;
end;

procedure TFddlr.BtnFirstRecordClick(Sender: TObject);
begin
  //inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select min(djh) as djh from xsdd');
    Open;
    RzButtonEdit2.Text:=FieldByName('djh').AsString;
  end;
  RzButtonEdit2.Button.Click;
end;

procedure TFddlr.BtnLastRecordClick(Sender: TObject);
begin
  //inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(djh) as djh from xsdd');
    Open;
    RzButtonEdit2.Text:=FieldByName('djh').AsString;
  end;
  RzButtonEdit2.Button.Click;
end;

procedure TFddlr.BtnPreviousRecordClick(Sender: TObject);
begin
  //inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select max(djh) as djh from xsdd where djh<'+QuotedStr(dqdh));
    Open;
    RzButtonEdit2.Text:=FieldByName('djh').AsString;
  end;
  RzButtonEdit2.Button.Click;
end;

procedure TFddlr.BtnNextRecordClick(Sender: TObject);
begin
  //inherited;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select min(djh) as djh from xsdd where djh>'+QuotedStr(dqdh));
    Open;
    RzButtonEdit2.Text:=FieldByName('djh').AsString;
  end;
  RzButtonEdit2.Button.Click;
end;

procedure TFddlr.BtnDeleteClick(Sender: TObject);
begin
  inherited;

  with ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM mfljh where ddh='+QuotedStr(Edit1.Text));
    Open;

    if RecordCount>0 then
    begin
      Application.MessageBox('该订单已经使用，不可删除!!', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;

  if MessageBox(HANDLE,'您是否确认删除这个订单？','友情提示',MB_OKCANCEL)=IDOK then
  begin
    with ADOQuery3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from xsdd where djh='+QuotedStr(Edit1.Text));
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('delete from xsdds where djh='+QuotedStr(Edit1.Text));
      ExecSQL;
    end;

    ShowMessage('删除完成');
  end;
  BtnLastRecord.Click;
end;

procedure TFddlr.BtnEditClick(Sender: TObject);
begin
  inherited;
  Xiugai;
end;

procedure TFddlr.BtnSecurityClick(Sender: TObject);
begin
  inherited;
  if (GetStr(ComboBox1.Text,'/',True)=Gid) or (Gid='admin') then
  begin
    SelSSQL:='';
    Frysel:=TFrysel.Create(Application);
    Frysel.ShowModal;
    Frysel.Free;

    if SelSSQL='' then
      Exit
    else
      RzEdit4.Text:=SelSSQL;

    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Add('delete from spxx where djlx=''订单工艺'' and djh='+QuotedStr(Edit1.Text));
    ADOQuery4.ExecSQL;
    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Add('select * from spxx where djh='+QuotedStr(Edit1.Text));
    ADOQuery4.Open;
    ADOQuery4.Append;
    ADOQuery4.FieldByName('djlx').AsString:='订单工艺';
    ADOQuery4.FieldByName('djh').AsString:=Edit1.Text;
    ADOQuery4.FieldByName('dsrbm').AsString:=GetStr(RzEdit4.Text,'/',True);
    ADOQuery4.FieldByName('dsr').AsString:=GetStr(RzEdit4.Text,'/',False);
    ADOQuery4.Post;


    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Add('select * from spxx where djlx=''订单审核'' and djh='+QuotedStr(Edit1.Text));
    ADOQuery4.Open;

    ADOQuery4.Edit;
    ADOQuery4.FieldByName('shrbm').AsString:=Gid;
    ADOQuery4.FieldByName('shr').AsString:=GName;
    ADOQuery4.FieldByName('shsj').AsDateTime:=Now();
    ADOQuery4.Post;

    RzButtonEdit2.Text:=Edit1.Text;
    RzButtonEdit2.Button.Click;
  end
  else
  begin
    ShowMessage('你无权审核该单据');
  end;
end;

procedure TFddlr.BtnErrorClick(Sender: TObject);
begin
  inherited;
  if (GetStr(ComboBox1.Text,'/',True)=Gid) or (Gid='admin') then
  begin
    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Add('delete from spxx where djlx=''订单工艺'' and djh='+QuotedStr(Edit1.Text));
    ADOQuery4.ExecSQL;

    ADOQuery4.Close;
    ADOQuery4.SQL.Clear;
    ADOQuery4.SQL.Add('update spxx set shrbm=null,shr=null,shsj=null where djlx=''订单审核'' and djh='+QuotedStr(Edit1.Text));
    ADOQuery4.ExecSQL;

    RzButtonEdit2.Text:=Edit1.Text;
    RzButtonEdit2.Button.Click;
  end
  else
  begin
    ShowMessage('你无权弃审该单据');
  end;
end;

procedure TFddlr.BtnDateViewClick(Sender: TObject);
begin
  inherited;
  if (GetStr(RzEdit4.Text,'/',True)=Gid) or (Gid='admin') then
  begin
    SelSSQL:=Edit1.Text;
    Flcsz:=TFlcsz.Create(Application);
    Flcsz.ShowModal;
    Flcsz.Free;
  end
  else
  begin
    ShowMessage('你无权设置流程！');
  end;
end;

procedure TFddlr.ComboBox1DropDown(Sender: TObject);
begin
  inherited;
  with ADOQuery4 do
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

procedure TFddlr.FormShow(Sender: TObject);
begin
  inherited;
  BtnLastRecord.Click;
end;

end.
