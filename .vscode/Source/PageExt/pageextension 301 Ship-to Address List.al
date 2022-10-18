pageextension 50101 "PageExt50101" extends "Ship-to Address List" //301
{
    layout
    {
        addafter("Code")
        {
            field(Blocked; Rec.Blocked)
            {
                Caption = 'Blocked';
                ApplicationArea = All;
            }
        }
    }

}