unit ContractId;

interface

type
    TContractId = class
    private
        _number: String;
        procedure Validate(number: String);
    public
        constructor Create(number: String);
        function ShortForm(): String;
    end;

implementation

uses
    System.SysUtils;

{ TContractNumber }

constructor TContractId.Create(number: String);
begin
    Validate(number);

    _number := number;
end;

procedure TContractId.Validate(number: String);
begin
    if not number.StartsWith('UM/') then
        raise Exception.Create('Error Message');
end;

function TContractId.ShortForm: String;
begin
    result := _number.Substring(3);
end;

end.
