trigger OpportunityExpensiveCompetitor on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new){

        //Add Competitors to list in order
        List<String> competitors = new List<String>();
        competitors.add(opp.Competitor_1__c);
        competitors.add(opp.Competitor_2__c);
        competitors.add(opp.Competitor_3__c);

        //Add Competitors Prices to list in order
        List<Decimal> competitorsPrices = new List<Decimal>();
        competitorsPrices.add(opp.Competitor_1_Price__c);
        competitorsPrices.add(opp.Competitor_2_Price__c);
        competitorsPrices.add(opp.Competitor_3_Price__c);

        Decimal highestPrice;
        Integer highestPricePosition;
        for (Integer i=0; i < competitorsPrices.size(); i++){
            Decimal currentPrice = competitorsPrices.get(i);
            if(highestPrice == null || currentPrice > highestPrice){
                highestPrice = currentPrice;
                highestPricePosition = i;
            }
        }
        opp.MostExpensiveCompetitor__c = competitors.get(highestPricePosition);
        opp.MostExpensiveCompetitorPrice__c = competitorsPrices.get(highestPricePosition);

    }

}