@isTest(seeAllData=true)
private class CollectionBotControllerTest
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

private static testMethod void testCallBot()
{   
   Test.startTest(); 
   createTestData();
   Test.setMock(HttpCalloutMock.class, new TwilioMockCalloutTest());
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.R4KCollectionBot;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('of','CAP User');
   cb.clearAndGetOpenCollections();
   if(cb.colWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.colWrapLst.size(); i++)
       {
           cb.colWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.callCustomers();
   cb.ignore();
   cb.cancel();
   Test.stopTest(); 
}

private static testMethod void testLeadFollowupCallBot()
{   
   Test.startTest(); 
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.R4KCLOEnquiryBot;
   Test.setCurrentPage(myVfPage); 
   cb.getUnAssignedLeads();
   if(cb.leadWrapLst.size()>0)
   {
       Integer cbCount  = cb.leadWrapLst.size() >10 ? 10 : cb.leadWrapLst.size();
       for(Integer i =0 ; i< cbCount; i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.callCustomersForLeadFollowUp();
   cb.stopBotForLeadFollowUp();
   cb.cancelToLeads();
   Test.stopTest(); 
}

private static testMethod void testMarketingCallBot()
{   
   Test.startTest(); 
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.R4KMarketingBot;
   Test.setCurrentPage(myVfPage); 
   cb.clearAndGetOpenMarketingEnquiries();
   if(cb.acctWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
           cb.acctWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.callCustomersForMarketingEnquiries();
   cb.ignoreMarketing();
   cb.cancelToAccounts();
   Test.stopTest(); 
}

/*private static testMethod void testLeadFollowupAndWIPProcessBot()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000Plk1c'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000NIvAvUAL'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Shrijit');
   cb.getWIPUnassignedLeads();
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.addBusinessHours();
   
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.sendHybridLinkSMSForHA();
   
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.sendReminderSMSForHA();
   
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
       }
   }
   ApexPages.currentPage().getParameters().put('chkClearSelfieHA','true');
   ApexPages.currentPage().getParameters().put('chkClearPhotoIdHA','true');
   ApexPages.currentPage().getParameters().put('chkClearMyGovHA','true');
   ApexPages.currentPage().getParameters().put('chkClearBankStHA','true');   
   cb.sendResetHybridLinkSMSForHA();

   
   if(cb.acctWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
           cb.acctWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.sendHybridLinkSMS();
   
   if(cb.acctWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
           cb.acctWrapLst[i].isSelectedToCall = true;
       }
   }
   ApexPages.currentPage().getParameters().put('chkClearSelfie','true');
   ApexPages.currentPage().getParameters().put('chkClearPhotoId','true');
   ApexPages.currentPage().getParameters().put('chkClearMyGov','true');
   ApexPages.currentPage().getParameters().put('chkClearBankSt','true'); 
   cb.sendResetHybridLinkSMS();
   
   if(cb.acctWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
           cb.acctWrapLst[i].isSelectedToCall = true;
       }
   }
   cb.sendReminderSMS();
   
   ApexPages.currentPage().getParameters().put('acctId',applicant.Id);
   cb.getRefereesToBeContacted();
   if(cb.refWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.refWrapLst.size(); i++)
       {
           cb.refWrapLst[i].isSelected = true;
       }
   }
   cb.sendRefereeContactFollowupSMS();
   
   ApexPages.currentPage().getParameters().put('pcId',pc.Id);
   cb.markNotificationAsRead();
   Test.stopTest(); 
}*/

private static testMethod void testLeadFollowupAndWIPProcessBot1()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000Plk1c'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000NIvAvUAL'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Sharon');
   cb.getWIPUnassignedLeads();
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
           break;
       }
   }
   cb.addBusinessHours();
   
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
           break;
       }
   }
   cb.sendHybridLinkSMSForHA();

   Test.stopTest(); 
}

