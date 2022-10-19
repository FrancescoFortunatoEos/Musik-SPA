page 50102 "MSK Garanzia Factbox"
{
    PageType = Card;
    Caption = 'MSK Garanzia Factbox';
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "MSK Garanzie";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Warranty ID No."; Rec."Warranty ID No.")
                {
                    ApplicationArea = All;

                }
                field("Warranty description"; Rec."Warranty description")
                {
                    ApplicationArea = All;
                }
                field("Warranty start date"; Rec."Warranty start date")
                {
                    ApplicationArea = All;
                }
                field("Warranty Finish Date"; Rec."Warranty Finish Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MSKInfoCard)
            {
                ApplicationArea = All;
                Caption = 'Card';
                RunObject = page "MSK Info Card";
                RunPageOnRec = true;
                // trigger OnAction()
                // begin

                // end;
            }
        }
    }

    // var
    //     myInt: Integer;
}