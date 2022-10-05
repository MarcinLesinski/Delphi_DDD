unit View.Citizen;

interface

uses
    CitizenService,

    System.SysUtils, System.Types, System.UITypes, System.Classes,
    System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
    FMX.Controls.Presentation, FMX.StdCtrls;

type
    TCitizenForm = class(TForm)
        giveMandate100Button: TButton;
        payMandateButton: TButton;
        procedure giveMandate100ButtonClick(Sender: TObject);
        procedure payMandateButtonClick(Sender: TObject);
    private
        _citizenService: TCitizenService;
    public
        procedure Inject(CitizenService: TCitizenService);
    end;

var
    CitizenForm: TCitizenForm;

implementation

{$R *.fmx}

const
    CITIZEN_ID = 12;
    MANDATE_ID = 34;

procedure TCitizenForm.Inject(citizenService: TCitizenService);
begin
    _citizenService := CitizenService;
end;

procedure TCitizenForm.giveMandate100ButtonClick(Sender: TObject);
begin
    _citizenService.GiveAMandateToCitizen(CITIZEN_ID, MANDATE_ID);
end;

procedure TCitizenForm.payMandateButtonClick(Sender: TObject);
begin
    _citizenService.CitizenPayMandate(CITIZEN_ID);
end;

end.
