unit unTengzhou4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Math, Vcl.Graphics, Winapi.GDIPOBJ, Winapi.GDIPAPI,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  CodeSiteLogging, RxCtrls, Vcl.ExtCtrls;

type
  TPosSize = record
    Num: string;
    Len: integer;
    wid: integer;
    gap: integer;
    NumPos: word;
    subPos: boolean;
  end;

type
  TfrmTengzhou4 = class(TForm)
    BitBtn1: TBitBtn;
    cs: TCodeSiteLogger;
    csDest: TCodeSiteDestination;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxSave: TRxCheckBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure setPos;
    procedure DrawLine(Sx, Sy, Ex, Ey: word; CurColor: TColor);
    procedure DrawRect(Sx, Sy, Ex, Ey: word; borderColor: TColor;
      fillColor: TColor = clWhite);
    procedure DrawPositonRect(areaNo: byte);
    procedure DrawConnection(areaNo: byte);
    procedure DrawLabels(areaNo: byte);
    procedure DrawArrow(Sx, Sy: word; sizeLength: word;
      direction: byte); overload;
    procedure DrawArrow(Sx, Sy: word; sizeLength, sizeWidth: word;
      direction: byte); overload;
    procedure DrawArea(areaNo: byte);
    procedure DrawRoller(Sx, Sy, Slength, Swidth, Sratio, Srubbernum: word;
      borderColor, fillColor: TColor; Spair, Shorizon: boolean);
    procedure DrawRollers(Sx, Sy, Rlength, Rwidth, Rratio, RollersNum: word;
      borderColor, fillColor: TColor; Shorizon: boolean);
    procedure DrawEdgeTrim(Sx, Sy, Rlength, Rwidth, Rratio, RollersNum: word;
      borderColor, fillColor: TColor; Shorizon: boolean);
    procedure DrawChevron(Sx, Sy, Rlength, Rwidth, Rratio: word;
      borderColor, fillColor: TColor; Shorizon: boolean);
    procedure DrawSnap(areaNo: byte; Sx, Sy, Rlength: word; borderColor, fillColor: TColor);
    procedure DrawSideLine(areaNo: byte; Sx, Sy, Rlength, Rwidth, L1, W1, L2, W2, Rratio, vOffset, top, direction:word; posLabel: string; borderColor, fillColor :TColor);
    procedure DrawRotator(areaNo: byte; Cx, Cy, Rlength, Rwidth, direction, vOffset :word; borderColor, fillColor :TColor);
    procedure DrawRotationStacker(areaNo: byte; Cx, Cy, Rlength, Rwidth, direction, vOffset :word; borderColor, fillColor :TColor);
    procedure DrawRectangleStacker(areaNo: byte; Cx, Cy, Rlength, Rwidth, direction, vOffset :word; borderColor, fillColor :TColor);
    procedure DrawAirDesk(areaNo: byte; Sx, Sy, xLength, yLength, xHole, yHole, radial, direction, vOffset : integer; zoom :word=100);
    procedure DrawLabel(Sx, Sy, lineLength, direction :integer; posNo :string);
    procedure DrawSideLine_simple(areaNo: byte; Sx, Sy, Rlength, Rwidth, L1, W1, L2, W2, Rratio, vOffset, top, direction:word; posLabel: string; borderColor, fillColor :TColor);

  public
    { Public declarations }
  end;

var
  frmTengzhou4: TfrmTengzhou4;
  posLabel, pos, posData: array [0 .. 37] of TPosSize;

  sumLen: longword;
  iStartX, iStartY, layoutDistance, labelOffSet: long;
  zeroX: longword = 100;
  zeroY: longword = 200;

  minPos, maxPos, ratio, arrowLength, arrowSx, arrowSy, slLabelOffSet: word;

  g :TGPGraphics;
  p :TGPPen;
  b :TGPSolidBrush;

implementation

{$R *.dfm}

procedure TfrmTengzhou4.DrawSideLine_simple(areaNo: byte; Sx, Sy, Rlength, Rwidth, L1, W1, L2, W2, Rratio, vOffset, top, direction:word; posLabel: string; borderColor, fillColor :TColor);
var
  iRect :TRect ;
  vSx, vSy, vEx, vEy, vCx, vCy, iType, iState :integer;
  vTop :integer;
  areaPosLabel :string;
begin
  if (posLabel='170.190') then  areaPosLabel :='201.' else areaPosLabel :='202.';

  iType := DFC_BUTTON;
  iState := DFCS_BUTTONPUSH or DFCS_FLAT;
  vTop :=Ceil(Power(-1,top));
  vCx :=Sx+Rlength div Rratio div 2;
  vCy :=Sy+(Rwidth div Rratio div 2+vOffset)*vTop;
  vSx :=Sx;
  //vSy :=sy + vOffSet*vTop;
  vSy :=vEy + vOffSet*vTop;
  vEx :=vSx + Rlength div Rratio;
  //vEy :=vSy + Rwidth div Rratio*vTop;
  vEy :=vSy + W1 div Rratio*vTop;
  iRect :=Rect(vSx, vSy, vEx, vEy);

  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
  vSx :=vSx + (Rlength-L1) div Rratio div 2;
  //vSy :=vEy + vOffSet*vTop;
  vSy :=sy + vOffSet*vTop;
  vEx :=vSx + L1 div Rratio;
  //vEy :=vSy + W1 div Rratio*vTop;
  vEy :=vSy + Rwidth div Rratio*vTop;
  iRect :=Rect(vSx, vSy, vEx, vEy);
  DrawRect(vSx, vSy, vEx, vEy, borderColor, fillcolor);

  //if ((areaNo =0) and (Sy<500)) or (areaNo >0) then
  if ((Sy<500) and (posLabel='170.190')) or ((Sy<500) and (posLabel='170.220')) then
  begin
    DrawLine(Sx+Rlength div Rratio div 2, vEy, Sx+Rlength div Rratio div 2, vEy + (Rwidth div Rratio div 2)*vTop*2, clGreen);
    DrawLabel(Sx+Rlength div Rratio div 2-34, vEy + (Rwidth div Rratio div 2)*vTop*2-12, Rlength div Rratio+Rlength div Rratio div 2,1,areaPosLabel+'010');
    //if areaNo = 0 then DrawLabel(Sx+Rlength div Rratio div 2-34, vEy + (Rwidth div Rratio div 2)*vTop*2-12 + layoutdistance, Rlength div Rratio+Rlength div Rratio div 2,1,areaPosLabel+'010');

  end;


  if areaNo > 0 then
  begin
    DrawLine(vSx+Rlength div Rratio div 2, vEy , vSx+Rlength div Rratio div 2, vEy + (Rwidth div Rratio div 1)*vTop, clGreen);
    DrawLabel(vSx+Rlength div Rratio div 2 + 35, vEy + (Rwidth div Rratio div 1)*vTop, vSx+Rlength div Rratio div 2, 3, areaPosLabel+'030');
  end;
  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
  vEx :=vSx - L2 div Rratio - vOffSet;
  vSx :=vSx - vOffSet;
  vEy := vSy + W2 div Rratio*vTop;
  iRect :=Rect(vSx, vSy, vEx, vEy);
  DrawRect(vSx, vSy, vEx, vEy, borderColor, fillColor);
  if areaNo > 0 then
  begin
    DrawLine(vEx, vSy + (W2 div Rratio div 2)*vTop, vEx-L2 div Rratio+L2 div Rratio div 2 - slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, clGreen);
    DrawLabel(vEx-L2 div Rratio+L2 div Rratio div 2 - slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, Rlength div Rratio+Rlength div Rratio div 2,3,areaPosLabel+'050');
  end;
  DrawRectangleStacker(areaNo,(vSx+vEx) div 2,(vSy+vEy) div 2,L2 div Rratio, W2 div Rratio, direction, vOffset, clBlack, fillColor);

  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
  vSx :=vSx + L1 div Rratio + vOffSet * 2;
  vEx :=vSx + L2 div Rratio;
  iRect :=Rect(vSx, vSy, vEx, vEy);
  DrawRect(vSx, vSy, vEx, vEy, borderColor, fillColor);
  if areaNo > 0 then
  begin
    DrawLine(vEx, vSy + (W2 div Rratio div 2)*vTop, vEx + L2 div Rratio div 2 + slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, clGreen);
    DrawLabel(vEx + L2 div Rratio div 2 + slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, Rlength div Rratio+Rlength div Rratio div 2,4,areaPosLabel+'040');
  end;
  DrawRectangleStacker(areaNo,(vSx+vEx) div 2,(vSy+vEy) div 2,L2 div Rratio, W2 div Rratio, direction, vOffset, clBlack, fillColor);



  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
end;


procedure TfrmTengzhou4.DrawAirDesk(areaNo: byte; Sx, Sy, xLength, yLength, xHole, yHole, radial, direction, vOffset : integer; zoom :word=100);
var
  iType, iState: UINT;
  iRect: TRect;
  vSpacing, hSpacing, vFirst, hFirst :word;
  vSx, vEx, vSy, vEy, i, k, iCx, iCy, zoomxLength, zoomyLength :integer;
begin
  iType := DFC_BUTTON;
  iState := DFCS_BUTTONPUSH or DFCS_FLAT;
  zoomxLength :=Trunc(xLength*zoom/100);
  zoomyLength :=Trunc(yLength*zoom/100);
  case direction of   //0-self, 1-up, 2-down, 3-left, 4-right
    0:
    begin
      vSx :=Sx;
      vEx :=Sx + zoomxLength;
      vSy :=Sy;
      vEy :=Sy + zoomyLength;
    end;
    1:
    begin
      vSx :=Sx;
      vEx :=Sx + zoomxLength;
      vSy :=Sy - vOffset - zoomyLength;
      vEy :=Sy - vOffset;
    end;
    2:
    begin
      vSx :=Sx;
      vEx :=Sx + zoomxLength;
      vSy :=Sy + vOffset + yLength;
      vEy :=Sy + vOffset + yLength + zoomyLength;
    end;
    3:
    begin
      vSx :=Sx - vOffset - zoomxLength;
      vEx :=Sx - vOffset;
      vSy :=Sy;
      vEy :=Sy + zoomyLength;
    end;
    4:
    begin
      vSx :=Sx + vOffset + xLength;
      vEx :=Sx + vOffset + xLength + zoomxLength;
      vSy :=Sy;
      vEy :=Sy + zoomyLength;
    end;
  end;

  if areaNo = 0 then
  begin
    iRect := Rect(vSx, vSy, vEx, vEy);
    //DrawRect(vSx, vSy, vEx, vEy, clRed);
    DrawFrameControl(Canvas.Handle, iRect, iType, iState);
    if areaNo=0 then
    begin
      iRect := Rect(vSx, vSy+layoutdistance, vEx, vEy+layoutdistance);
      DrawFrameControl(Canvas.Handle, iRect, iType, iState);
    end;

  end;

  Canvas.Brush.Color := clMedGray;
  hSpacing :=zoomxLength div xHole;
  hFirst :=(zoomxLength - hSpacing*(xHole-1)) div 2;
  vSpacing :=zoomyLength div yHole;
  vFirst :=(zoomyLength - vSpacing*(yHole-1)) div 2;

  for i := 0 to xHole-1 do
    for k := 0 to yHole-1 do
      begin
        iCx :=vSx + hFirst + hSpacing * i;
        iCy :=vSy + vFirst + vSpacing * k;
        iRect :=Rect(iCx-radial, iCy-radial, iCx+radial, iCy+radial);

        if areaNo = 0 then
        begin
          Canvas.Ellipse(iCx-radial, iCy-radial, iCx+radial, iCy+radial);
          Canvas.Ellipse(iCx-radial, iCy-radial+layoutdistance, iCx+radial, iCy+radial+layoutdistance);
        end;
        if areaNo > 0 then
          Canvas.Ellipse(iCx-radial*2, iCy-radial*2, iCx+radial*2, iCy+radial*2);


      end;
end;

procedure TfrmTengzhou4.DrawRectangleStacker(areaNo: byte; Cx, Cy, Rlength, Rwidth, direction, vOffset :word; borderColor, fillColor :TColor);
var
  i, vSx, vSy, vEx, vEy, vSize, vVSize :integer;
  iSx, iSy, iEx, iEy, iDistance, iStart, iHands :integer;