private static testMethod void testLeadFollowupAndWIPProcessBot7()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000Plk1c'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000NIvAvUAL'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Sharon');
   cb.getWIPUnassignedLeads();
   
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
           break;
       }
   }
   ApexPages.currentPage().getParameters().put('smsTextHA','Hi {name}, {link} , the {product}');
   cb.sendReminderSMSForHA();
   
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
           break;
       }
   }
   ApexPages.currentPage().getParameters().put('chkClearSelfieHA','true');
   ApexPages.currentPage().getParameters().put('chkClearPhotoIdHA','true');
   ApexPages.currentPage().getParameters().put('chkClearMyGovHA','true');
   ApexPages.currentPage().getParameters().put('chkClearBankStHA','true');   
   //cb.sendResetHybridLinkSMSForHA();

   Test.stopTest(); 
}

private static testMethod void testLeadFollowupAndWIPProcessBot5()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000Plk1c'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000NIvAvUAL'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Sharon');
   cb.getWIPUnassignedLeads();
   if(cb.leadWrapLst.size()>0)
   {
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           cb.leadWrapLst[i].isSelectedToCall = true;
           break;
       }
   }
   cb.addBusinessHours();
   
   if(cb.leadWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
          if(j<=2)
           cb.leadWrapLst[i].isSelectedToCall = true;
          j++;
          break;
       }
   }
   ApexPages.currentPage().getParameters().put('chkClearSelfieHA','true');
   ApexPages.currentPage().getParameters().put('chkClearPhotoIdHA','true');
   ApexPages.currentPage().getParameters().put('chkClearMyGovHA','true');
   ApexPages.currentPage().getParameters().put('chkClearBankStHA','true');   
   cb.sendResetHybridLinkSMSForHA();

   Test.stopTest(); 
}


private static testMethod void testLeadFollowupAndWIPProcessBot2()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000Plk1c'); //production //a0N6F00000Plk1c
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000Xk3u8UAB'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Shrijit');
   cb.getWIPUnassignedLeads();
   
   cb.acctWrapLst = new List<CollectionBotController.AccountWrapper>();
   CollectionBotController.AccountWrapper aw = new CollectionBotController.AccountWrapper();
   aw.acct=applicant;
   aw.isSelectedToCall=true;
   cb.acctWrapLst.add(aw);
   
   if(cb.acctWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
          if(j<=2)
               cb.acctWrapLst[i].isSelectedToCall = true;
           j++;
           break;
       }
   }
   cb.sendHybridLinkSMS();
   
   if(cb.acctWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
           if(j<=2)
               cb.acctWrapLst[i].isSelectedToCall = true;
           j++;
           break;
       }
   }
   ApexPages.currentPage().getParameters().put('chkClearSelfie','true');
   ApexPages.currentPage().getParameters().put('chkClearPhotoId','true');
   ApexPages.currentPage().getParameters().put('chkClearMyGov','true');
   ApexPages.currentPage().getParameters().put('chkClearBankSt','true'); 
   cb.sendResetHybridLinkSMS();
   
   if(cb.acctWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
           if(j<=2){
               cb.acctWrapLst[i].isSelectedToCall = true;
               cb.acctWrapLst[i].opp = [SELECT Id,AccountId FROM Opportunity WHERE Account.Company_Territory__c = true ORDER BY CreatedDate DESC LIMIT 1];
           }
           j++;
           break;
       }
   }
   ApexPages.currentPage().getParameters().put('smsText','Hi {name}, {link} , the {product}');
   ApexPages.currentPage().getParameters().put('signLink','yes');
   cb.sendReminderSMS();
   
   /*ApexPages.currentPage().getParameters().put('acctId',applicant.Id);
   cb.getRefereesToBeContacted();
   if(cb.refWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.refWrapLst.size(); i++)
       {
           if(j<=2)
               cb.refWrapLst[i].isSelected = true;
           j++;
           break;
       }
   }
   cb.sendRefereeContactFollowupSMS();
   
   ApexPages.currentPage().getParameters().put('pcId',pc.Id);
   cb.markNotificationAsRead();*/
}

