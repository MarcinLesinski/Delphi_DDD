unit ContractUtils;

interface

uses
  System.SysUtils;

function isContractNumberValid(contractNumber: String): Boolean;


implementation

function isContractNumberValid(contractNumber: String): Boolean;
begin
  result := contractNumber.StartsWith('UM');
end;


end.
