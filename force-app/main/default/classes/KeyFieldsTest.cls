@isTest
public class KeyFieldsTest {
    @isTest static void createLead(){

    //Create Lead
    Lead l = new Lead();
    l.FirstName = 'Test';
    l.LastName  = 'Tester';
    l.Company = 'Zillow';
    l.Website = 'google.com';
    insert l;

    l.Phone = '123';
    update l;

    l = [SELECT Id, LastName, FirstName, Company, Website, Phone FROM Lead WHERE Id = :l.Id];
    List<Task> tasksFromLead = new List<Task>();
    tasksFromLead = [SELECT Id FROM Task WHERE WhatId = :l.Id];
    System.Assert(tasksFromLead.size()>0);    
    }
}