trigger RollupToAccount on Contact (after insert, after update, after delete){
    List <Contact> contactsList = Trigger.new; //Contact record after save is added to contactsList
    String AcctId = contactsList[0].AccountId; //AccountId from 1st position on contactsList
    List <Contact> allChildContacts = [SELECT ID, TotalCost__c from Contact WHERE AccountId = :AcctId AND TotalCost__c != null]; //query statement and add to allChildContacts list
    Decimal TotalCost = 0; // set initial value
    System.debug(allChildContacts);

    for (Contact c: allChildContacts){ //loop through allChildContacts List
        TotalCost = TotalCost + c.TotalCost__c;
    }

    System.debug(TotalCost); //display value of TotalCost
    Account acc = [SELECT Id from Account WHERE Id = :AcctId LIMIT 1]; //query Account for update and set to variable 'acc'
    acc.GrandTotal__c = TotalCost; // set Grandtotal__c on Account to TotalCost variable that was summed from Contact loop
    update acc;
}