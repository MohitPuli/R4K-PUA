@IsTest(SeeAllData=true)
private class CAMProcessControllerTest{
 static Account applicant;
  static Account applicant2;
  static Account applicant3;
  static Opportunity contract1;
  static Opportunity contract2;
  static Opportunity contract3;
  static Opportunity contract4;
  static Territory__c territory;
  static Payment__c paymentCRN;
  static Payment__c paymentCRN2;
  static Payment__c paymentERN;
   static final String STAGE_CREATE_PAYMENTS = 'Goods Delivered';
   static List<Scheduled_Payment__c> sps;
   static List<Payment_Allocation__c> payAllocations;
   static OpportunityLineItem item;
   static OpportunityLineItem item2;
   static OpportunityLineItem item3;
   static OpportunityLineItem item4;
   static Equifax_Defaults__c equifaxDefault;
   static Equifax_Defaults__c equifaxDefault2;
   static Attachment att;
   static Attachment att2;
   static Attachment att3;
   static Attachment att4;
   static Attachment att5;
   static Attachment att6;
   static Attachment att7;
   static Contact contact;
   static Referee__c ref;
   static Employee__c employee;
   static Credit_GuideLine__c cg;
     static void createTestData() {
    territory = [
            SELECT
                Id,
                Name,
                Short_Name__c
            FROM
                Territory__c
            WHERE
                Name = '100' limit 1
        ];
        System.debug('###territory: ' + territory.Id);
    //territory.Has_Access_For_MOGO_And_Equifax__c = true;
    //territory.Is_Included_for_Credit_Approval_Process__c = true;
    update territory;    
    cg = [SELECT Id,Name FROM Credit_GuideLine__c WHERE Territory__c =: territory.Id ORDER BY CreatedDate DESC LIMIT 1];
    RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
    applicant = new Account(
        RecordTypeId = personAccountRecordType.Id,
      Salutation = 'Mr.',
      FirstName = 'UnitTest',
      LastName = 'Applicant 1',
      Centrepay_Ref_No__c = 'xxxxxxxxxx',
      Ezidebit_Ref_No__c = null, 
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
      Credit_Guideline__c = cg.Id
    );
    insert applicant;
    
    applicant2 = new Account(
        RecordTypeId = personAccountRecordType.Id,
      Salutation = 'Mr.',
      FirstName = 'UnitTest',
      LastName = 'Applicant 2',
      Ezidebit_Ref_No__c = '1234568',
      Customer_No__c = 'xxxxxxxz',
      Territory_Number__c = territory.Id,
      Veda_File_Number__c='9877790909994',
      Centrelink_Benefit__c='Parenting Payment',
      Centrelink_Benefit_Amount__c=1000,
      Rent_Mortgage_Board__c=500,
      Product_Category_Selected__c='Phones',
      Product_COGS_for_Agreement__c=1000,
      Bank_Institution__c='Demo Bank',
      Equifax_Mobile__c='0469036691',
      Credit_Guideline__c = cg.Id
      
    );
    insert applicant2;
    
        applicant3 = new Account(
        RecordTypeId = personAccountRecordType.Id,
      Salutation = 'Mr.',
      FirstName = 'UnitTest',
      LastName = 'Applicant 3',
      Ezidebit_Ref_No__c = '123456',
      Customer_No__c = 'xxxxxz',
      Territory_Number__c = territory.Id,
      Veda_File_Number__c='987779090999',
      Centrelink_Benefit__c='Parenting Payment',
      Centrelink_Benefit_Amount__c=1000,
      Rent_Mortgage_Board__c=500,
      Product_Category_Selected__c='Phones',
      Product_COGS_for_Agreement__c=1000,
      Bank_Institution__c='Demo Bank',
      Equifax_Mobile__c='0569036691',
      Credit_Guideline__c = cg.Id
      
    );
    insert applicant3;
    
    contract1 = new Opportunity(
      Name = 'UnitTest - Contract Number Test 1',
      AccountId = applicant.Id,
      StageName = STAGE_CREATE_PAYMENTS,
      Start_Date__c = Date.today(),
      CloseDate = Date.today().addMonths(12),
      Term_Months__c = '12',
      Payment_Frequency__c = 'Fortnightly',
      Scheduled_Amount__c = 200,
      Is_Active__c = true,
      Requirements_Objectives__c='testrequired',
      Repossess_Notes__c='repossesstest',
      Credit_Guideline__c = cg.Id
    );
    insert contract1;
    
    contract2 = new Opportunity(
      Name = 'UnitTest - Contract Number Test 2',
      AccountId = applicant.Id,
      StageName = STAGE_CREATE_PAYMENTS,
      Start_Date__c = Date.today(),
      CloseDate = Date.today().addMonths(12),
      Term_Months__c = '12',
      Payment_Frequency__c = 'Fortnightly',
      Scheduled_Amount__c = 200,
      Is_Active__c = true,
      Requirements_Objectives__c='testrequired',
      Credit_Guideline__c = cg.Id
    );
    insert contract2;
    
    contract3 = new Opportunity(
      Name = 'UnitTest - Contract Number Test 3',
      AccountId = applicant.Id,
      StageName = 'Completed',
      Start_Date__c = Date.today(),
      CloseDate = Date.today().addMonths(12),
      Term_Months__c = '36',
      Payment_Frequency__c = 'Fortnightly',
      Scheduled_Amount__c = 200,
      Is_Active__c = true,
      Agreement_Completed_Date__c=Date.today().addMonths(-12),
      Credit_Guideline__c = cg.Id
    );
    insert contract3;
    
    att = new Attachment(
    Name='Photo Id_test.pdf',
    ParentId = applicant.Id,
    Body = Blob.valueOf('Test')
    );
    insert att;
    
    att2 = new Attachment(
    Name='BankStatementCategorised_test.pdf',
    ParentId = applicant.Id,
    Body = Blob.valueOf('Test')
    );
    insert att2;
    
    att3 = new Attachment(
    Name='BankStatement_test.pdf',
    ParentId = applicant.Id,
    Body = Blob.valueOf('Test')
    );
    insert att3;
    
    att4 = new Attachment(
    Name='myGov_test,pdf',
    ParentId = applicant.Id,
    Body = Blob.valueOf('Test')
    );
    insert att4;
    
    att5 = new Attachment(
    Name='Equifax_test.pdf',
    ParentId = applicant.Id,
    Body = Blob.valueOf('Test')
    );
    insert att5;
    
    att6 = new Attachment(
    Name='Other File-Test.pdf',
    ParentId = applicant.Id,
    Body = Blob.valueOf('Test')
    );
    insert att6;
    
    att7 = new Attachment(
    Name='Proof of Income-WINZ.pdf',
    ParentId = applicant.Id,
    Body = Blob.valueOf('Test')
    );
    insert att7;
    
    /*contract4 = new Opportunity(
      Name = 'UnitTest - Contract Number Test 4',
      AccountId = applicant.Id,
      StageName = STAGE_CREATE_PAYMENTS,
      Start_Date__c = Date.today(),
      CloseDate = Date.today().addMonths(12),
      Term_Months__c = '12',
      Payment_Frequency__c = 'Weekly',
      Scheduled_Amount__c = 200,
      Is_Active__c = true
    );
    insert contract4;*/
    
     /* Attachment aatt = new Attachment();
  aatt.parentId = applicant.Id;
  aatt.Name = 'BankStatement_Test';
  aatt.Body = EncodingUtil.base64Decode('Test Body');
  insert aatt;
  Attachment aatt0 = new Attachment();
  aatt0.parentId = applicant.Id;
  aatt0.Name = 'myGov_Test';
  aatt0.Body = EncodingUtil.base64Decode('Test Body');
  insert aatt0;
  Attachment aatt2 = new Attachment();
  aatt2.parentId = applicant.AgreementId_for_Current_Enquiry__c;
  aatt2.Name = 'BankStatement_Test';
  aatt2.Body = EncodingUtil.base64Decode('Test Body');
  insert aatt2;
  Attachment aatt3 = new Attachment();
  aatt3.parentId = applicant.AgreementId_for_Current_Enquiry__c;
  aatt3.Name = 'myGov_Test';
  aatt3.Body = EncodingUtil.base64Decode('Test Body');
  insert aatt3;
    */
    List<PriceBookEntry> books=[select id,Name from PriceBookEntry where Name='Computing - Desktop' AND CurrencyIsoCode = 'AUD'];
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
    
    List<PriceBookEntry> books2=[select id,Name from PriceBookEntry where Name='Repair' AND CurrencyIsoCode = 'AUD'];
    item2 = new OpportunityLineItem();
    item2.OpportunityId=contract1.Id;
    if(books2.size()>0)
       item2.PriceBookEntryId=books2[0].Id;
    item2.Description='Repair';
    item2.Supplier__c='Other';
    item2.Other_Supplier__c='Other';
    item2.UnitPrice=1050;
    item2.Cost_of_Goods__c=300;
    item2.Weighted_AAF__c = 99;
    item2.Total_Agreement_Value_For_Rent__c=1050;
    insert item2;
    
    List<PriceBookEntry> books3=[select id,Name from PriceBookEntry where Name='Variation' AND CurrencyIsoCode = 'AUD'];
    item3 = new OpportunityLineItem();
    item3.OpportunityId=contract1.Id;
    if(books3.size()>0)
       item3.PriceBookEntryId=books3[0].Id;
    item3.Description='Variation';
    item3.Supplier__c='Other';
    item3.Other_Supplier__c='Other';
    item3.UnitPrice=1300;
    item3.Cost_of_Goods__c=500;
    item3.Total_Agreement_Value_For_Rent__c=500;
    insert item3;
    
    item4 = new OpportunityLineItem();
    item4.OpportunityId=contract1.Id;
    if(books.size()>0)
       item4.PriceBookEntryId=books[0].Id;
    item4.Description='Computer';
    item4.Supplier__c='Other';
    item4.Other_Supplier__c='Other';
    item4.UnitPrice=7000;
    item4.Cost_of_Goods__c=2600;
    item4.Total_Agreement_Value_For_Rent__c=4000;
    insert item4;
    
    Payment_File__c paymentFile = new Payment_File__c(
        File_Name__c = 'Unit Test Centrepay payments',
        File_Upload_Date__c = datetime.now()
      );
      insert paymentFile;
      
       paymentCRN = new Payment__c(
          Payment_File__c = paymentFile.Id,
          RecordTypeId    = PaymentUtil.RECORDTYPE_ID_CENTREPAY,
          Customer_Name__c = 'UnitTest Applicant 1',
          Scheduled_Amount__c = 100,
          Actual_Amount__c = 99.01,
          Effective_Date__c = Date.today().addDays(14),
          Payment_Date__c = Date.today().addDays(14),
          Centrelink_Ref_No__c = 'xxxxxxxxxx',
          Fee_Amount__c = 0.99,
          Lodgement_Prefix_Ref_No__c = 'xxxxxxxx',
          Applicantlookup__c=applicant.Id
        );
        insert paymentCRN;
        
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
          Lodgement_Prefix_Ref_No__c = 'xxxxxxxx',
          Applicantlookup__c=applicant.Id
        );
        insert paymentCRN2;
        
