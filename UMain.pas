unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, RzGroupBar, jpeg, RzStatus, RzPanel,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, DB,
  ADODB, RzLine, RzSplit, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData,shellapi, cxCheckBox;

type
  TFMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    RzStatusBar1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    RzStatusPane2: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    RzLine1: TRzLine;
    RzSizePanel1: TRzSizePanel;
    RzSizePanel2: TRzSizePanel;
    RzGroupBar1: TRzGroupBar;
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzPanel2: TRzPanel;
    RzGroupBox2: TRzGroupBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    cxGrid1DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    Timer1: TTimer;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenForm(FormClass:TFormClass;var fm;AOwner:TComponent);
    procedure SubItemClick(Sender: TObject);
    procedure syj();
  end;

var
  FMain: TFMain;

implementation

uses UDM, UGlobal, Uqxsz, Uxtsz, UgysEditlb, UkhEditlb, UchflEdit,
  UcldaEditlb, UewbEditlb, Uddlr, Ubomlr, Umfljh, Umflly, Umflrk, Ucylchb,
  Uwxlchb, UwxdzbEditlb, Ujhsclb, Ujhhblb, UlcdaEditlb;
{$R *.dfm}

//ˢԤ��
procedure TFMain.syj();
begin
  with ADOQuery4 do
  begin
    //������ͳ��
  end;    // with
end;

//���Ӵ���
procedure TFMain.OpenForm(FormClass:TFormClass;var fm;AOwner:TComponent);
var
  i:Integer;
  Child:TForm;
begin
  try
    for i:=0 to Screen.FormCount-1 do
      if Screen.Forms[i].ClassType=FormClass then
      begin
        Child:=Screen.Forms[i];
        if Child.WindowState=wsMaximized then
          ShowWindow(Child.Handle,1);
        if (not Child.Visible) then Child.Visible:=true;
        Child.BringToFront;
        Child.SetFocus;
        TForm(fm):=Child;
        exit
      end;
      Child:=TForm(FormClass.NewInstance);
      TForm(fm):=Child;
      Child.Create(AOwner);
  except
  end;
end;

//ȷ���˳�ϵͳ����ɱ��湤��
procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageBox(HANDLE,'���Ƿ����Ҫ�˳���ϵͳ��','������ʾ',MB_OKCANCEL)=IDOK then
    CanClose:=True
  else
    CanClose:=False;
end;

procedure TFMain.N3Click(Sender: TObject);
begin
  Close;
end;

procedure TFMain.SubItemClick(Sender: TObject);
begin
  if TRzGroupItem(Sender).Caption='ϵͳ����' then
  begin
    Fxtsz:=TFxtsz.Create(Application);
    Fxtsz.ShowModal;
    Fxtsz.Free;
  end;

  if TRzGroupItem(Sender).Caption='Ȩ������' then
    OpenForm(TFqxsz,Fqxsz,self);

  if TRzGroupItem(Sender).Caption='��Ӧ�̵���' then
    OpenForm(TFgysEditlb,FgysEditlb,self);

  if TRzGroupItem(Sender).Caption='�ͻ�����' then
    OpenForm(TFkhEditlb,FkhEditlb,self);

  if TRzGroupItem(Sender).Caption='���Ϸ���' then
  begin
    FchflEdit:=TFchflEdit.Create(Application);
    FchflEdit.ShowModal;
    FchflEdit.Free;
  end;
  //OpenForm(TFchflEdit,FchflEdit,self);

  if TRzGroupItem(Sender).Caption='���ϵ���' then
    OpenForm(TFcldaEditlb,FcldaEditlb,self);

  if TRzGroupItem(Sender).Caption='��Э���ձ�' then
    OpenForm(TFwxdzbEditlb,FwxdzbEditlb,self);

  if TRzGroupItem(Sender).Caption='��ά����' then
    OpenForm(TFewbEditlb,FewbEditlb,self);

  if TRzGroupItem(Sender).Caption='����¼��' then
    OpenForm(TFddlr,Fddlr,self);

  if TRzGroupItem(Sender).Caption='�µ���Ҫ' then
    OpenForm(TFbomlr,Fbomlr,self);

  if TRzGroupItem(Sender).Caption='�渨�ϼƻ�' then
    OpenForm(TFmfljh,Fmfljh,self);

  if TRzGroupItem(Sender).Caption='�渨�����' then
    OpenForm(TFmflrk,Fmflrk,self);

  if TRzGroupItem(Sender).Caption='�渨������' then
    OpenForm(TFmflly,Fmflly,self);

  if TRzGroupItem(Sender).Caption='�������̻㱨' then
    OpenForm(TFcylchb,Fcylchb,self);

  if TRzGroupItem(Sender).Caption='��Э�������̻㱨' then
    OpenForm(TFwxlchb,Fwxlchb,self);

  //���ϡ�Ⱦɫ��֯�졢��ɴ������
  if TRzGroupItem(Sender).Caption='���ϼƻ�' then
  begin
    try
      Fjhsclb.Destroy;
    except

    end;

    lx:='����';
    OpenForm(TFjhsclb,Fjhsclb,self);
  end;
  if TRzGroupItem(Sender).Caption='Ⱦɫ�ƻ�' then
  begin
    try
      Fjhsclb.Destroy;
    except

    end;

    lx:='Ⱦɫ';
    OpenForm(TFjhsclb,Fjhsclb,self);
  end;
  if TRzGroupItem(Sender).Caption='֯��ƻ�' then
  begin
    try
      Fjhsclb.Destroy;
    except

    end;

    lx:='֯��';
    OpenForm(TFjhsclb,Fjhsclb,self);
  end;
  if TRzGroupItem(Sender).Caption='��ɴ�ƻ�' then
  begin
    try
      Fjhsclb.Destroy;
    except

    end;

    lx:='��ɴ';
    OpenForm(TFjhsclb,Fjhsclb,self);
  end;
  if TRzGroupItem(Sender).Caption='���ϼƻ�' then
  begin
    try
      Fjhsclb.Destroy;
    except

    end;

    lx:='����';
    OpenForm(TFjhsclb,Fjhsclb,self);
  end;

  //���ϡ�Ⱦɫ��֯�졢��ɴ������
  if TRzGroupItem(Sender).Caption='���ϼƻ��㱨' then
  begin
    try
      Fjhhblb.Destroy;
    except
    end;
    lx:='����';
    OpenForm(TFjhhblb,Fjhhblb,self);
  end;

  if TRzGroupItem(Sender).Caption='Ⱦɫ�ƻ��㱨' then
  begin
    try
      Fjhhblb.Destroy;
    except
    end;
    lx:='Ⱦɫ';
    OpenForm(TFjhhblb,Fjhhblb,self);
  end;

  if TRzGroupItem(Sender).Caption='֯��ƻ��㱨' then
  begin
    try
      Fjhhblb.Destroy;
    except
    end;
    lx:='֯��';
    OpenForm(TFjhhblb,Fjhhblb,self);
  end;

  if TRzGroupItem(Sender).Caption='��ɴ�ƻ��㱨' then
  begin
    try
      Fjhhblb.Destroy;
    except
    end;
    lx:='��ɴ';
    OpenForm(TFjhhblb,Fjhhblb,self);
  end;

  if TRzGroupItem(Sender).Caption='���ϼƻ��㱨' then
  begin
    try
      Fjhhblb.Destroy;
    except
    end;
    lx:='����';
    OpenForm(TFjhhblb,Fjhhblb,self);
  end;

  if TRzGroupItem(Sender).Caption='���̵���' then
    OpenForm(TFlcdaEditlb,FlcdaEditlb,self);  