begin
  case direction of
    1,2,5:
    begin
      vSize :=Trunc(Rlength *0.4);
      vVSize :=Ceil(RWidth*0.5);
    end;
    3,4:
    begin
      vSize :=Trunc(RWidth *0.4);
      vVSize :=Ceil(Rlength*0.5);
    end;
  end;
  if vSize mod 2 <> 0 then Inc(vSize);
  if vVSize mod 2 <> 0 then Inc(vVSize);

  Canvas.Pen.Color :=borderColor;
  Canvas.Brush.Color :=fillColor;
  case direction of   //1-up,2-down,3-left,4-right
  1,2:
  begin
    vSx :=Cx-vSize;
    vSy :=Cy+vVSize+vOffset*1;
    vEx :=Cx+vSize;
    vEy :=Cy+vVSize*2;
    Canvas.Rectangle(vSx+vOffset, vEy-1, vEx-vOffset, vEy+vVSize div 2);
  end;
  3:
  begin
    vSx :=Cx-vSize-vOffset;
    vSy :=Cy-vVSize;
    vEx :=Cx-vSize*2;
    vEy :=Cy+vVSize;
    Canvas.Rectangle(vEx+1,vSy+vOffset, vEx-vSize div 2, vEy-vOffset);
  end;
  4:
  begin
    vSx :=Cx+vSize+vOffset;
    vSy :=Cy-vVSize;
    vEx :=Cx+vSize*2;
    vEy :=Cy+vVSize;
    Canvas.Rectangle(vEx-1,vSy+vOffset, vEx+vSize div 2, vEy-vOffset);
  end;
  5:
  begin
    vSx :=Cx-vSize;
    vSy :=Cy-vVSize;
    vEx :=Cx+vSize;
    vEy :=Cy-vVSize*2+vOffset;
    Canvas.Rectangle(vSx+vOffset, vEy+1, vEx-vOffset, vEy-vVSize div 2);
  end;
  end;
  //Canvas.Ellipse(vSx, vSy, vEx, vEy);
  Canvas.Rectangle(vSx, vSy, vEx, vEy);

  iHands :=5;
  case direction of   //1-up,2-down,3-left,4-right
  1,2:
  begin
    vSx :=Cx-vSize+vOffset;
    vSy :=Cy+vVSize;
    vEx :=Cx+vSize-vOffset;
    vEy :=Cy+vVSize*2;
    iDistance :=(vEx-vSx-vOffset*iHands) div (iHands-1);
    iStart :=(vEx-vSx-(iDistance*(iHands-1)+vOffset*iHands)) div 2;
    for i := 0 to (iHands-1) do
    begin
      iSx :=vSx + iStart + i*(iDistance+vOffset);
      iEx :=vSx + iStart + i*(iDistance+vOffset) +vOffset;
      iSy :=vSy;
      iEy :=vEy;
      DrawRect(iSx, iSy, iEx, iEy, borderColor, RGB(240,240,240));
      if areaNo>0 then DrawLine(iSx+(vOffset-1) div 2,iSy+vOffset,iSx+(vOffset-1) div 2,iEy-vOffset,borderColor);
    end;
  end;
  3:
  begin
    vSx :=Cx-vVSize;
    vSy :=Cy-vSize+vOffset;
    vEx :=Cx-vVSize*2;
    vEy :=Cy+vSize-vOffset;
    iDistance :=(vEy-vSy-vOffset*iHands) div (iHands-1);
    iStart :=(vEy-vSy-(iDistance*(iHands-1)+vOffset*iHands)) div 2;
    for i := 0 to (iHands-1) do
    begin
      iSy :=vSy + iStart + i*(iDistance+vOffset);
      iEy :=vSy + iStart + i*(iDistance+vOffset) +vOffset;
      iSx :=vSx;
      iEx :=vEx;
      DrawRect(iSx, iSy, iEx, iEy, borderColor, RGB(240,240,240));
      if areaNo>0 then DrawLine(iSx-vOffset,iSy+(vOffset-1) div 2,iEx+vOffset,iSy+(vOffset-1) div 2,borderColor);
    end;
  end;
  4:
  begin
    vSx :=Cx+vVSize;
    vSy :=Cy-vSize+vOffset;
    vEx :=Cx+vVSize*2;
    vEy :=Cy+vSize-vOffset;
    iDistance :=(vEy-vSy-vOffset*iHands) div (iHands-1);
    iStart :=(vEy-vSy-(iDistance*(iHands-1)+vOffset*iHands)) div 2;
    for i := 0 to (iHands-1) do
    begin
      iSy :=vSy + iStart + i*(iDistance+vOffset);
      iEy :=vSy + iStart + i*(iDistance+vOffset) +vOffset;
      iSx :=vSx;
      iEx :=vEx;
      DrawRect(iSx, iSy, iEx, iEy, borderColor, RGB(240,240,240));
      if areaNo>0 then DrawLine(iSx+vOffset,iSy+(vOffset-1) div 2,iEx-vOffset,iSy+(vOffset-1) div 2,borderColor);
    end;
  end;
  5:
  begin
    iHands :=7;
    vSx :=Cx-vSize+vOffset;
    vSy :=Cy-vVSize+vOffset;
    vEx :=Cx+vSize-vOffset;
    vEy :=Cy-vVSize*2+vOffset;
    iDistance :=(vEx-vSx-vOffset*iHands) div (iHands-1);
    iStart :=(vEx-vSx-(iDistance*(iHands-1)+vOffset*iHands)) div 2;
    for i := 0 to (iHands-1) do
    begin
      iSx :=vSx + iStart + i*(iDistance+vOffset);
      iEx :=vSx + iStart + i*(iDistance+vOffset) +vOffset;
      iSy :=vSy;
      iEy :=vEy;
      DrawRect(iSx, iSy, iEx, iEy, borderColor, RGB(240,240,240));
      if areaNo>0 then DrawLine(iSx+(vOffset-1) div 2,iSy-vOffset,iSx+(vOffset-1) div 2,iEy+vOffset,borderColor);
    end;
  end;
  end;

  case direction of   //1-up,2-down,3-left,4-right
  1,2:
  begin
    vSx :=Cx-vSize-vOffset;
    vSy :=Cy+vSize*2-vOffset div 2-1;
    vEx :=Cx+vSize+vOffset;
    vEy :=Cy+vSize*2+vOffset-1;
  end;
  3:
  begin
    vSx :=Cx-vSize*2-vOffset div 2-1;
    vSy :=Cy-vSize-vOffset;
    vEx :=Cx-vSize*2-vOffset*2;
    vEy :=Cy+vSize+vOffset;
  end;
  4:
  begin
    vSx :=Cx+vSize*2+vOffset div 2+1;
    vSy :=Cy-vSize-vOffset;
    vEx :=Cx+vSize*2+vOffset*2;
    vEy :=Cy+vSize+vOffset;
  end;
  5:
  begin
    vSx :=Cx-vSize-vOffset;
    vSy :=Cy-vVSize*2+vOffset-2;
    vEx :=Cx+vSize+vOffset;
    vEy :=Cy-vVSize*2-vOffset;
  end;
  end;
  DrawRect(vSx, vSy-vOffset div 2, vEx, vEy-vOffset div 2, borderColor, clMedGray);
end;

procedure TfrmTengzhou4.DrawRotationStacker(areaNo: byte; Cx, Cy, Rlength, Rwidth, direction, vOffset :word; borderColor, fillColor :TColor);
var
  i, vSx, vSy, vEx, vEy, vSize, vRadio :integer;
begin
  vSize :=Ceil(min(Rlength, Rwidth) * 1) div 2;
  if vSize mod 2 <> 0 then Inc(vSize);
  case direction of   //1-up,2-down,3-left,4-right
  1,2:
  begin
    vSx :=Cx-vSize;
    vSy :=Cy+vSize*1+vOffset;
    vEx :=Cx+vSize;
    vEy :=Cy+vSize*3+vOffset;
  end;
  3:
  begin
    vSx :=Cx-vSize*3-vOffset;
    vSy :=Cy-vSize;
    vEx :=Cx-vSize*1-vOffset;
    vEy :=Cy+vSize;
  end;
  4:
  begin
    vSx :=Cx+vSize*3+vOffset;
    vSy :=Cy-vSize;
    vEx :=Cx+vSize*1+vOffset;
    vEy :=Cy+vSize;
  end;
  5:
  begin
    vSx :=Cx-vSize;
    vSy :=Cy-vSize*1-vOffset;
    vEx :=Cx+vSize;
    vEy :=Cy-vSize*3-vOffset;
  end;
  end;
  Canvas.Brush.Color :=fillColor;
  Canvas.Ellipse(vSx, vSy, vEx, vEy);

  case direction of   //1-up,2-down,3-left,4-right
  1,2:
  begin
    vSx :=Cx-vSize div 3 -vOffset;
    vSy :=Cy+vSize*1+vOffset div 3;
    vEx :=Cx-vSize div 3 +vOffset;
    vEy :=Cy+vSize*3+vOffset+ vOffset div 3;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine((vSx+vEx) div 2,vSy+vOffset*3,(vSx+vEx) div 2,vEy-vOffset*3,borderColor);
    vSx :=Cx+vSize div 3 +vOffset;
    vSy :=Cy+vSize*1+vOffset div 3;
    vEx :=Cx+vSize div 3 - vOffset;
    vEy :=Cy+vSize*3+vOffset+ vOffset div 3;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine((vSx+vEx) div 2,vSy+vOffset*3,(vSx+vEx) div 2,vEy-vOffset*3,borderColor);
  end;
  3:
  begin
    vSx :=Cx-vSize*1-vOffset div 3*2;
    vSy :=Cy+vSize div 3 - vOffset;
    vEx :=Cx-vSize*3 - vOffset -vOffset div 3*2;
    vEy :=Cy+vSize div 3 + vOffset;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine(vSx-vOffset*3,(vSy+vEy) div 2,vEx+vOffset*3,(vSy+vEy) div 2,borderColor);
    vSx :=Cx-vSize*1-vOffset div 3;
    vSy :=Cy-vSize div 3 - vOffset;
    vEx :=Cx-vSize*3 - vOffset -vOffset div 3;
    vEy :=Cy-vSize div 3 + vOffset;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine(vSx-vOffset*3,(vSy+vEy) div 2,vEx+vOffset*3,(vSy+vEy) div 2,borderColor);
  end;
  4:
  begin
    vSx :=Cx+vSize*3 + vOffset +vOffset div 3;
    vSy :=Cy+vSize div 3 - vOffset;
    vEx :=Cx+vSize*1+vOffset div 3;
    vEy :=Cy+vSize div 3 + vOffset;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine(vSx-vOffset*3,(vSy+vEy) div 2,vEx+vOffset*3,(vSy+vEy) div 2,borderColor);
    vSx :=Cx+vSize*3 + vOffset +vOffset div 3;
    vSy :=Cy-vSize div 3 - vOffset;
    vEx :=Cx+vSize*1+vOffset div 3;
    vEy :=Cy-vSize div 3 + vOffset;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine(vSx-vOffset*3,(vSy+vEy) div 2,vEx+vOffset*3,(vSy+vEy) div 2,borderColor);
  end;
  5:
  begin
    vSx :=Cx-vSize div 3 -vOffset;
    vSy :=Cy-vSize*1-vOffset div 3;
    vEx :=Cx-vSize div 3 +vOffset;
    vEy :=Cy-vSize*3-vOffset- vOffset div 3;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine((vSx+vEx) div 2,vSy-vOffset*3,(vSx+vEx) div 2,vEy+vOffset*3,borderColor);
    vSx :=Cx+vSize div 3 +vOffset;
    vSy :=Cy-vSize*1-vOffset div 3;
    vEx :=Cx+vSize div 3 - vOffset;
    vEy :=Cy-vSize*3-vOffset- vOffset div 3;
    DrawRect(vSx, vSy, vEx, vEy, borderColor, RGB(240,240,240));
    DrawLine((vSx+vEx) div 2,vSy-vOffset*3,(vSx+vEx) div 2,vEy+vOffset*3,borderColor);
  end;
  end;

  case direction of   //1-up,2-down,3-left,4-right
  1,2:
  begin
    vSx :=Cx-vSize-vOffset;
    vSy :=Cy+vSize*2-vOffset div 2;
    vEx :=Cx+vSize+vOffset;
    vEy :=Cy+vSize*2+vOffset;
  end;
  3:
  begin
    vSx :=Cx-vSize*2+vOffset div 2;
    vSy :=Cy-vSize-vOffset;
    vEx :=Cx-vSize*2-vOffset;
    vEy :=Cy+vSize+vOffset;
  end;
  4:
  begin
    vSx :=Cx+vSize*2-vOffset div 2;
    vSy :=Cy-vSize-vOffset;
    vEx :=Cx+vSize*2+vOffset;
    vEy :=Cy+vSize+vOffset;
  end;
  5:
  begin
    vSx :=Cx-vSize-vOffset;
    vSy :=Cy-vSize*2+vOffset div 2;
    vEx :=Cx+vSize+vOffset;
    vEy :=Cy-vSize*2-vOffset;
  end;
  end;
  DrawRect(vSx, vSy, vEx, vEy, borderColor, clMedGray);
end;

procedure TfrmTengzhou4.FormCreate(Sender: TObject);
begin
  g :=TGPGraphics.Create(Canvas.Handle);
  p :=TGPPen.Create(MakeColor(255, 0, 0, 0),1);
  b :=TGPSolidBrush.Create(clWhite);
end;

procedure TfrmTengzhou4.DrawRotator(areaNo: byte; Cx, Cy, Rlength, Rwidth, direction,vOffset :word; borderColor, fillColor :TColor);
const
pd :array[0..3] of TGPPoint = ((X:800;Y:300),(X:830;Y:390),(X:810;Y:460),(X:890;Y:470));
var
  i, vSx, vSy, vEx, vEy, vSize, vRadio :integer;
  pa :array of TGPPoint;

begin
//  g :=TGPGraphics.Create(Canvas.Handle);
//  p :=TGPPen.Create(MakeColor(255, 0, 0, 0),1);
//  b :=TGPSolidBrush.Create(clWhite);

  SetLength(pa,4);
  pa[0] :=MakePoint(800,300);
  pa[1] :=MakePoint(830,390);
  pa[2] :=MakePoint(810,460);
  pa[3] :=MakePoint(890,470);
//  g.DrawLines(p, PGPPoint(pa),length(pa));

