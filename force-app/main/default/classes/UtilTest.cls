@isTest(seeAllData=true)
private class UtilTest
{

static PostCode__c postcode;
static Territory__c territory;
static Lead testLead;

static void createTestData() {
territory = [
    SELECT
        Id,
        Name,
        Short_Name__c
    FROM
        Territory__c
    WHERE
        Name = '1000' limit 1
];


postcode = new PostCode__c(
    Name='0000',
    Territory__c=territory.Id
);
insert postcode;

testLead = new Lead(
    FirstName = 'unittest',
    LastName = 'testlead',
    MobilePhone = '0111111111',
    Email = 'test123@test.com',
    Company = 'Test Company',
    PostalCode = postCode.Name,
    Not_Spam__c='yes',
    form_type__c='Fonebox',
    crn__c='232323232C',
    did_your_hear__c='Website',
    contact_desc__c='test',
    Desired_Product__c='test',
    OwnerId = UserInfo.getUserId(),
    Territory_Number__c = territory.Id,
    Country='AU'
);
insert testLead;
}

private static testMethod void testgetRecordTypeInfosByDeveloperName()
{   
   Test.startTest(); 
   Util.getRecordTypeInfosByDeveloperName('Account');
   Test.stopTest(); 
}

private static testMethod void testIsOutOfBusinessHours()
{   
   Test.startTest(); 
   String botStartTime ='9:00';
    String botFinishTime = '17:00';
    
    String[] botStartTimeSplit = botStartTime.split(':');
    Time botStartTimeVal = Time.newInstance( Integer.valueOf(botStartTimeSplit[0]) ,Integer.valueOf(botStartTimeSplit[1]) ,0,0); 
    
    String[] botFinishTimeSplit = botFinishTime.split(':');
    Time botFinishTimeVal = Time.newInstance( Integer.valueOf(botFinishTimeSplit[0]) ,Integer.valueOf(botFinishTimeSplit[1]) ,0,0); 
    system.debug(botStartTimeVal+' - '+botFinishTimeVal);
   Util.isOutOfBusinessHours('VIC',botStartTimeVal,botFinishTimeVal);
   
   Datetime dt = Util.getStateTimeZoneDatetime('WA',Datetime.now());
   Datetime dt2 = Util.getStateTimeZoneDatetime('VIC',Datetime.now());
   Datetime dt3 = Util.getStateTimeZoneDatetime('NZ',Datetime.now());
   Datetime dt4 = Util.getStateTimeZoneDatetime('SA',Datetime.now());
   
   Datetime dt5 = Util.getStateTimeZoneDatetimeToAddInput('WA',Datetime.now());
   Datetime dt6 = Util.getStateTimeZoneDatetimeToAddInput('VIC',Datetime.now());
   Datetime dt7 = Util.getStateTimeZoneDatetimeToAddInput('NZ',Datetime.now());
   Datetime dt8 = Util.getStateTimeZoneDatetimeToAddInput('SA',Datetime.now());
   Test.stopTest(); 
}

private static testMethod void testgetStateTimeZoneDatetimeToAddInput()
{  
    Test.startTest();
    Util.getStateTimeZoneDatetimeToAddInput('VIC',Datetime.now());
    Test.stopTest(); 
}

private static testMethod void testgetObjectApiNameFromId()
{  
    Test.startTest();
        
    List<Territory__c> ters = [select id from Territory__c LIMIT 1];
    if(ters.size()>0)
        Util.getObjectApiNameFromId(ters[0].Id);
    Test.stopTest(); 
}

private static testMethod void testgetRentalCalculation()
{  
    Test.startTest();
    Util.getRentalCalculation('NZ',1000,0,'24','Fortnightly');
    Util.getRentalCalculation('NZ',1000,0,'24','Weekly');
    Util.getRentalCalculation('NZ',1000,0,'36','Fortnightly');
    Util.getRentalCalculation('NZ',1000,0,'36','Weekly');
    
    Util.getRentalCalculation('AU',2500,200,'24','Weekly');
    Util.getRentalCalculation('AU',4000,400,'36','Weekly');
    Util.getRentalCalculation('AU',3000,200,'24','Fortnightly');
    
    Util.getFees(1000,24);
    
    Util.getComparisonRates(1000,2,null);
    Test.stopTest(); 
}

private static testMethod void testCreditCalculatorBatch() {
        // Prepare test data
        /*List<Product_Inventory__c> testPIs = new List<Product_Inventory__c>();
        for (Integer i = 0; i < 100; i++) {
            testPIs.add(new Product_Inventory__c(ProductCode__c = 'Test PI ' + i));
        }
        insert testPIs;*/
        
        // Start test
        Test.startTest();
        CreditCalculatorBatch batch = new CreditCalculatorBatch();
        Id batchId = Database.executeBatch(batch);
        Test.stopTest();
    }

static testmethod void testCreditCalculatorBatchScheduler() {
Test.startTest();

scheduledCreditCalculatorBatch myJob = new scheduledCreditCalculatorBatch();
String cronExpression = '0 0 13 ? * MON-FRI';
String jobId = System.schedule('MyTestJob', cronExpression, myJob);

Test.stopTest();
}
    
private static testMethod void testCreateApplicant()
{
     Test.startTest();
     createTestData();
     
     RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Enquiry' limit 1];
     Util.createApplicant(testLead,'a0N6F00000K5nGWUAZ','Enquiry',personAccountRecordType.Id,null,'Test');
     
     Test.stopTest(); 
}

private static testMethod void testHashing()
{
     Test.startTest();
     Util.generateSHA256String('Test');
     
     Test.stopTest(); 
}

private static testMethod void testTimeDiff()
{
     Test.startTest();
     Util.getTimeDifferenceBetweenUsers(UserInfo.getTimeZone().getID(),UserInfo.getTimeZone().getID());
     Test.stopTest(); 
}
}