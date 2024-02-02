public class ContactSearch {
    public static List<Contact> searchForContacts(String lName, String mZip){
        lName='Young';
        mZip='66045';
        Contact[] foundContacts = [SELECT Id,FirstName,LastName
                                   FROM Contact
                                   WHERE LastName=:lName AND MailingPostalCode=:mZip];
        return(foundContacts);                              
    }
}