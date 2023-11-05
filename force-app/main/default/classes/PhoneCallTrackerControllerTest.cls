@isTest(SeeAllData=true)
public class PhoneCallTrackerControllerTest
{
    
    static Territory__c territory;
    static Territory__c territory2;
    static Account applicant;
    static Account applicant2;
    static Contact contact;
    static Referee__c ref;
    static Opportunity contract1;
    static final String STAGE_CREATE_PAYMENTS = 'Goods Delivered';
    static OpportunityLineItem item;
    static OpportunityLineItem item2;
    static Collection_Activity__c ca;
    static Payment__c paymentCRN2;
    static Attachment att;
    static Lead testLead;
    static Lead testLead2;
    static Lead testLead3;
    static PostCode__c postcode;
    static PhoneCall__c pc;
    static PhoneCall__c mpc1;
    static PhoneCall__c incpc1;
    static smagicinteract__smsMagic__c incSMS1{get;set;}
    static smagicinteract__smsMagic__c incSMS2{get;set;}
    
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
    
    territory2 = [
        SELECT
            Id,
            Name,
            Short_Name__c
        FROM
            Territory__c
        WHERE
            Short_Name__c = 'Pakenham' limit 1
    ];
    System.debug('###territory: ' + territory.Id);
    update territory; 
    
