unit MainPartner;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  ComCtrls, ExtCtrls, Grids, frmPartner, Menus,
  Snap7;

type

  { TForm1 }

  TfrmMain = class(TForm)
    NewActiveBtn: TButton;
    NewPassiveBtn: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure NewActiveBtnClick(Sender: TObject);
    procedure NewPassiveBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{ TForm1 }


procedure TfrmMain.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmMain.NewActiveBtnClick(Sender: TObject);
begin
  TPartnerForm.Create(Application).CreatePartner(_Active);
end;

procedure TfrmMain.NewPassiveBtnClick(Sender: TObject);
begin
  TPartnerForm.Create(Application).CreatePartner(_Passive);
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
Var
  Count : integer;
begin
//Count:=Par_PartnersCount;
//  StatusBar.Panels[0].Text:='Partners : '+IntToStr(Count);
end;

end.