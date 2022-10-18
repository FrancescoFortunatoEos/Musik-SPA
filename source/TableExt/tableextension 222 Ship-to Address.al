tableextension 50100 "MSK TableExt50100" extends "Ship-to Address" //222
{
    fields
    {
        field(50100; "Blocked"; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()

            begin

                if Blocked then begin

                    Blocked := Dialog.Confirm('Are you sure you want to block this record?');

                end;

            end;
        }
    }

    var
        myInt: Integer;
}