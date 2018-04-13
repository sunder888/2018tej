unit Ujhsc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ComCtrls, RzEdit, Buttons, Mask,
  RzBtnEdt;

type
  TFjhsc = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    RzButtonEdit1: TRzButtonEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    RzNumericEdit1: TRzNumericEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetFieldStr(Table,Get,GetField,ResultField:String):String;
    function GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;    
  end;

var
  Fjhsc: TFjhsc;

implementation

uses UDM, UGlobal, UddSel;

{$R *.dfm}

function TFjhsc.GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;
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

function TFjhsc.GetFieldStr(Table,Get,GetField,ResultField:String):String;
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

procedure TFjhsc.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:=lx;

  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[tmp_'+jqm+'_jhscs]'') AND type in (N''U'')) ');
    SQL.Add(' DROP TABLE [dbo].[tmp_'+jqm+'_jhscs] ');
    ExecSql;

    Close;
    SQL.Clear;
    SQL.Add(' CREATE TABLE [dbo].[tmp_'+jqm+'_jhscs](   ');
    SQL.Add(' [id] [int] IDENTITY(1,1) NOT NULL,   ');
    SQL.Add(' [ddh] [varchar](50) NULL,  ');
    SQL.Add(' [jhlx] [varchar](50) NULL,  ');
    SQL.Add(' [mc] [varchar](500) NULL,  ');
    SQL.Add(' [bw] [varchar](200) NULL,  ');
    SQL.Add(' [ys] [varchar](200) NULL,  ');
    SQL.Add(' [cm] [varchar](200) NULL,  ');
    SQL.Add(' [dh] [float] NULL,  ');
    SQL.Add(' [ddsl] [float] NULL,  ');
    SQL.Add(' [sl] [float] NULL,  ');
    SQL.Add(' [bomsid] [int] NULL,  ');
    SQL.Add(' CONSTRAINT [PK_tmp_'+jqm+'_jhscs] PRIMARY KEY CLUSTERED  ');
    SQL.Add(' (   ');
    SQL.Add(' [id] ASC   ');
    SQL.Add(' )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]  ');
    SQL.Add(' ) ON [PRIMARY] ');
    ExecSql;
  end;

  if zt='新增' then
  begin
    RzButtonEdit1.Text:='';
    RzButtonEdit1.Enabled:=True;
    Label6.Caption:='';
    Label2.Caption:='';
    Label3.Caption:='';    

    RzButtonEdit1.SetFocus;
  end;

  if zt='修改' then
  begin
    RzButtonEdit1.Text:='';
    RzButtonEdit1.Enabled:=False;

    with ADOQuery3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from V_jhb where 订单号='+QuotedStr(SelSSQL)+' and 类型='+QuotedStr(SelSSQL1));
      Open;

      Label2.Caption:=FieldByName('大货款号').AsString;
      RzButtonEdit1.Text:=FieldByName('订单号').AsString;
      Label3.Caption:=SelSSQL;
      Label6.Caption:=FieldByName('品名').AsString;
      //Label10.Caption:=FieldByName('流程').AsString;

      Close;
      SQL.Clear;
      SQL.Add(' insert into tmp_'+jqm+'_jhscs(ddh,jhlx,mc,bw,ys,cm,dh,sl,bomsid,ddsl)  SELECT ddh,jhlx,mc,bw,ys,cm,dh,sl,bomsid,ddsl ');
      SQL.Add(' FROM jhbs');
      SQL.Add(' WHERE ddh= '+QuotedStr(SelSSQL)+' and jhlx='+QuotedStr(SelSSQL1));
      ExecSql;
    end;    // with
  end;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT mc as 名称,bw as 部位,ys as 颜色,cm as 尺码,dh as 单耗,ddsl as 订单数量,sl as 数量 FROM tmp_'+jqm+'_jhscs');
  ADOQuery1.Open;

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();
end;

procedure TFjhsc.RzButtonEdit1ButtonClick(Sender: TObject);
var
  st1,st2:Tstringlist;
  i,j:Integer;
