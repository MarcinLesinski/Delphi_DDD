unit Citizen.Mandate;

interface

uses
    Citizen.MandateRatio,
    Citizen.Points;

type
    TMandate = record
    private
        _value: Cardinal;
    public
        constructor &of(value: Cardinal);
        function reductionPoints(ratio: TMandateRatio): TPoints;
    end;

implementation

{ TMandate }

constructor TMandate.&of(value: Cardinal);
begin
    _value := value;
end;

function TMandate.reductionPoints(ratio: TMandateRatio): TPoints;
begin
    result := ( _value + 1 ) * ratio.value;
end;

end.
