unit Repository;

interface

uses
    System.Generics.Collections;

type
    TValue = Integer;

    TRepository = class
    private
        values: TList<TValue>;
    public
        function findBests(): TList<TValue>;
        function findWorsts(): TList<TValue>;
    end;

implementation

{ TRepository }

function TRepository.findBests: TList<TValue>;
begin

end;

function TRepository.findWorsts: TList<TValue>;
begin

end;

end.