begin
  SelSSQL:=RzButtonEdit1.Text;
  FddSel:=TFddSel.Create(Application);
  FddSel.ShowModal;
  FddSel.Free;

  RzButtonEdit1.Text:=SelSSQL;

  Label3.Caption:=SelSSQL;
  Label2.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','dhkh');
  Label6.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','pm');

  Label4.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','fc');
  if Label4.Caption='' then
    Label4.Caption:='0';
  Label7.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','rs');
  if Label7.Caption='' then
    Label7.Caption:='0';
  Label8.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','zs');
  if Label8.Caption='' then
    Label8.Caption:='0';
  //Label9.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','pm');

  //Label13.Caption:=GetFieldStr(uf+'..inventory',SelSSQL,'cinvcode','bComsume');
  //ShowMessage(copy(SelSSQL,1,3));

  with ADOQuery2 do
  begin
    //把BOM取过来
    Close;
    SQL.Clear;
    SQL.Add(' IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[tmp_'+jqm+'_bomsdr]'') AND type in (N''U'')) ');
    SQL.Add(' DROP TABLE [dbo].[tmp_'+jqm+'_bomsdr] ');
    ExecSql;

    Close;
    SQL.Clear;
    SQL.Add(' CREATE TABLE [dbo].[tmp_'+jqm+'_bomsdr](   ');
    SQL.Add(' [id] [int] IDENTITY(1,1) NOT NULL,   ');
    SQL.Add(' [ddh] [varchar](50) NULL,  ');
    SQL.Add(' [dylx] [varchar](50) NULL,  ');
    SQL.Add(' [clbm] [varchar](50) NULL,  ');
    SQL.Add(' [clmc] [varchar](50) NULL,  ');
    SQL.Add(' [clgg] [varchar](50) NULL,  ');
    SQL.Add(' [mltz] [varchar](50) NULL,  ');
    SQL.Add(' [sfyt] [varchar](50) NULL,  ');
    SQL.Add(' [mf] [varchar](50) NULL,   ');
    SQL.Add(' [kz] [varchar](50) NULL,  ');
    SQL.Add(' [sl] [float] NULL,  ');
    SQL.Add(' [mc] [varchar](500) NULL,  ');
    SQL.Add(' [dyms] [varchar](50) NULL,  ');
    SQL.Add(' [msmc] [varchar](50) NULL,  ');
    SQL.Add(' [mssl] [float] NULL,   ');
    SQL.Add(' [bw] [varchar](200) NULL,  ');
    SQL.Add(' [ys] [varchar](200) NULL,  ');
    SQL.Add(' [cm] [varchar](200) NULL,  ');
    SQL.Add(' [bomsid] [int] NULL,  ');
    SQL.Add(' CONSTRAINT [PK_tmp_'+jqm+'_bomsdr] PRIMARY KEY CLUSTERED  ');
    SQL.Add(' (   ');
    SQL.Add(' [id] ASC   ');
    SQL.Add(' )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]  ');
    SQL.Add(' ) ON [PRIMARY] ');
    ExecSql;

    Close;
    SQL.Clear;
    SQL.Add(' insert into tmp_'+jqm+'_bomsdr(bomsid,[ddh],[dylx],[clbm],[clmc],[clgg],mltz,sfyt,[mf],[kz],[sl],[dyms],[mssl],mc,bw,ys,cm,msmc)  SELECT dbo.boms.id,dbo.boms.ddh, dbo.boms.dylx, dbo.boms.clbm, dbo.clda.clmc, dbo.clda.clgg,dbo.boms.mltz,dbo.boms.sfyt,'+' dbo.boms.mf, dbo.boms.kz, dbo.boms.sl, dbo.clda.dyms, dbo.boms.mssl,dbo.boms.mc,dbo.boms.bw,dbo.boms.ys,dbo.boms.cm,dbo.boms.msmc ');
    SQL.Add(' FROM dbo.clda INNER JOIN ');
    SQL.Add(' dbo.boms ON dbo.clda.clbm = dbo.boms.clbm ');
    SQL.Add(' WHERE boms.ddh= '+QuotedStr(SelSSQL));
    ExecSql;

    //面料
    if StatusBar1.Panels[0].Text='面料' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tmp_'+jqm+'_bomsdr where dylx=''经销面料''');
      Open;
      First;
      while not Eof do
      begin
        st1:= Tstringlist.Create();
        st1.Delimiter:=',';
        st1.CommaText:=FieldByName('ys').AsString;

        st2:= Tstringlist.Create();
        st2.Delimiter:=',';
        st2.CommaText:=FieldByName('cm').AsString;

        for i:=0 to st1.Count-1 do
        begin
          for j:=0 to st2.Count-1 do
          begin
            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;
            ADOQuery3.SQL.Add('select * from tmp_'+jqm+'_jhscs');
            ADOQuery3.Open;
            ADOQuery3.Append;
            ADOQuery3.FieldByName('ddh').AsString:=RzButtonEdit1.Text;
            ADOQuery3.FieldByName('jhlx').AsString:='面料';
            ADOQuery3.FieldByName('mc').AsString:=FieldByName('mc').AsString;
            ADOQuery3.FieldByName('bw').AsString:=FieldByName('bw').AsString;
            ADOQuery3.FieldByName('ys').AsString:=st1.Strings[i];
            ADOQuery3.FieldByName('cm').AsString:=st2.Strings[j];
            ADOQuery3.FieldByName('dh').AsFloat:=FieldByName('sl').AsFloat;
            ADOQuery3.FieldByName('bomsid').AsInteger:=FieldByName('bomsid').AsInteger;
            ADOQuery3.Post;
          end;
        end;

        Next;
      end;

      //更新订单数量
      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_jhscs set tmp_'+jqm+'_jhscs.ddsl = xsdds.sl from xsdds where tmp_'+jqm+'_jhscs.ddh = xsdds.djh and tmp_'+jqm+'_jhscs.ys = xsdds.hbt and tmp_'+jqm+'_jhscs.cm = xsdds.lbt'); 
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_jhscs set sl=dh*ddsl*('+Label4.Caption+'+100)/100*('+Label7.Caption+'+100)/100*('+Label8.Caption+'+100)/100 '); 
      ExecSQL;      
    end;

    //染色
    if (StatusBar1.Panels[0].Text='染色') or (StatusBar1.Panels[0].Text='织造') then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tmp_'+jqm+'_bomsdr where dylx=''外协面料''');
      Open;
      First;
      while not Eof do
      begin
        st1:= Tstringlist.Create();
        st1.Delimiter:=',';
        st1.CommaText:=FieldByName('ys').AsString;

        st2:= Tstringlist.Create();
        st2.Delimiter:=',';
        st2.CommaText:=FieldByName('cm').AsString;

        for i:=0 to st1.Count-1 do
        begin
          for j:=0 to st2.Count-1 do
          begin
            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;
            ADOQuery3.SQL.Add('select * from tmp_'+jqm+'_jhscs');
            ADOQuery3.Open;
            ADOQuery3.Append;
            ADOQuery3.FieldByName('ddh').AsString:=RzButtonEdit1.Text;
            ADOQuery3.FieldByName('jhlx').AsString:=StatusBar1.Panels[0].Text;
            ADOQuery3.FieldByName('mc').AsString:=FieldByName('clmc').AsString;
            ADOQuery3.FieldByName('bw').AsString:=FieldByName('bw').AsString;
            ADOQuery3.FieldByName('ys').AsString:=st1.Strings[i];
            ADOQuery3.FieldByName('cm').AsString:=st2.Strings[j];
            ADOQuery3.FieldByName('dh').AsFloat:=FieldByName('sl').AsFloat;
            ADOQuery3.FieldByName('bomsid').AsInteger:=FieldByName('id').AsInteger;
            ADOQuery3.Post;
          end;
        end;

        Next;
      end;

      //更新订单数量
      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_jhscs set tmp_'+jqm+'_jhscs.ddsl = xsdds.sl from xsdds where tmp_'+jqm+'_jhscs.ddh = xsdds.djh and tmp_'+jqm+'_jhscs.ys = xsdds.hbt and tmp_'+jqm+'_jhscs.cm = xsdds.lbt');
      ExecSQL;

      Close;
      SQL.Clear;
      if (StatusBar1.Panels[0].Text='染色') then
        SQL.Add('update tmp_'+jqm+'_jhscs set sl=dh*ddsl*('+Label4.Caption+'+100)/100*('+Label7.Caption+'+100)/100 ');
      if (StatusBar1.Panels[0].Text='织造') then
        SQL.Add('update tmp_'+jqm+'_jhscs set sl=dh*ddsl*('+Label4.Caption+'+100)/100*('+Label7.Caption+'+100)/100*('+Label8.Caption+'+100)/100 ');
      ExecSQL;
    end;

    //棉纱
    if (StatusBar1.Panels[0].Text='棉纱') then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tmp_'+jqm+'_bomsdr where dylx=''外协面料''');
      Open;
      First;
      while not Eof do
      begin
        st1:= Tstringlist.Create();
        st1.Delimiter:=',';
        st1.CommaText:=FieldByName('ys').AsString;

        st2:= Tstringlist.Create();
        st2.Delimiter:=',';
        st2.CommaText:=FieldByName('cm').AsString;

        for i:=0 to st1.Count-1 do
        begin
          for j:=0 to st2.Count-1 do
          begin
            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;
            ADOQuery3.SQL.Add('select * from tmp_'+jqm+'_jhscs');
            ADOQuery3.Open;
            ADOQuery3.Append;
            ADOQuery3.FieldByName('ddh').AsString:=RzButtonEdit1.Text;
            ADOQuery3.FieldByName('jhlx').AsString:=StatusBar1.Panels[0].Text;
            ADOQuery3.FieldByName('mc').AsString:=FieldByName('mc').AsString;
            ADOQuery3.FieldByName('bw').AsString:=FieldByName('bw').AsString;
            ADOQuery3.FieldByName('ys').AsString:=st1.Strings[i];
            ADOQuery3.FieldByName('cm').AsString:=st2.Strings[j];
            ADOQuery3.FieldByName('dh').AsFloat:=FieldByName('mssl').AsFloat;
            ADOQuery3.FieldByName('bomsid').AsInteger:=FieldByName('id').AsInteger;
            ADOQuery3.Post;
          end;
        end;

        Next;
      end;

      //更新订单数量
      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_jhscs set tmp_'+jqm+'_jhscs.ddsl = xsdds.sl from xsdds where tmp_'+jqm+'_jhscs.ddh = xsdds.djh and tmp_'+jqm+'_jhscs.ys = xsdds.hbt and tmp_'+jqm+'_jhscs.cm = xsdds.lbt');
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_jhscs set sl=dh*ddsl*('+Label4.Caption+'+100)/100*('+Label7.Caption+'+100)/100*('+Label8.Caption+'+100)/100 ');
      ExecSQL;
    end;

    //辅料
    if StatusBar1.Panels[0].Text='辅料' then
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tmp_'+jqm+'_bomsdr where dylx=''辅料''');
      Open;
      First;
      while not Eof do
      begin
        st1:= Tstringlist.Create();
        st1.Delimiter:=',';
        st1.CommaText:=FieldByName('ys').AsString;

        st2:= Tstringlist.Create();
        st2.Delimiter:=',';
        st2.CommaText:=FieldByName('cm').AsString;

        for i:=0 to st1.Count-1 do
        begin
          for j:=0 to st2.Count-1 do
          begin
            ADOQuery3.Close;
            ADOQuery3.SQL.Clear;
            ADOQuery3.SQL.Add('select * from tmp_'+jqm+'_jhscs');
            ADOQuery3.Open;
            ADOQuery3.Append;
            ADOQuery3.FieldByName('ddh').AsString:=RzButtonEdit1.Text;
            ADOQuery3.FieldByName('jhlx').AsString:='辅料';
            ADOQuery3.FieldByName('mc').AsString:=FieldByName('clmc').AsString;
            ADOQuery3.FieldByName('bw').AsString:=FieldByName('bw').AsString;
            ADOQuery3.FieldByName('ys').AsString:=st1.Strings[i];
            ADOQuery3.FieldByName('cm').AsString:=st2.Strings[j];
            ADOQuery3.FieldByName('dh').AsFloat:=FieldByName('sl').AsFloat;
            ADOQuery3.FieldByName('bomsid').AsInteger:=FieldByName('id').AsInteger;
            ADOQuery3.Post;
          end;
        end;

        Next;
      end;

      //更新订单数量
      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_jhscs set tmp_'+jqm+'_jhscs.ddsl = xsdds.sl from xsdds where tmp_'+jqm+'_jhscs.ddh = xsdds.djh and tmp_'+jqm+'_jhscs.ys = xsdds.hbt and tmp_'+jqm+'_jhscs.cm = xsdds.lbt'); 
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('update tmp_'+jqm+'_jhscs set sl=dh*ddsl');
      ExecSQL;
    end;
    
    
    ADOQuery1.Close;
    ADOQuery1.Open;

    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems();
    cxGrid1DBTableView1.ApplyBestFit();

  end;
