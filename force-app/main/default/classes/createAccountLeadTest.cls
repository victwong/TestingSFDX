@isTest
public class createAccountLeadTest {

    @isTest static void createLead() {
        Lead l = new Lead();
        l.FirstName = 'Victor';
        l.LastName  = 'Wong';
        l.Company   = 'Zillow';
        l.Email     = 'victorw@zillowgroup.com';
        insert l;
    }
}