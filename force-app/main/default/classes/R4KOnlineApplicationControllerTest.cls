@IsTest(SeeAllData=true)
private class R4KOnlineApplicationControllerTest {
static Territory__c territory;
static Territory__c territory2;
static Territory__c territory3;
static PostCode__c postcode;
static PostCode__c postcode2;
static User testUser1;
static Lead testLead;
static Lead testLead2;
static Lead testLead3;
static Lead testLead4;
static Account applicant;
static Account applicant2;
static Account applicant3;  
static Opportunity contract2;
static Attachment attachment;
static Attachment attachment2;
static Contact contact;
static Referee__c referee;

static void createTestData() {
territory = [
    SELECT
        Id,
        Name,
        Short_Name__c,OwnerId
    FROM
        Territory__c where short_Name__c='Greensborough'
     limit 1
];
territory2 = [
    SELECT
        Id,
        Name,
        Short_Name__c,OwnerId
    FROM
        Territory__c where short_Name__c='Pakenham'
     limit 1
];
territory3 = [
    SELECT
        Id,
        Name,
        Short_Name__c,OwnerId
    FROM
        Territory__c where short_Name__c='Latrobe Valley'
     limit 1
];
Profile standardUserProfile = [SELECT Id FROM Profile WHERE Name = '~Territory Owner' limit 1];
testUser1 = new User(
    FirstName = 'unittest',
    LastName = 'user 1',
    ProfileId = standardUserProfile.Id,
    Email = 'unittest@systempartners.com',
    Username = 'unittest@systempartners.com',
    CompanyName = 'System',
    Alias = 'tuser1',
    TimeZoneSidKey = 'Australia/Sydney',
    LocaleSidKey = 'en_AU',
    EmailEncodingKey = 'ISO-8859-1',
    LanguageLocaleKey = 'en_US'
);
insert testUser1;

postcode = new PostCode__c(
    Name='0000',
    Territory__c=territory.Id
    //OwnerId=testUser1.id
);
insert postcode;
    
postcode2 = new PostCode__c(
    Name='123456',
    Territory__c=territory3.Id
    //OwnerId=testUser1.id
);
insert postcode2;

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
    Country='AU',
    Description='test'
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
    Country='AU',
    Description='test'
);
insert testLead2;
    
testLead3 = new Lead(
    FirstName = 'unittest3',
    LastName = 'testlead3',
    MobilePhone = '01111111123',
    Email = 'applicant3@test.com',
    Company = 'Test Company',
    PostalCode = postCode.Name,
    Not_Spam__c='yes',
    form_type__c='Fonebox',
    crn__c='',
    did_your_hear__c='Website',
    contact_desc__c='test',
    Desired_Product__c='test',
    Country='AU',
    Description='test'
);
insert testLead3;
    
testLead4 = new Lead(
    FirstName = 'Mohit',
    LastName = 'Puli',
    MobilePhone = '0449066375',
    Email = 'applicant3@test.com',
    Company = 'Test Company',
    PostalCode = postCode.Name,
    Not_Spam__c='yes',
    form_type__c='Fonebox',
    crn__c='MP123456789',
    did_your_hear__c='Website',
    contact_desc__c='test',
    Desired_Product__c='test',
    Country='AU',
    Description='test'
);
insert testLead4;    

 RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
    applicant = new Account(
        RecordTypeId = personAccountRecordType.Id,
      FirstName = 'unittest',
      LastName = 'testlead',
      Centrepay_Ref_No__c = '232323232C',
      Customer_No__c = 'xxxxxxxx',
      PersonMobilePhone='0111111111',
      Territory_Number__c = territory.Id,
      PersonEmail = 'test123@test.com',
      BirthDate__c = Date.valueOf('2020-04-01'),
      Equifax_Enquiry_Datetime__c = Datetime.now(),
      Equifax_Age_of_File__c = '12 months',
      Explanation_for_All_Other_Defaults__c = '##Rental - test1 ##NonRental - test2',
      Enquiries_in_the_last_6_months__c = '13/10/2020 -- RENT4KEEPS(AUST) PTY LTD -- 2691 \n21/07/2020 -- ZIPPAY -- 0 \n31/05/2020 -- VENTURE 5 GROUP PTY LTD -- 810 \n4/05/2020 -- CREDIT CORP FIN SERVICES -- 500',
      Shared_Expenses_Sent__c = 'Rent; Household; Clothing; Utilities; Transport; Mobile; Credit Card; Loan; Insurance; Other Rental; Other Expense; Automotive; Travel; Children Retail; Department Stores; Groceries; Education; Gyms and other memberships; Health; Personal Care; Retail; Online Retail and Subscription Services; Subscription TV; Telecommunications; Car/Petrol/Maintenance/Travel'
    );
    insert applicant;
    
    applicant2 = new Account(
        RecordTypeId = personAccountRecordType.Id,
      FirstName = 'unittest',
      LastName = 'testlead',
      Centrepay_Ref_No__c = '232323232X',
      Customer_No__c = 'xxxxxxxx',
      PersonMobilePhone='0111111112',
      Territory_Number__c = territory2.Id,
      PersonEmail = 'test456@test.com',
      BirthDate__c = Date.valueOf('2020-04-02'),
      Gender__pc = 'Male',
      Identification_Type__c = 'Driver License',
      Identification_No__c = '1212121212',
      PersonMailingStreet = '11 Peacock Street',
      PersonMailingCity = 'Burwood',
      PersonMailingState = 'VIC',
      PersonMailingPostalCode = '3125'
    );
    insert applicant2;
    
    applicant3 = new Account(
        RecordTypeId = personAccountRecordType.Id,
      FirstName = 'unittest3',
      LastName = 'testlead3',
      Customer_No__c = 'applicant3',
      PersonMobilePhone='01111111123',
      Territory_Number__c = territory3.Id,
      OwnerId = territory3.OwnerId,
      PersonEmail = 'applicant3@test.com',
      BirthDate__c = Date.valueOf('2020-04-02'),
      Gender__pc = 'Male',
      Identification_Type__c = 'Driver License',
      Identification_No__c = '1212121212',
      PersonMailingStreet = '11 Peacock Street',
      PersonMailingCity = 'Burwood',
      PersonMailingState = 'VIC',
      PersonMailingPostalCode = '123456'
    );
    insert applicant3;
    
   contract2 = new Opportunity(
      Name = 'UnitTest - Contract Number Test 2',
      AccountId = applicant3.Id,
      StageName = 'Good Delivered',
      Start_Date__c = Date.today(),
      CloseDate = Date.today().addMonths(12),
      Term_Months__c = '12',
      Payment_Frequency__c = 'Fortnightly',
      Scheduled_Amount__c = 200,
      Is_Active__c = true,
      Requirements_Objectives__c='testrequired'
    );
    insert contract2;
    
    attachment = new Attachment(
        Name='Proof of Income-myfile.jpg',
        Body=Blob.valueOf('Test'),
        parentId = applicant.Id
    );
    insert attachment;
    
    attachment2 = new Attachment(
        Name='Other File-myfile.jpg',
        Body=Blob.valueOf('Test'),
        parentId = applicant.Id
    );
    insert attachment2;
    
    contact = new Contact(
      FirstName = 'testContactFName',
      LastName = 'testContactLName',
      MobilePhone = '999999999'
    );
    insert contact;
    
    referee = new Referee__c(
        Applicant__c=applicant.Id,
        Referee_Name__c=contact.Id,
        Sharing_Expenses__c = 'Rent; Household; Clothing; Utilities; Transport; Mobile; Credit Card; Loan; Insurance; Other Rental; Other Expense; Automotive; Travel; Children Retail; Department Stores; Groceries; Education; Gyms and other memberships; Health; Personal Care; Retail; Online Retail and Subscription Services; Subscription TV; Telecommunications; Car/Petrol/Maintenance/Travel',
        Rent_Contribution__c = 10,
        Household_Contribution__c = 10,
        Clothing_Contribution__c = 10,
        Utilities_Contribution__c = 10,
        Transport_Contribution__c = 10,
        Mobile_Contribution__c = 10,
        Credit_Card_Contribution__c = 10,
        Loan_Contribution__c = 10,
        Insurance_Contribution__c = 10,
        Other_Rental_Contribution__c = 10,
        Other_Regular_Contribution__c = 10,
        Automotive_Contribution__c = 10,
        Travel_Contribution__c = 10,
        Children_Retail_Contribution__c = 10,
        Department_Stores_Contribution__c = 10,
        Groceries_Contribution__c = 10,
        Education_Contribution__c = 10,
        Gyms_and_other_memberships_Contribution__c = 10,
        Health_Contribution__c = 10,
        Personal_Care_Contribution__c = 10,
        Retail_Contribution__c = 10,
        Online_Retail_Subscriptions_Contribution__c = 10,
        Subscription_TV_Contribution__c = 10,
        Telecommunications_Contribution__c = 10,
        Referee_Added_DateTime__c = Datetime.now()
    );
    insert referee;
}

