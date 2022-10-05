program Aggregate;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Citizen in 'View.Citizen.pas' {CitizenForm},
  Citizen in 'domain\Citizen.pas',
  CitizenService in 'CitizenService.pas',
  CitizenRepository in 'CitizenRepository.pas',
  Citizen.Mandate in 'domain\Citizen.Mandate.pas',
  Citizen.MandateRatio in 'domain\Citizen.MandateRatio.pas',
  Citizen.Points in 'domain\Citizen.Points.pas',
  Citizen.Rank in 'domain\Citizen.Rank.pas',
  Citizen.Day in 'domain\Citizen.Day.pas';

{$R *.res}

begin
    Application.RealCreateForms;

    Application.Initialize;
    Application.CreateForm(TCitizenForm, CitizenForm);
  CitizenForm.Inject(
        TCitizenService.Create(
            TCitizenRepository.Create()
        )
    );

    Application.Run;

end.
