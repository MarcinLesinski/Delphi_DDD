unit Entity;

interface

type
    TOther = record

    end;


    TEntity = record
    private
        id: Cardinal;
        value: String;
    public
        procedure Change();
        function Transform()
        : TOther;
    end;


implementation

{ TEntity }

procedure TEntity.Change;
begin

end;

function TEntity.Transform: TOther;
begin

end;

end.