static testmethod void testConvertApplicantOnline() {
Test.startTest();
List<Lead> leadList = [SELECT Id,Account__c,Account__r.PersonMobilePhone,Account__r.Birthdate__c,Account__r.Centrepay_Ref_No__c,
                       Account__r.FirstName,Account__r.LastName,Account__r.PersonEmail,Account__r.Identification_No__c
                       ,Account__r.Identification_Type__c
                       FROM Lead WHERE IsConverted = true AND Lead_Medium__c = 'Web' AND Account__r.Centrepay_Ref_No__c != null
                       AND Account__r.Birthdate__c != null AND Account__r.Identification_No__c != null AND Account__r.MyGov_date__c = LAST_N_DAYS:30
                       ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('redo','yes');
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        ApexPages.currentPage().getParameters().put('ldName',leadList[0].Account__r.LastName);
        Apexpages.currentPage().getParameters().put('ldCRN',leadList[0].Account__r.Centrepay_Ref_No__c);
        Apexpages.currentPage().getParameters().put('ldMobile',leadList[0].Account__r.PersonMobilePhone);
        Apexpages.currentPage().getParameters().put('ldEmail',leadList[0].Account__r.PersonEmail);
        Apexpages.currentPage().getParameters().put('idNumberVal',leadList[0].Account__r.Identification_No__c);
        Apexpages.currentPage().getParameters().put('idTypVal',leadList[0].Account__r.Identification_Type__c);
        Apexpages.currentPage().getParameters().put('ldDob','2000-02-02');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ra.getFormDetails();
        ra.ocrText = 'ochegrwhksang,dsfngkdfgjklrlk.s df,gbdsfjkgndf.kgdfm,gbjdfng.gafkjgbfjgn,ma gnmas';
        ra.photoIdDetails = 'FirstName - Mohit\nLastName - Puli\nDOB - 2004-05-15\nId Type - Driver License\nId Number - 1498265834';
        ra.convertToApplicant();
    }    
Test.stopTest();
}
    
static testmethod void testConvertApplicantOnline2() {
Test.startTest();
List<Lead> leadList = [SELECT Id,Account__c,Account__r.PersonMobilePhone,Account__r.Birthdate__c,Account__r.Centrepay_Ref_No__c,
                       Account__r.FirstName,Account__r.LastName,Account__r.PersonEmail,Account__r.Identification_No__c
                       ,Account__r.Identification_Type__c
                       FROM Lead WHERE IsConverted = false AND Lead_Medium__c = 'Web'                       
                       ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('redo','yes');
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        ApexPages.currentPage().getParameters().put('ldName','sdgflkdjklsd');
        Apexpages.currentPage().getParameters().put('ldCRN','3284973495349');
        Apexpages.currentPage().getParameters().put('ldMobile','03458734995');
        Apexpages.currentPage().getParameters().put('ldEmail','');
        Apexpages.currentPage().getParameters().put('idNumberVal','495839248503');
        Apexpages.currentPage().getParameters().put('idTypVal','Passport');
        Apexpages.currentPage().getParameters().put('ldDob','2000-02-02');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ra.getFormDetails();
        ra.ocrText = 'ochegrwhksang,dsfngkdfgjklrlk.s df,gbdsfjkgndf.kgdfm,gbjdfng.gafkjgbfjgn,ma gnmas';
        ra.photoIdDetails = 'FirstName - Mohit\nLastName - Puli\nDOB - 2004-05-15\nId Type - Driver License\nId Number - 1498265834';
        ra.convertToApplicant();
    }    
Test.stopTest();
}
    
static testmethod void testOnlineApplicationForExistingUnconverted() {
Test.startTest();
createTestData();

ApexPages.currentPage().getParameters().put('ld',testLead.Id);
Apexpages.currentPage().getParameters().put('clientSideAppType','existing');
Apexpages.currentPage().getParameters().put('ldCRN','existing');
Apexpages.currentPage().getParameters().put('ldMobile','0111111111');
Apexpages.currentPage().getParameters().put('ldEmail','test123@test.com');

Apexpages.currentPage().getParameters().put('ldCRN2','232323232C');
Apexpages.currentPage().getParameters().put('ldMobile2','0111111111');
Apexpages.currentPage().getParameters().put('ldEmail2','test123@test.com');
    
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();
ra.saveShortLinkOpenedDeviceDataForHybridLink();
ra.convertToApplicant();

ra.convertToApplicantStageTwo();

Apexpages.currentPage().getParameters().put('ldCRN2','232323232C');
Apexpages.currentPage().getParameters().put('ldMobile2','0111111111');
Apexpages.currentPage().getParameters().put('ldEmail2','');
Apexpages.currentPage().getParameters().put('ldDob2','2020-04-01');
ra.convertToApplicantStageTwo();

Apexpages.currentPage().getParameters().put('ldCRN2','232323232C');
Apexpages.currentPage().getParameters().put('ldMobile2','');
Apexpages.currentPage().getParameters().put('ldEmail2','test123@test.com');
Apexpages.currentPage().getParameters().put('ldDob2','2020-04-01');
ra.convertToApplicantStageTwo();

Apexpages.currentPage().getParameters().put('ldCRN2','');
Apexpages.currentPage().getParameters().put('ldMobile2','0111111111');
Apexpages.currentPage().getParameters().put('ldEmail2','test123@test.com');
Apexpages.currentPage().getParameters().put('ldDob2','2020-04-01');
ra.convertToApplicantStageTwo();

ra.getFormDetails();
ra.save();
ra.finishOnlineProcess();

Apexpages.currentPage().getParameters().put('address','test address');
Apexpages.currentPage().getParameters().put('lat','123.12');
Apexpages.currentPage().getParameters().put('lng','-123.12');
ra.saveShortLinkOpenedDeviceDataForHybridLink();
//ra.deletePhotoId();
ra.deleteCustomerPhotoId();
//ra.deletePhotoIdForDocLink();
//ra.saveConsent();

Apexpages.currentPage().getParameters().put('idType','Drivers Licence');
 
Test.stopTest();
}

static testmethod void testAccountEnquiry() {
Test.startTest();
createTestData();

ApexPages.currentPage().getParameters().put('ld',testLead.Id);
Apexpages.currentPage().getParameters().put('csAppType','acctEnquiry');
   
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();
ra.convertToAccountEnquiry();

Apexpages.currentPage().getParameters().put('csAppType','serviceEnquiry');
ra.convertToAccountEnquiry();
 
Test.stopTest();
}
    
static testmethod void testAccountEnquiry2() {
Test.startTest();
createTestData();

ApexPages.currentPage().getParameters().put('ld',testLead4.Id);
Apexpages.currentPage().getParameters().put('clientSideAppType','existing');
Apexpages.currentPage().getParameters().put('ldCRN','MP123456789');
Apexpages.currentPage().getParameters().put('ldMobile','0449066375');
Apexpages.currentPage().getParameters().put('ldEmail','mohit@rent4keeps.com.au');

    
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();
ra.convertToApplicantHybrid();
 
Test.stopTest();
}

static testmethod void testOnlineApplicationForNewUnconverted() {
Test.startTest();
createTestData();

ApexPages.currentPage().getParameters().put('ld',testLead.Id);
Apexpages.currentPage().getParameters().put('clientSideAppType','new');
Apexpages.currentPage().getParameters().put('ldCRN','');
Apexpages.currentPage().getParameters().put('ldMobile','0111111111');
Apexpages.currentPage().getParameters().put('ldEmail','test123@test.com');

    
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();
ra.convertToApplicantHybrid();

ApexPages.currentPage().getParameters().put('ld',testLead4.Id);
Apexpages.currentPage().getParameters().put('clientSideAppType','existing');
Apexpages.currentPage().getParameters().put('ldCRN','MP123456789');
Apexpages.currentPage().getParameters().put('ldMobile','0449066375');
Apexpages.currentPage().getParameters().put('ldEmail','mohit@rent4keeps.com.au');
ra.getFormDetails();
ra.convertToApplicant();

ApexPages.currentPage().getParameters().put('ld',testLead2.Id);
Apexpages.currentPage().getParameters().put('clientSideAppType','new');
Apexpages.currentPage().getParameters().put('ldCRN','');
Apexpages.currentPage().getParameters().put('ldMobile','0111111112');
Apexpages.currentPage().getParameters().put('ldEmail','');
R4KOnlineApplicationController ra2 = new R4KOnlineApplicationController();
ra2.convertToApplicant();

Test.stopTest();
}