//  g.DrawLines(p, PGPPoint(@pd),length(pd));
//  g.DrawPolygon(p, PGPPoint(@pd),length(pd));

  //g.Clear(MakeColor(255,255,255,0));
  vSize :=Ceil(min(Rlength, Rwidth) * 0.6) div 2;
  if vSize mod 2 <> 0 then
    Inc(vSize);
  vSx :=Cx-vSize;
  vSy :=Cy-vSize;
  vEx :=Cx+vSize;
  vEy :=Cy+vSize;
  g.DrawRectangle(p, vSx, vSy,vSize*2, vSize*2);
  //DrawRect(vSx, vSy, vEx, vEy, borderColor, fillColor);
  DrawLine(Cx, vSy, Cx, vEy, borderColor);
  DrawLine(Cx-vSize div 2, vSy, Cx-vSize div 2, vEy, borderColor);
  DrawLine(Cx+vSize div 2, vSy, Cx+vSize div 2, vEy, borderColor);
  DrawLine(vSx, Cy, vEx, Cy, borderColor);
  DrawLine(vSx, Cy-vSize div 2, vEx, Cy-vSize div 2, borderColor);
  DrawLine(vSx, Cy+vSize div 2, vEx, Cy+vSize div 2, borderColor);

  Canvas.Pen.Color :=borderColor;
  Canvas.Brush.Color :=borderColor;
  vRadio :=Ceil(min(Rlength, Rwidth) * 0.9) div 5;
  for i := 3 downto 1 do
    Canvas.Ellipse(Cx-i, Cy-i,Cx+i, Cy+i);

  g :=TGPGraphics.Create(Canvas.Handle);
  p :=TGPPen.Create(MakeColor(255, 0, 0, 0),1);
  //g.Clear(MakeColor(255,255,255,0));

  p.SetEndCap(LineCapArrowAnchor);
  //Canvas.Arc(Cx-vRadio*2, Cy-vRadio*2-vOffset*3, Cx+vRadio*2,Cy+vRadio*2-vOffset*3, Cx+vSize*1,vSy-vSize div 3, Cx-vSize*1,vSy-vSize div 3);
  //cs.SendMsg(Format('Canvas.Arc: %d, %d, %d, %d, %d, %d, %d, %d',[Cx-vRadio*2, Cy-vRadio*2-vOffset*3, Cx+vRadio*2,Cy+vRadio*2-vOffset*3, Cx+vSize*1,vSy-vSize div 3, Cx-vSize*1,vSy-vSize div 3]));
  g.DrawArc(p,Cx-vRadio*2, Cy-vRadio*2-vOffset*3, vRadio*4, vRadio*4, 315,-90);
  //cs.SendMsg(Format('g.DrawArc: %d, %d, %d, %d, %d, %d',[Cx-vRadio*2, Cy-vRadio*2-vOffset*3, vRadio*4, vRadio*4, 330,-120]));
end;

procedure TfrmTengzhou4.DrawLabel(Sx, Sy, lineLength, direction :integer; posNo :string);
var
  i: byte;
  iType, iState: UINT;
  iRect: TRect;
  lineSx, lineSy, lineEx, lineEy :word;
  textX, textY: word;
begin
  case direction of   //1-up,2-down,3-left,4-right
    3:
    begin
      lineSx :=Sx-70;
      lineSy :=Sy;
      textX :=lineSx+6;
      textY :=lineSy-8;
    end;
    4:
    begin
      lineSx :=Sx;
      lineEx :=Sx + lineLength;
      lineSy :=Sy;
      lineEy :=Sy;
      textX :=lineSx+6;
      textY :=lineSy-8;
    end;
    2:begin
      lineSx :=Sx ;
      lineSy :=Sy ;
      textX :=lineSx+6;
      textY :=lineSy;
    end;
    1:begin
      lineSx :=Sx ;
      lineSy :=Sy ;
      textX :=lineSx+6;
      textY :=lineSy-8;
    end;
  end;

  Canvas.Brush.Color := clBtnFace;
  Canvas.Pen.Color := clBlack;
  font.Size := 12;
  Canvas.RoundRect(textX - 7, textY - 3, textX + 68, textY + 22, 20, 20);
  Canvas.TextOut(textX, textY, posNo);
end;


procedure TfrmTengzhou4.DrawSideLine(areaNo: byte; Sx, Sy, Rlength, Rwidth, L1, W1, L2, W2, Rratio, vOffset, top, direction :word; posLabel: string; borderColor, fillColor :TColor);
var
  iRect :TRect ;
  vSx, vSy, vEx, vEy, vCx, vCy, iType, iState :integer;
  vTop :integer;
  areaPosLabel :string;
begin
  case areaNo of
    4: areaPosLabel := '201.';
    5: areaPosLabel := '203.';
    6: areaPosLabel := '205.';
    else
    begin
      if posLabel='181.010' then
        areaPosLabel := '201.'
      else if posLabel='183.010' then
        areaPosLabel := '203.'
      else areaPosLabel := '205.';
    end;
  end;

  iType := DFC_BUTTON;
  iState := DFCS_BUTTONPUSH or DFCS_FLAT;
  vTop :=Ceil(Power(-1,top));
  vCx :=Sx+Rlength div Rratio div 2;
  vCy :=Sy+(Rwidth div Rratio div 2+vOffset)*vTop;
  vSx :=Sx;
  vSy :=sy + vOffSet*vTop;
  vEx :=vSx + Rlength div Rratio;
  vEy :=vSy + Rwidth div Rratio*vTop;
  iRect :=Rect(vSx, vSy, vEx, vEy);
  DrawRect(vSx, vSy, vEx, vEy, borderColor, fillColor);
  DrawRotator(areaNo,vCx, vCy, Rlength div Rratio, Rwidth div Rratio, Rratio, vOffset, clBlack, fillColor);
  if ((areaNo =0) and (Sy<500)) or (areaNo >0) then
  //if ((areaNumber =0) and (Sy<500) and (posLabel='183.010')) or ((areaNumber =0) and (Sy>500) and (posLabel<>'183.010')) or (areaNumber >0) then
  begin
    DrawLine(Sx+Rlength div Rratio, Sy + (Rwidth div Rratio div 2)*vTop, Sx+Rlength div Rratio+Rlength div Rratio div 2, Sy + (Rwidth div Rratio div 2)*vTop, clGreen);
    DrawLabel(Sx+Rlength div Rratio+Rlength div Rratio div 2, Sy + (Rwidth div Rratio div 2)*vTop, Rlength div Rratio+Rlength div Rratio div 2,4,areaPosLabel+'020');
  end;
  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
  vSx :=vSx + (Rlength-L1) div Rratio div 2;
  vSy :=vEy + vOffSet*vTop;
  vEx :=vSx + L1 div Rratio;
  vEy :=vSy + W1 div Rratio*vTop;
  iRect :=Rect(vSx, vSy, vEx, vEy);
  DrawRect(vSx, vSy, vEx, vEy, borderColor, fillColor);
  if areaNo > 0 then
  begin
    DrawLine(vSx+Rlength div Rratio div 2, vEy , vSx+Rlength div Rratio div 2, vEy + (Rwidth div Rratio div 1)*vTop, clGreen);
    DrawLabel(vSx+Rlength div Rratio div 2 + 35, vEy + (Rwidth div Rratio div 1)*vTop, vSx+Rlength div Rratio div 2, 3, areaPosLabel+'030');
  end;
  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
  vEx :=vSx - L2 div Rratio - vOffSet;
  vSx :=vSx - vOffSet;
  vEy := vSy + W2 div Rratio*vTop;
  iRect :=Rect(vSx, vSy, vEx, vEy);
  DrawRect(vSx, vSy, vEx, vEy, borderColor, fillColor);
  if areaNo > 0 then
  begin
    DrawLine(vEx, vSy + (W2 div Rratio div 2)*vTop, vEx-L2 div Rratio+L2 div Rratio div 2 - slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, clGreen);
    DrawLabel(vEx-L2 div Rratio+L2 div Rratio div 2 - slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, Rlength div Rratio+Rlength div Rratio div 2,3,areaPosLabel+'050');
  end;
  DrawRectangleStacker(areaNo,(vSx+vEx) div 2,(vSy+vEy) div 2,L2 div Rratio, W2 div Rratio, direction, vOffset, clBlack, fillColor);

  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
  vSx :=vSx + L1 div Rratio + vOffSet * 2;
  vEx :=vSx + L2 div Rratio;
  iRect :=Rect(vSx, vSy, vEx, vEy);
  DrawRect(vSx, vSy, vEx, vEy, borderColor, fillColor);
  if areaNo > 0 then
  begin
    DrawLine(vEx, vSy + (W2 div Rratio div 2)*vTop, vEx + L2 div Rratio div 2 + slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, clGreen);
    DrawLabel(vEx + L2 div Rratio div 2 + slLabelOffSet, vSy + (W2 div Rratio div 2)*vTop, Rlength div Rratio+Rlength div Rratio div 2,4,areaPosLabel+'040');
  end;
  DrawRectangleStacker(areaNo,(vSx+vEx) div 2,(vSy+vEy) div 2,L2 div Rratio, W2 div Rratio, direction+1, vOffset, clBlack, fillColor);
  //DrawFrameControl(Canvas.Handle, iRect, iType, iState);
end;

procedure TfrmTengzhou4.DrawSnap(areaNo :byte; Sx, Sy, Rlength : word; borderColor, fillColor: TColor);
var
  i, Ex, Ey, Y1, Y2, Y3, Y4, X1, X2, X3, X4: word;
  snapWidth, lineCenter, starDis: word;
begin
  snapWidth := Rlength div 16;
  lineCenter := Sx + Rlength div 4;
  Ey := Sy + Rlength;
  starDis :=(Rlength - Rlength div 4) div 4;
  DrawRect(lineCenter - snapWidth div 2, Sy, lineCenter + snapWidth div 2, Ey, borderColor, fillColor);
  Canvas.Pen.Color :=borderColor;
  Canvas.Brush.Color :=fillColor;
  for i := 0 to 4 do
  begin
    Y1 := Sy + Rlength div 8 +  starDis*i;
    Y2 := Y1 - snapWidth div 2;
    Y3 := Y1 + snapWidth div 2;
    Y4 := Y1;
    X1 := lineCenter - snapWidth * 2;
    X2 := lineCenter - snapWidth;
    X3 := X2;
    X4 := X2 - snapWidth div 3;
    Canvas.Polygon([point(X1, Y1), point(X2, Y2), point(X4, Y4), point(X3, Y3)]);
    X1 := lineCenter + snapWidth * 2;
    X2 := lineCenter + snapWidth;
    X3 := X2;
    X4 := X2 + snapWidth div 3;
    Canvas.Polygon([point(X1, Y1), point(X2, Y2), point(X4, Y4), point(X3, Y3)]);
  end;
  Canvas.Pen.Color :=clBlack;
  Canvas.Brush.Color :=clWhite;
end;

procedure TfrmTengzhou4.BitBtn12Click(Sender: TObject);
begin
  DrawSnap(2,200, 200, 450, clBlack, clMedGray);

  Canvas.Brush.Color :=clLime;
  Canvas.Ellipse(100,100,147,147);
  Canvas.Brush.Color :=clWhite;
  Canvas.Ellipse(106,106,141,141);


  Canvas.Brush.Color :=clRed;
  Canvas.Ellipse(200,200,247,247);
  Canvas.Brush.Color :=clWhite;
  Canvas.Ellipse(206,206,241,241);
//  DrawLine(211,211,235,235,clBlack);
  DrawLine(213,209,237,233,clBlack);
  DrawLine(209,213,233,237,clBlack);


end;

procedure TfrmTengzhou4.BitBtn13Click(Sender: TObject);
begin
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Rect(0, 0, self.width - 1, self.height - 1));
  DrawRollers(100, 100, 6873, 5600, 10, 24, clGray, clMenu, True);
end;

procedure TfrmTengzhou4.BitBtn14Click(Sender: TObject);
var
  bmp :TBitMap ;
  cvs :TCanvas;
begin
  bmp :=TBitMap.Create ;
  cvs :=TCanvas.Create;

  bmp.Transparent :=true;
  bmp.TransparentMode :=tmAuto;
  cvs.Handle :=GetDC(bmp.Canvas.Handle);
  bmp.LoadFromFile('D:\white.bmp');
  bmp.Canvas.Pen.Color :=clBlack;
  bmp.Canvas.Pen.Width :=1;
  bmp.Canvas.Brush.Color :=clgreen;
  bmp.Canvas.Rectangle(10,10, 200,200);

  Canvas.Draw(400,400, bmp);
end;

procedure TfrmTengzhou4.DrawChevron(Sx, Sy, Rlength, Rwidth, Rratio: word;
  borderColor, fillColor: TColor; Shorizon: boolean);
var
  i, Ex, Ey, horiCenter, verCenter: word;
  disRubber, tailChevron: word;
begin
  if Shorizon then
  begin
    tailChevron := Trunc(Rwidth * 0.8);
    Ex := Sx + Rwidth div Rratio;
    Ey := Sy + Rlength div Rratio;
    horiCenter := (Sx + Ex) div 2;
    DrawRect(Sx, Sy + tailChevron div Rratio, Ex, Ey - tailChevron div Rratio,
      clBlack, fillColor);
    DrawRect(horiCenter - Rwidth div 4 div Rratio, Sy,
      horiCenter + Rwidth div 4 div Rratio, Sy + tailChevron div Rratio,
      clBlack, fillColor);
    DrawRect(horiCenter - Rwidth div 4 div Rratio, Ey,
      horiCenter + Rwidth div 4 div Rratio, Ey - tailChevron div Rratio,
      clBlack, fillColor);
    DrawRect(Sx - Rwidth div 8 div Rratio, Sy + Rwidth div 4 div Rratio,
      Ex + Rwidth div 8 div Rratio, Sy + Rwidth div 2 div Rratio, clBlack,
      borderColor);
    DrawRect(Sx - Rwidth div 8 div Rratio, Ey - Rwidth div 4 div Rratio,
      Ex + Rwidth div 8 div Rratio, Ey - Rwidth div 2 div Rratio, clBlack,
      borderColor);

    disRubber := (Rlength - tailChevron * 2 - Rwidth div 3 -
      Rwidth div 4) div 5;
    for i := 0 to 5 do
      DrawRect(Sx - Rwidth div 8 div Rratio, Sy + tailChevron div Rratio +
        (Rwidth div 6 + disRubber * i) div Rratio, Ex + Rwidth div 8 div Rratio,
        Sy + tailChevron div Rratio + (Rwidth div 6 + disRubber * i +
        Rwidth div 4) div Rratio, clBlack, borderColor);
  end
  else
  begin
    tailChevron := Trunc(Rwidth * 0.8);
    Ex := Sx + Rlength div Rratio;
    Ey := Sy + Rwidth div Rratio;
    verCenter := (Sy + Ey) div 2;
    DrawRect(Sx + tailChevron div Rratio, Sy, Ex - tailChevron div Rratio, Ey,
      clBlack, fillColor);
    DrawRect(Sx, verCenter - Rwidth div 4 div Rratio,
      Sx + tailChevron div Rratio, verCenter + Rwidth div 4 div Rratio, clBlack,
      fillColor);
    DrawRect(Ex, verCenter - Rwidth div 4 div Rratio,
      Ex - tailChevron div Rratio, verCenter + Rwidth div 4 div Rratio, clBlack,
      fillColor);
    DrawRect(Sx + Rwidth div 4 div Rratio, Sy - Rwidth div 8 div Rratio,
      Sx + Rwidth div 2 div Rratio, Ey + Rwidth div 8 div Rratio, clBlack,
      borderColor);
    DrawRect(Ex - Rwidth div 4 div Rratio, Sy - Rwidth div 8 div Rratio,
      Ex - Rwidth div 2 div Rratio, Ey + Rwidth div 8 div Rratio, clBlack,
      borderColor);

    disRubber := (Rlength - tailChevron * 2 - Rwidth div 3 -
      Rwidth div 4) div 5;
    for i := 0 to 5 do
      DrawRect(Sx + tailChevron div Rratio + (Rwidth div 6 + disRubber * i)
        div Rratio, Sy - Rwidth div 8 div Rratio, Sx + tailChevron div Rratio +
        (Rwidth div 6 + disRubber * i + Rwidth div 4) div Rratio,
        Ey + Rwidth div 8 div Rratio, clBlack, borderColor);
  end;
