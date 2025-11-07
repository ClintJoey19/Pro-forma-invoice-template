reportextension 50100 MyProFormaInvoiceExt extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
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