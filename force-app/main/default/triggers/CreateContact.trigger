trigger CreateContact on Candidate__c (after insert){
    //Instantiate an object called cc from the class CreateContactFromCan
    CreateContactFromCan cc = new CreateContactFromCan();
    //Invoke the method createContact and send a List of Candidates as an input parameter
    cc.createContact(Trigger.new);
}