static testmethod void testRefereeEDM() {
Test.startTest();
createTestData();

ApexPages.currentPage().getParameters().put('ld',testLead.Id);
Apexpages.currentPage().getParameters().put('clientSideAppType','existing');
Apexpages.currentPage().getParameters().put('ldCRN','existing');
Apexpages.currentPage().getParameters().put('ldMobile','0111111111');
Apexpages.currentPage().getParameters().put('ldEmail','test123@test.com');
Apexpages.currentPage().getParameters().put('country','AU');
Apexpages.currentPage().getParameters().put('postcode','3130');
Apexpages.currentPage().getParameters().put('ldDob','1987-04-01');
    
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();
ra.searchApplicantForRefereeEDM();

Apexpages.currentPage().getParameters().put('clientSideAppType','new');
ra.searchApplicantForRefereeEDM();

Apexpages.currentPage().getParameters().put('clientSideAppType','existing');
Apexpages.currentPage().getParameters().put('ldCRN','existing');
Apexpages.currentPage().getParameters().put('ldMobile','0111111111');
Apexpages.currentPage().getParameters().put('ldEmail','random@test.com');
Apexpages.currentPage().getParameters().put('country','AU');
Apexpages.currentPage().getParameters().put('postcode','0000');
Apexpages.currentPage().getParameters().put('ldDob','2024-04-01');
ra.searchApplicantForRefereeEDM();

String atId = ra.addApplicant('Shrijit','Test', Date.valueOf('2020-04-01'), '1212121212', '02323232323', 'test@test.com', '', '', '', '3130', 'AU');

Test.stopTest();
}

static testmethod void testRefereeContact() {
Test.startTest();
Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
createTestData();

ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('rfirstName','Test3F');
Apexpages.currentPage().getParameters().put('rlastName','Test3L');
Apexpages.currentPage().getParameters().put('rphone','000000000');

ApexPages.currentPage().getParameters().put('rf',referee.Id);
Apexpages.currentPage().getParameters().put('rffirstName','Test2F');
Apexpages.currentPage().getParameters().put('rflirstName','test2L');
Apexpages.currentPage().getParameters().put('pageParam','ci');
    
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();

Apexpages.currentPage().getParameters().put('rphone','999999999');
ra.addReferee();

ra.updateReferee();

Apexpages.currentPage().getParameters().put('pageParam','pd');
Apexpages.currentPage().getParameters().put('rfstreetName','11 Peacock Street');
ra.updateReferee();

Apexpages.currentPage().getParameters().put('pageParam','rl');
Apexpages.currentPage().getParameters().put('relation','Family Member');
ra.updateReferee();

Apexpages.currentPage().getParameters().put('isOptOutForMarketing','true');
ra.completeContactRefereeProcess();
Test.stopTest();
}

static testmethod void testReferee2() {
Test.startTest();
Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
createTestData();

ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('rfirstName','Test3F');
Apexpages.currentPage().getParameters().put('rlastName','Test3L');
Apexpages.currentPage().getParameters().put('rphone','000000000');
ApexPages.currentPage().getParameters().put('rf',referee.Id);
Apexpages.currentPage().getParameters().put('rffirstName','Test2F');
Apexpages.currentPage().getParameters().put('rflirstName','test2L');
Apexpages.currentPage().getParameters().put('pageParam','ci');
Apexpages.currentPage().getParameters().put('rphone','999999999');
Apexpages.currentPage().getParameters().put('addPrevRefNo','999999999');
Apexpages.currentPage().getParameters().put('cpRefId',referee.Id);
Apexpages.currentPage().getParameters().put('prevRefs',referee.Id+','+referee.Id);
    
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();
ra.redirectAndAddPreviousReferees();
Test.stopTest();
}

static testmethod void testSendRefereeSMS() {
Test.startTest();
Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
List<Referee__c> refs = [select id from Referee__c where applicant__r.Territory_Number__r.Name='100' Limit 1];
 if(refs.size()>0)   
    R4KOnlineApplicationController.sendRefereeSMS(refs[0].Id,'Someurl');
Test.stopTest();
}

static testmethod void testEquifaxSearch() {
Test.startTest();
createTestData();

ApexPages.currentPage().getParameters().put('id',applicant2.Id);
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ra.getFormDetails();
ra.equifaxSearch();

ApexPages.currentPage().getParameters().put('id',applicant.Id);
ra.getFormDetails();
ra.equifaxSearch();

R4KOnlineApplicationController.getEquifaxPdf('enquiryId',applicant.Id,'Test name');

Test.stopTest();
}

static testmethod void testDeletingIds() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('winzId',attachment.Id);
ra.getFormDetails();
ra.deleteWinzId();
ra.deleteWinzIdForDocLink();

Apexpages.currentPage().getParameters().put('otherId',attachment2.Id);
ra.deleteOtherId();
ra.deleteOtherIdForHybridLink();

Test.stopTest();
}

static testmethod void testSaveLead() {
Test.startTest();
List<Lead> lld = [SELECT Id FROM Lead WHERE Territory_Number__r.Short_Name__c = 'Head Office' AND Not_Spam__c = 'yes' AND IsConverted = false AND PostalCode <> null ORDER BY CreatedDate DESC LIMIT 1]; 
if(lld.size() > 0)
{
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('ld',lld[0].Id);
ra.getFormDetails();
ra.ldPostCode = '3805';
ra.ldLastName = 'Test';
ra.saveLead();
}
Test.stopTest();
}

static testmethod void testCreateLead() {
Test.startTest();

Account acct = [SELECT Id FROM Account WHERE Territory_Short_Name__c = 'Head Office' AND PersonMobilePhone <> null AND No_Of_Agreements__c = 0 LIMIT 1];
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',acct.Id);
ra.createRetentionLead();

Test.stopTest();
}

static testmethod void testInitOnlineAcknowledgement() 
{
Test.startTest();
Opportunity opp = [SELECT Id FROM Opportunity WHERE Territory_Short_Name__c = 'Head Office' AND Amount > 0 LIMIT 1];
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('oppId',opp.Id);
ApexPages.currentPage().getParameters().put('log','Consent');
ApexPages.CurrentPage().getParameters().put('consumerLease','true');
ra.initOnlineAcknowledgement();
ra.updateSigningLogs();
Test.stopTest();
}

static testmethod void testDeviceData() 
{
Test.startTest();
Opportunity opp = [SELECT Id FROM Opportunity WHERE Territory_Short_Name__c = 'Head Office' AND Amount > 0 LIMIT 1];
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('oppId',opp.Id);
ApexPages.currentPage().getParameters().put('log','Consent');
ApexPages.CurrentPage().getParameters().put('consumerLease','true');
ra.initOnlineAcknowledgement();
ra.saveSigningDeviceData();
Test.stopTest();
}

static testmethod void testOTPCode() 
{
Test.startTest();
Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
Opportunity opp = [SELECT Id,CustomerAuthCode__c FROM Opportunity WHERE CustomerAuthCode__c <> null AND Amount > 0 LIMIT 1];
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('oppId',opp.Id);
ApexPages.currentPage().getParameters().put('log','Consent');
ApexPages.CurrentPage().getParameters().put('consumerLease','true');
ApexPages.CurrentPage().getParameters().put('otpCode',opp.CustomerAuthCode__c);
ra.initOnlineAcknowledgement();
ra.sendOTPCode();
ra.validateOTP();
Test.stopTest();
}

