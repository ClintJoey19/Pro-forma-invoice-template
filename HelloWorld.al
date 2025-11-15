codeunit 50123 EventHandler
{
    [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Pro Forma Inv", OnAfterLineOnPreDataItem, '', false, false)]
    local procedure PFInvOnAfterLineOnPreDataItem(var SalesLine: Record "Sales Line")
    begin
        SalesLine.SetRange(Type);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Pro Forma Inv", OnBeforeGetItemForRec, '', false, false)]
    local procedure PFInvOnBeforeGetItemForRec(var IsHandled: Boolean)
    begin
        IsHandled := true
    end;
}

reportextension 50100 MyProFormaInvoiceExt extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        modify(Line) {
            trigger OnBeforeAfterGetRecord()
            begin
                if Item.Get(Line."No.") then;
            end;
        }
        add(Line)
        {
            column(ItemNo;Line."No.")
            {}
            column(LocationCode;Line."Location Code")
            {}
            column(PaymentTermsCode;Header."Payment Terms Code")
            {}
            column(CompanyBankName;CompanyInfo."Bank Name")
            {}
            column(CompanyBankAccountNo;CompanyInfo."Bank Account No.")
            {}
            column(CompanyBankSWIFTCode;CompanyInfo."SWIFT Code")
            {}
        }
    }
    var
        CompanyInfo: Record "Company Information";
    
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
    end;
}