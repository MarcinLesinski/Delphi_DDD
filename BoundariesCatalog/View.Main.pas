unit View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

function lib(): String; external 'Project2.dll';

procedure TForm1.Button1Click(Sender: TObject);
begin
    Button1.Text := lib()  ;
    // buy a ticket
    // check a ticket
    // parking ticket
    // speeding ticket
    //

    // Citizen5000
end;

end.
