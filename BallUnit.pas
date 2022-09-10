unit BallUnit;

interface

uses Windows, graphics, system.UITypes, system.Math.Vectors, math, DrawObjectUnit, AllUnit;

type TBall = class(TDrawObject)
   private
      moveVector: TVector3D;
   public
      constructor create(bmpDraw: TBitmap);
      destructor Destroy(); override;

      procedure draw(); override;
      procedure move(sDist, cRasius: single);

end;

implementation

{ TBall }

constructor TBall.create(bmpDraw: TBitmap);
begin
  inherited;

  ctrPnt := TPoint3D.Create(0, 0, 0);
  moveVector := TVector3D.Create(1, 0.7, 0.2);
  moveVector.Normalize();
end;

destructor TBall.destroy();
begin

end;

procedure TBall.draw();
var
  cnt, rColor, gColor, bColor: integer;
begin
  inherited;

  bmpDraw.Canvas.Brush.Style := bsClear;
  bmpDraw.Canvas.Pen.width := 2;

  rColor := GetRValue(bmpDraw.Canvas.pen.Color);
  gColor := GetGValue(bmpDraw.Canvas.pen.Color);
  bColor := GetBValue(bmpDraw.Canvas.pen.Color);

  for cnt := 1 to round(objRadius) do begin
    bmpDraw.Canvas.Pen.Color := RGB(rColor, gColor, bColor);
    bmpDraw.Canvas.Ellipse(cptDraw.X + round(ctrPnt.X - cnt), cptDraw.Y + round(ctrPnt.Y - cnt),
                           cptDraw.X + round(ctrPnt.X + cnt), cptDraw.Y + round(ctrPnt.Y + cnt));
    rColor := max(0, rColor - 5);
    gColor := max(0, gColor - 5);
    bColor := max(0, bColor - 5);
  end;

end;

procedure TBall.move(sDist, cRasius: single);
var
  sVector: TVector3D;
begin
  sVector := moveVector * sDist;
  setCtrPnt(Point3D(ctrPnt.X + sVector.X, ctrPnt.Y + sVector.Y, ctrPnt.Z + sVector.Z));

  if (abs(ctrPnt.X) > (cRasius - objRadius)) then moveVector.X := -moveVector.X;
  if (abs(ctrPnt.Y) > (cRasius - objRadius)) then moveVector.Y := -moveVector.Y;
  if (abs(ctrPnt.Z) > (cRasius - objRadius)) then moveVector.Z := -moveVector.Z;
end;

end.
