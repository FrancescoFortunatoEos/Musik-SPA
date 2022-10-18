pageextension 50100 "MSK PageExt50100" extends "Ship-to Address" //300
{
    layout
    {
        addafter(Code)
        {
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}