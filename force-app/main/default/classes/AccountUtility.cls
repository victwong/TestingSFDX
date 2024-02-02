public class AccountUtility {
    public static void viewAnnualRevenue(){
        List <Account> accountsList = [Select Name, AnnualRevenue from Account];
        for (Account acc : accountsList){
            String acctRev = acc.name + ' : ' + acc.annualrevenue;
            System.debug(acctRev);
        }
    }
}