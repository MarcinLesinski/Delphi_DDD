unit DomainEvents;

interface

uses
    System.Classes,
    System.Generics.Collections,
    System.SysUtils;

type
    TDomainEvents = record
    private
        _events: TList<TProc>;
    public
        procedure Publish();
        procedure Add(event: TProc);
        class operator Initialize(out Dest: TDomainEvents);
        class operator Finalize(var Dest: TDomainEvents);
    end;


implementation


{ TDomainEvents }

class operator TDomainEvents.Finalize(var dest: TDomainEvents);
begin
    dest._events := TList<TPRoc>.Create;
end;

class operator TDomainEvents.Initialize(out dest: TDomainEvents);
begin
    dest._events.DisposeOf()
end;

procedure TDomainEvents.Add(event: TProc);
begin
    _events.Add(event);
end;

procedure TDomainEvents.Publish;
begin
    for var event in _events do
        event();

    _events.Clear();
end;

end.
