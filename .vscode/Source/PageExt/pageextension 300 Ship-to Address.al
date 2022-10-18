pageextension 50100 "PageExt50100" extends "Ship-to Address" //300
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
    trigger OnOpenPage()
    begin
        if Rec.Blocked then
            Editable := false;
    end;
}