static testmethod void testOnlineSigning() 
{
Test.startTest();
List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE StageName = 'Goods Delivered' AND TaxInvoice_Signed_DateTime__c = null AND 
                   Account.Company_Territory__c = true AND Payment_Type__c = 'Ezidebit' LIMIT 1];
    if(oppList.size() > 0){
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('oppId',oppList[0].Id);
ApexPages.CurrentPage().getParameters().put('signatureBody','signatureBody'); 
ApexPages.CurrentPage().getParameters().put('initialBody','initialBody'); 
ApexPages.CurrentPage().getParameters().put('parentId',oppList[0].Id); 
ApexPages.CurrentPage().getParameters().put('type','applicantonline'); 
ApexPages.CurrentPage().getParameters().put('objectType','opportunity'); 
ApexPages.CurrentPage().getParameters().put('agreementType',''); 
ApexPages.CurrentPage().getParameters().put('signTypeValue','initial'); 
ra.initOnlineAcknowledgement();
ra.saveSignature();
ra.updateSigningTime();
    }
Test.stopTest();
}

static testmethod void testEmployment1() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('fnightlyEmploymentManual','1200');
Apexpages.currentPage().getParameters().put('employerName','R4K');
Apexpages.currentPage().getParameters().put('employmentType','Full-Time');
Apexpages.currentPage().getParameters().put('employmentDate','21/09/2021');
ra.getFormDetails();
ra.updateEmployment();

Test.stopTest();
}

static testmethod void testEmployment2() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('fnightlyEmploymentManual','1200');
Apexpages.currentPage().getParameters().put('employmentAgree','yes');
ra.getFormDetails();
ra.updateEmploymentIncome();

Test.stopTest();
}

static testmethod void testBoardingIncome() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('incomeOtherSharingName','MP');
Apexpages.currentPage().getParameters().put('incomeOtherSharingNumber','0449066375');
Apexpages.currentPage().getParameters().put('incomeOtherSharingRelation','Friend');
Apexpages.currentPage().getParameters().put('incomeOtherSharingContact','yes');
Apexpages.currentPage().getParameters().put('incomeOtherSharingReferee','yes');
ra.getFormDetails();
ra.updateBoardingIncome();

Test.stopTest();
}

static testmethod void testOtherIncome() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('fnightlyIncomeOther','400');
Apexpages.currentPage().getParameters().put('incomeOtherSource','Lease');
Apexpages.currentPage().getParameters().put('incomeOtherVerify','yes');
ra.getFormDetails();
ra.updateOtherIncome();

Test.stopTest();
}

static testmethod void testCentrelink() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('clinkBenefitIndex','2');
Apexpages.currentPage().getParameters().put('clinkBenefitName','Abstudy');
Apexpages.currentPage().getParameters().put('cbenIncome','650');
Apexpages.currentPage().getParameters().put('cbenAgree','man');
ra.getFormDetails();
ra.updateCentrelinkBenefit();

Test.stopTest();
}

static testmethod void testConsumerLease() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('ld',testLead.Id);
Apexpages.currentPage().getParameters().put('whyConsumerLease','easy');
Apexpages.currentPage().getParameters().put('benefitsOfConsumerLease','easy');
ra.initEnquiry();
ra.updateConsumerLeaseDetails();

Test.stopTest();
}

static testmethod void testProductDetails() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('ld',testLead.Id);
Apexpages.currentPage().getParameters().put('prodRequirement','Phones');
Apexpages.currentPage().getParameters().put('prodName','Iphone');
Apexpages.currentPage().getParameters().put('prodObjective','To make calls');
ra.initEnquiry();
ra.updateProductDetails();

Test.stopTest();
}

static testmethod void testUpdateAddress() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('currentStreetAddress','35A Railway Road');
Apexpages.currentPage().getParameters().put('currentSuburb','Blackburn');
Apexpages.currentPage().getParameters().put('currentState','VIC');
Apexpages.currentPage().getParameters().put('currentCountry','AU');
Apexpages.currentPage().getParameters().put('currentLatitude','0');
Apexpages.currentPage().getParameters().put('currentLongitude','0');
Apexpages.currentPage().getParameters().put('currentPostcode','3130');
ra.getFormDetails();
ra.updateAddress();

Test.stopTest();
}

static testmethod void testUpdateResidentialStatus() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('lengthOfStayCurrent','10');
Apexpages.currentPage().getParameters().put('residentialStatus','Other');
Apexpages.currentPage().getParameters().put('landlordName','Barry Plant');
Apexpages.currentPage().getParameters().put('landlordNumber','0465548456');
ra.getFormDetails();
ra.updateResidentialStatus();

Test.stopTest();
}

static testmethod void testUpdatePreviousAddress() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('lengthOfStayPrevious','10');
Apexpages.currentPage().getParameters().put('previousAddress','35A Railway Road Blackburn VIC 3130');
ra.getFormDetails();
ra.updatePreviousAddress();

Test.stopTest();
}

static testmethod void testUpdateDependents() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('noOfDependents','10');
Apexpages.currentPage().getParameters().put('maritalStatus','Single');
ra.getFormDetails();
ra.updateDependents();

Test.stopTest();
}

static testmethod void testUpdateIdentificationNo() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('identificationNo','12345678');
ra.getFormDetails();
ra.updateIdentificationNo();

Test.stopTest();
}

static testmethod void testUpdateConsent() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
ra.getFormDetails();
ra.updateConsent();

Test.stopTest();
}

/*
static testmethod void testUpdateBasicInfoInitial() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('firstName','Mohit');
Apexpages.currentPage().getParameters().put('lastName','Puli');
Apexpages.currentPage().getParameters().put('dob','');
Apexpages.currentPage().getParameters().put('phone','0449066375');
Apexpages.currentPage().getParameters().put('postalCode','3168');
ra.getFormDetails();
ra.updateBasicInfoInitial();

Test.stopTest();
}
*/

static testmethod void testUpdateBasicInfo() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('firstName','Mohit');
Apexpages.currentPage().getParameters().put('lastName','Puli');
Apexpages.currentPage().getParameters().put('dob','');
Apexpages.currentPage().getParameters().put('phone','0449066375');
Apexpages.currentPage().getParameters().put('postalCode','3168');
Apexpages.currentPage().getParameters().put('gender','Male');
Apexpages.currentPage().getParameters().put('crn','316298789458');
ra.getFormDetails();
ra.updateBasicInfo();

Test.stopTest();
}

static testmethod void testUpdateContactDetails() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
Apexpages.currentPage().getParameters().put('email','mohit@rent4keeps.com.au');
Apexpages.currentPage().getParameters().put('phone','0449066375');
ra.getFormDetails();
ra.updateContactDetails();

Test.stopTest();
}

static testmethod void testInitAcknowledgement() {
    Test.startTest();
    //createTestData();
    List<Account> acctList = [SELECT Id FROM Account WHERE Territory_Number__r.Is_Credit_Contract__c = true ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        //ra.getFormDetails();
        ra.initAcknowledgement();
        ra.redirectToOnlineProcess();
        ra.onlineAccountId = acctList[0].Id;
        ra.createOnlineLead();
    }
    Test.stopTest();
}

static testmethod void testInitAcknowledgement2() {
Test.startTest();
//createTestData();
List<Lead> leadList = [SELECT Id FROM Lead WHERE Lead_Medium__c = 'Web' AND IsConverted = false ORDER BY CreatedDate DESC LIMIT 1];
if(leadList.size() > 0){
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
    ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
    ra.initAcknowledgement();
}
Test.stopTest();
}
    
static testmethod void testResendOnlineLink() {
Test.startTest();
Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
//createTestData();
List<Account> acctLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c from Account where Photo_Id_Front__c <> null AND Photo_Id_Back__c <> null ORDER BY CreatedDate DESC LIMIT 1];
if(acctLst.size() > 0)
{
R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',acctLst[0].Id);
ra.getFormDetails();
ra.resetLinkId = false;
ra.resetLinkBank = false;
ra.resetLinkMygov = false;
ra.resetLinkBasic = false;
ra.resetLinkIncome = false;
ra.resetLinkExpense = false;
ra.resetLinkReferees = false;
ra.resetLinkRO = false;
ra.resetLinkEquifax = false;
ra.resendOnlineLink();
}
Test.stopTest();
}

static testmethod void testSaveDeviceData() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
ApexPages.currentPage().getParameters().put('addressVal','35A Railway Rd, Blackburn, VIC 3130');
ApexPages.currentPage().getParameters().put('latVal','124');
ApexPages.currentPage().getParameters().put('lngVal','124');
ApexPages.currentPage().getParameters().put('linkOpenedDeviceBrand','Apple');
ApexPages.currentPage().getParameters().put('linkOpenedDeviceName','Iphone');
ApexPages.currentPage().getParameters().put('linkOpenedDeviceType','Phone');
ApexPages.currentPage().getParameters().put('linkOpenedDeviceBrowser','Mozilla');
ra.getFormDetails();
ra.saveLocationInfo();
ra.saveDeviceInfo();

