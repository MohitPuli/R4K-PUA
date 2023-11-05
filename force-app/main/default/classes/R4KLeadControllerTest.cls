@isTest(SeeAllData=true)
public class R4KLeadControllerTest {

    public static Account applicant;
    public static Account applicant2;
    public static Opportunity opp2;
    public static Territory__c territory;
    public static Lead lead;

    public static void createTestData() {
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
            Form_Type__c='Credit Contract',
            Lead_Medium__c = 'Web'
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
            Lead_Medium__c = 'Web',
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
            Lead_Medium__c = 'Web',
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

    @IsTest
    static void testConvertToApplicant(){    
        Test.startTest();
        List<Lead> ldList = [SELECT Id,FirstName,LastName,MobilePhone,crn__c,Country,Lead_Medium__c,Territory_Number__c,PostalCode,Territory_Number__r.Name,
                                Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Territory_Number__r.Short_Name__c,Incoming_Count__c,
                                Identity_Confirmed_By_Customer__c,OwnerId,Territory_Number__r.Lead_Phone__c,Territory_Number__r.SMS_Lead_Phone__c,Outgoing_Count__c,OTP_Code__c,
                                SMS_Mobile__c,Email,Reason_For_Enquiry__c,Form_Type__c,Opt_In_Info_From_Rent4keeps__c,Rent4Keeps_Account__c,Call_Time_Charged_minutes__c,
                                CreatedDate,Street,City,State,Desired_Product__c,contact_desc__c,did_your_hear__c,Territory_State__c,TwilioRecordingSid__c,TwilioCallSid__c,
                                Territory_Number__r.SMSTemplate__c,Territory_Number__r.SMSTemplate__r.GENSMS_Lead_Action_Key__c,Territory_Number__r.SMSTemplate__r.JMPQ_Lead_Action_Key__c,Automated_Bot_Message_Tracking__c   
                                FROM Lead WHERE MobilePhone != null AND LastName != null AND IsConverted = false AND
                                Territory_Number__r.State_Master_State__c != 'NZ' AND Probable_Account__c != null AND Territory_Number__r.Is_Credit_Contract__c = true
                                ORDER BY CreatedDate DESC LIMIT 1];

        List<Account> acctList = [SELECT Id,Enquiry_Date__c,State_Master_State__c,Company_Territory__c,Rep_Responsible_For_Converting_Lead__c,Rep_Responsible_For_Converting_Lead__r.Name,
                                No_of_times_lead_has_been_converted__c,No_Of_Active_Agreements__c,Days_Since_Expected_Payment__c,WrittenOff_s_Count__c,Last_Default_Letter_Sent_Date__c,
                                Actual_Arrears__c,Total_Paid_Amount_Active_Only__c,Enquiry_Status__c 
                                FROM Account WHERE PersonMobilePhone != null AND LastName != null AND 
                                PersonMailingPostalCode != null AND Territory_Number__r.Is_Credit_Contract__c = true AND Territory_Number__r.Company_Territory__c = true AND
                                Territory_Number__r.Name != '1000' AND Territory_Number__r.State_Master_State__c != 'NZ' ORDER BY CreatedDate DESC LIMIT 1];
        if(ldList.size() > 0 && acctList.size() > 0){
            R4KLeadController.convertToApplicant(ldList[0],acctList[0],'Delivery Status');
        }
        Test.stopTest();
    }

    @IsTest
    static void testAcctCategory(){    
        Test.startTest();
        List<Lead> ldList = [SELECT Id,FirstName,LastName,MobilePhone,crn__c,Country,Lead_Medium__c,Territory_Number__c,PostalCode,Territory_Number__r.Name,
                                Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Territory_Number__r.Short_Name__c,Incoming_Count__c,
                                Identity_Confirmed_By_Customer__c,OwnerId,Territory_Number__r.Lead_Phone__c,Territory_Number__r.SMS_Lead_Phone__c,Outgoing_Count__c,OTP_Code__c,
                                SMS_Mobile__c,Email,Reason_For_Enquiry__c,Form_Type__c,Opt_In_Info_From_Rent4keeps__c,Rent4Keeps_Account__c,Call_Time_Charged_minutes__c,
                                CreatedDate,Street,City,State,Desired_Product__c,contact_desc__c,did_your_hear__c,Territory_State__c,TwilioRecordingSid__c,TwilioCallSid__c,
                                Territory_Number__r.SMSTemplate__c,Territory_Number__r.SMSTemplate__r.GENSMS_Lead_Action_Key__c,Territory_Number__r.SMSTemplate__r.JMPQ_Lead_Action_Key__c,Automated_Bot_Message_Tracking__c   
                                FROM Lead WHERE MobilePhone != null AND LastName != null AND IsConverted = false AND
                                Territory_Number__r.State_Master_State__c != 'NZ' AND Probable_Account__c != null AND Territory_Number__r.Is_Credit_Contract__c = true
                                ORDER BY CreatedDate DESC LIMIT 1];

        List<Account> acctList = [SELECT Id,Enquiry_Date__c,State_Master_State__c,Company_Territory__c,Rep_Responsible_For_Converting_Lead__c,Rep_Responsible_For_Converting_Lead__r.Name,
                                No_of_times_lead_has_been_converted__c,No_Of_Active_Agreements__c,Days_Since_Expected_Payment__c,WrittenOff_s_Count__c,Last_Default_Letter_Sent_Date__c,
                                Actual_Arrears__c,Total_Paid_Amount_Active_Only__c,Enquiry_Status__c 
                                FROM Account WHERE PersonMobilePhone != null AND LastName != null AND 
                                PersonMailingPostalCode != null AND Territory_Number__r.Is_Credit_Contract__c = true AND Territory_Number__r.Company_Territory__c = true AND
                                Territory_Number__r.Name != '1000' AND Territory_Number__r.State_Master_State__c != 'NZ' ORDER BY CreatedDate DESC LIMIT 1];
        if(ldList.size() > 0 && acctList.size() > 0){
            R4KLeadController.getAccountCategory(acctList[0], ldList[0]);
        }
        Test.stopTest();
    }

    @IsTest
    static void testFindProbTerritory(){    
        Test.startTest();
        R4KLeadController.findTerritory('3130','AU',true);
        R4KLeadController.findTerritory('3130','AU',false);
        R4KLeadController.findTerritory('0110','NZ',false);
        R4KLeadController.findTerritory('3999','AU',false);
        Test.stopTest();
    }

}