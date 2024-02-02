trigger KeyFields on Lead (after insert, before update) {
    
    List <Task> tasksToCreate = new list<Task>();
    
    
    for (Lead myLead : Trigger.new){
        if(myLead.Bypass_Triggers__c == FALSE){
        List<String> leadFields = new List<String>();
        List<String> leadTestFields = new List<String>();

        //Check if fields are populated
        if(myLead.FirstName != null){
            leadFields.add('First Name');
            if(mylead.FirstName.containsignorecase('test')){
                leadTestFields.add('First Name');
            }
        }
        if (myLead.LastName != null){
            leadFields.add('Last Name');
            if(mylead.LastName.containsignorecase('test')){
                leadTestFields.add('Last Name');
            }
        }
        if(myLead.Email != null){
            leadFields.add('Email');
            if(mylead.Email.containsignorecase('test')){
                leadTestFields.add('Email');
            }
        }
        if(myLead.Phone != null){
            leadFields.add('Phone');
            if(mylead.Phone.containsignorecase('test')){
                leadTestFields.add('Phone');
            }
        }
        if(myLead.Website != null){
            leadFields.add('Website');
            if(mylead.Website.containsignorecase('test')){
                leadTestFields.add('Website');
            }
        }
        if(myLead.Title != null){
            leadFields.add('Title');
            if(mylead.Title.containsignorecase('test')){
                leadTestFields.add('Title');
            }
        }



        //Update field with number of populated fields
        myLead.Key_Fields_Populated__c = leadFields.size();
        
        
        //If 3 or more fields are populated, create tasks
        if(leadFields.size() >= 3){
            for (String fieldType : leadFields)
            {
                Task t = new Task();
                t.Subject = 'Other';
                t.ActivityDate = Date.today()+3;
                t.WhoId = myLead.Id;
                t.Description = 'Verify the '+ fieldType +' field';
                taskstoCreate.add(t);
            }          
        }
        if(leadTestFields.size() > 0){
            Task tt = new Task();
            tt.Subject = 'Warning';
            tt.ActivityDate = Date.today()+3;
            tt.WhoId = myLead.Id;
            tt.Description = 'This lead contains the TEST keyword in the following fields:' + leadTestFields;
            taskstoCreate.add(tt);
        }
        }
    insert tasksToCreate;
    }
}