private static testMethod void testLeadFollowupAndWIPProcessBot3()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000Xk3u8UAB'); //production //a0N6F00000Plk1c
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000NIvAvUAL'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Shrijit');
   cb.getWIPUnassignedLeads();
   
   cb.acctWrapLst = new List<CollectionBotController.AccountWrapper>();
   CollectionBotController.AccountWrapper aw = new CollectionBotController.AccountWrapper();
   aw.acct=applicant;
   aw.isSelectedToCall=true;
   cb.acctWrapLst.add(aw);
   
   if(cb.acctWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
       {
           if(j<=2)
               cb.acctWrapLst[i].isSelectedToCall = true;
           j++;
           break;
       }
   }
   
   ApexPages.currentPage().getParameters().put('acctId',applicant.Id);
   cb.getRefereesToBeContacted();
   if(cb.refWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.refWrapLst.size(); i++)
       {
           if(j<=2)
               cb.refWrapLst[i].isSelected = true;
           j++;
           break;
       }
   }
   cb.sendRefereeContactFollowupSMS();
   
   ApexPages.currentPage().getParameters().put('pcId',pc.Id);
   cb.markNotificationAsRead();
}

private static testMethod void testUnasssignedLeadsTobeConvertedToDNC()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGWUAZ'); //production
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGWUAZ'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Sharon');
   cb.getWIPUnassignedLeads();
   
   if(cb.leadWrapLst.size()>0)
   {
       Integer j=0;
       for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
       {
           if(j<=3)
               cb.leadWrapLst[i].isSelectedToCall = true;
           j++;
       }
   }
   cb.getAndMapApplicantsTobeConverted();
   for(Integer i =0 ; i< cb.leadSearchWrapLst.size(); i++)
    {
        if(cb.leadSearchWrapLst[i].applicantSearchWrapLst != null && cb.leadSearchWrapLst[i].applicantSearchWrapLst.size() > 0){
            cb.leadSearchWrapLst[i].applicantSearchWrapLst[0].isSelected = true;
        }
    }
   cb.convertToDN();
   RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Enquiry' limit 1];
   cb.createApplicant(testLead,'a0N6F00000K5nGWUAZ','Enquiry',personAccountRecordType.Id,null);
}

private static testMethod void testUnasssignedLeadsTobeAddedToWeCare()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000Plk1cUAB'); //production
   ApexPages.currentPage().getParameters().put('eid','a0N6F00000Plk1c'); //production
   //ApexPages.currentPage().getParameters().put('eid','a0N6F00000K5nGZ'); // sandbox
   ApexPages.currentPage().getParameters().put('tp','Sharon');
   cb.getWIPUnassignedLeads();
   
    if(cb.leadWrapLst.size()>0)
    {
        Integer j=0;
        for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
        {
            if(i<=3){
                cb.leadWrapLst[i].isSelectedToCall = true;
            }
        }
    }
   cb.getAndMapApplicantsTobeConverted();
   for(Integer i =0 ; i< cb.leadSearchWrapLst.size(); i++)
    {
        if(cb.leadSearchWrapLst[i].applicantSearchWrapLst != null && cb.leadSearchWrapLst[i].applicantSearchWrapLst.size() > 0){
            cb.leadSearchWrapLst[i].applicantSearchWrapLst[0].isSelected = true;
        }
    }
   cb.addToWeCare();
}

private static testMethod void testEmployeeAssignment()
{   
   Test.startTest();
   createTestData();
   
   CollectionBotController cb = new CollectionBotController();
   PageReference myVfPage = Page.CLOLeadManager;
   Test.setCurrentPage(myVfPage); 
   ApexPages.currentPage().getParameters().put('state','VIC');
   cb.getWIPUnassignedLeads();
   cb.getEmployeesToAssign();
   
   cb.acctWrapLst = new List<CollectionBotController.AccountWrapper>();
   CollectionBotController.AccountWrapper aw = new CollectionBotController.AccountWrapper();
   aw.acct=applicant;
   aw.isSelectedToCall=true;
   cb.acctWrapLst.add(aw);
   
   cb.assignRepResponsible();
   cb.getPUAApprovedApplicants();
}

