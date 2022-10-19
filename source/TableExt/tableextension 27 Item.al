tableextension 50101 "MSK TableExt50101" extends Item //27
{
    fields
    {
        field(50100; Warranty; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Warranty';
            TableRelation = "MSK Garanzie"."Warranty ID No.";
        }
    }

    var
        myInt: Integer;
}