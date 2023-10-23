@IsTest(SeeAllData=true)
private class NewEnquirySectionControllerTest{

static testmethod void testNewEnquiryForExistingAccount() {
Test.startTest();
Account acct= new Account();

User [] uList = [select Id,Territory__c from User where id=:UserInfo.getUserId()];

if(uList.size()>0)
{
Territory__c [] terList=[select id, name,Short_Name__c from Territory__c where name=:uList[0].Territory__c];
if(terList.size()>0)
{

List<Applicant_Status__c> appstats = [SELECT Id,Name,Status__c,CreatedDate,Activation_Code__c,Scheduled_Amount__c,Actual_Amount__c,Effective_Date__c,Account__c,Account__r.Territory_Number__c,Account__r.Id FROM Applicant_Status__c WHERE Account__c != null AND Account__r.Id != null AND Account__r.Territory_Number__c <>: terList[0].Id AND Activation_Code__c = 'ITI' AND CreatedDate = LAST_N_DAYS:30 LIMIT 1];
  
if(appstats.size() > 0){
    String acctId = appstats[0].Account__r.Id;
    
    Account [] accts=[select id,Name,Firstname,LastName,PersonLeadSource,PersonMobilePhone,Birthdate__c,Product_Interested_In__c,
            Product_Description__c,Middle_Name__pc,Previous_Name__c,Identification_No__c,PersonEmail,PersonHomePhone,PersonMailingStreet,
            PersonMailingCity,PersonMailingState,PersonMailingPostalCode,Sensis_Latitude__c,Sensis_Longitude__c,Previous_Address__c,
            Number_of_Dependants__c,General_Notes__c,Employment_Income__c,Existing_R4K_Payment__c,Is_Disability_Support_Pension__c,Enquiry_Notes__c,
            Rent_Mortgage_Board__c,Centrelink_Benefit__c,Loan_Payments__c,Centrelink_Benefit_Amount__c,Car_Lease_Loan_Payment__c,Notes__c,
            Centrelink_Benefit2__c,Credit_Card__c,Centrelink_Benefit2_Amount__c,Other_Rental_Companies__c,Centrelink_Benefit3__c,Insurance__c,
            Centrelink_Benefit3_Amount__c,Utilities__c,Other_Centrelink_Benefit__c,Food__c,Other_Centrelink_Benefit_Amount__c,Clothing__c,
            Highlevel_Income__c,Tobacco_Alcohol__c,Serviceability__c,OtherOutgoings__c,Credit_Check_Consent__c,Comfortable_Spending__c,
            RequestOwnerforBuyout__c,Buyer_Territory__c,Territory_Number__r.id,OwnerId,No_of_times_lead_has_been_converted__c,
            Lead_Employment_Income__c,Lead_Rent__c,Lead_Total_Centrelink_Benefit_Amount__c,Lead_Utilities__c,Lead_Highlevel_Income__c,
            Lead_Food__c,Lead_Serviceability__c,Lead_Other_Outgoings__c,Lead_Comfortable_Spending__c,Reason_for_Enquiry__c,
            Territory_Number__r.Short_Name__c,Territory_Number__r.Mobile__c,Territory_Number__r.Email__c,Territory_Number__c
            from Account where Id =: acctId limit 1 ]; 
    
    
    
    Lead [] leads=[select id from Lead where id<>'' limit 1];
    
    if(accts.size()>0 && leads.size()>0)
    { 
      PageReference pageRef = Page.newenquirysectionpage;
      Test.setCurrentPage(pageRef);
      ApexPages.currentPage().getParameters().put('acctId',accts[0].id);
      ApexPages.currentPage().getParameters().put('leadId',leads[0].id);
      
      ApexPages.StandardController stdController = new ApexPages.StandardController(accts[0]);
      NewEnquirySectionController controller = new NewEnquirySectionController(stdController);
      controller.requestForBuyout='Yes';
      controller.SetApplicantValues(accts[0].id,leads[0].id);
      controller.save();
      
      controller.requestForBuyout='No';
      controller.save();
      
      controller.leadId='';
      controller.requestForBuyout='No';
      controller.save();
      
      controller.redirectToEditApplication();  
    } 
}

}
}
  Test.stopTest();
}


static testmethod void testNewEnquiryForNewAccount() {
  Test.startTest();
  Account acct= new Account();
  Lead [] leads=[select id from Lead where id<>'' limit 1];
  PageReference pageRef = Page.newenquirysectionpage;
  Test.setCurrentPage(pageRef);
  //ApexPages.currentPage().getParameters().put('acctId',acct.id);
  ApexPages.currentPage().getParameters().put('ownerName','a');
  ApexPages.currentPage().getParameters().put('leadId',leads[0].id);
  
  ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
  NewEnquirySectionController controller = new NewEnquirySectionController(stdController);
  controller.getEmployees();
  controller.runQuery();
  controller.runSearch();
  controller.hideSearchList();
  controller.save();
  
  controller.account.FirstName='first';
  controller.save();
  
  controller.account.LastName='last';
  controller.save();
  controller.next();
  controller.saveAndClose();
  controller.redirectToEditApplication(); 
  Test.stopTest();
}

static testmethod void testNewEnquiryForNewAccountWithLead() {
  Test.startTest();
  Account acct= new Account();
  Lead [] leads=[select id from Lead where id<>'' limit 1];
  PageReference pageRef = Page.newenquirysectionpage;
  Test.setCurrentPage(pageRef);
  //ApexPages.currentPage().getParameters().put('acctId',acct.id);
  ApexPages.currentPage().getParameters().put('ownerName','a');
  ApexPages.currentPage().getParameters().put('leadId',leads[0].id);
  
  ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
  NewEnquirySectionController controller = new NewEnquirySectionController(stdController);
  controller.runQuery();
  controller.runSearch();
  controller.hideSearchList();
  
  controller.account.FirstName='first';
  
  controller.account.LastName='last';
  
  controller.territorySearchQuery = '00';
  controller.searchTerritories();
  
  ApexPages.currentPage().getParameters().put('selectedTerritoryIndex','0');
  controller.updateSelectedTerritory();
  
  controller.save();
  controller.next();
  controller.saveAndClose();
  controller.redirectToEditApplication(); 
  Test.stopTest();
}

static testmethod void testNewEnquiryForNewAccountWithLeadNoSearch() {
  Test.startTest();
  Account acct= new Account();
  Lead [] leads=[select id,OwnerId from Lead where id<>'' AND OwnerId =: UserInfo.getUserId() limit 1];
  System.debug('***********owner: ' + leads[0].OwnerId);
  PageReference pageRef = Page.newenquirysectionpage;
  Test.setCurrentPage(pageRef);
  ApexPages.currentPage().getParameters().put('leadId',leads[0].id);
  
  ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
  NewEnquirySectionController controller = new NewEnquirySectionController(stdController);
  controller.runQuery();
  controller.runSearch();
  controller.hideSearchList();
  System.debug('************territorylist: ' + controller.territoryIdsWithRecordAccess);
  
  controller.account.FirstName='first';
  
  controller.account.LastName='last';
  
  controller.save();
  controller.next();
  controller.saveAndClose();
  controller.redirectToEditApplication(); 
  Test.stopTest();
}


static testmethod void testNewEnquiryForNewAccountNoLead() {
  Test.startTest();
  Account acct= new Account();
  Lead [] leads=[select id from Lead where id<>'' limit 1];
  PageReference pageRef = Page.newenquirysectionpage;
  Test.setCurrentPage(pageRef);
  
  ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
  NewEnquirySectionController controller = new NewEnquirySectionController(stdController);
  controller.runQuery();
  controller.runSearch();
  controller.hideSearchList();
  
  controller.account.FirstName='first';
  
  controller.account.LastName='last';
  
  controller.territorySearchQuery = '00';
  controller.searchTerritories();
  
  ApexPages.currentPage().getParameters().put('selectedTerritoryIndex','0');
  controller.updateSelectedTerritory();
  
  controller.save();
  controller.next();
  controller.saveAndClose();
  controller.redirectToEditApplication(); 
  Test.stopTest();
}

static testmethod void testQuickAction() {
  Test.startTest();
  
  Account acct= new Account();
  Lead [] leads = [select id from Lead where id<>'' limit 1];
  List<Account> acctList = [SELECT Id,FirstName,LastName,PersonMobilePhone,PersonEmail,Reason_for_Enquiry__c,Enquiry_Notes__c,
                            PersonMailingStreet,PersonMailingCity,PersonMailingState,Product_Description__c,Territory_Number__c, 
                            OwnerId, Next_CAM_Step__c, No_of_times_lead_has_been_converted__c FROM Account WHERE 
                            Enquiry_Date__c = LAST_N_DAYS:20 AND Enquiry_Status__c = 'Enquiry' LIMIT 1];  
  
  PageReference pageRef = Page.newenquirysectionpage;
  Test.setCurrentPage(pageRef);
  
  ApexPages.currentPage().getParameters().put('acctId',acctList[0].Id);
  ApexPages.currentPage().getParameters().put('leadId',leads[0].Id);
  
  ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
  NewEnquirySectionController controller = new NewEnquirySectionController(stdController);  
  controller.cancel();
  controller.createSmartRecommendation(acctList[0].Id);
  controller.sv.docsPending = false;
  controller.sv.assessmentPending = false;
  controller.sv.sourcingPending = true;
  controller.sv.nextSourcingStep = 'Outstanding Purchase Receipt';  
  controller.quickConvert(); 
  
    ApexPages.currentPage().getParameters().put('acctId',acctList[0].Id);
  ApexPages.currentPage().getParameters().put('leadId','');
  
  ApexPages.StandardController stdController2 = new ApexPages.StandardController(acct);
  NewEnquirySectionController controller2 = new NewEnquirySectionController(stdController2);
  controller2.createSmartRecommendation(acctList[0].Id);
  controller2.sv.docsPending = false;
  controller2.sv.assessmentPending = true;
  controller2.sv.sourcingPending = false;
  controller2.sv.nextAssessStep = 'Equifax';
  controller2.quickConvert();
    
  ApexPages.currentPage().getParameters().put('acctId',acctList[0].Id);
  ApexPages.currentPage().getParameters().put('leadId','');
  
  ApexPages.StandardController stdController3 = new ApexPages.StandardController(acct);
  NewEnquirySectionController controller3 = new NewEnquirySectionController(stdController3);
  controller3.createSmartRecommendation(acctList[0].Id);
  controller3.sv.docsPending = true;
  controller3.sv.assessmentPending = false;
  controller3.sv.sourcingPending = false;
  controller3.sv.nextDocsStep = 'Add Referees';
  controller3.quickConvert();  
    
  Test.stopTest();
}

static testmethod void testLeadTransferNewAccount1() {
    Test.startTest();
    
    //Lead Present
    Lead [] leads = [Select Id FROM Lead WHERE Id <> '' AND Owner.Name != 'Andy Head Office'  AND Owner.Name != 'Amanda Greensborough' AND Lead_Medium__c != 'Fonebox' AND Lead_Medium__c != 'Web' AND Territory_Number__c != null LIMIT 4];  
    Account acct = new Account();
    
    if(leads.size() > 0){
        ApexPages.currentPage().getParameters().put('leadId',leads[0].Id);
        ApexPages.currentPage().getParameters().put('acctId','');
        ApexPages.currentPage().getParameters().put('pfname','Mohit');
        ApexPages.currentPage().getParameters().put('plname','Puli');
        ApexPages.currentPage().getParameters().put('psuburb','Blackburn');
        ApexPages.currentPage().getParameters().put('pmobile','0449066375');
        
        ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
        NewEnquirySectionController controller = new NewEnquirySectionController(stdController);
        controller.enquiryStatus = 'Enquiry';
        controller.ownerName = 'Amanda Greensborough';
        controller.save(); 
    }
    
    Account acct2 = new Account();
    ApexPages.currentPage().getParameters().put('leadId','');
    ApexPages.currentPage().getParameters().put('acctId','');
    ApexPages.currentPage().getParameters().put('pfname','Mohit');
    ApexPages.currentPage().getParameters().put('plname','Puli');
    ApexPages.currentPage().getParameters().put('psuburb','Blackburn');
    ApexPages.currentPage().getParameters().put('pmobile','0449066375');
    
    ApexPages.StandardController stdController2 = new ApexPages.StandardController(acct2);
    NewEnquirySectionController controller2 = new NewEnquirySectionController(stdController2);
    controller2.enquiryStatus = 'Enquiry';
    controller2.ownerName = 'Amanda Greensborough';
    controller2.save(); 
    
    if(leads.size() > 1){
        Account acct3 = new Account();
        ApexPages.currentPage().getParameters().put('leadId',leads[1].Id);
        ApexPages.currentPage().getParameters().put('acctId','');
        ApexPages.currentPage().getParameters().put('pfname','Mohit');
        ApexPages.currentPage().getParameters().put('plname','Puli');
        ApexPages.currentPage().getParameters().put('psuburb','Blackburn');
        ApexPages.currentPage().getParameters().put('pmobile','0449066375');
        
        ApexPages.StandardController stdController3 = new ApexPages.StandardController(acct3);
        NewEnquirySectionController controller3 = new NewEnquirySectionController(stdController3);
        controller3.enquiryStatus = 'Enquiry';
        controller3.ownerName = 'Amanda Greensborough';
        controller3.territoryNamesWithRecordAccess = new List<String>();
        controller3.save(); 
    }
    
    Test.stopTest();
}

static testmethod void testLeadTransferNewAccount2() {
    Test.startTest();
    
    Account acct4 = new Account();
    ApexPages.currentPage().getParameters().put('leadId','');
    ApexPages.currentPage().getParameters().put('acctId','');
    ApexPages.currentPage().getParameters().put('pfname','Mohit');
    ApexPages.currentPage().getParameters().put('plname','Puli');
    ApexPages.currentPage().getParameters().put('psuburb','Blackburn');
    ApexPages.currentPage().getParameters().put('pmobile','0449066375');
    
    ApexPages.StandardController stdController4 = new ApexPages.StandardController(acct4);
    NewEnquirySectionController controller4 = new NewEnquirySectionController(stdController4);
    controller4.enquiryStatus = 'Enquiry';
    controller4.ownerName = 'Amanda Greensborough';
    controller4.territoryNamesWithRecordAccess = new List<String>();
    controller4.save(); 
    
    Test.stopTest();
}
static testmethod void testLeadTransferNewAccount3() {
    Test.startTest();
    
    //Lead Present
    Lead [] leads = [Select Id FROM Lead WHERE Id <> '' AND Owner.Name != 'Andy Head Office'  AND Owner.Name != 'Amanda Greensborough' AND Lead_Medium__c != 'Fonebox' AND Lead_Medium__c != 'Web' AND Territory_Number__c != null LIMIT 1];  

    if(leads.size() > 0){
        Account acct5 = new Account();
        ApexPages.currentPage().getParameters().put('leadId',leads[0].Id);
        ApexPages.currentPage().getParameters().put('acctId','');
        ApexPages.currentPage().getParameters().put('pfname','Mohit');
        ApexPages.currentPage().getParameters().put('plname','Puli');
        ApexPages.currentPage().getParameters().put('psuburb','Blackburn');
        ApexPages.currentPage().getParameters().put('pmobile','0449066375');
        
        ApexPages.StandardController stdController5 = new ApexPages.StandardController(acct5);
        NewEnquirySectionController controller5 = new NewEnquirySectionController(stdController5);
        controller5.territoryNamesWithRecordAccess = new List<String>();
        controller5.save();
        controller5.getOwnerId('','','220 Coffsharbour');    
    }
    
    Test.stopTest();
}

static testmethod void testUnhandledLeads() {
    Test.startTest();
    
    Account acct = [SELECT Id FROM Account WHERE Enquiry_Status__c = 'Enquiry' ORDER BY CreatedDate LIMIT 1];
    
    ApexPages.currentPage().getParameters().put('leadId','');
    ApexPages.currentPage().getParameters().put('acctId',acct.Id);
    
    ApexPages.StandardController stdController = new ApexPages.StandardController(acct);
    NewEnquirySectionController controller = new NewEnquirySectionController(stdController);
    controller.handleUnconvertedLeads(acct.Id);
    
    Test.stopTest();
}

static testmethod void testGetUnconvertedLeads() 
{
    Test.startTest();
    ApexPages.currentPage().getParameters().put('leadCount','1');
    ApexPages.currentPage().getParameters().put('searchString','04');
    NewEnquirySectionController controller = new NewEnquirySectionController();
    controller.getUnconvertedLeads();
    if(controller.leadWrapperList.size() > 0)
    {
        controller.leadWrapperList[0].isSelected = true;
        controller.mergeLeads();
    }
    Test.stopTest();
}

static testmethod void testMergeLeads() 
{
    Test.startTest();
    ApexPages.currentPage().getParameters().put('leadCount','2');
    ApexPages.currentPage().getParameters().put('searchString','04');
    NewEnquirySectionController controller = new NewEnquirySectionController();
    controller.getUnconvertedLeads();
    if(controller.leadWrapperList.size() > 1)
    {
        controller.leadWrapperList[0].isSelected = true;
        controller.leadWrapperList[1].isSelected = true;
        controller.getSelectedLeads();
        controller.selectedLeadWrapperList[1].isMasterRecord = true;
        controller.mergeLeads();
    }
    Test.stopTest();
}

static testmethod void testGetLeadsMatchingMobile() 
{
    Test.startTest();
    ApexPages.currentPage().getParameters().put('searchString','04');
    NewEnquirySectionController controller = new NewEnquirySectionController();
    controller.getLeadsMatchingMobile();
    Test.stopTest();
}

static testmethod void testCalculateCallTime() 
{
    Test.startTest();
    List<Lead> leadList = [SELECT Id,Account__c FROM Lead WHERE IsConverted = true AND Account__c <> null AND ((((Territory_Number__r.State_Master_State__c = 'VIC' OR Territory_Number__r.State_Master_State__c = 'SA' 
                         OR Territory_Number__r.State_Master_State__c = 'NSW' OR Territory_Number__r.State_Master_State__c = 'WA') 
                        AND Territory_Number__r.Company_Territory__c = true)) OR Territory_Number__r.Short_Name__c = 'Greensborough' OR 
                      Territory_Number__r.Short_Name__c = 'Wide Bay') ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0)
    {
        NewEnquirySectionController controller = new NewEnquirySectionController();
        controller.calculateCallTime(leadList[0].Account__c,leadList[0].Id);
    }
    Test.stopTest();
}

static testmethod void testBulkCalculateCallTime() 
{
    Test.startTest();
    List<Lead> leadList = [SELECT Id,Account__c FROM Lead WHERE IsConverted = true AND Account__c <> null AND ((((Territory_Number__r.State_Master_State__c = 'VIC' OR Territory_Number__r.State_Master_State__c = 'SA' 
                         OR Territory_Number__r.State_Master_State__c = 'NSW' OR Territory_Number__r.State_Master_State__c = 'WA') 
                        AND Territory_Number__r.Company_Territory__c = true)) OR Territory_Number__r.Short_Name__c = 'Greensborough' OR 
                      Territory_Number__r.Short_Name__c = 'Wide Bay') ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0)
    {
        NewEnquirySectionController controller = new NewEnquirySectionController();
        controller.bulkCalculateCallTime(leadList);
    }
    Test.stopTest();
}
  
}