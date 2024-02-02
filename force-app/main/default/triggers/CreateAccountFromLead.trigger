trigger CreateAccountFromLead on Lead (before insert) {
    for (Lead l : Trigger.new) {
        Account acc = new Account();
        acc.Name = l.LastName;
        insert Acc;
    }

}