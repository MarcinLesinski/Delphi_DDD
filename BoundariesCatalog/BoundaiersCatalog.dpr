program BoundaiersCatalog;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Main in 'View.Main.pas' {Form1},
  Transport in 'transport\Transport.pas',
  Transport.Raid in 'transport\Transport.Raid.pas',
  Transport.Stop in 'transport\Transport.Stop.pas',
  Transport.Vehicle in 'transport\Transport.Vehicle.pas',
  Transport.Ticket in 'transport\Transport.Ticket.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
