@isTest
public class MultiSelectCounterTest {
    @isTest static void insertAccount() {
        Account acc = new Account();
        acc.Name = 'Test';
        acc.MultiTest__c = 'A;B;C';
        insert acc;

        acc = [SELECT Id, MultiTestCounter__c from Account where Id = :acc.Id];
        System.assert(acc.MultiTestCounter__c == 3);
    }
}