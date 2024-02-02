@isTest
public class CheckSecretInformationTest {
    @isTest static void createCase() {
        String childCaseSubject = 'Warning: Parent case may contain secret info';

        //Create Case
        Case c = new Case();
        c.Subject = 'Test Case';
        c.Description = 'SSN';
        insert c;

        //Check Child Case is created
        Case childCase = [SELECT ID, Description, Subject from Case where ParentId = :c.Id];
        System.assert(childCase.Subject == childCaseSubject);
    }
}