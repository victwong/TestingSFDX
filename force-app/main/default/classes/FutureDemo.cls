public with sharing class FutureDemo {
    public static void firstMethod() {
        Account acc = [SELECT Id, Name FROM Account Limit 1];
        acc.Name = 'FutureDemo Test'; 
        update acc;
        system.debug('not futur emethod');
        /*id jobId=*/  System.enqueueJob(new queueableDemo());
        }

    @future
    public static void FutureMethod(){
        Account acc = [SELECT Id FROM Account Limit 1];
        Contact con = [SELECT Id, FirstName FROM Contact WHERE AccountId = :acc.Id LIMIT 1];
        con.FirstName = 'FutureDemo';
        update con;
        system.debug('future method');
    }
}