        sps = new List<Scheduled_Payment__c>{
        new Scheduled_Payment__c(
          Opportunity__c = contract1.Id,
          Scheduled_Amount__c = 100,
          Scheduled_Date__c = Date.today()
        ),
        new Scheduled_Payment__c(
          Opportunity__c = contract1.Id,
          Scheduled_Amount__c = 100,
          Scheduled_Date__c = Date.today().addDays(14)
        ),
        new Scheduled_Payment__c(
          Opportunity__c = contract1.Id,
          Scheduled_Amount__c = 100,
          Scheduled_Date__c = Date.today().addDays(28)
        ),
        new Scheduled_Payment__c(
          Opportunity__c = contract1.Id,
          Scheduled_Amount__c = 100,
          Scheduled_Date__c = Date.today().addDays(42)
        )
        };
        insert sps;
        
        payAllocations = new List<Payment_Allocation__c>{
        new Payment_Allocation__c(
          Actual_Amount__c = 100,
          Contract__c = contract1.Id,
          RecordTypeId = Util.getRecordTypeInfosByDeveloperName('Payment_Allocation__c').get('Centrepay').Id,
          Payment__c=paymentCRN.Id,
          Scheduled_Payment__c=sps[0].Id,
          Payment_Date__c = Date.today()
        ),
        new Payment_Allocation__c(
          Actual_Amount__c = 100,
          Contract__c = contract1.Id,
          RecordTypeId = Util.getRecordTypeInfosByDeveloperName('Payment_Allocation__c').get('Centrepay').Id,
          Payment__c=paymentCRN2.Id,
          Scheduled_Payment__c=sps[1].Id,
          Payment_Date__c = Date.today()
        )
        };
        insert payAllocations;
        
