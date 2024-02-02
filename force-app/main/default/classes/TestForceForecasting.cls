@istest
public class TestForceForecasting {
    static testMethod void insertNewUser() {
       
       User userToCreate = new User();
       
       // Do you recognize these fields?
       userToCreate.FirstName = 'David';
       userToCreate.LastName  = 'Liu';
       userToCreate.Email     = 'seeifthisworks@expedia.com';
       userToCreate.Username  = 'seeifthisworks@expedia.com';
       userToCreate.Alias     = 'fatty';
       userToCreate.ProfileId = '00e36000000j3mt';

       // Don't worry about these
       userToCreate.TimeZoneSidKey    = 'America/Denver';
       userToCreate.LocaleSidKey      = 'en_US';
       userToCreate.EmailEncodingKey  = 'UTF-8';
       userToCreate.LanguageLocaleKey = 'en_US';
       
       insert userToCreate;
    }
}