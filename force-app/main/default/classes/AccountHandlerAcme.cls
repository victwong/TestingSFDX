public class AccountHandlerAcme {
    public static void insertAccount (Integer value){
        Integer counter = 1;
        //create a list to add our accounts
        List<Account> addAccounts  = new List<Account>();
        
        while (counter<=value){
            //display current counter value
            System.debug('Counter Value before Incrementing '+ counter);
            
            //create new account
            Account location = new Account();
            location.name = 'Acme Inc ' + counter;
            location.AccountNumber  = 'A000' + counter;
            addAccounts.add(location);
            
            System.debug(addAccounts);
            
            //increment counter
            counter = counter + 1;
            System.debug('Counter Value after incrementing '+ counter);
        }
           
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        
        //insert all accounts in list
        insert addAccounts;  
    }
        
}