end;

procedure TfrmTengzhou4.DrawEdgeTrim(Sx: word; Sy: word; Rlength: word;
  Rwidth: word; Rratio: word; RollersNum: word; borderColor: TColor;
  fillColor: TColor; Shorizon: boolean);
var
  i: byte;
  Sw, Sh, rSpacing, rFirst, lFirst, Rx, Ry, Ex, Ey, rollerLen: word;
  leftCenter, rightCenter, top_bottom: word;
  clCon1, clCon2, clCon3, clCon4: TColor;
  overlap: Single;
  bmp: TBitmap;
begin
  overlap := 0.6;
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Rect(0, 0, self.width - 1, self.height - 1));
  if Shorizon then
  begin
    Ex := Sx + Rlength div Rratio;
    Ey := Sy + Rwidth div Rratio;
    DrawRect(Sx, Sy, Ex, Ey, borderColor, fillColor);
  end
  else
  begin
    Ex := Sx + Rwidth div Rratio;
    Ey := Sy + Rlength div Rratio;
    DrawRect(Sx, Sy, Sx + Rwidth div Rratio, Sy + Rlength div Rratio,
      borderColor, fillColor);
  end;
  rSpacing := Rlength div RollersNum;
  rFirst := (Rlength - rSpacing * (RollersNum - 1) - rSpacing div 2) div 2;
  lFirst := rFirst * 0 + rSpacing;
  rollerLen := Trunc(Rwidth * overlap);
  for i := 1 to RollersNum do
  begin
    if Shorizon then
    begin
      Rx := Sx + (i - 1) * rSpacing div Rratio + rFirst div Rratio;
      Ry := Sy + 2;
      DrawRoller(Rx, Ry, rollerLen - Rratio * 4, Trunc(rSpacing / 2.5), Rratio,
        10, borderColor, fillColor, not odd(i), Shorizon);
    end
    else
    begin
      Rx := Sx + 2;
      Ry := Sy + (i - 1) * rSpacing div Rratio + rFirst div Rratio;
      DrawRoller(Rx, Ry, rollerLen - Rratio * 4, Trunc(rSpacing / 2.5), Rratio,
        10, borderColor, fillColor, not odd(i), Shorizon); //
    end;
  end;

  for i := 1 to RollersNum - 1 do
  begin
    if Shorizon then
    begin
      Rx := Sx + (i - 1) * rSpacing div Rratio + Trunc(rFirst + rSpacing / 2)
        div Rratio;
      Ry := Sy + Trunc(Rwidth * (1 - overlap)) div Rratio - 2;
      DrawRoller(Rx, Ry, rollerLen - Rratio * 4, Trunc(rSpacing / 2.5), Rratio,
        10, borderColor, fillColor, false, Shorizon);
    end
    else
    begin
      Rx := Sx + Trunc(Rwidth * (1 - overlap)) div Rratio + 2;
      Ry := Sy + (i - 1) * rSpacing div Rratio + Trunc(rFirst + rSpacing / 2)
        div Rratio;
      DrawRoller(Rx, Ry, rollerLen - Rratio * 4, Trunc(rSpacing / 2.5), Rratio,
        10, borderColor, fillColor, false, Shorizon); //
    end;
  end;

  leftCenter := Sx + Trunc(rSpacing * 0.2) div Rratio;
  rightCenter := Ex - Trunc(rSpacing * 0.2) div Rratio;
  clCon1 := clOlive;
  clCon2 := clMedGray;
  clCon3 := clYellow;
  clCon4 := clSkyBlue;

  if Shorizon then
  begin
    leftCenter := Sx + Trunc(rSpacing div 2) div Rratio;
    rightCenter := Ex - Trunc(rSpacing div 2) div Rratio;

    {**************************************************************************}

//     DrawRect(Sx, Sy-rSpacing div Rratio,
//     Sx+Trunc(rSpacing * 0.75) div Rratio, Sy + (Rwidth + rSpacing) div Rratio, clBlack, clCon1);
//     DrawRect(Sx-rSpacing div 8 div Rratio, leftCenter-rSpacing div 3 div Rratio,
//     Sx+Trunc(rSpacing*0.75+rSpacing div 8) div Rratio, leftCenter+rSpacing div 3 div Rratio, clBlack, clCon2);

    {**************************************************************************}

    top_bottom := Trunc(Rwidth div Rratio * 0.95);
    Canvas.Brush.Color := clCon4;
    Canvas.Ellipse(Rect(leftCenter - rSpacing div 3 div Rratio,
      Sy - rSpacing div 4 div Rratio, leftCenter + rSpacing div 3 div Rratio,
      Sy + rSpacing div 12 * 5 div Rratio));
    Canvas.Ellipse(Rect(leftCenter - rSpacing div 3 div Rratio,
      Sy - rSpacing div 3 div Rratio, leftCenter + rSpacing div 3 div Rratio,
      Sy + rSpacing div 3 div Rratio));
    DrawRect(leftCenter - rSpacing div 6 div Rratio,
      Sy - rSpacing div 2 div Rratio, leftCenter + rSpacing div 6 div Rratio,
      Sy + rSpacing div 8 div Rratio, clBlack, clCon3);
    DrawRect(leftCenter - Trunc(rSpacing * 0.26) div Rratio,
      Sy - rSpacing div 1 div Rratio, leftCenter + Trunc(rSpacing * 0.26)
      div Rratio, Sy - rSpacing div 3 div Rratio, clBlack, clCon2);

    Canvas.Brush.Color := clCon4;
    Canvas.Ellipse(Rect(leftCenter - rSpacing div 3 div Rratio,
      Sy + top_bottom - rSpacing div 4 div Rratio,
      leftCenter + rSpacing div 3 div Rratio, Sy + top_bottom + rSpacing div 12
      * 5 div Rratio));
    Canvas.Ellipse(Rect(leftCenter - rSpacing div 3 div Rratio,
      Sy + top_bottom - rSpacing div 3 div Rratio,
      leftCenter + rSpacing div 3 div Rratio,
      Sy + top_bottom + rSpacing div 3 div Rratio));
    DrawRect(leftCenter - rSpacing div 6 div Rratio,
      Sy + top_bottom - rSpacing div 2 div Rratio,
      leftCenter + rSpacing div 6 div Rratio,
      Sy + top_bottom + rSpacing div 8 div Rratio, clBlack, clCon3);
    DrawRect(leftCenter - Trunc(rSpacing * 0.26) div Rratio,
      Sy + top_bottom - rSpacing div 1 div Rratio,
      leftCenter + Trunc(rSpacing * 0.26) div Rratio,
      Sy + top_bottom - rSpacing div 3 div Rratio, clBlack, clCon2);

    {**************************************************************************}

    Canvas.Brush.Color := clCon4;
    Canvas.Ellipse(Rect(rightCenter - rSpacing div 3 div Rratio,
      Sy - rSpacing div 4 div Rratio, rightCenter + rSpacing div 3 div Rratio,
      Sy + rSpacing div 12 * 5 div Rratio));
    Canvas.Ellipse(Rect(rightCenter - rSpacing div 3 div Rratio,
      Sy - rSpacing div 3 div Rratio, rightCenter + rSpacing div 3 div Rratio,
      Sy + rSpacing div 3 div Rratio));
    DrawRect(rightCenter - rSpacing div 6 div Rratio,
      Sy - rSpacing div 2 div Rratio, rightCenter + rSpacing div 6 div Rratio,
      Sy + rSpacing div 8 div Rratio, clBlack, clCon3);
    DrawRect(rightCenter - Trunc(rSpacing * 0.26) div Rratio,
      Sy - rSpacing div 1 div Rratio, rightCenter + Trunc(rSpacing * 0.26)
      div Rratio, Sy - rSpacing div 3 div Rratio, clBlack, clCon2);

    Canvas.Brush.Color := clCon4;
    Canvas.Ellipse(Rect(rightCenter - rSpacing div 3 div Rratio,
      Sy + top_bottom - rSpacing div 4 div Rratio,
      rightCenter + rSpacing div 3 div Rratio, Sy + top_bottom + rSpacing div 12
      * 5 div Rratio));
    Canvas.Ellipse(Rect(rightCenter - rSpacing div 3 div Rratio,
      Sy + top_bottom - rSpacing div 3 div Rratio,
      rightCenter + rSpacing div 3 div Rratio,
      Sy + top_bottom + rSpacing div 3 div Rratio));
    DrawRect(rightCenter - rSpacing div 6 div Rratio,
      Sy + top_bottom - rSpacing div 2 div Rratio,
      rightCenter + rSpacing div 6 div Rratio,
      Sy + top_bottom + rSpacing div 8 div Rratio, clBlack, clCon3);
    DrawRect(rightCenter - Trunc(rSpacing * 0.26) div Rratio,
      Sy + top_bottom - rSpacing div 1 div Rratio,
      rightCenter + Trunc(rSpacing * 0.26) div Rratio,
      Sy + top_bottom - rSpacing div 3 div Rratio, clBlack, clCon2);

    {**************************************************************************}

    Canvas.Brush.Style := bsDiagCross;
    DrawRect(leftCenter - Trunc(rSpacing * 0.5) div Rratio,
      Sy - Trunc(rSpacing * 1.5) div Rratio, leftCenter + Trunc(rSpacing * 0.5)
      div Rratio, Sy - Trunc(rSpacing * 0.8) div Rratio, clBlack, clCon1);
    DrawRect(leftCenter - Trunc(rSpacing * 0.5) div Rratio,
      Sy + top_bottom - Trunc(rSpacing * 1.5) div Rratio,
      leftCenter + Trunc(rSpacing * 0.5) div Rratio,
      Sy + top_bottom - Trunc(rSpacing * 0.8) div Rratio, clBlack, clCon1);

    {**************************************************************************}

    DrawRect(rightCenter - Trunc(rSpacing * 0.5) div Rratio,
      Sy - Trunc(rSpacing * 1.5) div Rratio, rightCenter + Trunc(rSpacing * 0.5)
      div Rratio, Sy - Trunc(rSpacing * 0.8) div Rratio, clBlack, clCon1);
    DrawRect(rightCenter - Trunc(rSpacing * 0.5) div Rratio,
      Sy + top_bottom - Trunc(rSpacing * 1.5) div Rratio,
      rightCenter + Trunc(rSpacing * 0.5) div Rratio,
      Sy + top_bottom - Trunc(rSpacing * 0.8) div Rratio, clBlack, clCon1);

    {**************************************************************************}

    Canvas.Brush.Style := bsClear;
    DrawArrow(Ex + 150, Sy + Rwidth div 2 div Rratio, 100, 0, 2);

    //DrawRect(leftCenter-Trunc(rSpacing*0.5) div Rratio, Sy-Trunc(rSpacing*0.8) div Rratio, leftCenter+Trunc(rSpacing*0.5) div Rratio, Sy+top_bottom-Trunc(rSpacing*1.5) div Rratio,clBlack, RGB(30,200,200));

  end
  else
  begin
    leftCenter := Sx + Trunc(rSpacing * 0.2) div Rratio;
    rightCenter := Ex - Trunc(rSpacing * 0.2) div Rratio;
    DrawRect(Sx - rSpacing div Rratio, Sy, Sx + (Rwidth + rSpacing) div Rratio,
      Sy + Trunc(rSpacing * 0.75) div Rratio, clBlack, clCon1);
    DrawRect(leftCenter - rSpacing div 3 div Rratio,
      Sy - rSpacing div 4 div Rratio, leftCenter + rSpacing div 3 div Rratio,
      Sy + Trunc(rSpacing * 0.75 + rSpacing div 4) div Rratio, clBlack, clCon2);
    DrawRect(rightCenter + rSpacing div 3 div Rratio,
      Sy - rSpacing div 4 div Rratio, rightCenter - rSpacing div 3 div Rratio,
      Sy + Trunc(rSpacing * 0.75 + rSpacing div 4) div Rratio, clBlack, clCon2);
    DrawRect(leftCenter - rSpacing div 4 div Rratio,
      Sy + rSpacing div 4 div Rratio, leftCenter + rSpacing div 4 div Rratio,
      Sy + Trunc(rSpacing * 1.25 + rSpacing div 4) div Rratio, clBlack, clCon3);
    DrawRect(rightCenter + rSpacing div 4 div Rratio,
      Sy + rSpacing div 4 div Rratio, rightCenter - rSpacing div 4 div Rratio,
      Sy + Trunc(rSpacing * 1.25 + rSpacing div 4) div Rratio, clBlack, clCon3);
    DrawRect(leftCenter + rSpacing div 8 div Rratio,
      Sy + rSpacing div 1 div Rratio, leftCenter - rSpacing div 8 div Rratio,
      Sy + Trunc(rSpacing * 2) div Rratio, clBlack, clCon4);
    DrawRect(rightCenter + rSpacing div 8 div Rratio,
      Sy + rSpacing div 1 div Rratio, rightCenter - rSpacing div 8 div Rratio,
      Sy + Trunc(rSpacing * 2) div Rratio, clBlack, clCon4);

    DrawRect(Sx - rSpacing div Rratio, Ey, Sx + (Rwidth + rSpacing) div Rratio,
      Ey - Trunc(rSpacing * 0.75) div Rratio, clBlack, clCon1);
    DrawRect(leftCenter - rSpacing div 3 div Rratio,
      Ey + rSpacing div 4 div Rratio, leftCenter + rSpacing div 3 div Rratio,
      Ey - Trunc(rSpacing * 0.75 + rSpacing div 4) div Rratio, clBlack, clCon2);
    DrawRect(rightCenter + rSpacing div 3 div Rratio,
      Ey + rSpacing div 4 div Rratio, rightCenter - rSpacing div 3 div Rratio,
      Ey - Trunc(rSpacing * 0.75 + rSpacing div 4) div Rratio, clBlack, clCon2);
    DrawRect(leftCenter - rSpacing div 4 div Rratio,
      Ey - rSpacing div 4 div Rratio, leftCenter + rSpacing div 4 div Rratio,
      Ey - Trunc(rSpacing * 1.25 + rSpacing div 4) div Rratio, clBlack, clCon3);
    DrawRect(rightCenter + rSpacing div 4 div Rratio,
      Ey - rSpacing div 4 div Rratio, rightCenter - rSpacing div 4 div Rratio,
      Ey - Trunc(rSpacing * 1.25 + rSpacing div 4) div Rratio, clBlack, clCon3);
    DrawRect(leftCenter + rSpacing div 8 div Rratio,
      Ey - rSpacing div 1 div Rratio, leftCenter - rSpacing div 8 div Rratio,
      Ey - Trunc(rSpacing * 2) div Rratio, clBlack, clCon4);
    DrawRect(rightCenter + rSpacing div 8 div Rratio,
      Ey - rSpacing div 1 div Rratio, rightCenter - rSpacing div 8 div Rratio,
      Ey - Trunc(rSpacing * 2) div Rratio, clBlack, clCon4);
    DrawArrow(Sx + Rwidth div 2 div Rratio, Sy - 130, 100, 0, 3);
  end;

  bmp := TBitmap.Create;
  if Shorizon then
  begin
    Sw := 40 + Rwidth div Rratio + 120;
    Sh := 10 + Rlength div Rratio +180;
    bmp.width := Sw;
    bmp.height := Sh;
    BitBlt(bmp.Canvas.Handle, 0, 0, bmp.width, bmp.height, Canvas.Handle,
      Sx - 35, Sy - 80, srcCopy);
  end
  else
  begin
    Sw := 10 + Rwidth div Rratio;
    Sh := 10 + Rlength div Rratio + 160;
    bmp.width := Sw;
    bmp.height := Sh;
    BitBlt(bmp.Canvas.Handle, 0, 0, bmp.width, bmp.height, Canvas.Handle,
      Sx - 5, Sy - 10, srcCopy);
  end;
  if RxSave.Checked then
    bmp.SaveToFile('E:\Tengzhou L4\Edge_Trim.bmp');
  bmp.Free;

