unit CitizenService;

interface

uses
    Citizen,
    Citizen.Mandate,
    Citizen.Day,
    CitizenRepository;

type
    TCitizenService = class
    private
        _citizenRepository: TCitizenRepository;

        function getMandateById(mandateId: Integer): TMandate;
        function Today(): TDay;
    public
        constructor Create(CitizenRepository: TCitizenRepository);

        procedure GiveAMandateToCitizen(citizenId, mandateId: Integer);
        procedure CitizenPayMandate(citizenId: Integer);
    end;

implementation

uses
    System.SysUtils;

{ TCitizenService }

constructor TCitizenService.Create(CitizenRepository: TCitizenRepository);
begin
    _citizenRepository := CitizenRepository;
end;

procedure TCitizenService.GiveAMandateToCitizen(citizenId, mandateId: Integer);
begin
    const citizen = _citizenRepository.findById(citizenId);
    const mandate = getMandateById(mandateId);

    citizen.GiveAMandate(mandate);

    _citizenRepository.save(citizen);
end;

procedure TCitizenService.CitizenPayMandate(citizenId: Integer);
begin
    const citizen = _citizenRepository.findById(citizenId);

    citizen.PayAMandate(Today());

    _citizenRepository.save(citizen);
end;

function TCitizenService.getMandateById(mandateId: Integer): TMandate;
begin

end;

function TCitizenService.Today: TDay;
begin

end;

end.