Test.stopTest();
}

static testmethod void testIncomeExpense() {
Test.startTest();
createTestData();

R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
ApexPages.currentPage().getParameters().put('id',applicant.Id);
ra.getFormDetails();
ra.getIncomeExpense('cben4',124);
ra.getIncomeExpense('other rental',124);
ra.getIncomeExpense('other regular',124);

Test.stopTest();
}

static testmethod void testDeletePhotoIdOnline() {
Test.startTest();
List<Account> acctLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c from Account where Photo_Id_Front__c <> null AND Photo_Id_Back__c <> null ORDER BY CreatedDate DESC LIMIT 1];
if(acctLst.size() > 0)
{
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
    ApexPages.currentPage().getParameters().put('id',acctLst[0].Id);
    ApexPages.currentPage().getParameters().put('accountId',acctLst[0].Id);
    ApexPages.currentPage().getParameters().put('type','back');
    ra.getFormDetails();
    ra.deletePhotoIdOnline();
    ra.custPhotoAtt = acctLst[0].Photo_Id_Front__c;
    ra.deleteSelfieId();
}
Test.stopTest();
}

static testmethod void testDeletePhotoIdOnlineDoc() {
    Test.startTest();
    List<Account> acctLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c from Account where Photo_Id_Front__c <> null AND Photo_Id_Back__c <> null ORDER BY CreatedDate DESC LIMIT 1];
    if(acctLst.size() > 0)
    {
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctLst[0].Id);
        ApexPages.currentPage().getParameters().put('accountId',acctLst[0].Id);
        ApexPages.currentPage().getParameters().put('acctId',acctLst[0].Id);
        ApexPages.currentPage().getParameters().put('type','back');
        ra.getFormDetails();
        ra.deletePhotoIdForDocLink();
        ApexPages.currentPage().getParameters().put('type','front');
        ra.deletePhotoId();
    }
    Test.stopTest();
    }
    
static testmethod void testDeletePhotoIdOnline2() {
Test.startTest();
List<Lead> leadLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c from Lead where Photo_Id_Front__c <> null AND Photo_Id_Back__c <> null ORDER BY CreatedDate DESC LIMIT 1];
if(leadLst.size() > 0)
{
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
    ApexPages.currentPage().getParameters().put('ld',leadLst[0].Id);
    ApexPages.currentPage().getParameters().put('accountId',leadLst[0].Id);
    ApexPages.currentPage().getParameters().put('type','front');
    ra.getFormDetails();
    ra.deletePhotoIdOnline();
}
Test.stopTest();
}

static testmethod void testEquifaxOnline() {
Test.startTest();
List<Account> acctLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c from Account where Photo_Id_Front__c <> null AND Photo_Id_Back__c <> null ORDER BY CreatedDate DESC LIMIT 1];
if(acctLst.size() > 0)
{
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
    ApexPages.currentPage().getParameters().put('id',acctLst[0].Id);
    ra.getFormDetails();
    ra.equifaxSearchForOnline();
}
Test.stopTest();
}

static testmethod void testUpdateIdentityDetails() {
Test.startTest();
List<Account> acctLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c,PersonMobilePhone,Centrepay_Ref_No__c,Identification_No__c,Identification_Type__c
                         from Account where Photo_Id_Front__c <> null AND Photo_Id_Back__c <> null ORDER BY CreatedDate DESC LIMIT 1];
if(acctLst.size() > 0)
{
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
    ApexPages.currentPage().getParameters().put('id',acctLst[0].Id);
    ApexPages.currentPage().getParameters().put('appCRN',acctLst[0].Centrepay_Ref_No__c);
    ApexPages.currentPage().getParameters().put('appMobile',acctLst[0].PersonMobilePhone);
    ApexPages.currentPage().getParameters().put('appDob','');
    ApexPages.currentPage().getParameters().put('appIdTypVal',acctLst[0].Identification_Type__c);
    ApexPages.currentPage().getParameters().put('appIdNumberVal',acctLst[0].Identification_No__c);
    ra.getFormDetails();
    ra.updateIdentityDetails();
}
Test.stopTest();
}    

static testmethod void testInitRedirect() 
{
    Test.startTest();
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Applicant_Status__c = null ORDER BY CreatedDate DESC LIMIT 1];
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAcknowledgementRedirect();
    }
    Test.stopTest();
}

static testmethod void testInitLanding() 
{
    Test.startTest();
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.Application_Signed_Date__c = LAST_N_DAYS:30 AND Account__r.Enquiry_Date__c <> LAST_N_DAYS:7 ORDER BY Account__r.Application_Signed_Date__c DESC LIMIT 1];
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initR4KOnlineLandingPage();
    }
    Test.stopTest();
}

static testmethod void testCreateWeCareCases() 
{
    Test.startTest();
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.Company_Territory__c = true 
                         AND Account__r.Territory_State__c = 'VIC' AND Applicant_Status__c = 'Account Enquiry'
                         AND (Case__c = null OR Case__r.Status = 'Closed' OR Case__r.ClosedDate <> LAST_N_DAYS:10)
                         AND Account__r.Territory_Number__r.Is_Credit_Contract__c = true AND Account__r.Active_Agreements__c > 0
                         AND Account__r.Last_Collection_Activity__c = null AND Applicant_Status__c = 'Collection'
                         ORDER BY CreatedDate DESC LIMIT 1];
    
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        ApexPages.currentPage().getParameters().put('enquiryType','Account Enquiry');
        ApexPages.currentPage().getParameters().put('enquiryOpp','sdlkfalsdkgn');
        ApexPages.currentPage().getParameters().put('enquiryNotes','kdghflafhgla');
        ApexPages.currentPage().getParameters().put('rFromDt','2022-11-19');
        ApexPages.currentPage().getParameters().put('rFromTi','16:00');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.createEnquiryCase();
    }
    Test.stopTest();
}

static testmethod void testCreateWeCareCases3() 
{
    Test.startTest();
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.Company_Territory__c = true 
                         AND Account__r.Territory_State__c = 'VIC' AND Applicant_Status__c = 'Account Enquiry'
                         AND (Case__c = null OR Case__r.Status = 'Closed' OR Case__r.ClosedDate <> LAST_N_DAYS:10)
                         AND Account__r.Territory_Number__r.Is_Credit_Contract__c = false AND Account__r.Active_Agreements__c > 0
                         AND Account__r.Last_Collection_Activity__c = null AND Applicant_Status__c = 'Collection'
                         ORDER BY CreatedDate DESC LIMIT 1];
    
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        ApexPages.currentPage().getParameters().put('enquiryType','Account Enquiry');
        ApexPages.currentPage().getParameters().put('enquiryOpp','sdlkfalsdkgn');
        ApexPages.currentPage().getParameters().put('enquiryNotes','kdghflafhgla');
        ApexPages.currentPage().getParameters().put('rFromDt','2022-11-19');
        ApexPages.currentPage().getParameters().put('rFromTi','16:00');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.createEnquiryCase();
    }
    Test.stopTest();
}
    
    static testmethod void testCreateWeCareCases4() 
{
    Test.startTest();
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.Company_Territory__c = true 
                         AND Account__r.Territory_State__c = 'VIC' AND Applicant_Status__c = 'Account Enquiry'
                         AND (Case__c = null OR Case__r.Status = 'Closed' OR Case__r.ClosedDate <> LAST_N_DAYS:10)
                         ORDER BY CreatedDate DESC LIMIT 1];
    
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        ApexPages.currentPage().getParameters().put('enquiryType','Account Enquiry');
        ApexPages.currentPage().getParameters().put('enquiryOpp','sdlkfalsdkgn');
        ApexPages.currentPage().getParameters().put('enquiryNotes','kdghflafhgla');
        ApexPages.currentPage().getParameters().put('rFromDt','2022-11-19');
        ApexPages.currentPage().getParameters().put('rFromTi','16:00');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.createEnquiryCase();
    }
    Test.stopTest();
}
    
