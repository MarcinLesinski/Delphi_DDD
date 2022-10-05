unit TownHallService;

interface

uses
    TownHall,
    System.Generics.Collections;

type
    TRankingEntry = record
        citizenId: String;
        pointsInHex: String;
    end;

    TTownHallService = class
    private
    public
        procedure updateRanking(citizenId: Integer; points: Integer);

    end;

implementation

{ TTownHallService }


procedure TTownHallService.updateRanking(citizenId: Integer; points: Integer);
begin

end;

end.
