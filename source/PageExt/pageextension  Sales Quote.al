pageextension 50103 "MSK PageExt50103" extends "Sales Quote"
{
    layout
    {
        addafter("Activity Code")
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
}