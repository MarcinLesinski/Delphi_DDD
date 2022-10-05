unit Citizen_Tests;

interface

uses
    Citizen,
    Citizen.Rank,
    Citizen.MandateRatio,
    DUnitX.TestFramework;

type

    [TestFixture]
    TMyTestObject = class
    private
        _citizen: TCitizen;
        _rankedUp: Boolean;
        _rankedDown: Boolean;
    public

        [Setup]
        procedure Setup;

        [TearDown]
        procedure TearDown;

        [Test]
        procedure ShouldReducePoints_WhenMandateGiven();

        [Test]
        procedure ShouldRefund100Points_WhenMandatePaidNotInWednesday();

        [Test]
        procedure ShouldRefundExtraPoints_WhenMandatePaidInWednesday();

    end;

implementation

uses
    Citizen.Points,
    Citizen.Mandate,
    Citizen.Day,

    System.SysUtils;

const
    ID = 1;
    POINTS = 200;
    MANDATE = 4;

function TIME_OF_PAYMENT: TDateTime;
begin
    exit(StrToDateTime('06.10.2022 15:31'))
end;

var
    GOLD_RANK: TGoldRank;
    RANK: TGoldRank;

procedure TMyTestObject.Setup;
begin

end;

procedure TMyTestObject.TearDown;
begin
    _citizen.DisposeOf();
end;

procedure TMyTestObject.ShouldReducePoints_WhenMandateGiven;
begin
    // given
    _citizen := TCitizen.Create(ID, RANK, TPoints(100), TMandateRatio.of(2));

    // when
    _citizen.GiveAMandate(TMandate.of(19));

    // then
    Assert.AreEqual(60, _citizen.points)
end;

procedure TMyTestObject.ShouldRefund100Points_WhenMandatePaidNotInWednesday;
begin
    // given
    _citizen := TCitizen.Create(ID, RANK, TPoints(100), TMandateRatio.of(2));

    // when
    _citizen.PayAMandate(MONDAY);

    // then
    Assert.AreEqual(200, _citizen.points);
end;

procedure TMyTestObject.ShouldRefundExtraPoints_WhenMandatePaidInWednesday;
begin
    // given
    _citizen := TCitizen.Create(ID, GOLD_RANK, TPoints(100), TMandateRatio.of(2));

    // when
    _citizen.PayAMandate(WEDNESDAY);

    // then
    Assert.AreEqual(225, _citizen.points);
end;

initialization

TDUnitX.RegisterTestFixture(TMyTestObject);
GOLD_RANK := TGoldRank.Create();
RANK := TGoldRank.Create();

finalization

GOLD_RANK.DisposeOf;
RANK.DisposeOf;
end.
