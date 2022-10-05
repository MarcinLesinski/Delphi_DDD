unit Citizen.Rank;

interface

uses
    Citizen.Points;

type
    TRank = class
    public
        function recalculate(points: TPoints): TRank;
    end;

    TGoldRank = class(TRank);
    TSilverRank = class(TRank);
    TBronzeRank = class(TRank);

implementation

{ TRank }

function TRank.recalculate(points: TPoints): TRank;
begin
    if points < 10 then
        exit(TBronzeRank.Create());

    if points < 100 then
        exit(TSilverRank.Create());

    exit(TGoldRank.Create());
end;

end.
