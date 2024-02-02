@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates(){
        Date date1 = Date.today();
        Date date2 = date1.adddays(28);
        Date checkDate = VerifyDate.CheckDates(date1, date2);
		system.assertEquals(checkDate,date2);
    }
    
    @isTest static void testCheckDates2(){
        Date date1 = date.today();
        Date date2 = date1.adddays(31);
        Date checkDate = VerifyDate.CheckDates(date1, date2);
		system.assertEquals(checkDate,date1);
    }
    
    @isTest static void testDateWithin30Days(){
    	Date date1 = Date.today();
        Date date2 = date1.adddays(28);
        Boolean checkDays = verifydate.DateWithin30Days(date1, date2);
        system.assertEquals(true, checkDays);   
    }
    
    @isTest static void testSetEndOfMonthDate(){
        Date date1 = date.newInstance(2020,1,1);
        Date checkEOM = VerifyDate.SetEndOfMonthDate(date1);
        system.assertequals(date.newInstance(2020,1,31),checkEOM);
    }
}