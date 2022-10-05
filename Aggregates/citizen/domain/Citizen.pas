unit Citizen;

interface

uses
    DomainEvents,
    Citizen.MandateRatio,
    Citizen.Mandate,
    Citizen.Points,
    Citizen.Rank,
    Citizen.Day;

type
    TCitizen = class;
    TCitizenRankUpEvent = reference to procedure;
    TCitizenRankDownEvent = reference to procedure;
    TPointsChangedEvent = reference to procedure(citizen: TCitizen);

    TCitizen = class
    private
        _id: Integer;
        _rank: TRank;
        _points: TPoints;
        _currentMandateRatio: TMandateRatio;

        _onRankUp: TCitizenRankUpEvent;
        _onRankDown: TCitizenRankDownEvent;
        _onPointsChanged: TPointsChangedEvent;

    public
        constructor Create(id: Integer; rank: TRank; points: TPoints; currentMandateRatio: TMandateRatio);
        procedure GiveAMandate(mandate: TMandate);
        function PayAMandate(day: TDay): TDomainEvents;

        property onCitizenRankUp: TCitizenRankUpEvent write _onRankUp;
        property onCitizenRankDown: TCitizenRankDownEvent write _onRankDown;
        property onPointsChanged: TPointsChangedEvent write _onPointsChanged;

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
    // decrease points by mandate reduction points
    // mandate reduction points depends on mandate value and currentMandateRatio
    _points := _points - mandate.reductionPoints(_currentMandateRatio);
    _onPointsChanged(self);

    _rank := _rank.recalculate(_points);
    if _rank.degraded then
        _onRankDown();
end;

function TCitizen.PayAMandate(day: TDay): TDomainEvents;
begin
    const extraPoints = IfThen(day = WEDNESDAY, REFUND_PROMODAY_POINTS, 0);

    _points := _points + MANDATE_REFUND_POINTS + extraPoints;
    result.add(procedure begin _onPointsChanged(self); end);

    _rank := _rank.recalculate(_points);
    if _rank.promoted then
        result.add(procedure begin _onRankUp(); end);
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
