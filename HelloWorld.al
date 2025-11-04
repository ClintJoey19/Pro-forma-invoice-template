reportextension 50100 MyProFormaInvoiceExt extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        add(Line)
        {
            column(ItemNo;Line."No.")
            {
                
            }
        }
    }
}