static testmethod void testCreateWeCareCases2() 
{
    Test.startTest();
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.Company_Territory__c = true 
                         AND Account__r.Territory_State__c = 'VIC' AND Applicant_Status__c = 'Account Enquiry'
                         AND Case__c != null AND Case__r.Status <> 'Closed'
                         ORDER BY CreatedDate DESC LIMIT 1];
    
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        ApexPages.currentPage().getParameters().put('enquiryType','Account Enquiry');
        ApexPages.currentPage().getParameters().put('enquiryOpp','sdlkfalsdkgn');
        ApexPages.currentPage().getParameters().put('enquiryNotes','kdghflafhgla');
        ApexPages.currentPage().getParameters().put('rFromDt','2022-11-19');
        ApexPages.currentPage().getParameters().put('rFromTi','16:00');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.createEnquiryCase();
    }
    Test.stopTest();
}

static testmethod void testCloseWeCareCases() 
{
    Test.startTest();
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.Company_Territory__c = true AND 
                         Account__r.Territory_State__c = 'VIC' AND Account__r.Enquiry_Status__c LIKE 'DN%'
                         ORDER BY CreatedDate DESC LIMIT 1];    
    if(ldList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.closeWeCareCases();
    }
    Test.stopTest();
}  

static testmethod void testRedirectPaymentLink() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.Company_Territory__c = true AND 
                         Account__r.Territory_State__c = 'VIC' AND Account__r.Last_Collection_Activity__c = null
                         AND Account__r.Active_Agreements__c > 0
                         ORDER BY CreatedDate DESC LIMIT 1];
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.redirectToPaymentLink();
    }
    Test.stopTest();
}

static testmethod void testRedirectPaymentLink2() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Lead> ldList = [SELECT Id FROM Lead WHERE IsConverted = true AND
                         Account__r.Territory_Number__r.Name = '301' AND Account__r.Last_Collection_Activity__c = null 
                         ORDER BY CreatedDate DESC LIMIT 1];
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.redirectToPaymentLink();
    }
    Test.stopTest();
}

static testmethod void testOTPAuth() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Lead> ldList = [SELECT Id,OTP_Code__c FROM Lead WHERE IsConverted = true AND Account__r.Company_Territory__c = true AND 
                         Account__r.Territory_State__c = 'VIC' AND OTP_Code__c != null AND MobilePhone != null
                         ORDER BY CreatedDate DESC LIMIT 1];
    if(ldList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',ldList[0].Id);
        ApexPages.currentPage().getParameters().put('otpCode',ldList[0].OTP_Code__c);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.authenticateOTPCode();
        ra.isTimeout = true;
        ra.sendOTP();
    }
    Test.stopTest();
}

static testmethod void testCloseCasesOnSummary() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Case> csList = [SELECT Id,Lead__c FROM Case WHERE Status <> 'Closed' AND Lead__c <> null AND Lead__r.IsConverted = true AND Assigned_To__c = 'We Care'
                         ORDER BY CreatedDate DESC LIMIT 1];
    if(csList.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('ld',csList[0].Lead__c);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initAccountEnquiry();
        ra.closeWeCareCasesOnSummary();
    }
    Test.stopTest();
}

static testmethod void testAutoDecline() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Account> accts = new List<Account>();
    
    String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c, ' + 
                'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Territory_Number__r.Short_Name__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Name,Last_Collection_Activity__r.Collection_Outcome1__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c, '+
                'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                'Territory_Short_Name__c,No_of_Active_Agreements__c,Serviceability__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,Agreement_Completed_Date__c,Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Remaining_Amount_Active_Agreements__c,Latest_Agreement_Created_Date__c,' +
                'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name '+
                'from Account where LastName!=null AND No_Of_Active_Agreements__c > 0 AND Company_Territory__c = true ORDER BY CreatedDate DESC LIMIT 1';
    accts = Database.query(originalquery);
    if(accts.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('id',accts[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.checkAutoDecline(accts[0]);
    }
    Test.stopTest();
}

static testmethod void testEquifaxNotes() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Account> accts = new List<Account>();
    
    String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c, ' + 
                'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Territory_Number__r.Short_Name__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Name,Last_Collection_Activity__r.Collection_Outcome1__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c, '+
                'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                'Territory_Short_Name__c,No_of_Active_Agreements__c,Serviceability__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,Agreement_Completed_Date__c,Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Remaining_Amount_Active_Agreements__c,Latest_Agreement_Created_Date__c,' +
                'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name '+
                'from Account where LastName!=null AND No_Of_Active_Agreements__c > 0 AND Company_Territory__c = true ORDER BY CreatedDate DESC LIMIT 1';
    accts = Database.query(originalquery);
    if(accts.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('id',accts[0].Id);
        ApexPages.currentPage().getParameters().put('addEqEnquiries','test');
        ApexPages.currentPage().getParameters().put('addEqRentalDefaults','test');
        ApexPages.currentPage().getParameters().put('addEqNonRentalDefaults','test');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.updateEquifaxNotes();
    }
    Test.stopTest();
}

static testmethod void testBankRedo() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Account> accts = new List<Account>();
    
    String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c, ' + 
                'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Territory_Number__r.Short_Name__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Name,Last_Collection_Activity__r.Collection_Outcome1__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c, '+
                'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                'Territory_Short_Name__c,No_of_Active_Agreements__c,Serviceability__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,Agreement_Completed_Date__c,Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Remaining_Amount_Active_Agreements__c,Latest_Agreement_Created_Date__c,' +
                'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name '+
                'from Account where LastName!=null AND No_Of_Active_Agreements__c > 0 AND Company_Territory__c = true ORDER BY CreatedDate DESC LIMIT 1';
    accts = Database.query(originalquery);
    if(accts.size() > 0)
    {
        ApexPages.currentPage().getParameters().put('id',accts[0].Id);
        ApexPages.currentPage().getParameters().put('bankRedoAgree','remove');
        ApexPages.currentPage().getParameters().put('mygovRedoAgree','yes');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.resetBank();
        ApexPages.currentPage().getParameters().put('bankRedoAgree','yes');
        ra.resetBank();
        ra.resetMygov();
    }
    Test.stopTest();
}  

static testmethod void testSaveLocationInfo() 
{
    Test.startTest();
    List<Lead> leadList = [SELECT Id FROM Lead WHERE Lead_Medium__c = 'Web' AND IsConverted = false ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        ApexPages.currentPage().getParameters().put('addressVal','35A Railway Rd, Blackburn, VIC 3130');
        ApexPages.currentPage().getParameters().put('latVal','124');
        ApexPages.currentPage().getParameters().put('lngVal','124');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceBrand','Apple');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceName','Iphone');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceType','Phone');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceBrowser','Mozilla');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.saveDeviceInfo();
    }
    Test.stopTest();
}
    
static testmethod void testSaveLocationInfo2() 
{
    Test.startTest();
    List<Lead> leadList = [SELECT Id FROM Lead WHERE Lead_Medium__c = 'Web' AND IsConverted = false ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        ApexPages.currentPage().getParameters().put('addressVal','35A Railway Rd, Blackburn, VIC 3130');
        ApexPages.currentPage().getParameters().put('latVal','124');
        ApexPages.currentPage().getParameters().put('lngVal','124');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceBrand','Apple');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceName','Iphone');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceType','Phone');
        ApexPages.currentPage().getParameters().put('linkOpenedDeviceBrowser','Mozilla');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.saveLocationInfo();
    }
    Test.stopTest();
}

static testmethod void testCallbackRequest() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Lead> leadList = [SELECT Id FROM Lead WHERE Lead_Medium__c = 'Web' AND IsConverted = false ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        ApexPages.currentPage().getParameters().put('rFromDt','2022-11-19');
        ApexPages.currentPage().getParameters().put('rFromTi','16:00');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.submitCallbackRequest();
    }
    Test.stopTest();
}

static testmethod void testApplicationLogs() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Lead> leadList = [SELECT Id FROM Lead WHERE Lead_Medium__c = 'Web' AND IsConverted = false ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        ApexPages.currentPage().getParameters().put('logs','Uploaded Photo Id');
        ApexPages.currentPage().getParameters().put('userAgent','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/110.0');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.updateApplicationLogs();
    }
    Test.stopTest();
}
    
static testmethod void testApplicationLogs2() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new FirebaseCalloutMock());
    List<Account> acctList = [SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        ApexPages.currentPage().getParameters().put('logs','Privacy Policy & Credit Guide');
        ApexPages.currentPage().getParameters().put('userAgent','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/110.0');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.updateApplicationLogs();
    }
    Test.stopTest();
}

