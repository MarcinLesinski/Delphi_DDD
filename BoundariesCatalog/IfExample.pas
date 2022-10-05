unit IfExample;

interface

uses
    ContractId,
    ContractName,
    ContractUtils;

type
    TSome = class
    private
        procedure sendContract(contractNumber: String);
    public
        procedure sample(ContractId: String);
        procedure sample1(ContractId: String);
        procedure sample2(ContractId: TContractId);
    end;

implementation

uses
    System.SysUtils;

procedure doSomethingWithContractName(ContractName: TContractName);
begin

end;

procedure TSome.sample(ContractId: String);
begin
    // task: JIRA-7661
    if ContractId.StartsWith('UM/') then
    begin
        sendContract(ContractId.Substring(3));
    end;
end;

procedure TSome.sample1(ContractId: String);
begin
    var ValidContract := TContractId.Create(ContractId);

    SendContract(ValidContract.ShortForm);
end;

procedure TSome.sample2(ContractId: TContractId);
begin
    SendContract(ContractId.ShortForm);
end;

procedure TSome.sendContract(contractNumber: String);
begin

end;

{
  JIRA-7661
  Kontrakty z prawid³owymi identyfikatorami nale¿y wys³aæ u¿ywaj¹c skróconej nazwy.
}

end.
