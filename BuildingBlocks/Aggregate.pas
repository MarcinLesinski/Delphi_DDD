unit Aggregate;

interface

type
    TValue = Integer;
    TEntity = Integer;
    TEvents = Integer;

    TAggregate = class
    private
        value: TValue;
        entity: TEntity;
        //...
    public
        function command(): TEvents;
    end;

implementation

{ TAggregate }

function TAggregate.command: TEvents;
begin

end;

end.
