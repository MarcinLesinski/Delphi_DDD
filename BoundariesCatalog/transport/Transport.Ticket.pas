unit Transport.Ticket;

interface

type
    TSize = record
        width: Word;
        height: Word;
    end;

    TTicket = record
        name: String;
        description: String;
        price: Currency;

        size: TSize;

        digitalVersionId: String;
    end;

implementation

end.
