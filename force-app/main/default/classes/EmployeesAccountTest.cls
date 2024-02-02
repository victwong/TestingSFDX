@isTest
public  class EmployeesAccountTest {
    @isTest static void createAccount() {
        Account acc = new Account();
        acc.Name = 'Test Class';
        acc.NumberOfEmployees = 100;
        insert acc;
    
		List<Opportunity> oppList = [SELECT Id from Opportunity WHERE AccountId = :acc.Id];
        System.assert(oppList.size() == 10);
    }
}