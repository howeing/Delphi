unit unClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  RxCtrls, RxRichEd, Vcl.Mask, RxSpin, CodeSiteLogging, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient;

type
  TForm1 = class(TForm)
    btnConnect: TButton;
    RxLabelStatus: TRxLabel;
    RxLabelContent: TRxLabel;
    RxRichEditSend: TRxRichEdit;
    btnSend: TButton;
    RxSpinEditPort: TRxSpinEdit;
    cs: TCodeSiteLogger;
    csDest: TCodeSiteDestination;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    btnDisconnect: TButton;
    GroupBox1: TGroupBox;
    ClientSocket1: TClientSocket;
    ShapeStatus: TShape;
    RxSpinLen: TRxSpinEdit;
    edtIP: TLabeledEdit;
    IdUDPClient1: TIdUDPClient;
    procedure btnConnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure RxSpinEditPortChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure RxRichEditSendChange(Sender: TObject);
  private
    { Private declarations }
    strDT, strDetail :string;

  public
    { Public declarations }
    procedure CSLogging(vContent: string); overload;
    procedure CSLogging(vContent: string; vTime :TDateTime); overload;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  ClientSocket1.Address :=edtIP.Text;
  ClientSocket1.Port :=Trunc(RxSpinEditPort.Value);
  ClientSocket1.Active :=True ;
end;

procedure TForm1.btnSendClick(Sender: TObject);
begin
  if not ClientSocket1.Socket.Connected then Exit;
  ClientSocket1.Socket.SendText(RxRichEditSend.Text);
  CSLogging('Server Send: ' + RxRichEditSend.Text);
end;

procedure TForm1.btnDisconnectClick(Sender: TObject);
begin
  ClientSocket1.Active :=False;
end;

procedure TForm1.RxRichEditSendChange(Sender: TObject);
begin
  RxSpinLen.Value :=Length(Trim(RxRichEditSend.Text));
end;

procedure TForm1.RxSpinEditPortChange(Sender: TObject);
begin
  RxSpinEditPort.ValueType :=vtInteger;
  ClientSocket1.Port :=Trunc(RxSpinEditPort.Value);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RxSpinEditPort.Value :=ClientSocket1.Port ;
  edtIP.Text :=ClientSocket1.Address;
  RxSpinLen.Value :=Length(Trim(RxRichEditSend.Text));
end;

procedure TForm1.CSLogging(vContent: string);
var
  strDT :string;
begin
  strDT :=FormatdateTime('yyyy-mm-dd  hh:mm:ss ', Now);
  cs.SendFmtMsg('%s  %s' ,[strDT, vContent]);
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if Socket.Connected then
  begin
    RxLabelStatus.Caption :='Connected' ;
    CSLogging('Client conncted to Server');
    ShapeStatus.Brush.Color :=clLime ;
    ShapeStatus.Pen.Color :=clLime ;
  end
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RxLabelStatus.Caption :='Not connected';
  CSLogging('Client disconncted ......');
  ShapeStatus.Brush.Color :=clRed ;
  ShapeStatus.Pen.Color :=clRed ;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
  RxLabelContent.Caption :=Socket.ReceiveText;
  CSLogging('Server Recived: ' + Socket.ReceiveText);
end;

procedure TForm1.CSLogging(vContent: string; vTime :TDateTime);
var
  strDT :string;
begin
  strDT :=FormatdateTime('yyyy-mm-dd  hh:mm:ss ', vTime);
  cs.SendFmtMsg('%s  %s' ,[strDT, vContent]);
end;


end.
