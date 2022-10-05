unit Factory;

interface

type
    TFoo = Integer;
    TBar = Integer;
    TValue = Integer;

    TFactory = class
    public
        function construct(foo: TFoo; bar: TBar): TValue;
    end;

implementation

{ TFactory }

function TFactory.construct(foo: TFoo; bar: TBar): TValue;
begin

end;

end.