        equifaxDefault=new Equifax_Defaults__c(
          Applicant__c=applicant.Id,
          Company_Type__c='Rental',
          Company_Name__c='R4K',
          Unpaid_Default_Date__c=Date.today(),
          Amount__c=50,
          Status__c='Paid'
        );
        insert equifaxDefault;
        equifaxDefault2=new Equifax_Defaults__c(
          Applicant__c=applicant.Id,
          Company_Type__c='Non-Rental',
          Company_Name__c='Telstra',
          Unpaid_Default_Date__c=Date.today(),
          Amount__c=60,
          Status__c='Paid'
        );
        insert equifaxDefault2;

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
        
        employee= new Employee__c();
        employee.Name='Shrijit';
        employee.Mobile__c='0469036691';
        employee.Territory__c=territory.Id;
        insert employee;
        
        system.debug('remAmt: '+contract1.Remaining_Amount__c);
  }
  
static testmethod void testUpdateAccount() {
  Test.startTest();
  createTestData();
  
  ApexPages.currentPage().getParameters().put('id',applicant.Id);
  CAMProcessController cp = new CAMProcessController();
  PageReference pageRef = Page.CAMProcess;
  Test.setCurrentPage(pageRef);
  
  cp.getDocuments();
  
  ApexPages.currentPage().getParameters().put('accordionType','');
  ApexPages.currentPage().getParameters().put('nextFormType','next');
  ApexPages.currentPage().getParameters().put('nextSectionType','next');
  
  cp.formType='docs';
  cp.sectionType='id';
  cp.updateAccount();
  cp.sectionType='bank';
  cp.updateAccount();
  cp.sectionType='mygov';
  cp.updateAccount();
  cp.sectionType='referees';
  cp.updateAccount();
  cp.sectionType='equifax';
  cp.updateAccount();
  cp.sectionType='credit';
  cp.updateAccount();
  
  cp.formType='assessment';
  cp.sectionType='ro';
  cp.updateAccount();
  cp.sectionType='id';
  cp.updateAccount();
  cp.sectionType='bank';
  cp.updateAccount();
  cp.sectionType='equifax';
  cp.updateAccount();
  
  Test.stopTest();
}