end;

procedure TfrmTengzhou4.BitBtn11Click(Sender: TObject);
begin
  DrawEdgeTrim(300, 200, 4950, 5600, 10, 16, clGray, clMenu, True);
  //DrawEdgeTrim(1000, 200, 4455, 4500, 10, 14, clGray, clMenu, False);
end;

procedure TfrmTengzhou4.DrawRollers(Sx, Sy, Rlength, Rwidth, Rratio,
  RollersNum: word; borderColor, fillColor: TColor; Shorizon: boolean);
var
  i, k: byte;
  Sw, Sh, rSpacing, rFirst, Rx, Ry: word;
  Cx, Cy, FirstChevron, spaceChevron: word;
  bmp: TBitmap;
begin
  // Canvas.Brush.Color :=clWhite;
  // Canvas.FillRect(Rect(0,0, self.width-1,self.height-1));
  if Shorizon then
    DrawRect(Sx, Sy, Sx + Rlength div Rratio, Sy + Rwidth div Rratio,
      borderColor, fillColor)
  else
    DrawRect(Sx, Sy, Sx + Rwidth div Rratio, Sy + Rlength div Rratio,
      borderColor, fillColor);

  rSpacing := Rlength div RollersNum;
  rFirst := (Rlength - rSpacing * (RollersNum - 1) - rSpacing div 2) div 2;
  for i := 1 to RollersNum do
  begin
    if i = 0 then
      continue;

    if Shorizon then
    begin
      Rx := Sx + (i - 1) * rSpacing div Rratio + rFirst div Rratio;
      Ry := Sy + 2;
      if (i = 0) or (i = 6) then // chevron roller
      begin
        FirstChevron := Ry;
        spaceChevron := (Rwidth - 630 - 4 * Rratio) div 5;
        Cx := Rx + 2;
        for k := 0 to 5 do
        begin
          Cy := FirstChevron + spaceChevron * k div Rratio;
          DrawChevron(Cx, Cy, 630, Trunc(rSpacing * 0.4), Rratio, clBtnShadow,
            clScrollBar, Shorizon);
        end;
      end
      else
        DrawRoller(Rx, Ry, Rwidth - Rratio * 4, rSpacing div 2, Rratio, 15,
          borderColor, fillColor, not odd(i), Shorizon);
    end
    else
    begin
      Rx := Sx + 2;
      Ry := Sy + (i - 1) * rSpacing div Rratio + rFirst div Rratio;
      if i = 3 then
      begin
        FirstChevron := Rx;
        spaceChevron := (Rwidth - 630 - 4 * Rratio) div 5;
        Cy := Ry + 2;
        for k := 0 to 5 do
        begin
          Cx := FirstChevron + spaceChevron * k div Rratio;
          DrawChevron(Cx, Cy, 630, Trunc(rSpacing * 0.4), Rratio, clBtnShadow,
            clScrollBar, Shorizon);
        end;
      end
      else
        DrawRoller(Rx, Ry, Rwidth - Rratio * 4, rSpacing div 2, Rratio, 15,
          borderColor, fillColor, not odd(i), Shorizon); //
    end;
  end;

  bmp := TBitmap.Create;
  if Shorizon then
  begin
    DrawArrow(Sx + Rlength div Rratio + 130, Sy + Rwidth div Rratio div 2,
      100, 0, 2);
    Sw := 10 + Rlength div Rratio + 160;
    Sh := 10 + Rwidth div Rratio;

    bmp.width := Sw;
    bmp.height := Sh;

    BitBlt(bmp.Canvas.Handle, 0, 0, bmp.width, bmp.height, Canvas.Handle,
      Sx - 5, Sy - 5, srcCopy);
    if RxSave.Checked then
      bmp.SaveToFile('E:\Tengzhou L4\Chevron1.bmp');
  end
  else
  begin
    DrawArrow(Sx + Rwidth div Rratio div 2, Sy + Rlength div Rratio + 130,
      100, 0, 4);
    Sw := 10 + Rwidth div Rratio;
    Sh := 10 + Rlength div Rratio + 160;

    bmp.width := Sw;
    bmp.height := Sh;

    BitBlt(bmp.Canvas.Handle, 0, 0, bmp.width, bmp.height, Canvas.Handle,
      Sx - 5, Sy - 5, srcCopy);
    if RxSave.Checked then
      bmp.SaveToFile('E:\Tengzhou L4\Chevron2.bmp');
  end;
end;

procedure TfrmTengzhou4.DrawRoller(Sx, Sy, Slength, Swidth, Sratio,
  Srubbernum: word; borderColor, fillColor: TColor; Spair, Shorizon: boolean);
var
  i, Ex, Ey, disRubber, firstRubber: word;
  spairSpacing, spairFirst: word;
begin
  if Shorizon then
  begin
    Ex := Sx + Swidth div Sratio;
    Ey := Sy + Slength div Sratio;
    DrawRect(Sx, Sy, Ex, Ey, borderColor, fillColor);
  end
  else
  begin
    Ex := Sx + Slength div Sratio;
    Ey := Sy + Swidth div Sratio;
    DrawRect(Sx, Sy, Ex, Ey, borderColor, fillColor);
  end;

  disRubber := (Slength div (Srubbernum - 1));

  if (Slength mod (Srubbernum - 1)) > disRubber * 0.6 then
    firstRubber := (Slength mod Srubbernum - Swidth div 3) div 2
  else
  begin
    firstRubber := (Slength div Srubbernum + Slength mod Srubbernum -
      Swidth div 3) div 2;
    disRubber := Slength div Srubbernum;
  end;
  spairSpacing := (disRubber - 2 * Swidth div 3) div 2;
  if Spair then
    for i := 1 to Srubbernum - 1 do
    begin
      if Shorizon then
      begin
        DrawRect(Sx - Swidth div 6 div Sratio, Sy + firstRubber div Sratio,
          Ex + Swidth div 6 div Sratio, Sy + firstRubber div Sratio +
          Swidth div 3 div Sratio, borderColor, fillColor);
        DrawRect(Sx - Swidth div 6 div Sratio, Sy + (Srubbernum - 1) *
          disRubber div Sratio + firstRubber div Sratio,
          Ex + Swidth div 6 div Sratio, Sy + (Srubbernum - 1) *
          disRubber div Sratio + firstRubber div Sratio +
          Swidth div 3 div Sratio, borderColor, fillColor);

        DrawRect(Sx - Swidth div 6 div Sratio,
          Sy + (i - 1) * disRubber div Sratio + (firstRubber + spairSpacing + 1
          * Swidth div 3) div Sratio, Ex + Swidth div 6 div Sratio,
          Sy + (i - 1) * disRubber div Sratio + (firstRubber + spairSpacing + 1
          * Swidth div 3 + Swidth div 3) div Sratio, borderColor, fillColor);
      end
      else
      begin
        DrawRect(Sx + firstRubber div Sratio, Sy - Swidth div 6 div Sratio,
          Sx + firstRubber div Sratio + Swidth div 3 div Sratio,
          Ey + Swidth div 6 div Sratio, borderColor, fillColor);
        DrawRect(Sx + (Srubbernum - 1) * disRubber div Sratio +
          firstRubber div Sratio, Sy - Swidth div 6 div Sratio,
          Sx + (Srubbernum - 1) * disRubber div Sratio + firstRubber div Sratio
          + Swidth div 3 div Sratio, Ey + Swidth div 6 div Sratio, borderColor,
          fillColor);

        DrawRect(Sx + (i - 1) * disRubber div Sratio +
          (firstRubber + spairSpacing + 1 * Swidth div 3) div Sratio,
          Sy - Swidth div 6 div Sratio, Sx + (i - 1) * disRubber div Sratio +
          (firstRubber + spairSpacing + 1 * Swidth div 3 + Swidth div 3)
          div Sratio, Ey + Swidth div 6 div Sratio, borderColor, fillColor);
      end;
    end
  else
  begin
    for i := 1 to Srubbernum do
    begin
      if Shorizon then
        DrawRect(Sx - Swidth div 6 div Sratio,
          Sy + (i - 1) * disRubber div Sratio + firstRubber div Sratio,
          Ex + Swidth div 6 div Sratio, Sy + (i - 1) * disRubber div Sratio +
          firstRubber div Sratio + Swidth div 3 div Sratio, borderColor,
          fillColor)
      else
        DrawRect(Sx + (i - 1) * disRubber div Sratio + firstRubber div Sratio,
          Sy - Swidth div 6 div Sratio, Sx + (i - 1) * disRubber div Sratio +
          firstRubber div Sratio + Swidth div 3 div Sratio,
          Ey + Swidth div 6 div Sratio, borderColor, fillColor);
    end;
  end;
end;

procedure TfrmTengzhou4.BitBtn10Click(Sender: TObject);
begin
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Rect(0, 0, self.width - 1, self.height - 1));
  DrawRollers(100, 100, 7800, 5600, 10, 27, clGray, clMenu, True);
end;

procedure TfrmTengzhou4.DrawPositonRect(areaNo: byte);
var
  i, k, vSpacing, vOffset: byte;
  m, n, mS, nS, mR: byte;
  iType, iState: UINT;
  iRect: TRect;
  clBorder, clFill: TColor;
  slX, slY :word;