private static testMethod void testGetWIP()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    ApexPages.currentPage().getParameters().put('state','VIC');
    List<Account> wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,Rep_Responsible_For_Converting_Lead__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where Enquiry_Status__c in ('Enquiry','Applicant') and Rep_Responsible_For_Converting_Lead__c != null AND State_Master_State__c = 'VIC' AND
                                 Rep_Responsible_For_Converting_Lead__r.Name = 'Hybrid Application' and Enquiry_Date__c = LAST_N_DAYS:60 and 
                                 Next_Followup_Datetime__c=null order by Enquiry_Date__c desc LIMIT 1];
    if(wipacctList.size() > 0){
        ApexPages.currentPage().getParameters().put('eid',wipacctList[0].Rep_Responsible_For_Converting_Lead__c);
        ApexPages.currentPage().getParameters().put('tp','Mohit');
        cb.getWIP();
    }
    Test.stopTest();
}

private static testMethod void testGetWIPUnassigned()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    ApexPages.currentPage().getParameters().put('state','VIC');
    ApexPages.currentPage().getParameters().put('region','VIC');
    List<Account> wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,Rep_Responsible_For_Converting_Lead__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where Enquiry_Status__c in ('Enquiry','Applicant') and Rep_Responsible_For_Converting_Lead__c != null AND State_Master_State__c = 'VIC' AND
                                 Rep_Responsible_For_Converting_Lead__r.Name = 'Hybrid Application' and Enquiry_Date__c = LAST_N_DAYS:60 and 
                                 Next_Followup_Datetime__c=null order by Enquiry_Date__c desc LIMIT 1];
    if(wipacctList.size() > 0){
        ApexPages.currentPage().getParameters().put('eid',wipacctList[0].Rep_Responsible_For_Converting_Lead__c);
        ApexPages.currentPage().getParameters().put('tp','Mohit');
        ApexPages.currentPage().getParameters().put('type','apr');
        cb.getPUAApprovedApplicants();
        ApexPages.currentPage().getParameters().put('type','call');
        ApexPages.currentPage().getParameters().put('tp',null);
        cb.getFilteredConversations();
        if(cb.leadWrapLst.size() > 0){
            cb.leadWrapLst[0].isSelectedToCall = true;
            cb.communicatedBack();
        }
        ApexPages.currentPage().getParameters().put('type','sms');
        ApexPages.currentPage().getParameters().put('tp',null);
        ApexPages.currentPage().getParameters().put('smsTextHA','Hi {name}, {link} , the {product}');
        cb.getWIPUnassignedLeads();
        cb.leadWrapLst = new List<CollectionBotController.LeadWrapper>();
        if(cb.conversationWrapperList != null && cb.conversationWrapperList.size() > 0){
            cb.conversationWrapperList[0].isSelected = true;
            cb.sendReminderSMSForHA();
            cb.communicatedBack();
        }
        ApexPages.currentPage().getParameters().put('tp','mohit');
        ApexPages.currentPage().getParameters().put('type','sms');
        cb.getWIPUnassignedLeads();
        cb.leadWrapLst = new List<CollectionBotController.LeadWrapper>();
        if(cb.conversationWrapperList != null && cb.conversationWrapperList.size()>0)
        {
            Integer j=0;
            for(Integer i =0 ; i< cb.conversationWrapperList.size(); i++)
            {
                if(i<=3){
                    cb.conversationWrapperList[i].isSelected = true;
                }
            }
        }
        cb.getAndMapApplicantsTobeConverted();
        cb.getCountOfEachType();
    }
    Test.stopTest();
}

