@isTest
public class OpportunityCompetitorTest {
    @isTest static void createOpportunity() {
        // Create Opportunity with required fields
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.AccountId = '0013600001ePOfvAAG';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();

        // Set Competitor fields
        opp.Competitor_1__c = 'Amazon';
        opp.Competitor_2__c = 'Google';
        opp.Competitor_3__c = 'Salesforce';

        //Set Competitor price fields
        opp.Competitor_1_Price__c = 100;
        opp.Competitor_2_Price__c = 200;
        opp.Competitor_3_Price__c = 300;
        insert opp;
        
        //Verify values on test opp are expected
        opp = [SELECT Id, Leading_Competitor__c, MostExpensiveCompetitor__c,MostExpensiveCompetitorPrice__c FROM Opportunity where Id=:opp.Id];
        System.Assert(opp.Leading_Competitor__c == 'Amazon');
        System.assert(opp.MostExpensiveCompetitor__c == 'Salesforce');
        System.assert(opp.MostExpensiveCompetitorPrice__c == 300);   
    }
}