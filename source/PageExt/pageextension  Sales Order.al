pageextension 50102 "MSK PageExt50102" extends "Sales Order"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Reason Code"; Rec."Reason Code")
            {

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