end;

procedure TFMain.FormShow(Sender: TObject);
var
  Group: TRzGroup;
  GroupItem: TRzGroupItem;
  i:Integer;
begin
  syj;

  i:=0;

  with DM.QRead do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from yhb where yhbm='+QuotedStr(Gid));
    Open;

    GName:=FieldByName('yhxm').AsString;
    RzStatusPane1.Caption:=Gid+'/'+GName;

    Close;
    SQL.Clear;
    SQL.Add('select * from xtsz where xmm=''��λ����''');
    Open;
    Gdwmc:=FieldByName('xmz').AsString;
    RzStatusPane2.Caption:=Gdwmc;

    Close;
    SQL.Clear;
    SQL.Add('select * from xtsz where xmm=''�汾''');
    Open;
    //ShowMessage(FieldByName('xmz').AsString);
    if FieldByName('xmz').AsString<>'0.95' then
    begin
      ShowMessage('�������汾�Ѿ����£��뼰ʱ���£���');
      Application.Terminate;
    end;
    

    Close;
    SQL.Clear;
    SQL.Add('SELECT *  FROM [dbo].[V_yhqx]  where yhid='+QuotedStr(Gid)+' and sfqx=1 and zid=''-1''');
    Open;

    First;

    while not Eof do
    begin
      Group:= TRzGroup.Create(RzGroupBar1);
      Group.Caption:= FieldByName('qxm').AsString;
      RzGroupBar1.AddGroup(Group);

      DM.QRead1.Close;
      DM.QRead1.SQL.Clear;
      DM.QRead1.SQL.Add('select * from v_yhqx where yhid='+QuotedStr(Gid)+' and sfqx=1 and fid='+FieldByName('fid').AsString+' and zid<>''-1''');
      DM.QRead1.Open;
      DM.QRead1.First;

      while not DM.QRead1.Eof do
      begin
        GroupItem:= RzGroupBar1.Groups[i].Items.Add;

        GroupItem.Caption:= DM.QRead1.FieldByName('qxm').AsString;
        GroupItem.Selected:= True;
        //GroupItem.Data:=PAnsiChar(FieldByName('data').AsString); ;
        GroupItem.OnClick:= SubItemClick;

        DM.QRead1.Next;
      end;    // while

      i:=i+1;

      Next;
    end;    // while
  end;    // with

  //ShellExecute(Handle,nil,'update.exe', nil, nil, SW_SHOW);
end;

procedure TFMain.Timer1Timer(Sender: TObject);
begin
  //syj;
end;

end.
