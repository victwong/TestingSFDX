trigger MultiSelectCounter on Account (before insert, before update) {
    for (Account acc : Trigger.new){
        if (acc.MultiTest__c == null){
            acc.MultiTestCounter__c = 0;
        }
            else {
                Integer count = acc.MultiTest__c.countMatches(';')+1;
                acc.MultiTestCounter__c = count;     
            }
    }
}