static testmethod void testParseDate() 
{
    Test.startTest();
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
    ra.parseDateString('15 JUN 1994');
    ra.parseDateString('15/06/1994');
    ra.parseDateString('15-06-1994');
    ra.parseDateString('1994-06-15');
    ra.parseDateString('15061994');
    Test.stopTest();
}

//should be deleted later    
/*
static testmethod void testParseDateRemove() 
{
    Test.startTest();
    R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
    ra.parseDateStringRemove('15 JUN 1994');
    ra.parseDateStringRemove('15/06/1994');
    ra.parseDateStringRemove('15-06-1994');
    ra.parseDateStringRemove('1994-06-15');
    Test.stopTest();
}    
*/

static testmethod void testOCRDL() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new GoogleOCRMockCallout());
    List<Lead> leadList = [SELECT Id,Account__c,Account__r.PersonMobilePhone,Account__r.Birthdate__c,Account__r.Centrepay_Ref_No__c,
                       Account__r.FirstName,Account__r.LastName,Account__r.PersonEmail
                       FROM Lead WHERE IsConverted = true AND Lead_Medium__c = 'Web' AND Account__r.Centrepay_Ref_No__c != null
                       ORDER BY CreatedDate DESC LIMIT 1];
    List<Account> acctList = [SELECT Id,Photo_Id_Front__c FROM Account WHERE Territory_State__c != 'NZ' AND Photo_Id_Front__c != null 
                                AND Identification_Type__c in ('Driver Licence','Driver License')
                                AND Identification_No__c != null ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0 && leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.sendOCRRequest(acctList[0].Photo_Id_Front__c,leadList[0].Id,'back');
    }
    Test.stopTest();
}
    
static testmethod void testOCRPassport() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new GoogleOCRMockCallout());
    List<Lead> leadList = [SELECT Id,Account__c,Account__r.PersonMobilePhone,Account__r.Birthdate__c,Account__r.Centrepay_Ref_No__c,
                       Account__r.FirstName,Account__r.LastName,Account__r.PersonEmail
                       FROM Lead WHERE IsConverted = true AND Lead_Medium__c = 'Web' AND Account__r.Centrepay_Ref_No__c != null
                       ORDER BY CreatedDate DESC LIMIT 1];
    List<Account> acctList = [SELECT Id,Photo_Id_Front__c FROM Account WHERE Territory_State__c != 'NZ' AND Photo_Id_Front__c != null 
                                AND Identification_Type__c in ('Passport')
                                AND Identification_No__c != null ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0 && leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.sendOCRRequest(acctList[0].Photo_Id_Front__c,leadList[0].Id,'front');
    }
    Test.stopTest();
}
    
static testmethod void testOCRKeypass() 
{
    Test.startTest();
    Test.setMock(HttpCalloutMock.class, new GoogleOCRMockCallout());
    List<Lead> leadList = [SELECT Id,Account__c,Account__r.PersonMobilePhone,Account__r.Birthdate__c,Account__r.Centrepay_Ref_No__c,
                       Account__r.FirstName,Account__r.LastName,Account__r.PersonEmail
                       FROM Lead WHERE IsConverted = true AND Lead_Medium__c = 'Web' AND Account__r.Centrepay_Ref_No__c != null
                       ORDER BY CreatedDate DESC LIMIT 1];
    List<Account> acctList = [SELECT Id,Photo_Id_Front__c FROM Account WHERE Territory_State__c != 'NZ' AND Photo_Id_Front__c != null 
                                AND Identification_Type__c in ('Keypass')
                                AND Identification_No__c != null ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0 && leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.sendOCRRequest(acctList[0].Photo_Id_Front__c,leadList[0].Id,'front');
    }
    Test.stopTest();
}
    
static testmethod void testInitTCs() 
{
    Test.startTest();
    List<Territory__c> terrList = [SELECT Id FROM Territory__c WHERE Name = '1000' LIMIT 1];
    if(terrList.size() > 0){
        ApexPages.currentPage().getParameters().put('terId',terrList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initTCs();
    }
    Test.stopTest();
}

static testmethod void testSummaryPage() 
{
    Test.startTest();
    List<Account> acctList = [SELECT Id,Photo_Id_Front__c FROM Account WHERE Company_Territory__c = true AND Application_Signed_Date__c <> null ORDER BY Application_Signed_Date__c DESC LIMIT 1];
    if(acctList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        ApexPages.currentPage().getParameters().put('type','Other Expense');
        ApexPages.currentPage().getParameters().put('amount','44');
        ApexPages.currentPage().getParameters().put('details','yes');
        ApexPages.currentPage().getParameters().put('param','expsum');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.updateExpenseSummaryDetails();
        ra.confirmExpenseSummaryDetails();
    }
    Test.stopTest();
}

static testmethod void testSummaryPage2() 
{
    Test.startTest();
    List<Account> acctList = [SELECT Id,Photo_Id_Front__c FROM Account WHERE Company_Territory__c = true AND Application_Signed_Date__c <> null ORDER BY Application_Signed_Date__c DESC LIMIT 1];
    if(acctList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        ApexPages.currentPage().getParameters().put('type','Other Expense');
        ApexPages.currentPage().getParameters().put('amount','44');
        ApexPages.currentPage().getParameters().put('details','yes');
        ApexPages.currentPage().getParameters().put('param','incsum');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.confirmExpenseSummaryDetails();
        ApexPages.currentPage().getParameters().put('param','sursum');
        ra.confirmExpenseSummaryDetails();
    }
    Test.stopTest();
}
    
    static testmethod void testSave() 
{
    Test.startTest();
    List<Account> acctList = [SELECT Id,Photo_Id_Front__c,FirstName,LastName,PersonMobilePhone,PersonEmail FROM Account WHERE Company_Territory__c = true AND Application_Signed_Date__c <> null ORDER BY Application_Signed_Date__c DESC LIMIT 1];
    if(acctList.size() > 0){
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('firstName',acctList[0].FirstName);
        Apexpages.currentPage().getParameters().put('lastName',acctList[0].LastName);
        Apexpages.currentPage().getParameters().put('phone',acctList[0].PersonMobilePhone);
        Apexpages.currentPage().getParameters().put('email',acctList[0].PersonEmail);
        Apexpages.currentPage().getParameters().put('gender','Male');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.save();
    }
    Test.stopTest();
}
    
static testmethod void testCreditGuideEmail() 
{
    Test.startTest();
    List<Lead> leadList = [SELECT Id FROM Lead WHERE IsConverted = true AND Account__r.PersonEmail != null ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.initTCs();
        ra.sendCreditGuideEmail();
    }
    Test.stopTest();
}

static testmethod void testRemindMeIn() 
{
    Test.startTest();
    List<Lead> leadList = [SELECT Id FROM Lead WHERE IsConverted = false ORDER BY CreatedDate DESC LIMIT 1];
    if(leadList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        ApexPages.currentPage().getParameters().put('remindMeIn','9AM');
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.remindMeIn();
    }
    Test.stopTest();
}

static testmethod void testConfirmOtherIncome() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('fnightlyOtherInc','400');
        Apexpages.currentPage().getParameters().put('otherIncAgree','yes');
        ra.getFormDetails();
        ra.confirmOtherIncome();
    }
    Test.stopTest();
}

static testmethod void testUpdateTransferRelationship() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('transferRelationship','Savings');
        ra.getFormDetails();
        ra.updateTransferRelationship();
    }
    Test.stopTest();
}

static testmethod void testAcceptPUATerms() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('poaTerm1','yes');
        Apexpages.currentPage().getParameters().put('poaTerm2','yes');
        Apexpages.currentPage().getParameters().put('poaTerm3','yes');
        ra.getFormDetails();
        ra.acceptPOATerms();
    }
    Test.stopTest();
}

static testmethod void testDeclinePUATerms() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('poaTerm1','yes');
        Apexpages.currentPage().getParameters().put('poaTerm2','yes');
        Apexpages.currentPage().getParameters().put('poaTerm3','no');
        ra.getFormDetails();
        ra.acceptPOATerms(); 
    }
    Test.stopTest();
}