begin

  case areaNo of
    0:
      begin
        zeroX := 60;
        zeroY := 250;
        layoutDistance := 450;
      end;
    2:
      begin
        zeroX := 60;
        zeroY := 400;
        layoutDistance := 450;
      end;
  else
    begin
      zeroX := 400;
      zeroY := 400;
    end;
  end;
  iType := DFC_BUTTON;
  iState := DFCS_BUTTONPUSH or DFCS_FLAT;
  iStartX := zeroX;;
  iStartY := zeroY;
  Canvas.Pen.Color := clBlack;
  font.Size := 12;

  //DrawRect(20, 50, 1890, 980, clGreen);
  for i := maxPos downto minPos do // posLabel
  begin
    if posLabel[i].Len <= 0 then
      continue;
    iRect := Rect(iStartX, iStartY, iStartX + posLabel[i].Len,
      iStartY + posLabel[i].wid);
    DrawFrameControl(Canvas.Handle, iRect, iType, iState);
    if areaNo = 0 then
    begin
      iRect := Rect(iStartX, iStartY + layoutDistance,
        iStartX + posLabel[i].Len, iStartY + layoutDistance + posLabel[i].wid);
      DrawFrameControl(Canvas.Handle, iRect, iType, iState);
    end;

    // DrawRect(iStartX, iStartY, iStartX + posLabel[i].Len, iStartY + posLabel[i].wid, clBlack);
    // cs.SendMsg(Format('Positon: %s,  %d, %d',[posLabel[i].Num, posLabel[i].Len, iStartX]));
    iStartX := iStartX + posLabel[i].Len + posLabel[i].gap;
  end;

  iStartX := zeroX;;
  iStartY := zeroY;
  for i := maxPos downto minPos do // pos
  begin
    if pos[i].subPos then
    begin
      DrawLine(iStartX, iStartY + 2, iStartX, iStartY + pos[i].wid - 2, clGray);
      // cs.SendMsg(Format('subPositon: %s,  %d, %d',[pos[i].Num, pos[i].Len, iStartX]));
    end;
    // cs.SendMsg(Format('StartX: %s,  %d, %d',[pos[i].Num, pos[i].Len, iStartX]));
    iStartX := iStartX + pos[i].Len + pos[i].gap;
  end;

  iStartX := zeroX;;
  iStartY := zeroY;
  for i := maxPos downto minPos do // posLabel
  begin
    if posLabel[i].gap = 1 then
      vOffset := posLabel[i].gap * 3
    else
      vOffset := posLabel[i].gap * 2;
    if (posLabel[i].Num = '119.010') or (posLabel[i].Num = '159.010') then
    begin
      Canvas.Brush.Color := clMedGray;
      Canvas.Pen.Color := clBlack;
      Canvas.Polygon([point(iStartX + posLabel[i].Len - vOffset,
        iStartY + posLabel[i].gap * 2),
        point(iStartX + posLabel[i].Len - vOffset, iStartY + posLabel[i].wid -
        vOffset), point(iStartX + vOffset, iStartY + posLabel[i].wid div 2)]);
      if areaNo = 0 then
        Canvas.Polygon([point(iStartX + posLabel[i].Len - vOffset,
          iStartY + layoutDistance + posLabel[i].gap * 2),
          point(iStartX + posLabel[i].Len - vOffset, iStartY + layoutDistance +
          posLabel[i].wid - vOffset), point(iStartX + vOffset,
          iStartY + layoutDistance + posLabel[i].wid div 2)]);

      // if pos[i].gap <> 1 then DrawLine(iStartX + pos[i].Len - Ceil(pos[i].gap * 1.5), iStartY + pos[i].gap * 2, iStartX + pos[i].Len - Ceil(pos[i].gap * 1.5), iStartY + pos[i].wid - pos[i].gap * 2, clBlack) ;
    end;

    if (posLabel[i].Num = '130.010') then
    begin
      DrawRect(iStartX + vOffset * 16, iStartY - vOffset, iStartX + vOffset * 17,
        iStartY + posLabel[i].wid + vOffset, clBlue, clBlue);
      DrawRect(iStartX + vOffset * 20, iStartY - vOffset, iStartX + vOffset * 21,
        iStartY + posLabel[i].wid + vOffset, clBlue, clBlue);
      if areaNo = 0 then
      begin
        DrawRect(iStartX + vOffset * 16, iStartY + layoutDistance - vOffset,
          iStartX + vOffset * 17, iStartY + layoutDistance + posLabel[i].wid +
          vOffset, clBlue, clBlue);
        DrawRect(iStartX + vOffset * 20, iStartY + layoutDistance - vOffset,
          iStartX + vOffset * 21, iStartY + layoutDistance + posLabel[i].wid +
          vOffset, clBlue, clBlue);
      end;
    end;

    if (posLabel[i].Num = '130.010') then
    begin
      Canvas.Brush.Color := clBlue;
      Canvas.Pen.Color := clBlue;
      Canvas.Polygon([point(iStartX + vOffset * 1, iStartY - vOffset),
        point(iStartX + vOffset * -1, iStartY + posLabel[i].wid + vOffset),
        point(iStartX + vOffset * 0, iStartY + posLabel[i].wid + vOffset),
        point(iStartX + vOffset * 2, iStartY - vOffset)]);
      Canvas.Polygon([point(iStartX + vOffset * 5, iStartY - vOffset),
        point(iStartX + vOffset * 3, iStartY + posLabel[i].wid + vOffset),
        point(iStartX + vOffset * 4, iStartY + posLabel[i].wid + vOffset),
        point(iStartX + vOffset * 6, iStartY - vOffset)]);
      if areaNo = 0 then
      begin
        Canvas.Polygon([point(iStartX + vOffset * 1, iStartY + layoutDistance -
          vOffset), point(iStartX + vOffset * -1, iStartY + layoutDistance +
          posLabel[i].wid + vOffset), point(iStartX + vOffset * 0,
          iStartY + layoutDistance + posLabel[i].wid + vOffset),
          point(iStartX + vOffset * 2, iStartY + layoutDistance - vOffset)]);
        Canvas.Polygon([point(iStartX + vOffset * 5, iStartY + layoutDistance -
          vOffset), point(iStartX + vOffset * 3, iStartY + layoutDistance +
          posLabel[i].wid + vOffset), point(iStartX + vOffset * 4,
          iStartY + layoutDistance + posLabel[i].wid + vOffset),
          point(iStartX + vOffset * 6, iStartY + layoutDistance - vOffset)]);
      end;
    end;

    if (posLabel[i].Num = '130.025') then
    begin
      DrawSnap(0,iStartX-vOffset*2,iStartY-vOffset,posLabel[i].wid+vOffset*2,clBlue,clBlue);
      if areaNo=0 then
        DrawSnap(0,iStartX-vOffset*2,iStartY-vOffset+layoutDistance,posLabel[i].wid+vOffset*2,clBlue,clBlue);
    end;

    if (posLabel[i].Num = '141.200') then
    begin
      DrawRect(iStartX + vOffset, iStartY - vOffset, iStartX + vOffset * 2,
        iStartY + posLabel[i].wid + vOffset, clBlue, clBlue);
      DrawRect(iStartX, iStartY + vOffset, iStartX + vOffset * 3,
        iStartY + vOffset * 2, clBlue, clBlue);
      DrawRect(iStartX, iStartY + posLabel[i].wid - vOffset,
        iStartX + vOffset * 3, iStartY + posLabel[i].wid - vOffset * 2,
        clBlue, clBlue);
      DrawRect(iStartX + posLabel[i].Len - vOffset, iStartY - vOffset,
        iStartX + posLabel[i].Len - vOffset * 2, iStartY + posLabel[i].wid +
        vOffset, clBlue, clBlue);
      DrawRect(iStartX + posLabel[i].Len, iStartY + vOffset,
        iStartX + posLabel[i].Len - vOffset * 3, iStartY + vOffset * 2,
        clBlue, clBlue);
      DrawRect(iStartX + posLabel[i].Len, iStartY + posLabel[i].wid - vOffset,
        iStartX + posLabel[i].Len - vOffset * 3, iStartY + posLabel[i].wid -
        vOffset * 2, clBlue, clBlue);
      if areaNo = 0 then
      begin
        DrawRect(iStartX + vOffset, iStartY + layoutDistance - vOffset,
          iStartX + vOffset * 2, iStartY + layoutDistance + posLabel[i].wid +
          vOffset, clBlue, clBlue);
        DrawRect(iStartX, iStartY + layoutDistance + vOffset,
          iStartX + vOffset * 3, iStartY + layoutDistance + vOffset * 2,
          clBlue, clBlue);
        DrawRect(iStartX, iStartY + layoutDistance + posLabel[i].wid - vOffset,
          iStartX + vOffset * 3, iStartY + layoutDistance + posLabel[i].wid -
          vOffset * 2, clBlue, clBlue);
        DrawRect(iStartX + posLabel[i].Len - vOffset, iStartY + layoutDistance -
          vOffset, iStartX + posLabel[i].Len - vOffset * 2,
          iStartY + layoutDistance + posLabel[i].wid + vOffset, clBlue, clBlue);
        DrawRect(iStartX + posLabel[i].Len, iStartY + layoutDistance + vOffset,
          iStartX + posLabel[i].Len - vOffset * 3, iStartY + layoutDistance +
          vOffset * 2, clBlue, clBlue);
        DrawRect(iStartX + posLabel[i].Len, iStartY + layoutDistance +
          posLabel[i].wid - vOffset, iStartX + posLabel[i].Len - vOffset * 3,
          iStartY + layoutDistance + posLabel[i].wid - vOffset * 2,
          clBlue, clBlue);
      end;
    end;

    if (posLabel[i].Num = '200.010') then
      DrawAirDesk(areaNo, iStartX, iStartY, posLabel[i].len, posLabel[i].wid, 4, 4, 4, 0, vOffset);
//    begin
//      iRect := Rect(iStartX, iStartY - posLabel[i].wid - vOffset,
//                    iStartX + posLabel[i].Len, iStartY - posLabel[i].wid + posLabel[i].wid - vOffset);
//      DrawFrameControl(Canvas.Handle, iRect, iType, iState);
//
//      if areaNo = 0 then
//      begin
//        iRect := Rect(iStartX, iStartY - posLabel[i].wid - vOffset + layoutDistance,
//                      iStartX + posLabel[i].Len, iStartY - posLabel[i].wid + posLabel[i].wid - vOffset + layoutDistance);
//        DrawFrameControl(Canvas.Handle, iRect, iType, iState);
//      end;
//
//      Canvas.Brush.Color := clMedGray;
//      if posLabel[i].gap = 1 then
//        vSpacing := posLabel[i].gap * 10
//      else
//        vSpacing := posLabel[i].gap * 8;
//      if (posLabel[i].Len mod vSpacing) > vOffset * 2 then
//        mS := (posLabel[i].Len mod vSpacing) div 2
//      else
//        mS := ((posLabel[i].Len mod vSpacing) + vSpacing) div 2;
//
//      if (posLabel[i].wid mod vSpacing) > vOffset * 2 then
//        nS := (posLabel[i].wid mod vSpacing) div 2
//      else
//        nS := ((posLabel[i].wid mod vSpacing) + vSpacing) div 2;
//
//      for m := mS to posLabel[i].Len - vOffset do
//        for n := nS to posLabel[i].wid - vOffset do
//          if (((m - mS) mod vSpacing) = 0) and (((n - nS) mod vSpacing) = 0)
//          then
//          begin
//            Canvas.Ellipse(iStartX + m - vOffset, iStartY + n - vOffset*2 - posLabel[i].wid,
//              iStartX + m + vOffset, iStartY + n - posLabel[i].wid);
//            if areaNo = 0 then
//              Canvas.Ellipse(iStartX + m - vOffset, iStartY + layoutDistance + n
//                - vOffset*2 - posLabel[i].wid, iStartX + m + vOffset, iStartY + layoutDistance + n
//                - posLabel[i].wid);
//          end;
//    end;

    if (posLabel[i].Num = '170.030') or (posLabel[i].Num = '170.070') or
      (posLabel[i].Num = '170.110') or (posLabel[i].Num = '170.160') or
      (posLabel[i].Num = '170.151') then
    begin
      mR := Ceil(posLabel[i].Len * 0.7) div 2;
      Canvas.Brush.Color := RGB(255, 173, 91);
      Canvas.Ellipse(iStartX + posLabel[i].Len div 2 - mR,
        iStartY - mR * 2 - vOffset * 1, iStartX + posLabel[i].Len div 2 + mR,
        iStartY - vOffset * 1);
      Canvas.Ellipse(iStartX + posLabel[i].Len div 2 + mR,
        iStartY + posLabel[i].wid + mR * 2 + vOffset * 1,
        iStartX + posLabel[i].Len div 2 - mR, iStartY + posLabel[i].wid +
        vOffset * 1);

      clBorder := clBlack;
      clFill := clGreen;
      DrawRect(iStartX + posLabel[i].Len div 2 - mR div 2,
        iStartY - mR * 2 - vOffset * 2, iStartX + posLabel[i].Len div 2 -
        mR div 2 - vOffset, iStartY + posLabel[i].wid + mR * 2 + vOffset * 2,
        clBorder, clFill);
      DrawRect(iStartX + posLabel[i].Len div 2 + mR div 2,
        iStartY - mR * 2 - vOffset * 2, iStartX + posLabel[i].Len div 2 +
        mR div 2 + vOffset, iStartY + posLabel[i].wid + mR * 2 + vOffset * 2,
        clBorder, clFill);

      DrawRect(iStartX + posLabel[i].Len div 2 - mR div 2 - 1,
        iStartY - mR * 2 + vOffset * 2, iStartX + posLabel[i].Len div 2 +
        mR div 2 + 1, iStartY - mR * 2 + vOffset * 1, clBorder, clFill);
      DrawRect(iStartX + posLabel[i].Len div 2 - mR div 2 - 1,
        iStartY - vOffset - vOffset * 2, iStartX + posLabel[i].Len div 2 +
        mR div 2 + 1, iStartY - vOffset - vOffset * 3, clBorder, clFill);
      DrawRect(iStartX + posLabel[i].Len div 2 - mR div 2 - 1,
        iStartY - mR - vOffset - vOffset div 2, iStartX + posLabel[i].Len div 2
        + mR div 2 + 1, iStartY - mR - vOffset + vOffset - vOffset div 2,
        clBorder, clFill);

      DrawRect(iStartX + posLabel[i].Len div 2 - vOffset div 2,
        iStartY - mR * 2 + vOffset * 2 - 1, iStartX + posLabel[i].Len div 2 +
        vOffset - vOffset div 2, iStartY - vOffset - vOffset * 3 + 1,
        clBorder, clFill);

      DrawRect(iStartX + posLabel[i].Len div 2 - mR div 2 - 1,
        iStartY + posLabel[i].wid + mR * 2 - vOffset * 2,
        iStartX + posLabel[i].Len div 2 + mR div 2 + 1,
        iStartY + posLabel[i].wid + mR * 2 - vOffset * 1, clBorder, clFill);
      DrawRect(iStartX + posLabel[i].Len div 2 - mR div 2 - 1,
        iStartY + posLabel[i].wid + vOffset + vOffset * 2,
        iStartX + posLabel[i].Len div 2 + mR div 2 + 1,
        iStartY + posLabel[i].wid + vOffset + vOffset * 3, clBorder, clFill);
      DrawRect(iStartX + posLabel[i].Len div 2 - mR div 2 - 1,
        iStartY + posLabel[i].wid + mR + vOffset - vOffset div 2,
        iStartX + posLabel[i].Len div 2 + mR div 2 + 1,
        iStartY + posLabel[i].wid + mR + vOffset + vOffset - vOffset div 2,
        clBorder, clFill);

      DrawRect(iStartX + posLabel[i].Len div 2 - vOffset div 2,
        iStartY + posLabel[i].wid + mR * 2 - vOffset * 2 + 1,
        iStartX + posLabel[i].Len div 2 + vOffset - vOffset div 2,
        iStartY + posLabel[i].wid + vOffset + vOffset * 3 - 1,
        clBorder, clFill);
    end;

    if (posLabel[i].Num = '181.010') or (posLabel[i].Num = '183.010') or (posLabel[i].Num = '185.010') then
    begin

