public class AccountHandler {
    public static Account insertNewAccount(String value) {
        Account acct = new Account(Name=value);
       try{
           insert acct;
       } catch (DMLException e){
           return null;
       }
       return acct;
    }
}