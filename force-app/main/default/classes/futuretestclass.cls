public class futuretestclass {
    public static void createContact(List<String> accID){
        for (String acc : accId){
        	List<Contact> contactList = new List <Contact>();
       		Contact c1 = new Contact();
            c1.FirstName = 'Victor';
            c1.LastName = 'Wong';
            c1.AccountId = acc;
            contactList.add(c1);
            Contact c2 = new Contact();
            c2.FirstName = 'Victor2';
            c2.LastName = 'Wong2';
            c2.AccountId = acc;
            contactList.add(c2);
            insert contactList;
        }
	}
}