static testmethod void testOtherUtils() {
  Test.startTest();
  createTestData();
  
  //Account acct = [select id from Account where Enquiry_Status__c='Applicant' and Territory_Number__r.name='100' Limit 1];
  ApexPages.currentPage().getParameters().put('id',applicant.Id);
  CAMProcessController cp = new CAMProcessController();
  PageReference pageRef = Page.CAMProcess;
  Test.setCurrentPage(pageRef);
  cp.getDocuments();
  
  ApexPages.StandardController stdController = new ApexPages.StandardController(applicant);
  NewApplicantProcessController npc = new NewApplicantProcessController(stdController);
  cp.npc = npc;
  cp.npc.Account = new Account();
  cp.npc.Account.Id = applicant.Id;
  cp.npc.successfulEnquiry = true;
  cp.dobVal = '18/10/2000';
  cp.equifaxSearch();
  ApexPages.currentPage().getParameters().put('vedaFileNumber','343232323');
  ApexPages.currentPage().getParameters().put('license','12345');
  ApexPages.currentPage().getParameters().put('gender','Male');
  cp.possibleMatchSearch();
  cp.getEquifaxPdf();
  
  ApexPages.currentPage().getParameters().put('selectedDefaultId',equifaxDefault.Id);
  cp.editDefault();
  cp.saveEditedDefault();
  cp.deleteEditedDefault();
  
  ApexPages.currentPage().getParameters().put('selectedProductId',item.Id);
  cp.editProduct();
  cp.saveEditedProduct();
  
  ApexPages.currentPage().getParameters().put('prodCategory','Phones');
  cp.runSearchForProducts();
  
  Test.stopTest();
}

static testmethod void testHybridLink() {
  Test.startTest();
  Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
  Account acct = [select id from Account where AgreementId_For_Current_Enquiry__c <> null AND Credit_GuideLine__c <> null ORDER BY LastModifiedDate DESC Limit 1];
  ApexPages.currentPage().getParameters().put('id',acct.Id);
  CAMProcessController cp = new CAMProcessController();
  cp.resetHybridLinkId = true;
  cp.resetHybridLinkBank = true;
  cp.resetHybridLinkMyGov = true;
  cp.resendHybridLink();
  Test.stopTest();
}

static testmethod void testOnlineLink() {
  Test.startTest();
  Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
  Account acct = [select id from Account where AgreementId_For_Current_Enquiry__c <> null AND Credit_GuideLine__c <> null ORDER BY LastModifiedDate DESC Limit 1];
  ApexPages.currentPage().getParameters().put('id',acct.Id);
  CAMProcessController cp = new CAMProcessController();
  cp.resetLinkId = false;
  cp.resetLinkBank = false;
  cp.resetLinkMyGov = false;
  cp.resendOnlineLink();
  Test.stopTest();
}

