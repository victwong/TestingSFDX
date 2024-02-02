trigger DedupeLead on Lead (before insert) {

    List<Group> dataQualityGroups = [SELECT Id 
                                FROM Group 
                                WHERE DeveloperName = 'Data_Quality' 
                                LIMIT 1];
    

    for (Lead myLead : Trigger.New){
        if (myLead.Email != null){
        //searching for matching contacts
        List<Contact> matchingContacts = [SELECT Id,
                                                 FirstName,
                                                 LastName,
                                                 Account.Name 
                                            FROM Contact
                                            WHERE Email = :myLead.Email];
        System.debug(matchingContacts.size() + ' contact(s) found.');


        //if matches are found...
        If (!matchingContacts.isEmpty()){
            //assigned the lead to data quality queue
            if (!dataQualityGroups.isEmpty()){
                myLead.OwnerId = dataQualityGroups.get(0).Id;
            }
            //add the dupe contact IDs into the lead description
            String dupeContactsMessage = 'Duplicate contact(s) found:\n';
            for (Contact matchingContact : matchingContacts) {
                dupeContactsMessage += matchingContact.FirstName + ' '
                                    + matchingContact.LastName + ', '
                                    + matchingContact.Account.Name + ' ('
                                    + matchingContact.Id + ')\n';
            }
            myLead.Description = dupeContactsMessage + '\n' + mylead.Description;
        }
    }
    }
}