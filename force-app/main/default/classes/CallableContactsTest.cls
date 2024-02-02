@isTest
public class CallableContactsTest 
{
    @testSetUp
    static void setUpData()
    {
        //create data here
        //Create Account
        Account acc = new Account();
        acc.Name = 'TestCallableContacts';
        insert acc;
        
        //Add Contact List
        //Create 5 contacts (3 with and 2 without phone number)

        List<Contact> contactList = new List<Contact>();
        
        contactList.add(new Contact(FirstName = 'Test', LastName = 'Contact1', Phone = '1', AccountId = acc.Id));
        contactList.add(new Contact(FirstName = 'Test', LastName = 'Contact2',Phone = '2', AccountId = acc.Id));
        contactList.add(new Contact(FirstName = 'Test', LastName = 'Contact3', Phone = null, AccountId = acc.Id));
        contactList.add(new Contact(FirstName = 'Test', LastName = 'Contact4', Phone = null, AccountId = acc.Id));
        contactList.add(new Contact(FirstName = 'Test', LastName = 'Contact5', Phone = '5', AccountId = acc.Id));
          
        insert contactList;
    }
    
    //test methods
    static testMethod void testTriggerUponInsert()
    {
        //query account
        Account acc = [SELECT ID, Callable_Contacts__c FROM Account WHERE Name = 'TestCallableContacts' LIMIT 1];
        
        //create contact6 with phone
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Contact6';
        con.Phone = '6';
        con.AccountId = acc.Id;
        insert con;

        Account accCheck = [SELECT ID, Callable_Contacts__c FROM Account WHERE Name = 'TestCallableContacts' LIMIT 1];
        //assertEquals Account.callable_contacts__c = 4
        system.assertEquals(4, accCheck.Callable_Contacts__c,'Callable contacts total does not match');
    }

    static testMethod void testTriggerUponUpdate()
    {
        //query contact
        Contact con = [SELECT Id, Name, Phone FROM Contact WHERE Name = 'Test Contact1' LIMIT 1];
         //update contact (remove and add phone scenario)
        con.Phone = null;
        update con;

        Account accCheck = [SELECT ID, Callable_Contacts__c FROM Account WHERE Name = 'TestCallableContacts' LIMIT 1];
        system.assertEquals(2, accCheck.Callable_Contacts__c,'Callable contacts total does not match');
       
    }
    @isTest static void testTriggerUponDelete()
    {
        //query contact
        Contact con = [SELECT Id, Name, Phone FROM Contact WHERE Name = 'Test Contact1' LIMIT 1];
        //delete contact
        delete con;

        Account accCheck = [SELECT ID, Callable_Contacts__c FROM Account WHERE Name = 'TestCallableContacts' LIMIT 1];
        system.assertEquals(2, accCheck.Callable_Contacts__c,'Callable contacts total does not match');
    }
}