unit Ride_Tests;

interface

uses
  Transport.Ride,
  DUnitX.TestFramework;

type
  [TestFixture]
  TRide_Tests = class
  public
    [Test]
    procedure ShoulAddTwoRides;
    [Test]
    procedure ShoulAddStopToRide;

  end;

implementation

procedure TRide_Tests.ShoulAddTwoRides;
begin
    //given
    const ride1 = TRide.of(TStop(1), TStop(2));
    const ride2 = TRide.of(TStop(3), TStop(4));

    //when
    const actual = ride1 + ride2;

    //then
    const expected = TRide.of(TStop(1), TStop(4));
    Assert.AreEqual(expected, actual);
end;

procedure TRide_Tests.ShoulAddStopToRide;
begin
    //given
    const ride = ride_of(stop_of(1), stop_of(2));
    const stop = stop_of(8);

    //when
    const actual = ride + stop;

    //then
    const expected = ride_of(stop_of(1), stop_of(8));
    Assert.AreEqual(expected, actual);
end;

{$region 'domain specific language'}
function ride(startingStop: TStop; finalStop: TStop): TRide;
begin
    result := TRide.of(startingStop, finalStop);
end;

function stop(value: Integer): TStop;
begin
    result := value;
end;

type TCheckType = (is_equal_to);
procedure check_if(ride1: TRide; check: TCheckType; ride2: TRide);
begin
    if check = is_equal_to then
         Assert.AreEqual(ride1, ride2);
end;

{$endregion}

procedure DSL;
begin
    check_if(

        ride(1, 8),
        is_equal_to,
        ride(1, 2) + stop(8)

    );
end;



initialization
  TDUnitX.RegisterTestFixture(TRide_Tests);

end.
