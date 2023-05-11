unit unServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  RxCtrls, RxRichEd, Vcl.Mask, RxSpin, CodeSiteLogging, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, IdGlobal, IdSocketHandle,
  IdUDPClient;

type
  TDataRec = record
    msg :string;
  end;

type
  TfrmServer = class(TForm)
    ServerTcp: TServerSocket;
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
    ShapeStatus: TShape;
    ServerUdp: TIdUDPServer;
    rdoTcp: TRxRadioButton;
    rdoUdp: TRadioButton;
    IdUDPClient1: TIdUDPClient;
    procedure btnConnectClick(Sender: TObject);
    procedure ServerTcpClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerTcpClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure btnSendClick(Sender: TObject);
    procedure RxSpinEditPortChange(Sender: TObject);
    procedure ServerTcpListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure ServerTcpClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerUdpUDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
  private
    { Private declarations }
    strDT, strDetail :string;

  public
    { Public declarations }
    procedure CSLogging(vContent: string); overload;
    procedure CSLogging(vContent: string; vTime :TDateTime); overload;
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.dfm}

procedure TfrmServer.btnConnectClick(Sender: TObject);
begin
  if rdoTcp.Checked then
  begin
    ServerTcp.Active :=True ;
    RxLabelStatus.Caption :='Waiting TCP connecting......';
    CSLogging(Format('TCP Server Open Listing[Port = %d] ...... , But no connected!',[ServerTcp.Port]));
  end
  else
  begin
    ServerUdp.Active :=True ;
    RxLabelStatus.Caption :='Waiting UDP connecting......';
    CSLogging(Format('UDP Server Open Listing[Port = %d] ...... , But no connected!',[ServerTcp.Port]));
  end
end;

procedure TfrmServer.btnSendClick(Sender: TObject);
begin
  if rdoTcp.Checked then
  begin
    if not ServerTcp.Socket.Connected then Exit;
    ServerTcp.Socket.SendText(RxRichEditSend.Text);
    CSLogging('TCP Server Send: ' + RxRichEditSend.Text);
  end
  else
  begin
    ServerUdp.Send('127.0.0.1', 6651, 'UDP Protocol.', nil);
    CSLogging('UDP Server Send: ' + RxRichEditSend.Text);
  end;
end;

procedure TfrmServer.btnDisconnectClick(Sender: TObject);
begin
  if rdoTcp.Checked then
  begin
    ServerTcp.Active :=False;
    RxLabelStatus.Caption :=Format('TCP Port[%d]  Closed !',[ServerTcp.Port]);
    CSLogging(Format('TCP Port[%d]  Closed !',[ServerTcp.Port]));
  end
  else
  begin
    ServerUdp.Active :=False;
    RxLabelStatus.Caption :='UDP Closed !';
    CSLogging(Format('UDP Port[%d]  Closed !',[ServerTcp.Port]));
  end;
end;

procedure TfrmServer.RxSpinEditPortChange(Sender: TObject);
begin
  RxSpinEditPort.ValueType :=vtInteger;
  ServerTcp.Port :=Trunc(RxSpinEditPort.Value);
end;

procedure TfrmServer.ServerTcpClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if Socket.Connected then
  begin
    RxLabelStatus.Caption :='Connected' ;
    CSLogging('Client conncted to Server ......');
  end;
  ShapeStatus.Brush.Color :=clLime ;
  ShapeStatus.Pen.Color :=clLime ;
end;

procedure TfrmServer.ServerTcpClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  if ServerTcp.Active then
  begin
    RxLabelStatus.Caption :='Not connected';
    CSLogging('Client disconncted ......');
  end
  else
  begin
   RxLabelStatus.Caption :='Not connected';
   CSLogging('Server close Port ......');
  end;
  ShapeStatus.Brush.Color :=clRed ;
  ShapeStatus.Pen.Color :=clRed ;
end;

procedure TfrmServer.ServerTcpClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RxLabelContent.Caption :=Socket.ReceiveText;
  CSLogging('Server Recived: ' + Socket.ReceiveText);
end;

procedure TfrmServer.ServerTcpListen(Sender: TObject; Socket: TCustomWinSocket);
begin
//  if ServerSocket1.Socket.Connected then
//  begin
//    RxLabelStatus.Caption :='Connected';
//    CSLogging(Format('Connected! [Port = %d]!',[ServerSocket1.Port]));
//  end
//  else if ServerSocket1.Active then
//  begin
//    RxLabelStatus.Caption :='Waiting connecting......';
//    CSLogging(Format('Server Open Listing[Port = %d] ...... , But no connected!',[ServerSocket1.Port]));
//  end
//  else
//  begin
//    RxLabelStatus.Caption :='Not connect';
//    CSLogging(Format('Server [Port = %d] closed!',[ServerSocket1.Port]));
//  end;

end;

procedure TfrmServer.ServerUdpUDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  buffer :array[1..255] of char;
  str :string;
  i :integer ;
begin
  BytesToRaw(AData, buffer, SizeOf(buffer));
  for i := 0 to Length(buffer) do
    str :=str + buffer[i];
  cs.SendMsg(str);
end;

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  RxSpinEditPort.Value :=ServerTcp.Port ;
end;

procedure TfrmServer.CSLogging(vContent: string);
var
  strDT :string;
begin
  strDT :=FormatdateTime('yyyy-mm-dd  hh:mm:ss ', Now);
  cs.SendFmtMsg('%s  %s' ,[strDT, vContent]);
end;

procedure TfrmServer.CSLogging(vContent: string; vTime :TDateTime);
var
  strDT :string;
begin
  strDT :=FormatdateTime('yyyy-mm-dd  hh:mm:ss ', vTime);
  cs.SendFmtMsg('%s  %s' ,[strDT, vContent]);
end;


end.
