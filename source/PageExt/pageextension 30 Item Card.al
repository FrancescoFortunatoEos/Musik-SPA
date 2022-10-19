pageextension 50105 "MSK PageExt50105" extends "Item Card" //30
{
    layout
    {
        addafter(Item)
        {
            group(Warranty)
            {
                field("Warranty ID No."; Rec.Warranty)
                {
                    Caption = 'Warranty';
                    ApplicationArea = All;
                    trigger OnValidate()  //evento eseguito alla modifica del campo
                    var
                        Garanzia: Record "MSK Garanzie";  // oggetto dell tabella
                    begin
                        Garanzia.SetRange("Warranty ID No.", Rec.Warranty); // condizione
                        if Garanzia.FindFirst() then begin                  // recupero dei dati dalla tabella
                            DescWar := Garanzia."Warranty description";
                            StartDate := Garanzia."Warranty start date";
                            FinDate := Garanzia."Warranty Finish Date";

                        end;
                    end;
                }

                field("Warranty description"; DescWar)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Warranty start date"; StartDate)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Warranty Finish Date"; FinDate)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage()        //apertura pagina
    var
        Garanzia: Record "MSK Garanzie";
    begin
        Garanzia.SetRange("Warranty ID No.", Rec.Warranty);
        if Garanzia.FindFirst() then begin
            DescWar := Garanzia."Warranty description";
            StartDate := Garanzia."Warranty start date";
            FinDate := Garanzia."Warranty Finish Date";

        end;
    end;


    var
        // variabili globali per prendere i valori (appoggio)
        DescWar: Text;
        StartDate: Date;
        FinDate: Date;

}