program Layout;

uses
  Vcl.Forms,
  unTengzhou in 'unTengzhou.pas' {frmTengzhou},
  unFlat in 'unFlat.pas' {frmFlat},
  unTengzhou4 in 'unTengzhou4.pas' {frmTengzhou4},
  unZibo in 'unZibo.pas' {frmZibo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTengzhou4, frmTengzhou4);
  Application.Run;
end.