    postcode = new PostCode__c(
        Name='0000',
        Territory__c=territory2.Id
        //OwnerId=testUser1.id
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
    
    testLead2 = new Lead(
        FirstName = 'unittest2',
        LastName = 'testlead2',
        MobilePhone = '0111111112',
        Email = 'test456@test.com',
        Company = 'Test Company',
        PostalCode = postCode.Name,
        Not_Spam__c='yes',
        form_type__c='Fonebox',
        crn__c='232323232X',
        did_your_hear__c='Website',
        contact_desc__c='test',
        Desired_Product__c='test',
        Country='AU'
    );
    insert testLead2;
    
    testLead3 = new Lead(
        FirstName = 'unittest',
        LastName = 'testlead',
        MobilePhone = '0449066375',
        Email = 'test123@test.com',
        Company = 'Test Company',
        PostalCode = postCode.Name,
        Not_Spam__c='yes',
        did_your_hear__c='Website',
        contact_desc__c='test',
        Desired_Product__c='test',
        OwnerId = UserInfo.getUserId(),
        Territory_Number__c = territory.Id,
        Lead_Medium__c = 'Direct',
        Country='AU'
    );
    insert testLead3;
    
    Employee__c hybridEmployee = [SELECT Id FROM Employee__c WHERE Name = 'Hybrid Application' AND Territory__r.Name = '1000' LIMIT 1];
      
    RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
    applicant = new Account(
        RecordTypeId = personAccountRecordType.Id,
      Salutation = 'Mr.',
      FirstName = 'UnitTest',
      LastName = 'Applicant 1',
      Centrepay_Ref_No__c = 'xxxxxxxxxx',
      Ezidebit_Ref_No__c = 'XXXYYYY', 
      Customer_No__c = 'xxxxxxxx',
      PersonMobilePhone='0469036691',
      Territory_Number__c = territory.Id,
      Veda_File_Number__c='987779090999',
      Centrelink_Benefit__c='Parenting Payment',
      Centrelink_Benefit_Amount__c=1000,
      Rent_Mortgage_Board__c=500,
      Product_Category_Selected__c='Phones',
      Product_COGS_for_Agreement__c=1000,
      Product_Term_for_Agreement__c='36',
      PersonEmail='test@test.com.au',
      Bank_Institution__c='Demo Bank',
      Equifax_Mobile__c='0469036691',
      AccessId_BankStatement__c='123456432',
      Equifax_Enquiry_Id__c = '171205-P04CJ-040AS',
      Enquiry_Date__c=Date.today(),
      Rep_Responsible_For_Converting_Lead__c = hybridEmployee.Id
    );
    insert applicant;
    
    contact = new Contact();
    contact.FirstName='Shrijit';
    contact.LastName='Test';
    contact.MailingStreet='11 Peacock St';
    contact.MailingCity='Burwood';
    contact.MailingState='VIC';
    contact.MailingPostalCode='3125';
    contact.MobilePhone='0469036691';
    contact.Email='shri@rent4keeps.com.au';
    contact.HomePhone='0984894948484';
    insert contact;
    
    ref = new Referee__c();
    ref.Applicant__c=applicant.Id;
    ref.Referee_Name__c=contact.Id;
    insert ref;
    
    contract1 = new Opportunity(
      Name = 'UnitTest - Contract Number Test 1',
      AccountId = applicant.Id,
      StageName = STAGE_CREATE_PAYMENTS,
      Start_Date__c = Date.today(),
      CloseDate = Date.today().addMonths(12),
      Term_Months__c = '12',
      Payment_Frequency__c = 'Fortnightly',
      Scheduled_Amount__c = 200,
      Delivery_Cost__c = 200,
      Is_Active__c = true,
      Requirements_Objectives__c='testrequired',
      Repossess_Notes__c='repossesstest',
      Online_AppForm_Signed_Datetime__c = DateTime.now()
    );
    insert contract1;
    
    att = new Attachment(
    Name='Photo Id',
    ParentId = contract1.Id,
    Body = Blob.valueOf('Test')
    );
    insert att;
    
    List<PriceBookEntry> books=[select id,Name from PriceBookEntry where Name='Computing - Desktop' and CurrencyISOCode='AUD'];
    item = new OpportunityLineItem();
    item.OpportunityId=contract1.Id;
    if(books.size()>0)
       item.PriceBookEntryId=books[0].Id;
    item.Description='Computer';
    item.Supplier__c='Other';
    item.Other_Supplier__c='Other';
    item.UnitPrice=6600;
    item.Cost_of_Goods__c=2600;
    item.Total_Agreement_Value_For_Rent__c=7000;
    insert item;
    
    List<PriceBookEntry> books2=[select id,Name from PriceBookEntry where Name='Repair' and CurrencyISOCode='AUD'];
    item2 = new OpportunityLineItem();
    item2.OpportunityId=contract1.Id;
    if(books2.size()>0)
       item2.PriceBookEntryId=books2[0].Id;
    item2.Description='Repair';
    item2.Supplier__c='Other';
    item2.Other_Supplier__c='Other';
    item2.UnitPrice=900;
    item2.Cost_of_Goods__c=900;
    item2.Total_Agreement_Value_For_Rent__c=1000;
    insert item2;
    
    Payment_File__c paymentFile = new Payment_File__c(
    File_Name__c = 'Unit Test Centrepay payments',
    File_Upload_Date__c = datetime.now()
    );
    insert paymentFile;
    
    paymentCRN2 = new Payment__c(
    Payment_File__c = paymentFile.Id,
    RecordTypeId    = PaymentUtil.RECORDTYPE_ID_CENTREPAY,
    Customer_Name__c = 'UnitTest Applicant 1',
    Scheduled_Amount__c = 100,
    Actual_Amount__c = 99.01,
    Effective_Date__c = Date.today().addDays(14),
    Payment_Date__c = Date.today().addDays(14),
    Centrelink_Ref_No__c = 'xxxxxxxxxx',
    Fee_Amount__c = 0.99,
    Lodgement_Prefix_Ref_No__c = '190xxxxx',
    Applicantlookup__c=applicant.Id
    );
    insert paymentCRN2;
    
    ca = new Collection_Activity__c();
    ca.Applicant__c = applicant.Id;
    ca.Email__c = 'test@test.com';
    ca.First_Name__c = 'Shrijit';
    ca.Last_Name__c = 'XXXX';
    ca.MobilePhoneNumber__c = '0585868XXX';
    ca.Scheduled_Amount__c = 60;
    ca.Short_Link__c='testlink.com';
    ca.Collection_Outcome1__c='In Progress';
    ca.Collection_Notes__c='Missed payment';
    ca.Communication_Type__c='SMS';
    ca.Activity_By__c='Infield Collections';
    ca.Activity_Type__c='Missed';
    insert ca;
    
    pc = new PhoneCall__c(
            TwilioCallSid__c = 'SM0b6d72ddb2cb466c91464c7d36a8834ertrtrtrt',
            Mobile__c = '+61469036691',
            Account__c = applicant.Id
        );
    insert pc;
    
    mpc1 = new PhoneCall__c();
    mpc1.Call_Type__c = 'Missed';
    mpc1.Type__c = 'R4K LICENSING';
    mpc1.Medium__c = 'Browser';
    mpc1.Mobile__c = '61449066375';
    mpc1.Lead__c = testLead3.Id;
    insert mpc1;
    
    incpc1 = new PhoneCall__c();
    incpc1.Call_Type__c = 'Incoming SMS';
    incpc1.Type__c = 'R4K LICENSING';
    incpc1.Medium__c = 'Browser';
    incpc1.Mobile__c = '61469036691';
    incpc1.Account__c = applicant.Id;
    insert incpc1;
    
    incSMS1 = new smagicinteract__smsMagic__c();
    incSMS1.smagicinteract__PhoneNumber__c = '61449066375';
    incSMS1.smagicinteract__Direction__c = 'IN';
    incSMS1.smagicinteract__SMSText__c = 'CALL NOW';
    incSMS1.smagicinteract__SenderId__c = '61488884542';
    incSMS1.smagicinteract__external_field__c = String.valueOf(Datetime.now().getTime());
    incSMS1.smagicinteract__Lead__c = testLead3.Id;
    insert incSMS1;
    
    incSMS2 = new smagicinteract__smsMagic__c();
    incSMS2.smagicinteract__PhoneNumber__c = '61469036691';
    incSMS2.smagicinteract__Direction__c = 'IN';
    incSMS2.smagicinteract__SMSText__c = 'CALL NOW';
    incSMS2.smagicinteract__SenderId__c = '61488884542';
    incSMS2.smagicinteract__external_field__c = String.valueOf(Datetime.now().addMinutes(60).getTime());
    incSMS2.smagicinteract__Account__c = applicant.Id;
    insert incSMS2;
}

static testmethod void testGetConversationHistory() 
{
    Test.startTest();
    createTestData();
    ApexPages.currentPage().getParameters().put('top','R4K LICENSING');
  PhoneCallTrackerController pctc = new PhoneCallTrackerController();
  pctc.getConversationHistory();
  
  ApexPages.currentPage().getParameters().put('filterCriteria','Not Assigned');
  pctc.filterConversations();
  
  List<Employee__c> emps = [select id from Employee__c order by CreatedDate desc LIMIT 1];
  pctc.currentEmpId =emps.size()>0 ? emps[0].Id : null;
  
  if(pctc.conversationWrapperList.size()>0)
  {
      for(Integer i =0 ; i< pctc.conversationWrapperList.size(); i++)
       {
           if(pctc.conversationWrapperList[i].leadId!=null || pctc.conversationWrapperList[i].accountId!=null)
               pctc.conversationWrapperList[i].isSelected = true;
       }
  }
  pctc.convertToDNP();
  Test.stopTest();  
}

}