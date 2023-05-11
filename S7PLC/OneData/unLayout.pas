unit unLayout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RxDice, RxSpin, Vcl.StdCtrls,
  Vcl.Buttons, RxCtrls, RxToolEdit, RxCurrEdit, Vcl.Mask, Vcl.ExtCtrls,
  RxTimerLst, CodeSiteLogging, MemTableDataEh, Data.DB, Data.Win.ADODB,
  System.Sensors, Vcl.WinXCalendars, Vcl.WinXPickers, System.Sensors.Components,
  DataDriverEh, ADODataDriverEh, DBCtrlsEh, PythonEngine ;

type
  TfrmLayout = class(TForm)
    RxPanel1: TRxPanel;
    RxCalcEdit1: TRxCalcEdit;
    CurrencyEdit1: TCurrencyEdit;
    ComboEdit1: TComboEdit;
    FilenameEdit1: TFilenameEdit;
    DirectoryEdit1: TDirectoryEdit;
    DateEdit1: TDateEdit;
    RxLabel1: TRxLabel;
    RxCheckBox1: TRxCheckBox;
    RxRadioButton1: TRxRadioButton;
    RxAnimBitBtn1: TRxAnimBitBtn;
    RxSpinEdit1: TRxSpinEdit;
    RxTimeEdit1: TRxTimeEdit;
    RxDice1: TRxDice;
    RxTimerList1: TRxTimerList;
    RxTimerEvent1: TRxTimerEvent;
    cs: TCodeSiteLogger;
    RxAnimBitBtn2: TRxAnimBitBtn;
    csDest: TCodeSiteDestination;
    RxAnimBitBtn3: TRxAnimBitBtn;
    DBEditEh1: TDBEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DatePicker1: TDatePicker;
    CalendarPicker1: TCalendarPicker;
    RxDice2: TRxDice;
    CurrencyEdit2: TCurrencyEdit;
    PythonEngine1: TPythonEngine;
    procedure RxTimerEvent1Timer(Sender: TObject);
    procedure RxAnimBitBtn1Click(Sender: TObject);
    procedure RxAnimBitBtn2Click(Sender: TObject);
    procedure RxAnimBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLayout: TfrmLayout;

  actionDice :boolean = true;

implementation

{$R *.dfm}

procedure TfrmLayout.RxAnimBitBtn1Click(Sender: TObject);
begin
  RxTimerEvent1.Enabled :=true;
end;

procedure TfrmLayout.RxAnimBitBtn2Click(Sender: TObject);
begin
  RxTimerEvent1.Enabled :=false;
end;

procedure TfrmLayout.RxAnimBitBtn3Click(Sender: TObject);
begin
  if actionDice then
  begin
    RxDice1.Rotate :=true;
    RxDice2.Rotate :=true;
  end
  else
  begin
    RxDice1.Rotate :=false;
    RxDice2.Rotate :=false;
    RxCalcEdit1.Value :=RxDice1.Value + RxDice2.Value;
  end;
  actionDice := not actionDice ;
end;

procedure TfrmLayout.RxTimerEvent1Timer(Sender: TObject);
var
  Timer: ICodeSiteTimer;
  summary :double;
begin

  Timer := CodeSite.Timer( 'Loop Timer', tfMilliseconds, false, false );
  Timer.Start;
  for var i := 1 to 10000 do
    summary :=summary + i* 0.5 ;
  Timer.Stop;                 // Timing message sent
end;


end.