private static testMethod void testConvertToDN()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    ApexPages.currentPage().getParameters().put('state','VIC');
    ApexPages.currentPage().getParameters().put('region','VIC');
    List<Account> wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,Rep_Responsible_For_Converting_Lead__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where Enquiry_Status__c in ('Enquiry','Applicant') and Rep_Responsible_For_Converting_Lead__c != null AND State_Master_State__c = 'VIC' AND
                                 Rep_Responsible_For_Converting_Lead__r.Name = 'Hybrid Application' and Enquiry_Date__c = LAST_N_DAYS:60 and 
                                 Next_Followup_Datetime__c=null order by Enquiry_Date__c desc LIMIT 1];
    if(wipacctList.size() > 0){
        ApexPages.currentPage().getParameters().put('eid',wipacctList[0].Rep_Responsible_For_Converting_Lead__c);
        ApexPages.currentPage().getParameters().put('tp','Mohit');
        ApexPages.currentPage().getParameters().put('type','nonst');
        cb.getWIPUnassignedLeads();
        if(cb.leadWrapLst.size()>0)
        {
            Integer j=0;
            for(Integer i =0 ; i< cb.leadWrapLst.size(); i++)
            {
                if(i<=3){
                    cb.leadWrapLst[i].isSelectedToCall = true;
                }
            }
        }
        cb.getAndMapApplicantsTobeConverted();
        for(Integer i =0 ; i< cb.leadSearchWrapLst.size(); i++)
        {
            if(cb.leadSearchWrapLst[i].applicantSearchWrapLst != null && cb.leadSearchWrapLst[i].applicantSearchWrapLst.size() > 0){
                cb.leadSearchWrapLst[i].applicantSearchWrapLst[0].isSelected = true;
            }
        }
        cb.convertToDN();
        ApexPages.currentPage().getParameters().put('smsText','Hi {name}, {link} , the {product}');
        ApexPages.currentPage().getParameters().put('signLink','yes');
        cb.sendReminderSMS();
    }
    Test.stopTest();
}

private static testMethod void testSendReminderSMS()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    ApexPages.currentPage().getParameters().put('state','VIC');
    ApexPages.currentPage().getParameters().put('region','VIC');
    List<Account> wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,Rep_Responsible_For_Converting_Lead__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where Enquiry_Status__c in ('Enquiry','Applicant') and Rep_Responsible_For_Converting_Lead__c != null AND State_Master_State__c = 'VIC' AND
                                 Rep_Responsible_For_Converting_Lead__r.Name = 'Hybrid Application' and Enquiry_Date__c = LAST_N_DAYS:60 and SMS_Mobile__c != null AND
                                 Next_Followup_Datetime__c=null order by Enquiry_Date__c desc LIMIT 1];
    if(wipacctList.size() > 0){
        PhoneCall__c incpc3 = new PhoneCall__c();
        incpc3.Call_Type__c = 'Incoming SMS';
        incpc3.Type__c = 'R4K LICENSING';
        incpc3.Medium__c = 'Browser';
        incpc3.Mobile__c = wipacctList[0].SMS_Mobile__c;
        incpc3.Account__c = wipacctList[0].Id;
        insert incpc3;

        smagicinteract__smsMagic__c incSMS3 = new smagicinteract__smsMagic__c();
        incSMS3.smagicinteract__PhoneNumber__c = wipacctList[0].SMS_Mobile__c;
        incSMS3.smagicinteract__Direction__c = 'IN';
        incSMS3.smagicinteract__SMSText__c = 'CALL NOW';
        incSMS3.smagicinteract__SenderId__c = '61488884542';
        incSMS3.smagicinteract__external_field__c = String.valueOf(Datetime.now().getTime());
        incSMS3.smagicinteract__Account__c = wipacctList[0].Id;
        insert incSMS3;

        ApexPages.currentPage().getParameters().put('eid',wipacctList[0].Rep_Responsible_For_Converting_Lead__c);
        ApexPages.currentPage().getParameters().put('tp','Mohit');
        ApexPages.currentPage().getParameters().put('type','apr');
        cb.getWIP();
        if(cb.acctWrapLst.size()>0)
        {
            for(Integer i =0 ; i< cb.acctWrapLst.size(); i++)
            {
                if(i<=2)
                    cb.acctWrapLst[i].isSelectedToCall = true;
            }
        }
        ApexPages.currentPage().getParameters().put('smsText','Hi {name}, {link} , the {product}');
        ApexPages.currentPage().getParameters().put('signLink','signLink');
        Apexpages.currentPage().getParameters().put('chkClearSelfie','true');
        Apexpages.currentPage().getParameters().put('chkClearPhotoId','true');
        Apexpages.currentPage().getParameters().put('chkClearMyGov','true');
        Apexpages.currentPage().getParameters().put('chkClearBankSt','true');
        cb.sendReminderSMS();
        cb.sendResetHybridLinkSMS();
    }
    Test.stopTest();
}

