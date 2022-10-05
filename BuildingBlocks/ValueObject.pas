unit ValueObject;

interface

type
    TOther = record

    end;

    TValueObject = record
    private
        value: String;
    public
        procedure Change();
        function Transform()
        : TOther;
    end;



implementation

{ TValueObject }

procedure TValueObject.Change;
begin

end;

function TValueObject.Transform: TOther;
begin

end;

end.
