unit Mandate_Tests;

interface

uses
    Citizen.Mandate,
    Citizen.MandateRatio,
    Citizen.Points,
    DUnitX.TestFramework;

type
  [TestFixture]
  TMandate_Tests = class
  public
    [Test]
    [TestCase('','0,2,2')]
    [TestCase('','1,1,2')]
    [TestCase('','2,2,6')]
    [TestCase('','1,10,20')]
    procedure ShouldReducePoints(mandateValue: TPoints; mandateRatioValue: Integer; expectedPoints: TPoints);
  end;

implementation

procedure TMandate_Tests.ShouldReducePoints(mandateValue: TPoints; mandateRatioValue: Integer; expectedPoints: TPoints);
begin
    // given
    const mandate = TMandate.of(mandateValue);

    // when
    const actualPoints = mandate.reductionPoints(TMandateRatio.of(mandateRatioValue));

    // then
    Assert.AreEqual(expectedPoints, actualPoints);
end;

initialization
  TDUnitX.RegisterTestFixture(TMandate_Tests);

end.
