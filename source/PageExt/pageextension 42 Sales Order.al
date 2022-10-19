pageextension 50102 "MSK PageExt50102" extends "Sales Order" //42
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Reason Code"; Rec."Reason Code")
            {

            }
        }

        addafter(ShippingOptions)
        {
            field("MSK Shipping Options"; ShipToOptions)
            {
                ApplicationArea = All;

                Caption = 'Ship-to';
                OptionCaption = 'Default (Sell-to Address),Alternate Shipping Address,Custom Address';
                ToolTip = 'Specifies the address that the products on the sales document are shipped to. Default (Sell-to Address): The same as the customer''s sell-to address. Alternate Ship-to Address: One of the customer''s alternate ship-to addresses. Custom Address: Any ship-to address that you specify in the fields below.';

                trigger OnValidate()
                var
                    ShipToAddress: Record "Ship-to Address";
                    ShipToAddressList: Page "Ship-to Address List";
                    IsHandled: Boolean;
                begin
                    IsHandled := false;
                    if IsHandled then
                        exit;

                    case ShipToOptions of
                        ShipToOptions::"Default (Sell-to Address)":
                            begin
                                Rec.Validate("Ship-to Code", '');
                                Rec.CopySellToAddressToShipToAddress;
                            end;
                        ShipToOptions::"Alternate Shipping Address":
                            begin
                                ShipToAddress.SetRange("Customer No.", Rec."Sell-to Customer No.");
                                ShipToAddress.SetRange(Blocked, false);
                                ShipToAddressList.LookupMode := true;
                                ShipToAddressList.SetTableView(ShipToAddress);

                                if ShipToAddressList.RunModal = ACTION::LookupOK then begin
                                    ShipToAddressList.GetRecord(ShipToAddress);
                                    Rec.Validate("Ship-to Code", ShipToAddress.Code);
                                end else
                                    ShipToOptions := ShipToOptions::"Custom Address";
                            end;
                        ShipToOptions::"Custom Address":
                            begin
                                Rec.Validate("Ship-to Code", '');
                            end;
                    end;
                end;
            }
        }

        modify(ShippingOptions)
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}