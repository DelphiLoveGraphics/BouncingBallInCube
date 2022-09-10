unit CubeUnit;

interface

uses graphics, system.Math.Vectors, DrawObjectUnit, AllUnit;

type TCube = class(TDrawObject)
   private
      arrPoints, rotatedPoints: array[0..7] of TPoint3D;
   public
      constructor create(bmpDraw: TBitmap);
      destructor Destroy(); override;

      procedure generatePoints();
      procedure draw(); override;

end;

implementation

{ TCube }

constructor TCube.create(bmpDraw: TBitmap);
begin
  inherited;

end;

destructor TCube.destroy();
begin
  inherited;

end;

procedure TCube.draw();
var
  cnt: integer;
begin
  inherited;

  bmpDraw.Canvas.Brush.Style := bsClear;
  bmpDraw.canvas.Pen.Width := 3;

  for cnt := 0 to 7 do rotatedPoints[cnt] := arrPoints[cnt] * matDraw;

  bmpDraw.Canvas.MoveTo(cptDraw.X + round(rotatedPoints[0].X), cptDraw.Y + round(rotatedPoints[0].Y));
  for cnt := 1 to 3 do begin
    bmpDraw.Canvas.LineTo(cptDraw.X + round(rotatedPoints[cnt].X), cptDraw.Y + round(rotatedPoints[cnt].Y));
  end;
  bmpDraw.Canvas.LineTo(cptDraw.X + round(rotatedPoints[0].X), cptDraw.Y + round(rotatedPoints[0].Y));

  bmpDraw.Canvas.MoveTo(cptDraw.X + round(rotatedPoints[4].X), cptDraw.Y + round(rotatedPoints[4].Y));
  for cnt := 5 to 7 do begin
    bmpDraw.Canvas.LineTo(cptDraw.X + round(rotatedPoints[cnt].X), cptDraw.Y + round(rotatedPoints[cnt].Y));
  end;
  bmpDraw.Canvas.LineTo(cptDraw.X + round(rotatedPoints[4].X), cptDraw.Y + round(rotatedPoints[4].Y));

  for cnt := 0 to 3 do begin
    bmpDraw.Canvas.MoveTo(cptDraw.X + round(rotatedPoints[cnt].X), cptDraw.Y + round(rotatedPoints[cnt].Y));
    bmpDraw.Canvas.LineTo(cptDraw.X + round(rotatedPoints[cnt + 4].X), cptDraw.Y + round(rotatedPoints[cnt + 4].Y));
  end;

end;

procedure TCube.generatePoints();
var
  cnt: integer;
begin
  arrPoints[0] := TPoint3D.Create(-objRadius, objRadius, -objRadius);
  arrPoints[1] := TPoint3D.Create(-objRadius, objRadius, objRadius);
  arrPoints[2] := TPoint3D.Create(objRadius,  objRadius, objRadius);
  arrPoints[3] := TPoint3D.Create(objRadius,  objRadius, -objRadius);
  arrPoints[4] := TPoint3D.Create(-objRadius, -objRadius, -objRadius);
  arrPoints[5] := TPoint3D.Create(-objRadius, -objRadius, objRadius);
  arrPoints[6] := TPoint3D.Create(objRadius,  -objRadius, objRadius);
  arrPoints[7] := TPoint3D.Create(objRadius,  -objRadius, -objRadius);

  for cnt := 0 to 7 do begin
    arrPoints[0].Offset(ctrPnt);
  end;
end;

end.
