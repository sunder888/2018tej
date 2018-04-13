unit Ubomlredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, RzEdit, Buttons, Mask, RzBtnEdt,
  ComCtrls;

type
  TFbomlredit = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    RzButtonEdit1: TRzButtonEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    RzNumericEdit1: TRzNumericEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RzButtonEdit2: TRzButtonEdit;
    Label4: TLabel;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label11: TLabel;
    ComboBox2: TComboBox;
    BitBtn4: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    RzNumericEdit2: TRzNumericEdit;
    RzNumericEdit3: TRzNumericEdit;
    RzNumericEdit4: TRzNumericEdit;
    RzNumericEdit5: TRzNumericEdit;
    Label16: TLabel;
    RzNumericEdit6: TRzNumericEdit;
    Label17: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RzButtonEdit2ButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RzButtonEdit2Enter(Sender: TObject);
    procedure RzButtonEdit2Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetFieldStr(Table,Get,GetField,ResultField:String):String;
    function GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;
  end;

var
  Fbomlredit: TFbomlredit;

implementation

uses UDM, UGlobal,  Ubomlr, UddSel, Ucldasel, Ubommxedit;

{$R *.dfm}

function TFbomlredit.GetFieldFloat(Table,Get,GetField,ResultField:String):Extended;
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

function TFbomlredit.GetFieldStr(Table,Get,GetField,ResultField:String):String;
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

procedure TFbomlredit.FormShow(Sender: TObject);
begin
  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[tmp_'+jqm+'_boms]'') AND type in (N''U'')) ');
    SQL.Add(' DROP TABLE [dbo].[tmp_'+jqm+'_boms] ');
    ExecSql;

    Close;
    SQL.Clear;
    SQL.Add(' CREATE TABLE [dbo].[tmp_'+jqm+'_boms](   ');
    SQL.Add(' [id] [int] NULL,   ');
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
    SQL.Add(' [tmpid] [int] IDENTITY(1,1) NOT NULL,  ');
    SQL.Add(' CONSTRAINT [PK_tmp_'+jqm+'_boms] PRIMARY KEY CLUSTERED   ');
    SQL.Add(' ( ');
    SQL.Add(' [tmpid] ASC   ');
    SQL.Add(' )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY] ');
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
      SQL.Add('select * from V_bom where 订单号='+QuotedStr(SelSSQL));
      Open;

      Label2.Caption:=FieldByName('大货款号').AsString;
      RzButtonEdit1.Text:=FieldByName('订单号').AsString;
      Label3.Caption:=SelSSQL;
      Label6.Caption:=FieldByName('品名').AsString;
      Label10.Caption:=FieldByName('流程').AsString;

      RzNumericEdit2.Text:=FieldByName('负次').AsString;
      RzNumericEdit3.Text:=FieldByName('染损').AsString;
      RzNumericEdit4.Text:=FieldByName('织损').AsString;
      RzNumericEdit5.Text:=FieldByName('织比').AsString;
      RzNumericEdit6.Text:=FieldByName('落水定型').AsString;

      Close;
      SQL.Clear;
      SQL.Add(' insert into tmp_'+jqm+'_boms(id,[ddh],[dylx],[clbm],[clmc],[clgg],mltz,sfyt,[mf],[kz],[sl],[dyms],[mssl],mc,bw,ys,cm,msmc)  SELECT dbo.boms.id,dbo.boms.ddh, dbo.boms.dylx, dbo.boms.clbm, dbo.clda.clmc, dbo.clda.clgg,dbo.boms.mltz,dbo.boms.sfyt,'+' dbo.boms.mf, dbo.boms.kz, dbo.boms.sl, dbo.clda.dyms, dbo.boms.mssl,dbo.boms.mc,dbo.boms.bw,dbo.boms.ys,dbo.boms.cm,dbo.boms.msmc ');
      SQL.Add(' FROM dbo.clda INNER JOIN ');
      SQL.Add(' dbo.boms ON dbo.clda.clbm = dbo.boms.clbm ');
      SQL.Add(' WHERE boms.ddh= '+QuotedStr(SelSSQL));
      ExecSql;
    end;    // with
  end;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT  [dylx] as 对应类型,[clbm] as 材料编码,[clmc] as 材料名称,[clgg] as 材料规格,mltz as 面料特征 ,sfyt as'+' 是否圆筒,[mf] as 门幅,[kz] as 克重,[sl] as 数量,[dyms] as 对应棉纱,msmc as 棉纱名称,[mssl] as 棉纱数量,[mc] as 名称,bw as 部位,ys as 颜色,cm as 尺寸,ddh,id  FROM tmp_'+jqm+'_boms');
  ADOQuery1.Open;

  cxGrid1DBTableView1.ClearItems;
  cxGrid1DBTableView1.DataController.CreateAllItems();
  cxGrid1DBTableView1.ApplyBestFit();
end;

