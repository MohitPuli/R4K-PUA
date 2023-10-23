@IsTest(SeeAllData=true)
private class PreQualifierSearchControllerTest{

static Account applicant;
static Territory__c territory;
static Lead lead;

static void createTestData() {
territory = [
        SELECT
            Id,
            Name,
            Short_Name__c
        FROM
            Territory__c
         limit 1
    ];
    System.debug('###territory: ' + territory.Id);
    
RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
applicant = new Account(
    RecordTypeId = personAccountRecordType.Id,
  Salutation = 'Mr.',
  FirstName = 'UnitTest',
  LastName = 'Applicant1',
  Centrepay_Ref_No__c = 'XXXXXXXXXX',
  Ezidebit_Ref_No__c = null, 
  Customer_No__c = 'xxxxxxxx',
  Territory_Number__c = territory.Id
);
insert applicant;

lead = new Lead(
    Salutation = 'Mr.',
    FirstName = 'unittest',
    LastName = 'test lead',
    MobilePhone = '0411957833',
    Phone = '0282409294',
    Email = 'test@systempartners.com',
    Company = 'Test Company',
    PostalCode = '3322',
    Referring_Customer__c = null,
    Not_Spam__c='yes'
);
insert lead;
}
static testmethod void testPreQualifierSearchController() {
Test.startTest();
  createTestData();
  PageReference pageRef = Page.newenquirysectionpage;
  Test.setCurrentPage(pageRef);
  ApexPages.currentPage().getParameters().put('firstName','u');
  ApexPages.currentPage().getParameters().put('lastName','u');
  ApexPages.currentPage().getParameters().put('suburb','u');
  ApexPages.currentPage().getParameters().put('centrepay','u');
  ApexPages.currentPage().getParameters().put('mobile','u');
  ApexPages.currentPage().getParameters().put('email','u');
  ApexPages.currentPage().getParameters().put('ldid',lead.id);
  
  PreQualifierSearchController controller = new PreQualifierSearchController();
  controller.runQuery();
  controller.runSearch();
  controller.toggleSort();
  controller.save();
  controller.debugSoql='';
  
  controller.selectedAppId='';
  controller.save();
  Test.stopTest();
}


static testmethod void testCreateDirectLead() {
	Test.startTest();
	PreQualifierSearchController controller = new PreQualifierSearchController();
	controller.fname='Test';
	controller.lname='Applicant';
	controller.mobile='0449066787';
	controller.postcode='3130';
	controller.createDirectLead();
	Test.stopTest();
}


   
}