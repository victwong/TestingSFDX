trigger AccountGrandTotal on Account (before update) {
    List <Account> AccountList = Trigger.new; //Account record saved to Trigger.new list
    List <Account> oldAccountList = Trigger.old;
    Account newAccount = AccountList[0];
    Account oldAccount = oldAccountList[0];
    
    Set<String> accIdSet = new Set<String>();
        for (Account a:AccountList){
            accIdSet.add(a.Id);
        }
    
    //String AcctID = Accountlist[0].Id;
    List <Contact> allChildContacts = [SELECT ID, AccountId, TotalCost__c from Contact WHERE AccountId in :accIdSet AND TotalCost__c!=null]; //query child contacts from accIDSet
    Decimal TotalCost = 0;
    System.debug(allChildContacts);
    for (Contact c:allChildContacts){
       Map<Id, Contact> mapContact = new Map<Id,Contact>(allChildContacts);
        System.debug(TotalCost);
        newAccount.GrandTotal__c = mapContact.get(c.AccountID).TotalCost__c;
}
}