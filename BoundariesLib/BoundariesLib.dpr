library BoundariesLib;

uses
  System.SysUtils,
  System.Classes,
  Transport in 'Transport.pas',
  Transport.Raid in 'Transport.Raid.pas',
  Transport.Stop in 'Transport.Stop.pas',
  Transport.Ticket in 'Transport.Ticket.pas',
  Transport.Vehicle in 'Transport.Vehicle.pas',
  Types in 'Types.pas';

{$R *.res}

function transport(): ITRansport;
begin
    result :=  TTransport.Create();
end;

exports
  transport;

begin

end.
