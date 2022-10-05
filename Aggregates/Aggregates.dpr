program Aggregates;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Citizen in 'citizen\View.Citizen.pas' {CitizenForm},
  Citizen in 'citizen\domain\Citizen.pas',
  Citizen.Mandate in 'citizen\domain\Citizen.Mandate.pas',
  Citizen.MandateRatio in 'citizen\domain\Citizen.MandateRatio.pas',
  Citizen.Points in 'citizen\domain\Citizen.Points.pas',
  Citizen.Rank in 'citizen\domain\Citizen.Rank.pas',
  Citizen.Day in 'citizen\domain\Citizen.Day.pas',
  DomainEvents in '_\infrastructure\DomainEvents.pas',
  CitizenRepository in '_\adapters\CitizenRepository.pas',
  CitizenService in 'citizen\CitizenService.pas',
  EMail in '_\infrastructure\EMail.pas',
  TownHallService in 'townhall\TownHallService.pas',
  TownHall in 'townhall\TownHall.pas';

{$R *.res}

procedure bind(citizenService: TCitizenService; townHallService: TTownHallService);
begin
    citizenService.onCitizenPointsChange := townHallService.updateRanking;
//    citizenService.onCitizenPointsChange :=
//        procedure(citizenId: Integer; points: Integer)
//        begin
//            townHallService.updateRanking(citizenId, points);
//        end;
end;

begin
    Application.RealCreateForms;

    Application.Initialize;
    Application.CreateForm(TCitizenForm, CitizenForm);
    const citizenService = TCitizenService.Create(TCitizenRepository.Create(), TEmail.Create());
    const townHallService = TTownHallService.Create();
    bind(citizenService, townHallService);

    CitizenForm.Inject(citizenService);

    Application.Run;
end.