//      iRect := Rect(iStartX, iStartY + posLabel[i].wid + vOffset , iStartX + posLabel[i].Len,
//      iStartY + posLabel[i].wid*2+vOffset);
//      DrawFrameControl(Canvas.Handle, iRect, iType, iState);
      if (posLabel[i].Num = '183.010') then
        DrawSideLine(areaNo,iStartX+(posLabel[i].Len-4260 div ratio) div 2, iStartY, 4260, 5100, 4570, 4700, 3600, 4700, ratio, vOffset, 1, 3, posLabel[i].Num,clMedGray, RGB(240,240,240))
      else
        DrawSideLine(areaNo,iStartX+(posLabel[i].Len-4260 div ratio) div 2, iStartY+posLabel[i].wid, 4260, 5100, 4570, 3800, 4570, 3200, ratio, vOffset, 2, 1, posLabel[i].Num, clMedGray, RGB(240,240,240));
      if areaNo = 0 then
      begin
        //angle conveyor
//        iRect := Rect(iStartX, iStartY + layoutDistance + posLabel[i].wid + vOffset,
//                      iStartX + posLabel[i].Len, iStartY + layoutDistance + posLabel[i].wid*2+vOffset);
//        DrawFrameControl(Canvas.Handle, iRect, iType, iState);
//        for  k:= 0 to 5 do
//        begin
//          DrawLine(iStartX + (posLabel[i].Len - posLabel[i].Len div 7 * 5) div 2+(posLabel[i].Len div 7)*k, iStartY + layoutDistance + posLabel[i].wid + vOffset,
//                   iStartX + (posLabel[i].Len - posLabel[i].Len div 7 * 5) div 2+(posLabel[i].Len div 7)*k, iStartY + layoutDistance + posLabel[i].wid*2+vOffset,clMedGray);
//          cs.SendMsg(Format('StartX: %d, %d,  %d, %d, %d',[k, iStartX, iStartX + (posLabel[i].Len - posLabel[i].Len div 7 * 5 div 2)-(posLabel[i].Len div 7)*k, (posLabel[i].Len - posLabel[i].Len div 7 * 5 div 2), (posLabel[i].Len div 7)*k]));
//        end;
        //side line
        if (posLabel[i].Num = '183.010') then
          DrawSideLine(areaNo,iStartX+(posLabel[i].Len-4260 div ratio) div 2, iStartY+layoutDistance, 4260, 5100, 4570, 4700, 3600, 4700, ratio, vOffset, 1, 3, posLabel[i].Num, clMedGray, RGB(240,240,240))
        else
          DrawSideLine(areaNo,iStartX+(posLabel[i].Len-4260 div ratio) div 2, iStartY+posLabel[i].wid+layoutDistance, 4260, 5100, 4570, 3800, 4570, 3200, ratio, vOffset, 2, 1, posLabel[i].Num, clMedGray, RGB(240,240,240));
      end;
    end;

    if (posLabel[i].Num = '180.090') then
    begin
      DrawRotator(areaNo,iStartX+posLabel[i].Len div 2, iStartY+posLabel[i].wid div 2 , posLabel[i].Len, posLabel[i].wid, ratio, vOffset, clBlack, clBlue);
      if areaNO =0 then DrawRotator(areaNo,iStartX+posLabel[i].Len div 2, iStartY+posLabel[i].wid div 2+layoutDistance , posLabel[i].Len, posLabel[i].wid, ratio, vOffset, clBlack, clBlue);
    end;

//    if (posLabel[i].Num = '170.180') or (posLabel[i].Num = '170.200') or (posLabel[i].Num = '170.210') or (posLabel[i].Num = '170.230') then
//    begin
//      Canvas.Brush.Color :=clWhite;
//      Canvas.Pen.Color :=clWhite;
//      Canvas.Rectangle(iStartX, iStartY, iStartX+posLabel[i].Len, iStartY+600 div ratio);
//      DrawLine(iStartX, iStartY+600 div ratio, iStartX+posLabel[i].Len, iStartY+600 div ratio, clMedGray);
//      DrawRectangleStacker(areaNo,iStartX+posLabel[i].Len div 2, iStartY+posLabel[i].wid div 2, 7420 div ratio, 3900 div ratio, 5, vOffset, clBlack, RGB(240,240,240));
//      if areaNO =0 then
//      begin
//        Canvas.Brush.Color :=clWhite;
//        Canvas.Pen.Color :=clWhite;
//        Canvas.Rectangle(iStartX, iStartY+layoutDistance, iStartX+posLabel[i].Len, iStartY+600 div ratio+layoutDistance);
//        DrawLine(iStartX, iStartY+600 div ratio+layoutDistance, iStartX+posLabel[i].Len, iStartY+600 div ratio+layoutDistance, clMedGray);
//        DrawRectangleStacker(areaNo,iStartX+posLabel[i].Len div 2, iStartY+posLabel[i].wid div 2+layoutDistance, 7420 div ratio, 3900 div ratio, 5, vOffset, clBlack, RGB(240,240,240));
//      end;
//    end;

    if (posLabel[i].Num = '170.190') or (posLabel[i].Num = '170.220') then
    begin
      DrawSideLine_simple(0,iStartX, iStartY, 4400,3800, 4300,3000,4300,3000, ratio, vOffset, 1, 5, posLabel[i].Num,clMedGray, RGB(240,240,240));
      if areaNo = 0 then DrawSideLine_simple(0,iStartX, iStartY+layoutDistance, 4400,3800, 4300,3000,4300,3000, ratio, vOffset, 1, 5, posLabel[i].Num,clMedGray, RGB(240,240,240));
    end;
    iStartX := iStartX + posLabel[i].Len + posLabel[i].gap;
  end;
end;

procedure TfrmTengzhou4.DrawLabels;
var
  i: byte;
  iType, iState: UINT;
  iRect: TRect;
  textX, textY: word;
begin

  iStartX := zeroX;;
  iStartY := zeroY;
  Canvas.Brush.Color := clBtnFace;
  Canvas.Pen.Color := clBlack;
  font.Size := 12;
  for i := maxPos downto minPos do
  begin
    if posLabel[i].Len <= 0 then
      continue;
    textX := iStartX + posLabel[i].Len div 2 - 35;
    textY := iStartY + posLabel[i].NumPos + labelOffSet;
    Canvas.RoundRect(textX - 7, textY - 3, textX + 68, textY + 22, 20, 20);
    Canvas.TextOut(textX, textY, posLabel[i].Num);
    // Canvas.TextOut(textX + 30, iStartY - 22 , format('%d',[posLabel[i].Len]));
    iStartX := iStartX + posLabel[i].Len + posLabel[i].gap;
  end;
end;

procedure TfrmTengzhou4.DrawConnection(areaNo: byte);
var
  i: integer;
  iType, iState: UINT;

  iRect: TRect;
  lineX, lineY: word;
begin
  iStartX := zeroX;;
  iStartY := zeroY;
  for i := maxPos downto minPos do
  begin
    if posLabel[i].Len <= 0 then
      continue;
    lineX := iStartX + posLabel[i].Len div 2 - 1;
    if areaNo = 0 then
      lineY := iStartY + layoutDistance
    else
      lineY := iStartY + labelOffSet + posLabel[i].NumPos - 3;
    DrawLine(lineX, iStartY + posLabel[i].wid, lineX, lineY, clGreen);
    iStartX := iStartX + posLabel[i].Len + posLabel[i].gap;
  end;
end;



procedure TfrmTengzhou4.setPos;
var
  i, m: byte;
  posList: TStringList;
begin
  posData[1].Num := '110.010';
  posData[1].Len := 1800;
  posData[1].wid := 5600;
  posData[1].gap := 300;
  posData[1].NumPos := 100;

  posData[2].Num := '119.010';
  posData[2].Len := 1800;
  posData[2].wid := 5600;
  posData[2].gap := 300;
  posData[2].NumPos := 130;

  posData[3].Num := '120.050';
  posData[3].Len := 6600;
  posData[3].wid := 5600;
  posData[3].gap := 300;
  posData[3].NumPos := 160;

  posData[4].Num := '120.060';
  posData[4].Len := 13845;
  posData[4].wid := 5600;
  posData[4].gap := 300;
  posData[4].NumPos := 130;

  posData[5].Num := '130.010';
  posData[5].Len := 4900;
  posData[5].wid := 5600;
  posData[5].NumPos := 100;
  posData[5].gap := 300;

  posData[6].Num := '130.020';
  posData[6].Len := 5900;
  posData[6].wid := 5600;
  posData[6].NumPos := 130;
  posData[6].gap := 300;

  posData[7].Num := '130.025';
  posData[7].Len := 2080;
  posData[7].wid := 5600;
  posData[7].gap := 300;
  posData[7].NumPos := 160;

  posData[8].Num := '130.030';
  posData[8].Len := 2400;
  posData[8].wid := 5600;
  posData[8].gap := 300;
  posData[8].NumPos := 100;

  posData[9].Num := '130.040';
  posData[9].Len := 6000;
  posData[9].wid := 5600;
  posData[9].gap := 200;
  posData[9].subPos :=true;
  posData[9].NumPos := 130;

  posData[10].Num := '141.200';
  posData[10].Len := 4950;
  posData[10].wid := 5600;
  posData[10].NumPos := 160;
  posData[10].gap := 200;

  posData[11].Num := '146.010';
  posData[11].Len := 6873;
  posData[11].wid := 5400;
  posData[11].NumPos := 100;
  posData[11].gap := 300;

  posData[12].Num := '150.010';
  posData[12].Len := 7800;
  posData[12].wid := 5400;
  posData[12].gap := 300;
  posData[12].NumPos := 130;

  posData[13].Num := '159.010';
  posData[13].Len := 3000;
  posData[13].wid := 5400;
  posData[13].gap := 300;
  posData[13].NumPos := 160;

  posData[14].Num := '150.020';
  posData[14].Len := 5640;
  posData[14].wid := 5400;
  posData[14].gap := 300;
  posData[14].NumPos := 100;

  posData[15].Num := '170.010';
  posData[15].Len := 4500;
  posData[15].wid := 5400;
  posData[15].gap := 300;
  posData[15].NumPos := 130;

  posData[16].Num := '170.030';
  posData[16].Len := 4425;
  posData[16].wid := 5400;
  posData[16].gap := 300;
  posData[16].NumPos := 160;

  posData[17].Num := '170.040';
  posData[17].Len := 4500;
  posData[17].wid := 5400;
  posData[17].gap := 300;
  posData[17].NumPos := 100;

  posData[18].Num := '170.050';
  posData[18].Len := 4500;
  posData[18].wid := 5400;
  posData[18].gap := 300;
  posData[18].NumPos := 130;

  posData[19].Num := '170.060';
  posData[19].Len := 4500;
  posData[19].wid := 5400;
  posData[19].gap := 300;
  posData[19].NumPos := 160;

  posData[20].Num := '170.070';
  posData[20].Len := 4425;
  posData[20].wid := 5400;
  posData[20].gap := 300;
  posData[20].NumPos := 100;

  posData[21].Num := '170.080';
  posData[21].Len := 4500;
  posData[21].wid := 5400;
  posData[21].gap := 300;
  posData[21].NumPos := 130;

  posData[22].Num := '170.090';
  posData[22].Len := 4500;
  posData[22].wid := 5400;
  posData[22].gap := 300;
  posData[22].NumPos := 160;

  posData[23].Num := '170.100';
  posData[23].Len := 4500;
  posData[23].wid := 5400;
  posData[23].gap := 300;
  posData[23].NumPos := 100;

  posData[24].Num := '170.110';
  posData[24].Len := 4425;
  posData[24].wid := 5400;
  posData[24].gap := 000;
  posData[24].NumPos := 130;

  posData[25].Num := '170.120';
  posData[25].Len := 4500;
  posData[25].wid := 5400;
  posData[25].gap := 000;
  posData[25].NumPos := 160;

  posData[26].Num := '170.130';
  posData[26].Len := 4500;
  posData[26].wid := 5400;
  posData[26].gap := 300;
  posData[26].NumPos := 100;

  posData[27].Num := '170.140';
  posData[27].Len := 4500;
  posData[27].wid := 5400;
  posData[27].gap := 300;
  posData[27].NumPos := 130;

  posData[28].Num := '170.150';
  posData[28].Len := 4500;
  posData[28].wid := 5400;
  posData[28].gap := 300;
  posData[28].NumPos := 160;

  posData[29].Num := '170.160';
  posData[29].Len := 4500;
  posData[29].wid := 5400;
  posData[29].gap := 300;
  posData[29].NumPos := 100;

  posData[30].Num := '170.170';
  posData[30].Len := 6000;
  posData[30].wid := 5400;
  posData[30].gap := 300;
  posData[30].NumPos := 130;

  posData[31].Num := '170.180';
  posData[31].Len := 4500;
  posData[31].wid := 5400;
  posData[31].gap := 300;
  posData[31].NumPos := 160;

  posData[32].Num := '170.190';
  posData[32].Len := 4500;
  posData[32].wid := 5400;
  posData[32].gap := 000;
  posData[32].NumPos := 100;

  posData[33].Num := '170.200';
  posData[33].Len := 4500;
  posData[33].wid := 5400;
  posData[33].gap := 000;
  posData[33].NumPos := 130;

  posData[34].Num := '170.210';
  posData[34].Len := 4500;
  posData[34].wid := 5400;
  posData[34].gap := 000;
  posData[34].NumPos := 160;

  posData[35].Num := '170.220';
  posData[35].Len := 4500;
  posData[35].wid := 5400;
  posData[35].gap := 000;
  posData[35].NumPos := 100;

  posData[36].Num := '170.230';
  posData[36].Len := 4500;
  posData[36].wid := 5400;
  posData[36].gap := 000;
  posData[36].NumPos := 130;

  posData[37].Num := '200.010';
  posData[37].Len := 4500;
  posData[37].wid := 5400;
  posData[37].gap := 000;
  posData[37].NumPos := 160;


  for i := 1 to 37 do
  begin
    posData[i].gap := 100;
    //posData[i].wid := 4600;
  end;

  sumLen := 0;
  for i := 1 to 37 do
  begin
    pos[i].Len := Ceil(posData[i].Len / ratio);
    pos[i].wid := Ceil(posData[i].wid / ratio);
    pos[i].gap := Ceil(posData[i].gap / ratio);
    pos[i].NumPos := posData[i].NumPos;
    pos[i].Num := posData[i].Num;
    pos[i].subPos := posData[i].subPos;
    sumLen :=sumLen + pos[i].Len + pos[i].gap;
  end;

  posList := TStringList.Create;
  posList.Clear;
  cs.Clear;
  m := 0;
  for i := 1 to 37 do
  begin
    if posList.IndexOf(pos[i].Num) = -1 then
    begin
      m := m + 1;
      posList.Add(pos[i].Num);
      posLabel[m].Num := pos[i].Num;
      posLabel[m].Len := pos[i].Len;
      posLabel[m].wid := pos[i].wid;
      posLabel[m].gap := pos[i].gap;
      posLabel[m].NumPos := pos[i].NumPos;
      posLabel[m].subPos := pos[i].subPos;
      // cs.SendMsg(pos[i].Num);
    end
    else
      posLabel[m].Len := posLabel[m].Len + pos[i].Len + pos[i].gap;
  end;
