unit unGrids;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.Tabs,
  XLSSheetData5, XLSReadWriteII5, XLSGrid5, Vcl.Grids;

type
  TfrmGrids = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    Grid: TXLSGrid;
    XLS: TXLSReadWriteII5;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrids: TfrmGrids;

implementation

{$R *.dfm}

procedure TfrmGrids.FormCreate(Sender: TObject);
begin
  Grid.XLS.Filename :='C:\Users\hao.zhao\Desktop\tags.xls';
  Grid.XLS.Read ;
  Grid.ColWidths[0] :=40;
  Grid.ColWidths[1] :=240;
  Grid.ColWidths[2] :=60;
  Grid.ColWidths[3] :=60;
  Grid.ColWidths[4] :=60;
  Grid.ColWidths[5] :=40;
  Grid.ColWidths[6] :=100;
end;

end.
