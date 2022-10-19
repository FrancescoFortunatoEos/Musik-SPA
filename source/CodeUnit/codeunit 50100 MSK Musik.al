codeunit 50100 "MSK Musik"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    local procedure ReleaseSalesDocument_OnBeforeReleaseSalesDoc(
        var SalesHeader: Record "Sales Header";
        PreviewMode: Boolean;
        var IsHandled: Boolean;
            SkipCheckReleaseRestrictions: Boolean
    )
    begin
        if ((SalesHeader."Responsibility Center" = '') Or (SalesHeader."Your Reference" = '') Or (SalesHeader."Reason Code" = '')) then
            Error('Insert the responsibility center, the external document number and the reason code.');
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeValidateShipToOptions', '', false, false)]
    local procedure SalesOrder_OnBeforeValidateShipToOptions(
        var SalesHeader: Record "Sales Header";
        ShipToOptions: Option "Default (Sell-to Address)","Alternate Shipping Address","Custom Address";
        var IsHandled: Boolean
    )
    var
        ShipToAddress: Record "Ship-to Address";
        ShipToAddressList: Page "Ship-to Address List";
    begin
        ShipToAddress.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
        ShipToAddress.SetRange(Blocked, false);
        ShipToAddressList.LookupMode := true;
        ShipToAddressList.SetTableView(ShipToAddress);
        IsHandled := true;
        if ShipToAddressList.RunModal = ACTION::LookupOK then begin
            ShipToAddressList.GetRecord(ShipToAddress);
            SalesHeader.Validate("Ship-to Code", ShipToAddress.Code);
            // IsShipToCountyVisible := FormatAddress.UseCounty(ShipToAddress."Country/Region Code");
        end else
            ShipToOptions := ShipToOptions::"Custom Address";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Ship-to Address", 'OnBeforeModifyEvent', '', false, false)]
    local procedure ShiptoAddress_OnBeforeModifyEvent_BlockAddress(RunTrigger: Boolean; var Rec: Record "Ship-to Address"; var xRec: Record "Ship-to Address")
    begin
        if not xRec.Blocked then
            exit;
        if Rec.Blocked or xRec.Blocked then
            Error('You cannot modify this record, it''s blocked');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Ship-to Address", 'OnBeforeRenameEvent', '', false, false)]
    local procedure ShiptoAddress_OnBeforeRenameEvent_BlockAddress(RunTrigger: Boolean; var Rec: Record "Ship-to Address"; var xRec: Record "Ship-to Address")
    begin
        if not xRec.Blocked then
            exit;
        if Rec.Blocked or xRec.Blocked then
            Error('You cannot modify this record, it''s blocked');
    end;

    // [EventSubscriber(ObjectType::Page, Page::"Ship-to Address", '', '', false, false)]
    // local procedure ShiptoAddress_OnModifyRecordEvent_BlockAddress(RunTrigger: Boolean; var Rec: Record "Ship-to Address"; var xRec: Record "Ship-to Address")
    // begin
    //     if Rec.Blocked <> xRec.Blocked then
    //         exit;
    //     if Rec.Blocked then
    //         Error('You cannot modify this record, it''s blocked');
    // end;
}