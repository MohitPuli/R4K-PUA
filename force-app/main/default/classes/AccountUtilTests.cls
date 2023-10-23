/*
 * Unit tests for the AccountUtil and Account triggers.
 *
 * @Author: System Partners
 */
@IsTest(SeeAllData=true)
private class AccountUtilTests {
    static Territory__c territory;
    
    static void getQueueAndTerritory() { 
        territory = [
            SELECT
                Id,
                Name,
                Short_Name__c
            FROM
                Territory__c
            WHERE
                Applicant_Customer_Prefix__c = 'GLR' limit 1
        ];
    }
    
    /*
     * Testing auto customer number generation
     */
    static testmethod void generateCustomerNumberTest() {
        //Create test territory record and queue.
        getQueueAndTerritory();

        //Create the test Applicant account.
        RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
        Account account = new Account(
            RecordTypeId = personAccountRecordType.Id,
            Salutation = 'Mr.',
            FirstName = 'UnitTest',
            LastName = 'Applicant 1',
            Centrepay_Ref_No__c = 'xxx xxx xxx x',
            Territory_Number__c = territory.Id,
            // for GlobalSearch testing
            PersonMailingCity = 'TestSuburb',
            PersonMailingPostalCode = 'TestPostcode'
        );
        insert account;
        
        //Now check a valid formated customer number is generated.
        account = [SELECT Id, Territory_Number__c, Customer_No__c FROM Account WHERE Id =: account.Id limit 1];
        System.assertNotEquals(null, account.Customer_No__c, 'There should be a unique customer number created.');
        System.debug('###account.Customer_No__c created: ' + account.Customer_No__c);
        System.assert(account.Customer_No__c.length() >= 8, 'Customer number generated should be 3 character + 5 or more digitals');
        
        // NEW TEST - check global search
        List<Global_Search__c> gsRecs = refreshGlobalSearch(account.id);
        System.assertEquals(1, gsRecs.size());
        System.assertEquals('TestSuburb',gsRecs[0].Suburb__c);
        System.assertEquals('TestPostcode',gsRecs[0].Postcode__c);
        account.PersonMailingCity = 'TestSuburb2';
        account.PersonMailingPostalCode = 'TestPostcode2';
        update account;

        /*
         * Make sure all generic account info is showing in global search record that will
         * be available to users from other territory to see.
         */
        gsRecs = refreshGlobalSearch(account.id);
        System.assertEquals(1, gsRecs.size());
        //System.assertEquals('TestSuburb2',gsRecs[0].Suburb__c);
        //System.assertEquals('TestPostcode2',gsRecs[0].Postcode__c);
        delete account;
        gsRecs = refreshGlobalSearch(account.id);
        System.assertEquals(0, gsRecs.size());
    }
    
    /*
     * Helper method to refresh the global search record by given applicant account id.
     */
    private static List<Global_Search__c> refreshGlobalSearch(Id accountId){
        return [Select Id, Applicant__c, Postcode__c, Suburb__c from Global_Search__c where Applicant__c = :accountId];
    }
    
    /*
     * Create duplicate applicant test.
     */
    static testmethod void generateCustomerNumberAddErrorTest() {
        getQueueAndTerritory(); //Create test Territory and Queue
        try {
            //Try to create a duplicate applicant account which should cause an exception.
            RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
            Account account = new Account(
                RecordTypeId = personAccountRecordType.Id,
                Salutation = 'Mr.',
                FirstName = 'UnitTest',
                LastName = 'Applicant 1',
                Centrepay_Ref_No__c = 'xxx xxx xxx x'
            );
            insert account;
            System.assert(false, 'Should have add an error to account.');
        } catch (System.dmlException e) {}
    }
    
    static testmethod void testgenerateCustomerNumberForAccount() {
        Test.startTest();
        String customerNumber = AccountUtil.generateCustomerNumberforAccount('R4K',true);
        Test.stopTest();

    }
    
    static testmethod void testgetAverageDaysToDepleteTheIncome()
    {
        Test.startTest();
        List<BankStatement_Transaction__c> bts = [select id,name,Provider_Category__c,Transaction_Date__c,Credit_Amount__c,Debit_Amount__c,ApplicantId__c from BankStatement_Transaction__c where Credit_Amount__c>0 and Provider_Category__c='Wages' and CreatedDate=TODAY order by Transaction_Date__c desc LIMIT 1];
        Decimal avgDays = AccountUtil.getAverageDaysToDepleteTheIncome(bts[0].ApplicantId__c,30);
        Test.stopTest();
    }
}