unit unPython;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PythonEngine, PythonVersions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Phys.OracleDef,
  FireDAC.Phys.Oracle ;

type
  TForm1 = class(TForm)
    PythonEngine1: TPythonEngine;
    FDManager1: TFDManager;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  PythonVersion: TPythonVersion;
  path, SysVersion :string;
begin
  path :='C:\Users\hao.zhao\Anaconda3';
  SysVersion :='3.7' ;
  if GetRegisteredPythonVersion(SysVersion, PythonVersion) then
//  if PythonVersionFromPath(Path, PythonVersion) then
  begin
    PythonVersion.AssignTo(PythonEngine1);
    PythonEngine1.LoadDLL
  end

end;

end.
