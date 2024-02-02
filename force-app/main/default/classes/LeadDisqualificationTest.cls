@isTest
private class LeadDisqualificationTest {
    @isTest static void insertLead() {
        Lead lead1 = new Lead();
        lead1.FirstName = 'test';
        lead1.LastName = 'test';
        lead1.Company = 'test company';
        insert lead1;
    }
}