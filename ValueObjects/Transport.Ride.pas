unit Transport.Ride;

interface

type
    TStop = type Integer;

    TRide = record
    private
        _startingStop: TStop;
        _finalStop: TStop;
        procedure validate(startingStop, finalStop: TStop);
    public
        constructor &of(startingStop: TStop; finalStop: TStop);
        class operator Add(a, b: TRide): TRide;
        class operator Add(raid: TRide; stop:TStop): TRide;
    end;

    function ride_of(startingStop: TStop; finalStop: TStop): TRide;
    function stop_of(value: Integer): TStop;

implementation

uses
    System.SysUtils;

{ TRaid }

constructor TRide.&of(startingStop, finalStop: TStop);
begin
    validate(startingStop, finalStop);

    _startingStop := startingStop;
    _finalStop := finalStop;
end;

procedure TRide.Validate(startingStop, finalStop: TStop);
begin
    if not( startingStop < finalStop ) then
        raise Exception.Create('final stop should have greater index than starting stop');
end;

class operator TRide.Add(a, b: TRide): TRide;
begin
    result := TRide.of(a._startingStop, b._finalStop)
end;

class operator TRide.Add(raid: TRide; stop: TStop): TRide;
begin
    result := TRide.of(raid._startingStop, stop);
end;

function ride_of(startingStop: TStop; finalStop: TStop): TRide;
begin
    result := TRide.of(startingStop, finalStop);
end;

function stop_of(value: Integer): TStop;
begin
    result := value;
end;

end.
