codeunit 50100 "MSK Musik"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]

    local procedure ReleaseSalesDocument_OnBeforeReleaseSalesDoc(
       var
       SalesHeader: Record "Sales Header";
       PreviewMode: Boolean;
       IsHandled: Boolean
   )
    begin
        if (
            (SalesHeader."Responsibility Center" = '')
        or (SalesHeader."External Document No." = '')
        or (SalesHeader."Reason Code" = '')
        ) then
            Error('Something missing, you have to insert 3 fields: Responsibility Center, External Document No., Reason Code. Check them');

    end;
}