procedure TFbomlredit.BitBtn3Click(Sender: TObject);
begin
  if RzButtonEdit1.Enabled then
  begin
    ADOQuery1.Delete;
  end
  else
  begin
    with ADOQuery4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from jhbs where ddh='+QuotedStr(RzButtonEdit1.Text)+' and bomsid='+ADOQuery1.FieldByName('id').AsString);
      Open;

      if RecordCount>0 then
      begin
        ShowMessage('已经下达计划，无法删除！');
        Exit;
      end;
    end;
  end; 


end;

procedure TFbomlredit.RzButtonEdit1ButtonClick(Sender: TObject);
begin
  SelSSQL:=RzButtonEdit1.Text;
  FddSel:=TFddSel.Create(Application);
  FddSel.ShowModal;
  FddSel.Free;

  RzButtonEdit1.Text:=SelSSQL;

  Label3.Caption:=SelSSQL;
  Label2.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','dhkh');
  Label6.Caption:=GetFieldStr('xsdd',SelSSQL,'djh','pm');
  //Label13.Caption:=GetFieldStr(uf+'..inventory',SelSSQL,'cinvcode','bComsume');
  //ShowMessage(copy(SelSSQL,1,3));
end;

procedure TFbomlredit.BitBtn2Click(Sender: TObject);
begin
  if RzNumericEdit1.Text='0.00' then
  begin
    ShowMessage('要输入数量');
    Exit;
  end;

  if GetStr(RzButtonEdit2.Text,'/',True)='' then
  begin
    ShowMessage('请输入料号');
    Exit;
  end;

  if GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','对应类型')='外协面料' then
  with ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sum(msbl) as msbl from wxdzb where mlbm='+QuotedStr(GetStr(RzButtonEdit2.Text,'/',True)));
    Open;

    if (FieldByName('msbl').AsString='') or (FieldByName('msbl').AsFloat<>100) then
    begin
      ShowMessage('请补全外协对照表，并确认比例合计是100');
      Exit;
    end;

    Close;
    SQL.Clear;
    SQL.Add('select * from wxdzb where mlbm='+QuotedStr(GetStr(RzButtonEdit2.Text,'/',True)));
    Open;

    First;
    while not Eof do
    begin
      ADOQuery1.Append;
      ADOQuery1.FieldByName('ddh').AsString:=Label3.Caption;
      ADOQuery1.FieldByName('对应类型').AsString:=GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','对应类型');
      ADOQuery1.FieldByName('材料编码').AsString:=GetStr(RzButtonEdit2.Text,'/',True);
      ADOQuery1.FieldByName('材料名称').AsString:=GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','材料名称');
      ADOQuery1.FieldByName('材料规格').AsString:=GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','材料规格');
      ADOQuery1.FieldByName('门幅').AsString:=RzEdit1.Text;
      ADOQuery1.FieldByName('克重').AsString:=RzEdit2.Text;
      ADOQuery1.FieldByName('数量').AsString:=RzNumericEdit1.Text;
      ADOQuery1.FieldByName('面料特征').AsString:=ComboBox1.Text;
      ADOQuery1.FieldByName('是否圆筒').AsString:=ComboBox2.Text;
      ADOQuery1.FieldByName('对应棉纱').AsString:=FieldByName('msbm').AsString;
      ADOQuery1.FieldByName('棉纱名称').AsString:=GetFieldStr('V_clda',FieldByName('msbm').AsString,'材料编码','材料名称');
      ADOQuery1.FieldByName('棉纱数量').AsFloat:=StrToFloat(RzNumericEdit1.Text)*FieldByName('msgs').AsFloat*FieldByName('msbl').AsFloat/100;
      ADOQuery1.Post;

      Next;
    end;
  end;

  if GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','对应类型')<>'外协面料' then  
  with ADOQuery1 do
  begin
    Append;
    FieldByName('ddh').AsString:=Label3.Caption;
    FieldByName('对应类型').AsString:=GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','对应类型');
    FieldByName('材料编码').AsString:=GetStr(RzButtonEdit2.Text,'/',True);
    FieldByName('材料名称').AsString:=GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','材料名称');
    FieldByName('材料规格').AsString:=GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','材料规格');
    FieldByName('门幅').AsString:=RzEdit1.Text;
    FieldByName('克重').AsString:=RzEdit2.Text;
    FieldByName('数量').AsString:=RzNumericEdit1.Text;
    FieldByName('面料特征').AsString:=ComboBox1.Text;
    FieldByName('是否圆筒').AsString:=ComboBox2.Text;
    //FieldByName('对应棉纱').AsString:=GetFieldStr('V_clda',GetFieldStr('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','对应棉纱'),'材料编码','材料名称');
    //FieldByName('棉纱数量').AsFloat:=StrToFloat(RzNumericEdit1.Text)*GetFieldFloat('V_clda',GetStr(RzButtonEdit2.Text,'/',True),'材料编码','棉纱公式');
    Post;
  end;

  cxGrid1DBTableView1.ApplyBestFit();

  RzButtonEdit2.Text:='';
  RzEdit1.Text:='';
  RzEdit2.Text:='';
  ComboBox1.Text:='';
  ComboBox2.Text:='';
  RzNumericEdit1.Text:='0.00';
