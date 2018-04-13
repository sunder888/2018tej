unit UDM;

interface

uses
  SysUtils, Classes, ImgList, Controls, DB, ADODB, RzShellDialogs;

type
  TDM = class(TDataModule)
    conn: TADOConnection;
    QRead: TADOQuery;
    QRead1: TADOQuery;
    ImageList1: TImageList;
    ImageList3: TImageList;
    ImageList2: TImageList;
    RzSaveDialog1: TRzSaveDialog;
    QTree: TADOQuery;
    Stree: TDataSource;
    DataSource1: TDataSource;
    QXclhz: TADOQuery;
    QXclmx: TADOQuery;
    QStockmx: TADOQuery;
    sStockmx: TDataSource;
    Econn: TADOConnection;
    EQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
