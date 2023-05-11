unit unEMFTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Winapi.GDIPUTIL, Winapi.GDIPAPI, Winapi.GDIPOBJ,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  wmf :TMetafile;
  wmfCanvas :TMetafileCanvas;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  x, y :integer;
begin
  try
    wmfCanvas :=TMetafileCanvas.CreateWithComment(wmf, 0, 'Macro', 'Demo meatafile');
    wmfCanvas.Brush.Color :=clWhite;
    wmfCanvas.FillRect(wmfCanvas.ClipRect);
    for x := 1 to 20 do
      for y := 1 to 20 do
      begin
        wmfCanvas.MoveTo(15*(x+random(3)), 15*(y+random(6)));
        wmfCanvas.LineTo(45*x, 45*y);
      end;
  finally
    wmfCanvas.Free;
  end;
  paintbox1.Canvas.Draw(0, 0, wmf);
  wmf.SaveToFile('D:\wmfemf.emf');
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  wmf.LoadFromFile('D:\wmfemf.emf');
  if checkbox1.Checked then
    Canvas.StretchDraw(Paintbox1.Canvas.ClipRect, wmf)
  else
    Canvas.Draw(0, 0, wmf);
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
  g :TGPGraphics;
  p :TGPPen;
  m :TGPMetafile;
  arr :Array[0..9] of Single;
begin
  g :=TGPGraphics.Create(Canvas.Handle);
  P :=TGPPen.Create(MakeColor(255, 0, 0, 100),15);

  arr[0] :=0.00;
  arr[1] :=0.01;

  arr[2] :=0.10;
  arr[3] :=0.11;

  arr[4] :=0.20;
  arr[5] :=0.21;

  arr[6] :=0.30;
  arr[7] :=0.31;

  arr[8] :=0.40;
  arr[9] :=0.41;

  //p.SetEndCap(LineCapNoAnchor );
  //p.SetCompoundArray(@arr, Length(arr));
  p.SetEndCap(LineCapFlat );
  g.DrawLine(p, 50, 60, 150, 60);

  p.SetEndCap(LineCapSquare );
  g.DrawLine(p, 50, 90, 150, 90);

  p.SetEndCap(LineCapRound );
  g.DrawLine(p, 50, 120, 150, 120);

  p.SetEndCap(LineCapTriangle );
  g.DrawLine(p, 50, 150, 150, 150);

  p.SetEndCap(LineCapNoAnchor );
  g.DrawLine(p, 50, 180, 150, 180);

  p.SetEndCap(LineCapSquareAnchor );
  g.DrawLine(p, 50, 210, 150, 210);

  p.SetEndCap(LineCapRoundAnchor );
  g.DrawLine(p, 50, 240, 150, 240);

  p.SetEndCap(LineCapDiamondAnchor );
  g.DrawLine(p, 50, 270, 150, 270);

  p.SetEndCap(LineCapArrowAnchor );
  g.DrawLine(p, 50, 300, 150, 300);

  p.SetEndCap(LineCapCustom );
  g.DrawLine(p, 50, 330, 150, 330);

  p.SetEndCap(LineCapAnchorMask );
  g.DrawLine(p, 50, 360, 150, 360);


  //g.DrawArc(p, 100,100,600,200,110,110);


  p.Free;
  g.Free;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  wmf :=TMetafile.Create;
  wmf.Enhanced :=True;
  Randomize;
end;

end.
