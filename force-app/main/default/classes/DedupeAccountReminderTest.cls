@isTest
public class DedupeAccountReminderTest {
    @isTest static void createAccount() {
        Account acc = new Account();
        acc.Name    = 'Test Class';
        insert acc;
    }
}