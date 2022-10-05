program BoundariesUnit;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Main in 'View.Main.pas' {Form2},
  Transport in 'Transport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
