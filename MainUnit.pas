unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, CubeUnit, BallUnit, types, AllUnit,
  system.Math.Vectors, Math{, JPEG};

type
  TDrawForm = class(TForm)
    ScrollBox1: TScrollBox;
    ImgDraw: TImage;
    TimerDraw: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerDrawTimer(Sender: TObject);
  private
    { Private declarations }
    cube: TCube;
    ball: TBall;
  public
    { Public declarations }
  end;

var
  DrawForm: TDrawForm;

implementation

{$R *.dfm}

procedure TDrawForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  freeAndNil(cube);
end;

procedure TDrawForm.FormShow(Sender: TObject);
begin
  ImgDraw.Picture.Bitmap.Width := ImgDraw.Width;
  ImgDraw.Picture.Bitmap.Height := ImgDraw.Height;
  cptDraw := point(ImgDraw.Picture.Bitmap.Width div 2, ImgDraw.Picture.Bitmap.Height div 2);

  cube := TCube.create(ImgDraw.Picture.Bitmap);
  cube.setWidth(350);
  cube.generatePoints();
  cube.setColor(clBlue);

  ball := TBall.create(ImgDraw.Picture.Bitmap);
  ball.setWidth(50);
  ball.setCtrPnt(Point3D(0, 0, 0));
  ball.setColor(clRed);

  cube.draw();
  ball.draw();
end;

procedure TDrawForm.TimerDrawTimer(Sender: TObject);
var
   matRotation1, matRotation2: TMatrix;
begin
  ImgDraw.Picture.Bitmap.Canvas.Brush.Color := clBlack;
  ImgDraw.Picture.Bitmap.Canvas.FillRect(ImgDraw.Picture.Bitmap.Canvas.ClipRect);
  cube.draw();
  ball.draw();

  matRotation1 := TMatrix.CreateRotation(DegToRad(0.05));
  matRotation2 := TMatrix.CreateRotation(DegToRad(1));

  matRotation2.m13 := matRotation2.m12;
  matRotation2.m12 := 0;
  matRotation2.m31 := matRotation2.m21;
  matRotation2.m21 := 0;
  matRotation2.m33 := matRotation2.m22;
  matRotation2.m22 := 1;
  matRotation1 := matRotation1 * matRotation2;

  matDraw := matDraw * matRotation1;
  ball.move(20, cube.getWidth() / 2);
end;

end.