end;

procedure TfrmTengzhou4.DrawLine(Sx, Sy, Ex, Ey: word; CurColor: TColor);
begin
  Canvas.Pen.Color := CurColor;
  Canvas.MoveTo(Sx, Sy);
  Canvas.LineTo(Ex, Ey);
end;

procedure TfrmTengzhou4.DrawRect(Sx, Sy, Ex, Ey: word; borderColor: TColor;
  fillColor: TColor = clWhite);
begin
  Canvas.Pen.Color := borderColor;
  Canvas.Brush.Color := fillColor;
  Canvas.FillRect(Rect(Sx, Sy, Ex, Ey));
  Canvas.Rectangle(Sx, Sy, Ex, Ey);
  Canvas.Pen.Color := clBlack;
  Canvas.Brush.Color := clWhite;
end;

procedure TfrmTengzhou4.DrawArrow(Sx, Sy: word; sizeLength: word; direction: byte);
var
  Ex, Ey: word;
  X1, Y1, X2, Y2: word;
begin
  case direction of
    1:
      begin
        Ex := Sx + sizeLength;
        Ey := Sy;
        X1 := Sx + sizeLength div 6;
        X2 := Sx + sizeLength div 3;
        Y1 := Sy + sizeLength div 6;
        Y2 := Sy - sizeLength div 6;
      end; // right
    2:
      begin
        Ex := Sx - sizeLength;
        Ey := Sy;
        X1 := Sx - sizeLength div 6;
        X2 := Sx - sizeLength div 3;
        Y1 := Sy + sizeLength div 6;
        Y2 := Sy - sizeLength div 6;
      end; // left
    3:
      begin
        Ex := Sx;
        Ey := Sy + sizeLength;
        X1 := Sx - sizeLength div 6;
        X2 := Sx + sizeLength div 6;
        Y1 := Sy + sizeLength div 3;
        Y2 := Sy + sizeLength div 6;
      end; // down
    4:
      begin
        Ex := Sx;
        Ey := Sy - sizeLength;
        X1 := Sx - sizeLength div 6;
        X2 := Sx + sizeLength div 6;
        Y1 := Sy - sizeLength div 3;
        Y2 := Sy - sizeLength div 6;
      end; // up
  end;
  DrawLine(Sx, Sy, Ex, Ey, clBlack);
  DrawLine(X1, Y1, Ex, Ey, clBlack);
  DrawLine(X2, Y2, Ex, Ey, clBlack);
  DrawLine(X1, Y1, X2, Y2, clBlack);
  Canvas.Brush.Color := clBlack;
  if direction <= 2 then
    Canvas.Polygon([point(X2, Y2), point(Ex, Ey), point((X1 + X2) div 2, Sy)])
  else
    Canvas.Polygon([point(X1, Y1), point(Ex, Ey), point(Sx, (Y1 + Y2) div 2)])
end;

procedure TfrmTengzhou4.DrawArrow(Sx, Sy: word; sizeLength, sizeWidth: word; direction: byte);
var
  Ex, Ey: word;
  X1, Y1, X2, Y2, X3, Y3: word;
  pd :array[0..3] of TGPPoint;
begin
  case direction of
    1:
      begin
        Ex := Sx + sizeLength;
        Ey := Sy;
        X1 := Sx + sizeLength div 6;
        X2 := Sx + sizeLength div 3;
        Y1 := Sy + sizeLength div 6;
        Y2 := Sy - sizeLength div 6;
        X3 := Sx + sizeLength div 2;
        Y3 := Ey;
      end; // right
    2:
      begin
        Ex := Sx - sizeLength;
        Ey := Sy;
        X1 := Sx - sizeLength div 6;
        X2 := Sx - sizeLength div 3;
        Y1 := Sy + sizeLength div 6;
        Y2 := Sy - sizeLength div 6;
        X3 := Sx - sizeLength div 2;
        Y3 := Ey;
      end; // left
    3:
      begin
        Ex := Sx;
        Ey := Sy + sizeLength;
        X1 := Sx - sizeLength div 6;
        X2 := Sx + sizeLength div 6;
        Y1 := Sy + sizeLength div 3;
        Y2 := Sy + sizeLength div 6;
        X3 := Sx;
        Y3 := Sy + sizeLength div 2;
      end; // down
    4:
      begin
        Ex := Sx;
        Ey := Sy - sizeLength;
        X1 := Sx - sizeLength div 6;
        X2 := Sx + sizeLength div 6;
        Y1 := Sy - sizeLength div 3;
        Y2 := Sy - sizeLength div 6;
        X3 := Sx;
        Y3 := Sy - sizeLength div 2;
      end; // up
  end;

//  pd[0] :=MakePoint(x3,y3+50);
//  pd[1] :=MakePoint(x1,y1+50);
//  pd[2] :=MakePoint(Ex,Ey+50);
//  pd[3] :=MakePoint(x2,y2+50);
//  p.SetColor(aclBlack);
//  b.SetColor(MakeColor(255,0,0,0));
//  g.DrawLine(p, Sx,Sy+50,Ex,Ey+50);
//  g.DrawPolygon(p, PGPPoint(@pd),length(pd));
//  g.FillPolygon(b, PGPPoint(@pd),length(pd)-1);

  DrawLine(Sx, Sy, Ex, Ey, clBlack);
  DrawLine(X1, Y1, Ex, Ey, clBlack);
  DrawLine(X2, Y2, Ex, Ey, clBlack);
  DrawLine(X1, Y1, X3, Y3, clBlack);
  DrawLine(X2, Y2, X3, Y3, clBlack);
  Canvas.Brush.Color := clBlack;


  if direction <= 2 then
    Canvas.Polygon([point(X1, Y1), point(Ex, Ey), point(X3, Y3)])
  else
    Canvas.Polygon([point(X2, Y2), point(Ex, Ey), point(X3, Y3)]);
end;

procedure TfrmTengzhou4.BitBtn2Click(Sender: TObject);
begin
  DrawArrow(1500, 800, 150, 0, 1);
  DrawArrow(1400, 800, 150, 0, 2);
  DrawArrow(1450, 850, 150, 0, 3);
  DrawArrow(1450, 750, 150, 0, 4);
  Canvas.Brush.Color := clYellow;
  Canvas.Ellipse(1400, 750, 1500, 850);
end;

procedure TfrmTengzhou4.DrawArea(areaNo: byte);
var
  i: word;
begin
  // 不是posData, 也不是pos, 而是posLabel
  case areaNo of
    0:
      begin
        minPos := 1;
        maxPos := 37;
        ratio := 110;
        labelOffSet := 120;
        slLabelOffSet := 0;
        arrowLength := 90;
        arrowSx := 1850;
        arrowSy := 273;
      end;
    1:
      begin
        minPos := 1;
        maxPos := 2;
        ratio := 40;
        labelOffSet := 100;
        slLabelOffSet := 0;
        arrowLength := 120;
        arrowSx := 750;
        arrowSy := 458;
      end;
    2:
      begin
        minPos := 3;
        maxPos := 13;
        ratio := 40;
        labelOffSet := 100;
        slLabelOffSet := 0;
        arrowLength := 120;
        arrowSx := 1850;
        arrowSy := 458;
      end;
    3:
      begin
        minPos := 14;
        maxPos := 20;
        ratio := 40;
        labelOffSet := 160;
        slLabelOffSet := 0;
        arrowLength := 120;
        arrowSx := 1492;
        arrowSy := 458;
      end;
    4:
      begin
        minPos := 21;
        maxPos := 29;
        ratio := 40;
        labelOffSet := 160;
        slLabelOffSet := 0;
        arrowLength := 120;
        arrowSx := 1696;
        arrowSy := 458;
      end;
    5:
      begin
        minPos := 30;
        maxPos := 32;
        ratio := 40;
        labelOffSet := 160;
        slLabelOffSet := 100;
        arrowLength := 120;
        arrowSx := 1040;
        arrowSy := 458;
      end;
    6:
      begin
        minPos := 33;
        maxPos := 37;
        ratio := 40;
        labelOffSet := 160;
        slLabelOffSet := 0;
        arrowLength := 120;
        arrowSx := 1236;
        arrowSy := 458;
      end;
    7:
      begin
        minPos := 31;
        maxPos := 37;
        ratio := 40;
        labelOffSet := 100;
        slLabelOffSet := 0;
        arrowLength := 120;
        arrowSx := 820;
        arrowSy := 458;
      end;
  end;
  setPos;

  if areaNo >= 2 then
    for i := maxPos downto minPos do
      posLabel[i].NumPos := 130;
  if areaNo = 2 then
    posLabel[7].NumPos := 100;
  DrawPositonRect(areaNo);
  DrawConnection(areaNo);
  DrawPositonRect(areaNo);
  DrawLabels(areaNo);
  DrawArrow(arrowSx, arrowSy, arrowLength, 0, 2);
  if areaNo = 0 then
    DrawArrow(arrowSx, arrowSy + 450, arrowLength, 0, 2);

end;

procedure TfrmTengzhou4.BitBtn1Click(Sender: TObject);
var
  Sx, Sy, Ex, Ey, Sw, Sh: word;
  bmp: TBitmap;
begin
  Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Rect(0, 0, self.width - 1, self.height - 1));
  DrawArea((Sender as TBitBtn).tag);

  case (Sender as TBitBtn).tag of
    0:
      begin
        Sw := 1868;
        Sh := 820;
        Sx := 21;
        Sy := 101;
        Ey := 920;
      end;
    1:
      begin
        Sw := 530;
        Sh := 720;
        Sx := 310;
        Sy := 100;
        Ey := 550;
      end;
    2:
      begin
        Sw := 1860;
        Sh := 720;
        Sx := 10;
        Sy := 100;
        Ey := 550;
      end;
    3:
      begin
        Sw := 1200;
        Sh := 720;
        Sx := 320;
        Sy := 100;
        Ey := 550;
      end;
    4:
      begin
        Sw := 1400;
        Sh := 720;
        Sx := 380;
        Sy := 100;
        Ey := 550;
      end;
    5:
      begin
        Sw := 910;
        Sh := 720;
        Sx := 170;
        Sy := 100;
        Ey := 550;
      end;
    6:
      begin
        Sw := 910;
        Sh := 720;
        Sx := 350;
        Sy := 100;
        Ey := 550;
      end;
    7:
      begin
        Sw := 870;
        Sh := 498;
        Sx := 121;
        Sy := 51;
        Ey := 550;
      end;
  end;

  bmp := TBitmap.Create;
  bmp.width := Sw;
  bmp.height := Sh;

  BitBlt(bmp.Canvas.Handle, 0, 0, bmp.width, bmp.height, Canvas.Handle, Sx,Sy, srcCopy);
  if RxSave.Checked then
     bmp.SaveToFile('E:\Tengzhou L4\Area' + IntToStr((Sender as TBitBtn).tag) + '.bmp');
end;


end.



