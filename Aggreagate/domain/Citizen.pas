unit Citizen;

interface

uses
    Citizen.MandateRatio,
    Citizen.Mandate,
    Citizen.Points,
    Citizen.Rank,
    Citizen.Day;

type
    TCitizen = class
    private
        _id: Integer;
        _rank: TRank;
        _points: TPoints;
        _currentMandateRatio: TMandateRatio;

    public
        constructor Create(id: Integer; rank: TRank; points: TPoints; currentMandateRatio: TMandateRatio);
        procedure GiveAMandate(mandate: TMandate);
        procedure PayAMandate(day: TDay);

    private const
        MANDATE_REFUND_POINTS = 100;
        REFUND_PROMODAY_POINTS = 25;
    end;

    TCitizenReadExtension = class helper for TCitizen
    private
        function getPoints(): TPoints;
        function getRank(): TRank;
        function getId(): Integer;
    public
        property id: Integer read getId;
        property rank: TRank read getRank;
        property points: TPoints read getPoints;
    end;

implementation

uses
    System.SysUtils,
    System.Math;

{ TCitizen }

constructor TCitizen.Create(id: Integer; Rank: TRank; points: TPoints; currentMandateRatio: TMandateRatio);
begin
    _id := id;
    _rank := Rank;
    _points := Points;
    _currentMandateRatio := currentMandateRatio;
end;

procedure TCitizen.GiveAMandate(mandate: TMandate);
begin
    _points := _points - mandate.reductionPoints(_currentMandateRatio);

    _rank := _rank.recalculate(_points);
end;

procedure TCitizen.PayAMandate(day: TDay);
begin
    const extraPoints = IfThen(day = WEDNESDAY, REFUND_PROMODAY_POINTS, 0);

    _points := _points + MANDATE_REFUND_POINTS + extraPoints;

    _rank := _rank.recalculate(_points);
end;

{ TCitizenReadExtension }

function TCitizenReadExtension.getId: Integer;
begin
    result := _id;
end;

function TCitizenReadExtension.getRank: TRank;
begin
    result := _rank;
end;

function TCitizenReadExtension.getPoints: TPoints;
begin
    result := _points;
end;

end.
