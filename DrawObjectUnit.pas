unit DrawObjectUnit;

interface

uses system.Math.Vectors, graphics, types, AllUnit;

type TDrawObject = class
   protected
      objWidth:   single;
      objRadius:  single;
      bmpDraw:    Tbitmap;
      objColor:   TColor;
      ctrPnt:     TPoint3D;
   public
      constructor create(bmpDraw: TBitmap);
      destructor Destroy(); override;

      function getWidth(): single;

      procedure setWidth(oWidth: single);
      procedure setColor(clr: TColor);
      procedure setCtrPnt(cPt: TPoint3D);

      procedure draw(); virtual;
end;

implementation

{ TDrawObject }

constructor TDrawObject.create(bmpDraw: TBitmap);
begin
  self.bmpDraw := bmpDraw;
  matDraw := TMatrix.Identity;
//   matRotation.
end;

destructor TDrawObject.Destroy();
begin
end;

procedure TDrawObject.draw();
begin
  bmpDraw.Canvas.Pen.Color := objColor;
  bmpDraw.Canvas.Brush.Color := objColor;
end;

function TDrawObject.getWidth(): single;
begin
  result := objWidth;
end;

procedure TDrawObject.setColor(clr: TColor);
begin
  objColor := clr;
end;

procedure TDrawObject.setCtrPnt(cPt: TPoint3D);
begin
  ctrPnt := cPt;
end;

procedure TDrawObject.setWidth(oWidth: single);
begin
  objWidth := oWidth;
  objRadius := objWidth / 2;
end;

end.
