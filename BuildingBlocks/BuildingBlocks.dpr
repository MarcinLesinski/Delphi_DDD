program BuildingBlocks;

uses
  System.StartUpCopy,
  FMX.Forms,
  View in 'View.pas' {Form3},
  ValueObject in 'ValueObject.pas',
  Entity in 'Entity.pas',
  Aggregate in 'Aggregate.pas',
  Service in 'Service.pas',
  Repository in 'Repository.pas',
  Factory in 'Factory.pas',
  Policy in 'Policy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
