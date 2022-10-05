unit Ride;

interface

type
    TStop = type Integer;

    TRide = record
    private
        startingStop: TStop;
        finalStop: TStop;
        procedure Validate(startingStop, finalStop: TStop);
    public
        constructor &of(startingStop: TStop; finalStop: TStop);
        class operator Add(a, b: TRide): TRide;
        class operator Add(raid: TRide; stop:TStop): TRide;
    end;

implementation

uses
    System.SysUtils;

{ TRaid }

constructor TRide.&of(startingStop, finalStop: TStop);
begin
    Validate(startingStop, finalStop);

    self.startingStop := startingStop;
    self.finalStop := finalStop;
end;

procedure TRide.Validate(startingStop, finalStop: TStop);
begin
    if not( startingStop < finalStop ) then
        raise Exception.Create('final stop should have greater index than starting stop');
end;

class operator TRide.Add(a, b: TRide): TRide;
begin
    result := TRide.of(a.startingStop, b.finalStop)
end;

class operator TRide.Add(raid: TRide; stop: TStop): TRide;
begin
    result := TRide.of(raid.startingStop, stop);
end;

end.
