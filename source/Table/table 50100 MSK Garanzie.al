table 50100 "MSK Garanzie"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Warranty ID No."; Integer)
        {
            DataClassification = CustomerContent;

        }
        field(2; "Warranty description"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Warranty start date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Warranty Finish Date"; Date)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Warranty ID No.")
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}