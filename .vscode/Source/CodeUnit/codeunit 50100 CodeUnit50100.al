codeunit 50100 "CodeUnit50100"
{
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
}