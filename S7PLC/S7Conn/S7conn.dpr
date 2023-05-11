program S7conn;

uses
  Vcl.Forms,
  unMain in 'unMain.pas' {frmMain},
  S7Simatic in 'public\S7Simatic.pas',
  step7 in 'public\step7.pas',
  unGrids in 'unGrids.pas' {frmGrids},
  unPublic in 'public\unPublic.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  //Application.CreateForm(TfrmGrids, frmGrids);
  Application.Run;
end.
