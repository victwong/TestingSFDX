trigger EmployeesAccount on Account (before insert, before update) {
    
    List<Opportunity> oppsToCreate = new List<Opportunity>();
    
    for (Account acc : Trigger.new){
        if(acc.NumberOfEmployees != null && acc.NumberOfEmployees > 99)
        {
            for (Integer i=1; i < 11; i++)
            {
                Opportunity opp = new Opportunity();
                opp.Name = 'Opportunity ' + i;
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today();
                opp.AccountId = acc.Id;
                oppsToCreate.add(opp);
            }
        }
    }
	insert oppsToCreate;
}