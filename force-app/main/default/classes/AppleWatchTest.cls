@isTest
public class AppleWatchTest {

    @isTest static void createOpportunity(){
        Opportunity opp = new Opportunity();
        opp.Name        = 'Apple Watch Test';
        opp.CloseDate   = Date.today();
        opp.StageName   = 'Prospecting';
        insert opp;
    }
}