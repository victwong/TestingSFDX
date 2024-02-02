@isTest
public  class TwoContactsAccountCreateTest {
    @isTest static void createAccount() {
        Account acc = new Account();
        acc.Name    = 'Test Account';
        insert acc;
        }
}