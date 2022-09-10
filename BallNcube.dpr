program BallNcube;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {DrawForm},
  CubeUnit in 'CubeUnit.pas',
  DrawObjectUnit in 'DrawObjectUnit.pas',
  BallUnit in 'BallUnit.pas',
  AllUnit in 'AllUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDrawForm, DrawForm);
  Application.Run;
end.
