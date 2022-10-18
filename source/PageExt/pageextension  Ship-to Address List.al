pageextension 50101 "MSK pageExt50101" extends "Ship-to Address List" //301
{
    layout
    {
        addafter(Name)
        {

            field(Blocked; Rec.Blocked)
            {
                Caption = 'Blocked';
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}