static testmethod void testDeclineAcknowledgement() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account WHERE PersonEmail != null ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('rfirstName','Shrijit');
        Apexpages.currentPage().getParameters().put('rlastName','Test');
        Apexpages.currentPage().getParameters().put('rphone','03434343434343434');
        Apexpages.currentPage().getParameters().put('remail','test@test.com.au');
        Apexpages.currentPage().getParameters().put('rstreetName','11 test');
        Apexpages.currentPage().getParameters().put('rsuburb','Blackburn');
        Apexpages.currentPage().getParameters().put('rstate','VIC');
        Apexpages.currentPage().getParameters().put('rpostalCode','3130');
        Apexpages.currentPage().getParameters().put('acceptOrDecline','decline');
        ra.initAcknowledgementAndConsent();
        ra.acceptAcknowledgement();
        ra.addReferral();
    }
    Test.stopTest();
}

static testmethod void testAcceptAcknowledgement() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account WHERE PersonEmail != null AND Probable_Account__c != null ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('acceptOrDecline','accept');
        ra.initAcknowledgementAndConsent();
        ra.acceptAcknowledgement();
    }
    Test.stopTest();
}

static testmethod void testAcceptAcknowledgement2() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account WHERE PersonEmail != null AND Probable_Account__c = null AND Probable_Territory__c != null ORDER BY CreatedDate DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('acceptOrDecline','accept');
        ra.initAcknowledgementAndConsent();
        ra.acceptAcknowledgement();
    }
    Test.stopTest();
}

static testmethod void testMiscellaneous() {
    Test.startTest();
    List<Account> acctList = [SELECT Id FROM Account WHERE MyGov_date__c != null ORDER BY MyGov_date__c DESC LIMIT 1];
    if(acctList.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('id',acctList[0].Id);
        Apexpages.currentPage().getParameters().put('acceptOrDecline','accept');
        Apexpages.currentPage().getParameters().put('idType','Other');
        Apexpages.currentPage().getParameters().put('idTypeOther','Other');
        ra.getFormDetails();
        ra.skipMygovStatement();
        ra.saveShortLinkOpenedDeviceDataForHybridLink();
        ra.saveConsent();
        ra.saveIndentificationType();
    }
    Test.stopTest();
}

static testmethod void testUpdateProdSummary() {
    Test.startTest();
    List<Cart_Item__c> cartItems = [SELECT Id,Lead__c FROM Cart_Item__c WHERE Lead__c != null AND Cash_Price__c > 50 ORDER BY CreatedDate DESC LIMIT 1];
    if(cartItems.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('ld',cartItems[0].Lead__c);
        ApexPages.currentPage().getParameters().put('cartId',cartItems[0].Id);
        ra.initEnquiry();
        ra.showSelectedProduct = true;
        ra.proposedFrequency = 'Weekly';
        ra.proposedTerm = '24';
        ra.updateProductSummary();
    }
    Test.stopTest();
}

static testmethod void testUpdateProdSummary2() {
    Test.startTest();
    List<Cart_Item__c> cartItems = [SELECT Id,Lead__c FROM Cart_Item__c WHERE Lead__c != null AND Cash_Price__c > 50 ORDER BY CreatedDate DESC LIMIT 1];
    if(cartItems.size() > 0){
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();
        ApexPages.currentPage().getParameters().put('ld',cartItems[0].Lead__c);
        ApexPages.currentPage().getParameters().put('cartId',cartItems[0].Id);
        ra.initEnquiry();
        ra.showSelectedProduct = false;
        ra.proposedFrequency = 'Weekly';
        ra.proposedTerm = '24';
        ra.updateProductSummary();
    }
    Test.stopTest();
}

static testmethod void testConvertLeadOnline() 
{
    Test.startTest();
    List<Lead> leadList = [SELECT Id FROM Lead WHERE IsConverted = false ORDER BY CreatedDate DESC LIMIT 1];
    List<Account> acctList = [select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,OwnerId,CAM_Income__c,CAM_Expense__c,
                                PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Active_Agreements__c,Gender__pc,myGov_Completion_Datetime__c,BankStatement_Completion_Datetime__c,
                                Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c,Customer_Photo_Id__c,Mygov_DOB__c,myGov_Captured_CRN__c,
                                MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,Hybrid_Link_Status__c,Consent_URL_Address__c,Explanation_for_Other_ID_type__c,
                                Explanation_for_Recent_Enquiries__c,Veda_Notes__c,Explanation_for_All_Other_Defaults__c,No_of_Equifax_Enquiries_Last_6_Month__c,Equifax_No_of_Unpaid_Default_NonRental__c,Equifax_No_of_Unpaid_Default_Rental__c,Equifax_Age_of_File__c,Equifax_Enquiry_DateTime__c,Equifax_Enquiry_Id__c,Veda_File_Number__c,Enquiries_in_the_last_6_months__c,
                                WrittenOff_s_Count__c,Last_Agreement_Close_Date__c,RecordType.Name,UnformattedAddress_VedaAlert_Report__c,Length_of_Stay_in_Current_Address__c,Residential_Status__c,Landlord_Name__c,Landlord_Telephone__c,Previous_Address__c,Length_of_Stay_in_Previous_Address__c,Number_of_Dependants__c,
                                Marital_Status__pc,Next_Online_Step_Param__c,Shared_Details__c,Rent_Mortgage_Board_Details__c,Entertaiment_Details__c,Loan_Payment_Details__c,Credit_Card_Details__c,Insurance_Details__c,Food_Details__c,Utilities_Details__c,Car_Lease_Loan_Payment_Details__c,Mygov_Captured_Address__c,
                                Comfortable_Spending__c,Employer_Name__c,Employment_Type__c,Employment_Commencement_Date__c,Other_Income_Source__c,Other_Income_Details__c,Centrepay_Outgoings__c,Existing_R4K_Payment__c,   
                                MOGO_Mobile_Transactions__c,MOGO_Clothing_Transactions__c,MOGO_Tobacco_Alcohol_Transactions__c,MOGO_Other_Transactions__c,Photo_Id_Front__c,Photo_Id_Back__c,Other_Rental_Company_Details__c,Centrepay_Ref_No__c,Driver_Licence_State__c,Passport_Country__c,Employment_Income__c,
                                Basic_Info_Online__c,RO_Online__c,Income_Online__c,Expense_Online__c,Referees_Online__c,Equifax_Online__c,Consent_URL_Device_Info__c,MOGO_Captured_Address__c,MOGO_Centrelink_Income__c,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,
                                Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Total_Remaining_Amount__c,LastPaymentRecieved__c,Fortnightly_Scheduled_Payment__c,Last_Payment_Upload_Date__c,Territory_Number__r.Company_Territory__c,Highlevel_Income__c,Loan_Purpose__c,  
                                Rent_Mortgage_Board__c,Loan_Payments__c,Credit_Card__c,Insurance__c,Food__c,Utilities__c,Car_Lease_Loan_Payment__c,Mobile_Expenses__c,Clothing__c,Tobacco_Alcohol__c,OtherOutgoings__c,Other_Rental_Companies__c,Territory_State__c,
                                Rent_Online__c,Tobacco_Alcohol_Online__c,Transport_Travel_Online__c,Utilities_Online__c,Clothing_Online__c,Credit_Card_Online__c,Household_Online__c,Insurance_Online__c,Loan_Online__c,Mobile_Online__c,Other_Regular_Online__c,Other_Rental_Online__c,
                                Centrelink_Benefit_Amount__c,Centrelink_Benefit2_Amount__c,Centrelink_Benefit3_Amount__c,Other_Centrelink_Benefit_Amount__c,Other_Income_Amount__c,Rent4Keeps_Payment_C__c,Expense_Details__c,PersonContactId,Territory_Number__r.Name,
                                Centrelink_Benefit__c,Centrelink_Benefit2__c,Centrelink_Benefit3__c,Other_Centrelink_Benefit__c,Entertaiment__c,Territory_Number__r.Is_Credit_Contract__c,Rent4Keeps_Account__c,PUA_Status__c,PUA_Status_DateTime__c,PUA_Declined_Reason__c
                                FROM Account WHERE MyGov_date__c != null AND Territory_Number__r.Is_Credit_Contract__c = true ORDER BY MyGov_date__c DESC LIMIT 1];
    if(leadList.size() > 0 && acctList.size() > 0){
        ApexPages.currentPage().getParameters().put('ld',leadList[0].Id);
        R4KOnlineApplicationController ra = new R4KOnlineApplicationController();  
        ra.getFormDetails();
        ra.convertLeadOnline(ra.lead, acctList[0], acctList[0].FirstName, acctList[0].LastName, '1994', 'Passport', '313545435', 'mohitpuli@r4k.com.au', '0449066375', '9999999999');
    }
    Test.stopTest();
}
    
}