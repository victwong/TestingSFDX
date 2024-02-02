public with sharing class businessCard {
    @AuraEnabled(cacheable=true)
    public static list<Contact> getContact (Id contactId) {
        return [SELECT Name, Email, Phone FROM Contact where ID = :ContactId];
    }
}