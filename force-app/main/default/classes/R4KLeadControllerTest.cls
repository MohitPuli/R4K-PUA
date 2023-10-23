@isTest(SeeAllData=true)
public class R4KLeadControllerTest {

    static Account applicant;
    static Account applicant2;
    static Opportunity opp2;
    static Territory__c territory;
    static Lead lead;

    static void createTestData() {
        territory = [
                SELECT
                    Id,
                    Name,
                    Short_Name__c
                FROM
                    Territory__c WHERE Name = '1000'
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
            Territory_Number__c = territory.Id,
            PersonMobilePhone = '0449066375',
            Enquiry_Status__c = 'Enquiry',
            Enquiry_Date__c = Date.today()
        );
        insert applicant;

        applicant2 = new Account(
            RecordTypeId = personAccountRecordType.Id,
            Salutation = 'Mr.',
            FirstName = 'UnitTest',
            LastName = 'Applicant1',
            Centrepay_Ref_No__c = 'XXXXXXXXXX',
            Ezidebit_Ref_No__c = null, 
            Customer_No__c = 'xxxxxxxx',
            Territory_Number__c = territory.Id,
            PersonMobilePhone = '0449066376',
            Enquiry_Status__c = 'Applicant',
            Enquiry_Date__c = Date.today()
        );
        insert applicant2;

        opp2 = new Opportunity(
            Name = 'UnitTest - ContractTest1',
            AccountId = applicant2.Id,
            StageName = 'Goods Delivered',
            Start_Date__c = Date.today(),
            CloseDate = Date.today().addMonths(12),
            Term_Months__c = '12',
            Payment_Frequency__c = 'Fortnightly',
            GoogleDriveFolderId__c='folderId',
            Gift_To__c = 'test',
            Requirements_Objectives__c ='test',
            Why_was_the_agreement_approved__c = 'test',
            Amount = 2000,
            TaxInvoice_Signed_DateTime__c = DateTime.now().addDays(-15)
        );
        insert opp2;

        lead = new Lead(
            Salutation = 'Mr.',
            FirstName = 'unittest',
            LastName = 'test lead',
            MobilePhone = '0411957833',
            Phone = '0282409294',
            Email = 'test@systempartners.com',
            Company = 'Test Company',
            PostalCode = '3130',
            Referring_Customer__c = null,
            Not_Spam__c='yes',
            Form_Type__c='Credit Contract'
        );
        insert lead;
    }

    @IsTest
    static void testLeadInsertion(){    
        Test.startTest();
        createTestData();
        Test.stopTest();
    }

    @IsTest
    static void testLeadMerging(){    
        Test.startTest();
        createTestData();
        Lead lead2 = new Lead(
            Salutation = 'Mr.',
            FirstName = 'unittest',
            LastName = 'test lead',
            MobilePhone = '0411957833',
            Phone = '0282409294',
            Email = 'test@systempartners.com',
            Company = 'Test Company',
            PostalCode = '3130',
            Referring_Customer__c = null,
            Not_Spam__c='yes'
        );
        insert lead2;
        Test.stopTest();
    }

    @IsTest
    static void testProbableAccount(){    
        Test.startTest();
        createTestData();
        Lead lead2 = new Lead(
            Salutation = 'Mr.',
            FirstName = 'unittest',
            LastName = 'test lead',
            MobilePhone = '0449066375',
            Phone = '0282409294',
            Email = 'test@systempartners.com',
            Company = 'Test Company',
            PostalCode = '3130',
            Referring_Customer__c = null,
            Not_Spam__c='yes'
        );
        insert lead2;
        Test.stopTest();
    }

    @IsTest
    static void testProbableAccountDeliveryStatus(){    
        Test.startTest();
        createTestData();
        Lead lead2 = new Lead(
            Salutation = 'Mr.',
            FirstName = 'unittest',
            LastName = 'test lead',
            MobilePhone = '0449066376',
            Phone = '0282409294',
            Email = 'test@systempartners.com',
            Company = 'Test Company',
            PostalCode = '3130',
            Referring_Customer__c = null,
            Not_Spam__c='yes'
        );
        insert lead2;
        Test.stopTest();
    }

    @IsTest
    static void testProbableAccountFromAccount(){    
        Test.startTest();
        List<Account> acctList = [SELECT Id FROM Account WHERE PersonMobilePhone != null AND LastName != null AND 
                                    PersonMailingPostalCode != null AND Territory_Number__r.Is_Credit_Contract__c = true AND 
                                    Territory_Number__r.Name != '1000' AND Territory_Number__r.State_Master_State__c != 'NZ' ORDER BY CreatedDate DESC LIMIT 1];
        if(acctList.size() > 0){
            R4KLeadController.findProbableAccount(null, acctList[0].Id);
        }
        Test.stopTest();
    }

    @IsTest
    static void testLeadAssignment(){    
        Test.startTest();
        List<Lead> ldList = [SELECT Id FROM Lead WHERE MobilePhone != null AND LastName != null AND 
                                Territory_Number__r.State_Master_State__c != 'NZ' AND IsConverted = false 
                                ORDER BY CreatedDate DESC LIMIT 1];
        if(ldList.size() > 0){
            R4KLeadController.assignLeadOwner(ldList[0].Id);
        }
        Test.stopTest();
    }

    @IsTest
    static void testLeadAssignment2(){    
        Test.startTest();
        List<Lead> ldList = [SELECT Id FROM Lead WHERE MobilePhone != null AND LastName != null AND IsConverted = false AND
                                Territory_Number__r.State_Master_State__c != 'NZ' AND Probable_Account__c != null AND Territory_Number__r.Is_Credit_Contract__c = true
                                ORDER BY CreatedDate DESC LIMIT 1];
        if(ldList.size() > 0){
            R4KLeadController.assignLeadOwner(ldList[0].Id);
        }
        Test.stopTest();
    }

}