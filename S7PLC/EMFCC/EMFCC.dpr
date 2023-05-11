program EMFCC;

uses
  Vcl.Forms,
  unEMFCC in 'unEMFCC.pas' {Form1},
  unEMFTest in 'unEMFTest.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
