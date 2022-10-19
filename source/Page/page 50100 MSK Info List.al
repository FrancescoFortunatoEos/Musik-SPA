page 50100 "MSK Info List"
{
    PageType = List;
    Caption = 'MSK Info List';
    CardPageId = "MSK Info Card";
    ApplicationArea = All;
    UsageCategory = Administration;
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}