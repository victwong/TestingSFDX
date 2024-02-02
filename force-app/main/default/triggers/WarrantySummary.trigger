trigger WarrantySummary on Case (before insert, before update) {
    for (Case c : Trigger.new){
        if(c.Product_Purchase_Date__c !=null && c.Product_Total_Warranty_Days__c!=null){
        String purchaseDate        = c.Product_Purchase_Date__c.format();
        String createdDate         = DateTime.now().format();
        Integer warrantyDays       = c.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage = (100 * (c.Product_Purchase_Date__c.daysBetween(Date.today())/
                                     c.Product_Total_Warranty_Days__c)).setScale(2);
        Boolean extendedWarranty   = c.Product_Has_Extended_Warranty__c;
        String endingStatement     = 'Have a nice day!';

        c.Warranty_Summary__c = 'Product purchased on '+ purchaseDate + ' '
                              + 'and case created on ' + createdDate + '.\n'
                              + 'Warranty is for ' + warrantyDays + ' '
                              + 'days and is ' + warrantyPercentage + '% through its warranty period.\n'
                              + 'Extended warranty: ' + extendedWarranty + '\n'
                              + endingStatement;
                                

       }
    }
}