static testmethod void testDocLink() {
  Test.startTest();
  Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
  Account acct = [select id from Account where AgreementId_For_Current_Enquiry__c <> null AND Credit_GuideLine__c <> null ORDER BY LastModifiedDate DESC Limit 1];
  ApexPages.currentPage().getParameters().put('id',acct.Id);
  CAMProcessController cp = new CAMProcessController();
  cp.sendMOGOBankSMS = true;
  cp.sendMOGOMyGovSMS = true;
  cp.createConsentLink();
  Test.stopTest();
}

static testmethod void testCM1() {
  Test.startTest();
  Account acct = [select id from Account where AgreementId_For_Current_Enquiry__c = null AND Credit_GuideLine__c <> null AND Territory_Number__r.Is_Credit_Contract__c = true ORDER BY BankStatement_Completion_Datetime__c DESC Limit 1];
  ApexPages.currentPage().getParameters().put('id',acct.Id);
  CAMProcessController cp = new CAMProcessController();
  cp.getDocuments();  
  cp.checkCriteriaAndCreateAgreement();
  cp.checkCriteriaAndSubmitCreditMatrix();
  cp.getEmployees();
  cp.repName = cp.repList.size() > 1 ? cp.repList[1].getValue() : null;
  cp.selectRepName();
  cp.submitApprovalRequest();
  Test.stopTest();
}

static testmethod void testCM2() {
  Test.startTest();
  Account acct = [select id from Account where AgreementId_For_Current_Enquiry__c <> null AND No_Of_Agreements__c > 0 AND Credit_GuideLine__c <> null ORDER BY LastModifiedDate DESC Limit 1];
  ApexPages.currentPage().getParameters().put('id',acct.Id);
  CAMProcessController cp = new CAMProcessController();
  cp.checkCriteriaBeforeCreatingAgreement();
  cp.checkCriteriaAndCreateAgreement();
  cp.checkCriteriaAndSubmitCreditMatrix();
  cp.submitApprovalRequest();
  Test.stopTest();
}

static testmethod void testRefereeSMS() {
  Test.startTest();
    List<Referee__c> refs = [select id, name,Referee_Name__r.FirstName,Applicant__r.FirstName,Referee_Name__r.MobilePhone,SMS_Referee_Mobile__c,Referee_Name__c,Applicant__c,Applicant__r.OwnerId,Referee_Contact_Link__c from Referee__c where Applicant__c != null ORDER BY CreatedDate DESC LIMIT 1];
    if(refs.size() > 0)
    {
      ApexPages.currentPage().getParameters().put('id',refs[0].Applicant__c);
      ApexPages.currentPage().getParameters().put('formType','docs');
      ApexPages.currentPage().getParameters().put('sectionType','referees');
      ApexPages.currentPage().getParameters().put('refId',refs[0].Id);
      CAMProcessController cp = new CAMProcessController();
      cp.sendRefereeSMSNew();
    }
  Test.stopTest();
}

static testmethod void testOverrideDocs() {
  Test.startTest();
  List<Account> accts = [select id from Account where AgreementId_For_Current_Enquiry__c = null AND (BankStatement_Completion_Datetime__c = LAST_N_DAYS:7 OR PhotoId_Attached_DateTime__c = LAST_N_DAYS:7) ORDER BY BankStatement_Completion_Datetime__c,PhotoId_Attached_DateTime__c DESC Limit 1];
  
  ApexPages.currentPage().getParameters().put('formType','docs');
  
  if(accts.size() > 0)
  {
      ApexPages.currentPage().getParameters().put('sectionType','bank');
      ApexPages.currentPage().getParameters().put('id',accts[0].Id);
      CAMProcessController cp = new CAMProcessController();
      cp.overrideDocs = true;
      cp.overrideDocs();
      
      ApexPages.currentPage().getParameters().put('sectionType','id');
      cp = new CAMProcessController();
      cp.overrideDocs = true;
      cp.overrideDocs();
  }
  Test.stopTest();
}

