trigger ComparableOpp on Opportunity (after insert) {
    for (Opportunity opp : Trigger.new){

        //Query Account Info
        Opportunity oppwithAccountInfo = [SELECT Id,
                                                 Account.Industry
                                            FROM Opportunity
                                            WHERE Id = :opp.Id
                                            LIMIT 1];

        //Get Bind Varaibles ready
        Decimal minAmount = opp.Amount *.9;
        Decimal maxAmount = opp.Amount * 1.1;

        //search for comparable opps    
        List<Opportunity> comparableOpps = [SELECT ID,
                                                   Amount,
                                                   StageName,
                                                   Account.Industry,
                                                   Name,
                                                   CloseDate
                                            FROM Opportunity
                                            WHERE Amount >= :minAmount
                                            AND Amount <=:maxAmount
                                            AND Account.Industry = :oppwithAccountInfo.Account.Industry
                                            AND StageName = 'Closed Won'
                                            AND CloseDate >= LAST_N_DAYS:365];
        System.debug('Comparable opp(s) found: ' + comparableOpps);

        //for each comparable opp, create Comparable__c record
        List<Comparable__c> junctionObjsToInsert = new List<Comparable__c>();
        for (Opportunity comp : comparableOpps){
            Comparable__c junctionObj = new Comparable__c();
            junctionObj.Base_Opportunity__c = opp.Id;
            junctionObj.Comparable_Opportunity__c = comp.Id;
            junctionObjsToInsert.add(junctionObj);
        }
    insert junctionObjsToInsert;
    }                                                     
}