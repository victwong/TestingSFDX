trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account acc : Trigger.new){
        if(acc.Match_Billing_address__c == true && acc.BillingPostalCode != null){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        } 
    }
}