end;

procedure TFbomlredit.RzButtonEdit2ButtonClick(Sender: TObject);
begin
  invsel:='非棉纱';
  SelSSQL:=RzButtonEdit2.Text;

  FcldaSel:=TFcldaSel.Create(Application);
  FcldaSel.ShowModal;
  FcldaSel.Free;

  RzButtonEdit2.Text:=SelSSQL;
end;

procedure TFbomlredit.BitBtn1Click(Sender: TObject);
var
  i:Integer;
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
    SQL.Add('delete from bom where ddh='+QuotedStr(Label3.Caption));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('delete from boms where ddh='+QuotedStr(Label3.Caption));
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select * from bom where ddh='+QuotedStr(Label3.Caption));
    Open;
    Append;
    FieldByName('ddh').AsString:=Label3.Caption;
    FieldByName('lc').AsString:=Label10.Caption;
    FieldByName('fc').AsString:=RzNumericEdit2.Text;
    FieldByName('rs').AsString:=RzNumericEdit3.Text;
    FieldByName('zs').AsString:=RzNumericEdit4.Text;
    FieldByName('zb').AsString:=RzNumericEdit5.Text;
    FieldByName('lsdx').AsString:=RzNumericEdit6.Text;

    Post;

    Close;
    SQL.Clear;
    SQL.Add('update tmp_'+jqm+'_boms set mc=isnull(mltz,'''')+'' ''+isnull(msmc,'''')+'' ''+case mf when null then ''''  when '''' then ''''  else ''有效门幅''+mf end+'' ''+case kz when null then ''''  when '''' then ''''  else ''克重''+kz+''G/M2'' end');
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('select max(id) as id from tmp_'+jqm+'_boms');
    Open;
    i:=FieldByName('id').AsInteger+1;
    Close;
    SQL.Clear;
    SQL.Add('select * from tmp_'+jqm+'_boms where id is null');
    Open;
    while not Eof do
    begin
      Edit;
      FieldByName('id').AsInteger:=i;
      Post;
      i:=i+1;
      Next;
    end;
    

    Close;
    SQL.Clear;
    SQL.Add('insert into boms(id,[ddh],[dylx],[clbm],[mf],[kz],[sl],mltz,sfyt,bw,ys,cm,[mc],[dyms],[msmc],[mssl])  select id,[ddh],[dylx],[clbm],[mf],[kz],[sl],mltz,sfyt,bw,ys,cm,[mc],[dyms],[msmc],[mssl] from tmp_'+jqm+'_boms');
    ExecSQL; 
  end;

  SelSSQL:=Label6.Caption;  

  ShowMessage('保存完成');
  Close;

end;

procedure TFbomlredit.RzButtonEdit2Enter(Sender: TObject);
begin
  RzButtonEdit2.Text:=GetStr(RzButtonEdit2.Text,'/',True);
end;

procedure TFbomlredit.RzButtonEdit2Exit(Sender: TObject);
begin
  RzButtonEdit2.Text:=RzButtonEdit2.Text+'/'+GetFieldStr('V_clda',RzButtonEdit2.Text,'材料编码','材料名称');
end;

procedure TFbomlredit.BitBtn4Click(Sender: TObject);
begin
  if RzNumericEdit1.Enabled then
  begin
    SelSSQL:=Label3.Caption;

    try
    begin
      Fbommxedit:=TFbommxedit.Create(Application);
      Fbommxedit.ShowModal;
      Fbommxedit.Free;
    end;
    except
    end;

    ADOQuery1.Edit;
    if SelSSQL1<>'sunder' then
      ADOQuery1.FieldByName('颜色').AsString:=SelSSQL1;
    if SelSSQL2<>'sunder' then
      ADOQuery1.FieldByName('尺寸').AsString:=SelSSQL2;
    if SelSSQL3<>'sunder' then
      ADOQuery1.FieldByName('部位').AsString:=SelSSQL3;
    ADOQuery1.Post;
  end;
end;

procedure TFbomlredit.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  //
  if (AViewInfo.GridRecord.DisplayTexts[13]<>'') or (AViewInfo.GridRecord.DisplayTexts[14]<>'') or (AViewInfo.GridRecord.DisplayTexts[15]<>'') then
  begin
    ACanvas.Brush.Color:=clgreen;
    ACanvas.FillRect(AViewInfo.Bounds);
    ACanvas.DrawText(AViewInfo.GridRecord.DisplayTexts[AViewInfo.Item.Index], AViewInfo.Bounds, cxAlignHCenter);
    ADone:=true;
  end;
end;

end.
