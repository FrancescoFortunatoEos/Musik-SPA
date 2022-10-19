tableextension 50100 "TableExt50100" extends "Ship-to Address" //300
{
    fields
    {
        field(50100; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Blocked then begin
                    Blocked := Dialog.Confirm('Are you sure to block this record?');
                end;
            end;
        }
    }
    trigger OnDelete()
    var
        myInt: Integer;
    begin
        if Blocked then
            Error('You cant delete this record');
    end;
}