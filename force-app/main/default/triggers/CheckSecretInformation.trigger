trigger CheckSecretInformation on Case (after insert, before update){

    String childCaseSubject = 'Warning: Parent case may contain secret info';

    // Create a collection containing each secret keyword
    Set<String> secretKeywords = new Set<String>();
    secretKeywords.add('Credit Card');
    secretKeywords.add('Social Security');
    secretKeywords.add('SSN');
    secretKeywords.add('Passport');

    // Check to see if case contains any of the secret keywords
    List<Case> casesWithSecretInfo = new List<Case>();
    List<String> secretKeywordFound = new List<String>();
    for (Case c : Trigger.new){
        if (c.Subject !=childCaseSubject){
            for (String keyword : secretKeywords){
                if(c.Description != null && c.Description.containsIgnoreCase(keyword)){
                    casesWithSecretInfo.add(c);
                    secretKeywordFound.add(keyword);
                    System.debug('Case ' + c.Id + ' include secret keyword ' + keyword);
                }
            }
        }   
    }
    
    // If case contains a secret keyword, create a child case
    List<Case> casesToCreate = new List<Case>();
    for (Case caseWithSecretInfo: casesWithSecretInfo){
        Case childCase = new Case();
        childCase.ParentId = caseWithSecretInfo.Id;
        childCase.Subject = childCaseSubject;
        childCase.IsEscalated = true;
        childCase.Priority = 'High';
        childCase.Description = 'The following keywords were found '+ secretKeywordFound;
        casestoCreate.add(ChildCase);
        break;
    }
    insert casesToCreate;
}