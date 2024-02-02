@istest
public with sharing class DeDupeLeadTest {
    @isTest static void createLeadNoDupes(){
        String leadOwner = UserInfo.getUserId();

        //Create all required records
        Lead myLead = new Lead();
        myLead.FirstName = 'Sansa';
        myLead.LastName = 'Stark';
        myLead.Company = 'Winterfell';
        myLead.Email = 'sstark@winterfell.com';
        myLead.Description = 'The North Remembers';
        myLead.OwnerId = leadOwner;
        insert myLead;

        //Use SOQL to find latest values
        Lead updatedLead = [SELECT OwnerId,Description FROM Lead WHERE ID = :mylead.Id];

        //Assert that results are as expected
        System.assertEquals(leadOwner,updatedLead.OwnerID);
        System.assertEquals(myLead.Description,updatedLead.Description);
    }
    @isTest static void CreateLeadMultipleDupes(){
        String email = 'stark@winterfell.com';
        //Create two dupe contacts
        List<Contact> dupeContacts = new List<Contact>();
        Contact firstDupe = new Contact();
        firstDupe.FirstName = 'Sansa';
        firstDupe.LastName = 'Stark';
        firstDupe.Email = email;
        dupeContacts.add(firstDupe);

        Contact secondDupe = new Contact();
        secondDupe.FirstName = 'Sansa';
        secondDupe.LastName = 'Stark';
        secondDupe.Email = email;
        dupeContacts.add(secondDupe);
        insert dupeContacts;

        //Create dupe lead
        Lead myLead = new Lead();
        myLead.FirstName = 'Sansa';
        myLead.LastName = 'Stark';
        myLead.Company = 'Winterfell';
        myLead.Email = email;
        myLead.Description = 'The North Remembers';
        myLead.OwnerId = UserInfo.getUserId();
        insert myLead;

        Lead updatedLead = [SELECT OwnerId,Description FROM Lead WHERE ID = :mylead.Id];

        Group dataQualityQueue = [SELECT Id FROM Group WHERE DeveloperName = 'Data_Quality' LIMIT 1];

        System.assertequals(dataQualityQueue.Id,updatedLead.OwnerID);
        System.assert (updatedLead.Description.contains(firstDupe.Id));
        System.assert (updatedLead.Description.contains(secondDupe.Id));
    }
}