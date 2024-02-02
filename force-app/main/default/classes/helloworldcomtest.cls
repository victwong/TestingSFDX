@isTest
private class helloworldcomtest {

    @istest static void updateContact(){
        Contact myContact = new Contact();
        myContact.FirstName = 'David';
        myContact.LastName  = 'Liu';
        insert myContact;
    }
}