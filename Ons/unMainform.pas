unit unMainform;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    pnlLayout: TPanel;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    btnAction: TButton;
    procedure btnActionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnActionClick(Sender: TObject);
var
  resultStr, oriStr :string;
  i :Byte;
begin
  i :=0;
  oriStr :='ABCDEFGHIJKLMN';
  resultStr:='***';
  while i < Length(oriStr) do
  begin
    resultStr :=resultStr + oriStr[i];
    i :=2 * i - 1;
  end;

  pnlTop.Caption :=resultStr;

end;

end.