static testmethod void testEquifaxNZ() {
  Test.startTest();
  List<Account> accts = [select id from Account where Territory_State__c = 'NZ' 
                          AND Application_Signed_Date__c = LAST_N_DAYS:30 ORDER BY CreatedDate DESC LIMIT 1];
  
  if(accts.size() > 0)
  {
      ApexPages.currentPage().getParameters().put('formType','docs');
      ApexPages.currentPage().getParameters().put('sectionType','equifax');
      ApexPages.currentPage().getParameters().put('id',accts[0].Id);
      CAMProcessController cp = new CAMProcessController();
      ApexPages.StandardController stdController = new ApexPages.StandardController(accts[0]);
      NewApplicantProcessController npc = new NewApplicantProcessController(stdController);
      cp.npc = npc;
      cp.npc.Account = new Account();
      cp.npc.Account.Id = accts[0].Id;
      cp.npc.successfulEnquiry = true;
      cp.dobVal = '18/10/2000';
      cp.equifaxSearch();
      cp.getEquifaxPDFNZ();
  }
  Test.stopTest();
}
    
static testmethod void testCAMDN() {
  Test.startTest();
  List<Account> accts = [select id from Account where Territory_State__c = 'NZ' 
                          AND Application_Signed_Date__c = LAST_N_DAYS:30 ORDER BY CreatedDate DESC LIMIT 1];
  
  if(accts.size() > 0)
  {
      ApexPages.currentPage().getParameters().put('formType','docs');
      ApexPages.currentPage().getParameters().put('sectionType','id');
      ApexPages.currentPage().getParameters().put('firstname','mohit');
      ApexPages.currentPage().getParameters().put('id',accts[0].Id);
      CAMProcessController cp = new CAMProcessController();
      cp.enquiryStatus = 'Enquiry';
      cp.enquiryNotes = 'Enquiry';
      cp.reasonWhyApplicationDidNotGoAhead = 'Enquiry';
      cp.changeEnquiryStatusToDN();
      cp.doSecondEquifaxSearch();
      cp.setEquifaxBoolean();
      cp.changePrimaryBenefit();
      cp.toggleOtherBenefits();
      cp.overrideDocs();
      cp.runSearch();
      cp.hideSearchList();
      cp.hideSearchListForProducts();
      List<Referee__c> refList = [SELECT Id,Referee_Name__r.MobilePhone FROM Referee__c 
                                  WHERE Referee_Name__r.MobilePhone <> null ORDER BY CreatedDate DESC LIMIT 1];
      if(refList.size() > 0){
        cp.sendRefereeSMSNew();    
      }
  }
  Test.stopTest();
}

static testmethod void testCAMApproval() {
    Test.startTest();
    List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE Approval_DateTime__c = LAST_N_DAYS:7 LIMIT 1];
    if(oppList.size() > 0){
        ApexPages.currentPage().getParameters().put('oppId',oppList[0].Id);
        CAMProcessController cp = new CAMProcessController();
        cp.getDocuments();
        cp.lineManagerName = 'MP';
        cp.lineManagerComments = 'MP';
        cp.approveApproval();
    }
    Test.stopTest();
}
    static testmethod void testCAMApproval2() {
    Test.startTest();
    List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE Approval_DateTime__c = LAST_N_DAYS:7 LIMIT 1];
    if(oppList.size() > 0){
        ApexPages.currentPage().getParameters().put('oppId',oppList[0].Id);
        CAMProcessController cp = new CAMProcessController();
        cp.getDocuments();
        cp.lineManagerName = 'MP';
        cp.lineManagerComments = 'MP';
        cp.declineApproval();
    }
    Test.stopTest();
}
    static testmethod void testCAMApproval3() {
    Test.startTest();
    List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE Approval_DateTime__c = LAST_N_DAYS:7 LIMIT 1];
    if(oppList.size() > 0){
        ApexPages.currentPage().getParameters().put('oppId',oppList[0].Id);
        CAMProcessController cp = new CAMProcessController();
        cp.getDocuments();
        cp.lineManagerName = 'MP';
        cp.lineManagerComments = 'MP';
        cp.resubmitApproval();
    }
    Test.stopTest();
}

static testmethod void testSendRefereeSMS() {
  Test.startTest();
  List<Account> accts = [select id from Account where Territory_State__c != 'NZ' 
                          AND PersonMobilePhone != null ORDER BY CreatedDate DESC LIMIT 1];
  
  if(accts.size() > 0)
  {
      ApexPages.currentPage().getParameters().put('formType','docs');
      ApexPages.currentPage().getParameters().put('sectionType','referees');
      ApexPages.currentPage().getParameters().put('id',accts[0].Id);
      CAMProcessController cp = new CAMProcessController();
      cp.sendAddRefereeLinkToApplicant();
  }
  Test.stopTest();
}

}