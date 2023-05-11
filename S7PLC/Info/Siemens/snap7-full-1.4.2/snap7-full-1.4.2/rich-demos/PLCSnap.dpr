program PLCSnap;

uses
  Vcl.Forms,
  snap7 in 'snap7.pas',
  sc_info in 'sc_info.pas' {SmartConnectInfo},
  cp_info in 'cp_info.pas' {ParamsConnectInfo},
  bind_info in 'bind_info.pas' {BindErrortInfo},
  mainclient in 'mainclient.pas' {FormClient},
  MainServer in 'MainServer.pas' {FrmServer},
  MainPartner in 'MainPartner.pas' {frmMain},
  frmPartner in 'frmPartner.pas' {PartnerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  // Application.CreateForm(TFrmServer, FrmServer);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
