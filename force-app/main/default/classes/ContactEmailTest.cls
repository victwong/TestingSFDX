@isTest
public class ContactEmailTest {
    @isTest static void createContact() {
        Contact c = new Contact();
        c.FirstName = 'Victor';
        c.LastName  = 'Wong';
        c.Email     = 'victorw@zillowgroup.com';
        insert c;
    }
}