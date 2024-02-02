trigger CallableContacts on Contact (after insert,after update, after delete) {
    Set<String> accIds = new Set<String>();
    Map<String, Integer> accIdToTotal = new Map<String, Integer>();

    boolean isdelete = trigger.isDelete;

    for (Contact con : isdelete?Trigger.old:Trigger.new){
        accIds.add(con.AccountId);
        accIdToTotal.put(String.valueof(con.AccountId),0);
    }

    List<Contact> allContacts = [Select Id, phone, AccountID from Contact where accountId IN :accIds];

    if(!allContacts.isEmpty())
    {
        for(Contact con: allContacts)
        {
            if(con.phone != null)      
            {
                Integer total = accIdToTotal.get(con.AccountId);
                if(total == 0)
                {    
                    total = (isdelete?0:1);
                    accIdToTotal.put(con.AccountId, total);
                }
                else{ 
                    total = (isdelete?(total-1):(total+1));
                    accIdToTotal.put(con.AccountId, total);
                }
            }            
        }
    }
    
    List<Account> allAccounts = [SELECT Id, Callable_Contacts__c FROM Account WHERE ID in :accIds ];
    
    for(Account acc : allAccounts)
    {
        acc.Callable_Contacts__c = accIdToTotal.get(acc.Id);
    }
    update allAccounts;

}