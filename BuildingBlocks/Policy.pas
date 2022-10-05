unit Policy;

interface

type
    IPolicy = interface
        procedure apply();
    end;

    TFooPolicy = class(TInterfacedObject, IPolicy)
        procedure apply();
    end;

    TBarPolicy = class(TInterfacedObject, IPolicy)
        procedure apply();
    end;

implementation

{ TFooPolicy }

procedure TFooPolicy.apply;
begin

end;

{ TBarPolicy }

procedure TBarPolicy.apply;
begin

end;

end.
