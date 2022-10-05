unit CitizenService;

interface

uses
    Citizen,
    Citizen.Mandate,
    Citizen.Day,
    EMail,
    CitizenRepository;

type
    TOnCitizenPointsChange = reference to procedure(citizenId: Integer; points: Integer);

    TCitizenService = class
    private
        _citizenRepository: TCitizenRepository;
        _email: TEMail;
        _onCitizenPointsChange: TOnCitizenPointsChange;

        function getCitizenById(citizenId:Integer): TCitizen;
        function getMandateById(mandateId: Integer): TMandate;
        function today(): TDay;

        procedure citizenOnRankUp();
        procedure citizenOnRankDown();
        procedure citizenOnPointsChange(citizen: TCitizen);
    public
        constructor Create(CitizenRepository: TCitizenRepository; email: TEMail);

        procedure GiveAMandateToCitizen(citizenId, mandateId: Integer);
        procedure CitizenPayMandate(citizenId: Integer);

        property onCitizenPointsChange: TOnCitizenPointsChange read _onCitizenPointsChange write _onCitizenPointsChange;
    end;

implementation

uses
    System.SysUtils;

{ TCitizenService }

constructor TCitizenService.Create(CitizenRepository: TCitizenRepository; email: TEMail);
begin
    _citizenRepository := CitizenRepository;
    _email := email;
end;

procedure TCitizenService.GiveAMandateToCitizen(citizenId, mandateId: Integer);
begin
    const citizen = getCitizenById(citizenId);
    const mandate = getMandateById(mandateId);

    citizen.GiveAMandate(mandate);

    _citizenRepository.save(citizen);
end;

procedure TCitizenService.CitizenPayMandate(citizenId: Integer);
begin
    const citizen = getCitizenById(citizenId);

    const events = citizen.PayAMandate(Today());

    _citizenRepository.save(citizen);
    events.publish();
end;

function TCitizenService.getCitizenById(citizenId: Integer): TCitizen;
begin
    result := _citizenRepository.findById(citizenId);
    result.onCitizenRankUp := citizenOnRankUp;
    result.onCitizenRankDown := citizenOnRankDown;
    result.onPointsChanged := citizenOnPointsChange;
end;

procedure TCitizenService.citizenOnRankUp;
begin
    _email.sendCongratulationsMail();
end;

procedure TCitizenService.citizenOnRankDown;
begin
    _email.sendImSorryMail();
end;

procedure TCitizenService.citizenOnPointsChange(citizen: TCitizen);
begin
    _onCitizenPointsChange(citizen.id, citizen.points);
end;

function TCitizenService.getMandateById(mandateId: Integer): TMandate;
begin

end;

function TCitizenService.Today: TDay;
begin

end;

end.
