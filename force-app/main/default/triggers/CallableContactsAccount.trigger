trigger CallableContactsAccount on Account (before update)
{
    Set<String> accIds = new Set<String>();
    Map<String, Integer> accIdToTotal = new Map<String, Integer>();

    for(Account acc: Trigger.new)
    {
        accIds.add(acc.Id);
        accIdToTotal.put(String.valueof(acc.Id),0);
    }
    
    List<Contact> allContacts = [Select Id, phone, AccountID from Contact where accountId IN :accIds];
    
    if(!allContacts.isEmpty())
    {
        for(Contact con: allContacts)
        {
            if(con.phone != null)
            {
                Integer total = accIdToTotal.get(con.AccountId);
                if(total == 0){ accIdToTotal.put(con.AccountId, 1);}
                else{ accIdToTotal.put(con.AccountId, total+1);}
            }            
        }
    }
    
    for(Account acc : Trigger.new)
    {
        acc.Callable_Contacts__c = accIdToTotal.get(acc.Id);
    }
    
    
}