private static testMethod void testGetUnAssignedLeads2()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    cb.getUnAssignedLeads2();
    Test.stopTest();
}

private static testMethod void testConvertToDN2()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    ApexPages.currentPage().getParameters().put('tp','Mohit');
    ApexPages.currentPage().getParameters().put('type','nonst');
    cb.getWIPUnassignedLeads();
    List<Lead> phoneCallLeads;
    String ldlstSOQL = 'select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,';
    ldlstSOQL+=  'Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,';
    ldlstSOQL+= 'OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,';
    ldlstSOQL+='Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,';
    ldlstSOQL+='Account__r.Name,Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,';
    ldlstSOQL+= 'Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Account__r.PUA_Status__c,Probable_Territory__c,Probable_Territory__r.State_Master_State__c';
    ldlstSOQL+=  ' from Lead where IsConverted = true AND Territory_Number__r.Name = \'3000\' ORDER BY CreatedDate DESC LIMIT 1';
    phoneCallLeads = Database.query(ldlstSOQL);
    cb.getAndMapApplicantsTobeConverted();
    if(phoneCallLeads.size() > 0){
        cb.searchAndRetrieveApplicants(phoneCallLeads[0]);
        for(Integer i =0 ; i< cb.leadSearchWrapLst.size(); i++)
        {
            if(cb.leadSearchWrapLst[i].applicantSearchWrapLst != null && cb.leadSearchWrapLst[i].applicantSearchWrapLst.size() > 0){
                cb.leadSearchWrapLst[i].applicantSearchWrapLst[0].isSelected = true;
            }
        }
        cb.convertToDN();    
    }
    cb.redirectToCallPage();
    Test.stopTest();
}

private static testMethod void testGetUnassignedProfile()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('tp','Sharon');
    ApexPages.currentPage().getParameters().put('type','nonst');
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    cb.getUnAssignedLeads();
    ApexPages.currentPage().getParameters().put('profile','Darranda CLO');
    cb.getUnAssignedLeads();
    ApexPages.currentPage().getParameters().put('profile','NSW CLO');
    cb.getUnAssignedLeads();
    ApexPages.currentPage().getParameters().put('profile','NZ CLO');
    cb.getUnAssignedLeads();
    ApexPages.currentPage().getParameters().put('profile','QLD CLO');
    cb.getUnAssignedLeads();
}

private static testMethod void testGetUnassigned2Profile()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('tp','Sharon');
    ApexPages.currentPage().getParameters().put('type','nonst');
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    cb.getUnAssignedLeads2();
    ApexPages.currentPage().getParameters().put('profile','Darranda CLO');
    cb.getUnAssignedLeads2();
    ApexPages.currentPage().getParameters().put('profile','NSW CLO');
    cb.getUnAssignedLeads2();
    ApexPages.currentPage().getParameters().put('profile','NZ CLO');
    cb.getUnAssignedLeads2();
    ApexPages.currentPage().getParameters().put('profile','QLD CLO');
    cb.getUnAssignedLeads2();
}

private static testMethod void testGetWIPProfile()
{   
    createTestData();
    Test.startTest();
    CollectionBotController cb = new CollectionBotController();
    PageReference myVfPage = Page.CLOLeadManager;
    Test.setCurrentPage(myVfPage); 
    ApexPages.currentPage().getParameters().put('tp','Sharon');
    ApexPages.currentPage().getParameters().put('type','nonst');
    ApexPages.currentPage().getParameters().put('profile','R4K Licensing');
    cb.getWIP();
    ApexPages.currentPage().getParameters().put('profile','Darranda CLO');
    cb.getWIP();
    ApexPages.currentPage().getParameters().put('profile','NSW CLO');
    cb.getWIP();
    ApexPages.currentPage().getParameters().put('profile','NZ CLO');
    cb.getWIP();
    ApexPages.currentPage().getParameters().put('profile','QLD CLO');
    cb.getWIP();
}

}