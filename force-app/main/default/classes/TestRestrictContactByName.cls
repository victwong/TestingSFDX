@istest

private class TestRestrictContactByName{
    @isTest static void InsertContact(){
    //Test Data Setup
    Account acc = new Account(Name='Test Account');
    insert acc;
    Contact con = new Contact();
    con.FirstName = 'Test';
    con.LastName  = 'INVALIDNAME';
    con.accountid = acc.id;
    insert con;
	}
}