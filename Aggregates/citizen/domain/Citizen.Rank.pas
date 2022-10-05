unit Citizen.Rank;

interface

uses
    Citizen.Points;

type
    TRank = class
    private
        _promoted: Boolean;
        _degraded: Boolean;
        constructor CreatePromoted();
        constructor CreateDegraded();
    public
        constructor Create();

        function recalculate(Points: TPoints): TRank;

        property promoted: Boolean read _promoted;
        property degraded: Boolean read _degraded;
    end;

    TGoldRank = class(TRank);
    TSilverRank = class(TRank);
    TBronzeRank = class(TRank);

implementation

{ TRank }

constructor TRank.Create;
begin
    inherited;
    _promoted := false;
    _degraded := false;
end;

constructor TRank.CreatePromoted();
begin
    inherited;
    _promoted := true;
    _degraded := false;
end;

constructor TRank.CreateDegraded;
begin
    inherited;
    _promoted := false;
    _degraded := true;
end;

function TRank.recalculate(Points: TPoints): TRank;
begin
    if Points < 10 then
        exit(TBronzeRank.CreatePromoted());

    if Points < 100 then
        exit(TSilverRank.CreatePromoted());

    exit(TGoldRank.CreatePromoted());
end;

end.
