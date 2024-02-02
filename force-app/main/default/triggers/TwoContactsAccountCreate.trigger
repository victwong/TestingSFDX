trigger TwoContactsAccountCreate on Account (after insert){
    List<Contact> contactList = new List<Contact>();
    for (Account acc : Trigger.new){
        Contact c1 = new Contact();
        Contact c2 = new Contact();
        c1.FirstName = 'Victor';
        c1.LastName = 'Wong';
        c1.AccountId = acc.Id;

        c2.FirstName = 'Victor';
        c2.LastName = 'Wong';
        c2.AccountId = acc.Id;

        contactList.add(c1);
        contactList.add(c2);
    }
    insert contactList; 
}