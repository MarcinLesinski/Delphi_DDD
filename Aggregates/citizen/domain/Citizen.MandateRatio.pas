unit Citizen.MandateRatio;

interface

type
    TMandateRatio = record
    private
        _ratio: Integer;
    public
        constructor &of(ratio: Integer);
        property value: Integer read _ratio;
    end;

implementation

uses
    System.SysUtils;

{$REGION 'Integer extennsions'}
type
    Include = type Integer;
    NotInclude = type Integer;

    SingleHelper = record helper for Integer
    public
        function isBetween(from: Include; &to: Include): Boolean; overload;
        function isBetween(from: NotInclude; &to: NotInclude): Boolean; overload;
        function isBetween(from: NotInclude; &to: Include): Boolean; overload;
        function isBetween(from: Include; &to: NotInclude): Boolean; overload;
    end;

{$ENDREGION}

    { TMandateRatio }

constructor TMandateRatio.&of(ratio: Integer);
begin
    if (ratio < 1) or (ratio > 10) then
        raise Exception.Create
          ('Ratio have to have value between 1 and 10 - including 10 but not 1');

    ratio.isBetween(NotInclude(1), Include(10));

    _ratio := ratio;
end;

{ SingleHelper }

function SingleHelper.isBetween(from, &to: Include): Boolean;
begin
    result := (from >= self) and (self <= &to);
end;

function SingleHelper.isBetween(from, &to: NotInclude): Boolean;
begin
    result := (from > self) and (self < &to);
end;

function SingleHelper.isBetween(from: NotInclude; &to: Include): Boolean;
begin
    result := (from > self) and (self <= &to);
end;

function SingleHelper.isBetween(from: Include; &to: NotInclude): Boolean;
begin
    result := (from >= self) and (self < &to);
end;

end.