end;

procedure TFjhsc.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  RzNumericEdit1.Text:=ADOQuery1.FieldByName('数量').AsString;
end;

procedure TFjhsc.BitBtn2Click(Sender: TObject);
begin
  ADOQuery1.Edit;
  ADOQuery1.FieldByName('数量').AsString:=RzNumericEdit1.Text;
  ADOQuery1.Post;
end;

procedure TFjhsc.BitBtn1Click(Sender: TObject);
begin
  if Label3.Caption='' then
  begin
    ShowMessage('请选择订单号');
    RzButtonEdit1.SetFocus;
    Exit;
  end;

  with ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('delete from jhb where ddh='+QuotedStr(Label3.Caption)+' and jhlx='+QuotedStr(StatusBar1.Panels[0].Text));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('delete from jhbs where ddh='+QuotedStr(Label3.Caption)+' and jhlx='+QuotedStr(StatusBar1.Panels[0].Text));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select * from jhb where ddh='+QuotedStr(Label3.Caption));
    Open;
    Append;
    FieldByName('ddh').AsString:=Label3.Caption;
    FieldByName('jhlx').AsString:=StatusBar1.Panels[0].Text;    
    Post;

    Close;
    SQL.Clear;
    SQL.Add('insert into jhbs([ddh],[jhlx],[bomsid],[mc],[bw],[cm],[ys],[dh],[sl],[ddsl])  select [ddh],[jhlx],[bomsid],[mc],[bw],[cm],[ys],[dh],[sl],[ddsl] from tmp_'+jqm+'_jhscs');
    ExecSQL; 
  end;

  ShowMessage('保存完成');
  Close;
end;

end.
