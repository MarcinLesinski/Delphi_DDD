unit CitizenRepository;

interface

uses
    Citizen,

    System.Generics.Collections;

type
    ID = Integer;

    TCitizenRepository = class
    private
        _map: TDictionary<ID, TCitizen>;
    public
        function findById(id: Cardinal): TCitizen;
        procedure save(citizen: TCitizen);

    end;

implementation

{ TCitizenRepository }

function TCitizenRepository.findById(id: Cardinal): TCitizen;
begin
    result := _map[id];
end;

procedure TCitizenRepository.save(citizen: TCitizen);
begin
    _map.Add(citizen.id, citizen);
end;

end.
