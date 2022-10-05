unit Service;

interface

type
    TValue = Integer;
    TEntity = Integer;
    TResult = Integer;


    TService = class
    public
        function operation(value: TValue; entity: TEntity): TResult;
    end;

    TAggregate = class
    private
        service: TService;
    end;


implementation

{ TService }

function TService.operation(value: TValue; entity: TEntity): TResult;
begin

end;

end.
