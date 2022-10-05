unit ContractId_Tests;

interface

uses
    ContractId,
    DUnitX.TestFramework;

type
    [TestFixture]
    TContractName_Tests = class
    public

        [Test]
        procedure ShouldCreateValidObject;

        [Test]
        procedure ShouldRaiseException_WhenInvalidContractName;

        [Test]
        procedure ShouldReturnContractShortForm;

    end;

implementation

uses
    System.SysUtils;

const
    VALID_NAME = 'UM/10/QWERT1234';
    INVALID_NAME = 'IM/10/QWERTY1234';

procedure TContractName_Tests.ShouldCreateValidObject;
begin
    Assert.WillNotRaiseAny(
        procedure
        begin
            TContractId.Create(VALID_NAME)
        end,
      'valid contract name shouldn''t raise exception');
end;

procedure TContractName_Tests.ShouldRaiseException_WhenInvalidContractName;
begin
    Assert.WillRaiseAny(
        procedure
        begin
            TContractId.Create(INVALID_NAME)
        end,
        'invalid contract name should raise exception');
end;

procedure TContractName_Tests.ShouldReturnContractShortForm;
begin
    //given
    var contractId := TContractId.Create('UM/76/12KL2K');

    //when
    var actual := contractId.shortForm;

    //then
    Assert.AreEqual('76/12KL2K', actual);
end;

initialization

TDUnitX.RegisterTestFixture(TContractName_Tests);

end.
