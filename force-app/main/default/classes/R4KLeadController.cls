public without sharing class R4KLeadController{
    
    @future(callout=true)
    public static void assignLeadOwner(String strLead){
        try{
            Boolean leadMerged = false;
            List<Lead> ldList = [SELECT Id,FirstName,LastName,MobilePhone,crn__c,Country,Lead_Medium__c,Territory_Number__c,PostalCode,Territory_Number__r.Name,
                               Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Territory_Number__r.Short_Name__c,Incoming_Count__c,
                               Identity_Confirmed_By_Customer__c,OwnerId,Territory_Number__r.Lead_Phone__c,Territory_Number__r.SMS_Lead_Phone__c,Outgoing_Count__c,
                               SMS_Mobile__c,Email,Reason_For_Enquiry__c,Form_Type__c,Opt_In_Info_From_Rent4keeps__c,Rent4Keeps_Account__c,Call_Time_Charged_minutes__c,
                               CreatedDate,Street,City,State,Desired_Product__c,contact_desc__c,did_your_hear__c,Territory_State__c,TwilioRecordingSid__c,TwilioCallSid__c,
                               Territory_Number__r.SMSTemplate__c,Territory_Number__r.SMSTemplate__r.GENSMS_Lead_Action_Key__c,Territory_Number__r.SMSTemplate__r.JMPQ_Lead_Action_Key__c,Automated_Bot_Message_Tracking__c   
                               FROM Lead WHERE Id =: strLead LIMIT 1];
            
            if(ldList.size() > 0 && ldList[0].Form_Type__c != 'Buy Now'){
                Lead lead = ldList[0];
                String newLeadMedium = ldList[0].Lead_Medium__c;
                String newLeadFormType = ldList[0].Form_Type__c;
                String jmpqActionKey = ldList[0].Territory_Number__r.SMSTemplate__r.JMPQ_Lead_Action_Key__c;
                String genActionKey = ldList[0].Territory_Number__r.SMSTemplate__r.GENSMS_Lead_Action_Key__c;

                //generate hybrid links
                String onlineURL = SiteEndpoint__c.getValues('Online').URL__c;
                String randomNumber = SecretUtil.generateRandomNumber();
                String hybridLink = onlineURL+'/R4KOnlineFormAcknowledgementPage?ld='+lead.Id+'&n='+randomNumber;
                ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                if(!Test.isRunningTest()){
                    hybridLink = sl.shortLinkGenerator(hybridLink);
                }

                //merge leads if there is a similar lead with same mobile number in 1000 territory
                List<Lead> matchingLeads = new List<Lead>();
                if(Test.isRunningTest()){
                    matchingLeads = [SELECT Id,FirstName,LastName,Name,MobilePhone,OwnerId,Owner.Name,Territory_Number__c,Territory_Short_Name__c,Reason_for_Enquiry__c,Street,City,
                                        State,PostalCode,Lead_Medium__c,Email,CreatedDate,did_your_hear__c,contact_desc__c,Call_Time_Charged_minutes__c,Phone_Recording__c,Desired_Product__c,Territory_State__c,CRN__c,Incoming_Count__c,Outgoing_Count__c,
                                        TwilioCallSid__c,TwilioRecordingSid__c,Automation_Outcome__c,Last_Automated_Bot_Message__c,Next_Automated_Bot_Message__c,Automated_Bot_Message_Tracking__c,Bot_Call_Datetime__c,Next_Bot_Call_Datetime__c
                                        FROM Lead WHERE IsConverted = false AND Id <>: lead.Id ORDER BY CreatedDate DESC LIMIT 2];
                }else{
                    String alternateMobilePhone = lead.MobilePhone;
                    if(lead.MobilePhone != null && lead.MobilePhone.length() == 9 && !lead.MobilePhone.startsWith('0')){
                        alternateMobilePhone = ('0' + lead.MobilePhone);
                    }
                    matchingLeads = [SELECT Id,FirstName,LastName,Name,MobilePhone,OwnerId,Owner.Name,Territory_Number__c,Territory_Short_Name__c,Reason_for_Enquiry__c,Street,City,
                                    State,PostalCode,Lead_Medium__c,Email,CreatedDate,did_your_hear__c,contact_desc__c,Call_Time_Charged_minutes__c,Phone_Recording__c,Desired_Product__c,Territory_State__c,CRN__c,Incoming_Count__c,Outgoing_Count__c,
                                    TwilioCallSid__c,TwilioRecordingSid__c,Automation_Outcome__c,Last_Automated_Bot_Message__c,Next_Automated_Bot_Message__c,Automated_Bot_Message_Tracking__c,Bot_Call_Datetime__c,Next_Bot_Call_Datetime__c
                                    FROM Lead WHERE 
                                    (MobilePhone =: lead.MobilePhone OR MobilePhone =: alternateMobilePhone) AND
                                    IsConverted = false AND Id <>: lead.Id AND  
                                    Form_Type__c != 'Buy Now' AND 
                                    Territory_Number__r.Name = '1000'
                                    ORDER BY CreatedDate ASC LIMIT 2];
                }
                if(matchingLeads.size() > 0 && !Test.isRunningTest()){
                    hybridLink = onlineURL+'/R4KOnlineFormAcknowledgementPage?ld='+matchingLeads[0].Id+'&n='+randomNumber;
                    hybridLink = sl.shortLinkGenerator(hybridLink);
                }
                String masterLeadId = R4KLeadController.mergeLeads(lead, matchingLeads);
                System.debug('##masterLeadId ' + masterLeadId);

                if(!String.valueOf(lead.Id).substring(0,15).equals(String.valueOf(masterLeadId).substring(0,15))){
                    lead = [SELECT Id,FirstName,LastName,MobilePhone,crn__c,Country,Lead_Medium__c,Territory_Number__c,PostalCode,Territory_Number__r.Name,
                               Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Territory_Number__r.Short_Name__c,
                               Identity_Confirmed_By_Customer__c,OwnerId,Territory_Number__r.Lead_Phone__c,Territory_Number__r.SMS_Lead_Phone__c,
                               SMS_Mobile__c,Email,Reason_For_Enquiry__c,Form_Type__c,Opt_In_Info_From_Rent4keeps__c,Rent4Keeps_Account__c,Call_Time_Charged_minutes__c,
                               CreatedDate,Street,City,State,Desired_Product__c,contact_desc__c,did_your_hear__c,Territory_State__c,TwilioRecordingSid__c,TwilioCallSid__c,
                               Territory_Number__r.SMSTemplate__c,Territory_Number__r.SMSTemplate__r.GENSMS_Lead_Action_Key__c,Territory_Number__r.SMSTemplate__r.JMPQ_Lead_Action_Key__c,Automated_Bot_Message_Tracking__c   
                               FROM Lead WHERE Id =: masterLeadId LIMIT 1];
                    leadMerged = true;
                }

                //find possible territory
                Territory__c probTerritory = R4KLeadController.findTerritory(lead.PostalCode, (lead.Country != null && (lead.Country.contains('New Zealand') || lead.Country.contains('NZ')) ? 'NZ' : 'AU'), (lead.Form_Type__c == 'RENT4KEEPS ENQUIRY'));
                System.debug('##probTerritory ' + probTerritory.Name);

                //find probable account
                ProbableAccountWrapper paWrap = R4KLeadController.findProbableAccount(lead.Id, null);
                System.debug('##probableAccounts ' + paWrap);

                Account probableAccount = paWrap.ccAcct;
                Account rent4keepsAccount = paWrap.clAcct;

                //get bucket
                String applicantStatus = R4KLeadController.getAccountCategory(probableAccount, lead);
                System.debug('##applicantStatus ' + applicantStatus);

                Boolean sendCollectionsSMS = applicantStatus == 'Collection' ? true : false;
                Boolean sendWeCareSMS = (applicantStatus == 'Delivery Status' || applicantStatus == 'Account Enquiry' || applicantStatus == 'Service Enquiry' || applicantStatus == 'Other Enquiry') ? true : false;
                Boolean sendCLOSMS = (applicantStatus == 'Recent Application' || applicantStatus == 'New Enquiry') ? true : false;
                DateTime todayDateTime = DateTime.now();
                String dateTimeString = todayDateTime.format('dd/MM') + ' ' + todayDateTime.hour() + ':' + todayDateTime.minute();

                Lead ld = new Lead();
                ld.Id = lead.Id;
                ld.Automation_Outcome__c = (sendCollectionsSMS ? 'Collections' : (sendWeCareSMS ? 'We Care' : null));
                ld.Last_Automated_Bot_Message__c = (sendCollectionsSMS || sendWeCareSMS) ? 'GENSMS' : 'JMPQ';
                ld.Next_Automated_Bot_Message__c = (sendCollectionsSMS || sendWeCareSMS) ? 'NONE' : null;
                ld.Automated_Bot_Message_Tracking__c = ((lead.Automated_Bot_Message_Tracking__c == null ? '' : (lead.Automated_Bot_Message_Tracking__c + '\n')) + ((sendCollectionsSMS || sendWeCareSMS) ? 'GENSMS - ' + dateTimeString : 'JMPQ - ' + dateTimeString));
                ld.Hybrid_Link__c = hybridLink;

                //if probable account falls into New Enquiry bucket add the lead in 1000 territory
                if(applicantStatus == 'New Enquiry'){
                    Territory__c r4kLicensing = [SELECT Id,OwnerId,SMSTemplate__c,SMSTemplate__r.JMPQ_Lead_Action_Key__c,SMSTemplate__r.GENSMS_Lead_Action_Key__c FROM Territory__c WHERE Name = '1000' LIMIT 1];
                    ld.Territory_Number__c = r4kLicensing.Id;
                    ld.OwnerId = r4kLicensing.OwnerId;
                    jmpqActionKey = r4kLicensing.SMSTemplate__r.JMPQ_Lead_Action_Key__c;
                    genActionKey = r4kLicensing.SMSTemplate__r.GENSMS_Lead_Action_Key__c;
                }else if(probableAccount != null){
                    System.debug('##probableAccount ' + probableAccount.Customer_No__c);
                    ld.Territory_Number__c = probTerritory.Id;
                    ld.OwnerId = probTerritory.OwnerId;
                    jmpqActionKey = probTerritory.SMSTemplate__r.JMPQ_Lead_Action_Key__c;
                    genActionKey = probTerritory.SMSTemplate__r.GENSMS_Lead_Action_Key__c;
                    if(applicantStatus == 'Recent Application'){
                        ld.Credit_Check_Consent__c = probableAccount.Equifax_SMS_Consent_Received__c;
                        ld.RO_Online__c = probableAccount.RO_Online__c;
                        ld.Photo_Id_Front__c = probableAccount.Photo_Id_Front__c;
                        ld.Photo_Id_Back__c = probableAccount.Photo_Id_Back__c;
                    }
                }

                ld.Applicant_Status__c = applicantStatus;
                ld.Probable_Territory__c = probTerritory.Id;
                ld.Rent4Keeps_Account__c = rent4keepsAccount != null ? rent4keepsAccount.Id : null;
                ld.Probable_Account__c = null;
                ld.Probable_Account_Summary__c = null;
                ld.Auto_Allocation_Logs__c = paWrap.searchLogs;
                if(probableAccount != null){
                    ld.Probable_Account__c = probableAccount.Id;
                    String centrelinkBenefit = probableAccount.Centrelink_Benefit__c!=null ? probableAccount.Centrelink_Benefit__c: 'None';
                    String centrelinkBenefitAmt = probableAccount.Centrelink_Benefit__c!=null ? '$'+String.valueOf(probableAccount.Centrelink_Benefit_Amount__c) : '$0';
                    ld.Probable_Account_Summary__c = probableAccount.Name + ' -- ' + probableAccount.Territory_Short_Name__c + '\n'
                                                        + 'Benefit -- ' + centrelinkBenefit + ' (' + centrelinkBenefitAmt + ')\n'
                                                        + (probableAccount.No_of_Agreements__c == 0 ? '' : ('Active Agmts -- ' + probableAccount.No_of_Active_Agreements__c + '/' + probableAccount.No_of_Agreements__c + '\n'))
                                                        + (probableAccount.No_of_Active_Agreements__c > 0 ? ('Latest Agrmnt -- ' + probableAccount.Latest_Agreement_Created_Date__c.format('dd MMM yyyy') + '\n') : '') 
                                                        + (probableAccount.No_of_Active_Agreements__c > 0 ? ('RA -- $' + probableAccount.Remaining_Amount_Active_Agreements__c + '\n') : '')
                                                        + (probableAccount.No_of_Active_Agreements__c > 0 ? ('TAV -- $' + probableAccount.Total_Agreement_Amount_Active_Only__c + '\n') : '') 
                                                        + (probableAccount.No_of_Active_Agreements__c > 0 ? ('Arrears -- $' +probableAccount.Actual_Arrears__c + '\n') : '') 
                                                        + (probableAccount.No_of_Active_Agreements__c == 0 && probableAccount.No_of_Agreements__c > 0 ? ('Agrmnt Completed Date -- ' + (probableAccount.Agreement_Completed_Date__c == null ? '' : DateTime.newInstance(probableAccount.Agreement_Completed_Date__c.year(),probableAccount.Agreement_Completed_Date__c.month(),probableAccount.Agreement_Completed_Date__c.day()).format('dd MMM yyyy')) + '\n') : '')
                                                        + (probableAccount.No_of_Active_Agreements__c == 0 && probableAccount.No_of_Agreements__c > 0 ? ('TP -- $' + probableAccount.Total_Paid_Amount__c + '\n') : '')
                                                        + (probableAccount.No_of_Agreements__c == 0 ? ('Last Enquiry Date -- ' + (probableAccount.Enquiry_Date__c == null ? '' : probableAccount.Enquiry_Date__c.format()) + '\n') : '')
                                                        + (probableAccount.No_of_Agreements__c == 0 ? ('Enquiry Status -- ' + probableAccount.Enquiry_Status__c + '\n') : '')
                                                        + (probableAccount.No_of_Agreements__c == 0 ? ('Reason For DN -- ' + (probableAccount.Reason_why_application_did_not_go_ahead__c == null ? '' : probableAccount.Reason_why_application_did_not_go_ahead__c) + '\n') : '')
                                                        + 'Serviceability -- ' + (probableAccount.Serviceability__c == null ? 0 : probableAccount.Serviceability__c) + '%\n';
                }
                update ld;

                //if probable account falls into one of the following buckets convert the lead to that account
                //for company (Recent Application, Delivery Status, Collections, Account Enquiry, Service Enquiry, Other Enquiry)
                //for franchisees (Recent Application)
                if(probableAccount != null){
                    if(probTerritory.Name != '1000' && probTerritory.Name != '100' && probTerritory.Company_Territory__c && applicantStatus != null && applicantStatus != 'New Enquiry'){
                        R4KLeadController.convertToApplicant(lead, probableAccount, applicantStatus);
                    }else if(!probTerritory.Company_Territory__c && applicantStatus != null && applicantStatus == 'Recent Application'){
                        R4KLeadController.convertToApplicant(lead, probableAccount, applicantStatus);
                    }
                }

                //send sms
                if(newLeadMedium != 'Online' && newLeadMedium != 'Marketing to Customer' && newLeadFormType != 'Buy Now'){
                    String smsActionKey = (!sendCLOSMS ? genActionKey : jmpqActionKey);
                    System.debug('##Territory ' + lead.Territory_Number__r.Name);
                    System.debug('##sendCLOSMS ' + sendCLOSMS);
                    System.debug('##smsActionKey ' + smsActionKey);
                    CommunicationUtil.sendConverseTask(smsActionKey, lead.Id, null, null, null, null);
                }
            }
        }catch(Exception ex){
            System.debug('LeadException: Line - ' + ex.getLineNumber() + ' msg - ' + ex.getMessage());
        }
    }

    //get bucket
    public static string getAccountCategory(Account probableAccount, Lead ld){
        String applicantStatus = 'New Enquiry';
        try{
            if(probableAccount != null){
                List<Opportunity> pastOppList = [SELECT Id,TaxInvoice_Signed_DateTime__c,Remaining_Amount__c,Total_COGS_Less_AAF__c,Total_Paid_Amount__c,TaxInvoice_Signed_Date__c,
                                            (Select Id,Name,Product_Type__c From OpportunityLineItems) FROM Opportunity WHERE 
                                            AccountId =: probableAccount.Id AND StageName = 'Goods Delivered' AND RecordType.Name <> 'Trak SIM' 
                                            AND TaxInvoice_Signed_DateTime__c <> null ORDER BY TaxInvoice_Signed_DateTime__c DESC];
                if(((probableAccount.No_Of_Active_Agreements__c > 0 && probableAccount.Days_Since_Expected_Payment__c <> null && probableAccount.Days_Since_Expected_Payment__c > 30) || probableAccount.WrittenOff_s_Count__c > 0 || probableAccount.Last_Default_Letter_Sent_Date__c <> null || (probableAccount.No_Of_Active_Agreements__c > 0 && probableAccount.Actual_Arrears__c <> null && probableAccount.Actual_Arrears__c > 0 && probableAccount.Total_Paid_Amount_Active_Only__c <> null && ((probableAccount.Actual_Arrears__c / (probableAccount.Total_Paid_Amount_Active_Only__c + probableAccount.Actual_Arrears__c)) > 0.2))) || ld.Reason_For_Enquiry__c == 'Make Payment'){
                    applicantStatus = 'Collection';
                }else if(probableAccount.No_Of_Active_Agreements__c > 0 && pastOppList.size() > 0 && pastOppList[0].TaxInvoice_Signed_Date__c.daysBetween(Date.today()) <= 30 && probableAccount.Enquiry_Status__c != 'Enquiry' && !probableAccount.Enquiry_Status__c.startsWith('DN')){
                    applicantStatus = 'Delivery Status';
                }else if(probableAccount.Enquiry_Date__c != null && probableAccount.Enquiry_Date__c.daysBetween(Date.today()) <= 30 && probableAccount.Enquiry_Status__c != null && (probableAccount.Enquiry_Status__c == 'Enquiry' || probableAccount.Enquiry_Status__c.startsWith('DN'))){
                    applicantStatus = 'Recent Application';
                }else if(ld.Reason_For_Enquiry__c == 'Existing Account Enquiry' || ld.Reason_For_Enquiry__c == 'Accounts'){
                    applicantStatus = 'Account Enquiry';
                }else if(ld.Reason_For_Enquiry__c == 'Service Enquiry / Issue' || ld.Reason_For_Enquiry__c == 'Support' || ld.Reason_For_Enquiry__c == 'Warranty' || ld.Reason_For_Enquiry__c == 'Complaint'){
                    applicantStatus = 'Service Enquiry';
                }else if(ld.Reason_For_Enquiry__c == 'Other'){
                    applicantStatus = 'Other Enquiry';
                }
            }
            return applicantStatus;
        }catch(Exception ex){
            ErrorLog.addErrorLog('R4KLeadController','getAccountCategory',probableAccount.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
            return applicantStatus;
        }
    }
    
    //merge leads
    public static string mergeLeads(Lead newLead, List<Lead> matchingLeads){
        String masterLeadId = newLead.Id; 
        String alternateMobilePhone = newLead.MobilePhone;
        if(newLead.MobilePhone != null && newLead.MobilePhone.length() == 9 && !newLead.MobilePhone.startsWith('0')){
            alternateMobilePhone = ('0' + newLead.MobilePhone);
        }
        
        if(matchingLeads == null || matchingLeads.size() == 0){
            matchingLeads = [SELECT Id,FirstName,LastName,Name,MobilePhone,OwnerId,Owner.Name,Territory_Number__c,Territory_Short_Name__c,Reason_for_Enquiry__c,Street,City,
                                    State,PostalCode,Lead_Medium__c,Email,CreatedDate,did_your_hear__c,contact_desc__c,Call_Time_Charged_minutes__c,Phone_Recording__c,Desired_Product__c,Territory_State__c,CRN__c,Incoming_Count__c,Outgoing_Count__c,
                                    TwilioCallSid__c,TwilioRecordingSid__c,Automation_Outcome__c,Last_Automated_Bot_Message__c,Next_Automated_Bot_Message__c,Automated_Bot_Message_Tracking__c,Bot_Call_Datetime__c,Next_Bot_Call_Datetime__c
                                    FROM Lead WHERE 
                                    (MobilePhone =: newLead.MobilePhone OR MobilePhone =: alternateMobilePhone) AND
                                    IsConverted = false AND Id <>: newLead.Id AND  
                                    Form_Type__c != 'Buy Now' AND 
                                    Territory_Number__r.Name = '1000'
                                    ORDER BY CreatedDate ASC LIMIT 2];
        }
        if(matchingLeads.size() > 0)
        {
            String masterFirstName; String masterLastName; String masterEmail; String masterPostalCode; String masterStreet; 
            String masterCity; String masterState; String masterDesiredProduct; String masterNatureOfEnquiry; String masterhowDidYouHear; 
            String masterReasonForEnquiry; String masterCRN; String masterCallSID; String masterRecordingSID;
            Decimal totalOutgoingSMS = 1;
            Decimal totalIncomingSMS = 0;
            Decimal totalCallTime = 0;
            DateTime masterLeadCreatedTime = newLead.CreatedDate;
            DateTime masterLeadFinishTime = newLead.CreatedDate;
            Lead masterLead;
            
            List<Lead> mergeLeads = new List<Lead>();
            List<Lead> leadsInOrder = new List<Lead>();
            leadsInOrder.add(matchingLeads[0]);
            masterLeadId = matchingLeads[0].Id;
            leadsInOrder.add(newLead);
            for(Integer i=1; i<matchingLeads.size(); i++){
                leadsInOrder.add(matchingLeads[i]);
            }
            
            for(Integer i=0; i<leadsInOrder.size(); i++){
                totalOutgoingSMS += (leadsInOrder[i].Outgoing_Count__c == null ? 0 : leadsInOrder[i].Outgoing_Count__c);
                totalIncomingSMS += (leadsInOrder[i].Incoming_Count__c == null ? 0 : leadsInOrder[i].Incoming_Count__c);
                totalCallTime += (leadsInOrder[i].Call_Time_Charged_minutes__c == null ? 0 : leadsInOrder[i].Call_Time_Charged_minutes__c); 
                    
                masterFirstName = masterFirstName == null ? leadsInOrder[i].FirstName : masterFirstName;
                masterLastName = (masterLastName == null || masterLastName == 'Credit Contract' || masterLastName == 'Buy Now' || masterLastName == 'New IVR Lead' || masterLastName.trim() == '' ? leadsInOrder[i].LastName : masterLastName);
                masterEmail = masterEmail == null ? leadsInOrder[i].Email : masterEmail;
                masterPostalCode = masterPostalCode == null ? leadsInOrder[i].PostalCode : masterPostalCode;
                masterStreet = masterStreet == null ? leadsInOrder[i].Street : masterStreet;
                masterCity = masterCity == null ? leadsInOrder[i].City : masterCity;
                masterState = masterState == null ? leadsInOrder[i].State : masterState;
                masterDesiredProduct = masterDesiredProduct == null ? leadsInOrder[i].Desired_Product__c : masterDesiredProduct;
                masterNatureOfEnquiry = masterNatureOfEnquiry == null ? leadsInOrder[i].contact_desc__c : masterNatureOfEnquiry;
                masterhowDidYouHear = masterhowDidYouHear == null ? leadsInOrder[i].did_your_hear__c : masterhowDidYouHear;
                masterReasonForEnquiry = masterReasonForEnquiry == null ? leadsInOrder[i].Reason_for_Enquiry__c : masterReasonForEnquiry;
                masterCRN = masterCRN == null ? leadsInOrder[i].crn__c : masterCRN;
                
                if((leadsInOrder[i].TwilioCallSid__c <> null && masterCallSID == null) || (leadsInOrder[i].TwilioCallSid__c <> null && leadsInOrder[i].TwilioRecordingSid__c <> null && masterRecordingSID == null))
                {
                    masterCallSID = leadsInOrder[i].TwilioCallSid__c;
                    masterRecordingSID = leadsInOrder[i].TwilioRecordingSid__c;
                }
                
                if(i > 0){
                    mergeLeads.add(new Lead(Id=leadsInOrder[i].Id));
                }
            }
            
            masterLeadCreatedTime = DateTime.newInstance(masterLeadCreatedTime.year(),masterLeadCreatedTime.month(),masterLeadCreatedTime.day(),masterLeadCreatedTime.hour(),masterLeadCreatedTime.minute(),masterLeadCreatedTime.second());
            masterLeadFinishTime = masterLeadCreatedTime <> null ? masterLeadCreatedTime.addMinutes(Integer.valueOf(totalCallTime)) : null;
            System.debug('****masterLeadId ' + masterLeadId);
            masterLead = new Lead(Id=masterLeadId,FirstName=masterFirstName,LastName=masterLastName,crn__c=masterCRN,Reason_for_Enquiry__c=masterReasonForEnquiry,Desired_Product__c=masterDesiredProduct,Street=masterStreet,City=masterCity,State=masterState,PostalCode=masterPostalCode,Email=masterEmail,did_your_hear__c=masterhowDidYouHear,contact_desc__c=masterNatureOfEnquiry,Twilio_Call_Finish_Datetime__c=masterLeadFinishTime,TwilioCallSid__c=masterCallSId,TwilioRecordingSid__c=masterRecordingSID,Merged_Datetime__c=DateTime.now(),Incoming_Count__c=totalIncomingSMS,Outgoing_Count__c=totalOutgoingSMS);
    
            if(masterLead <> null && mergeLeads.size() > 0 && !Test.isRunningTest())
            {
                Database.MergeResult[] results = Database.merge(masterLead, mergeLeads, true);
            }
            return masterLeadId; 
        }
        return masterLeadId;
    }
    
    //find probable account
    public static ProbableAccountWrapper findProbableAccount(String ldId, String acctId){
        ProbableAccountWrapper paWrap = new ProbableAccountWrapper();
        try{
            if(ldId != null && ldId != ''){
                List<Lead> leadList = [SELECT Id,FirstName,LastName,MobilePhone,crn__c,Country,Lead_Medium__c,Territory_Number__c,PostalCode,Territory_Number__r.Name,
                                    Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Territory_Number__r.Short_Name__c,
                                    Identity_Confirmed_By_Customer__c,OwnerId,Territory_Number__r.Lead_Phone__c,Territory_Number__r.SMS_Lead_Phone__c,
                                    SMS_Mobile__c,Email,Reason_For_Enquiry__c,Form_Type__c,Opt_In_Info_From_Rent4keeps__c,Rent4Keeps_Account__c   
                                    FROM Lead WHERE Id =: ldId LIMIT 1];
                if(leadList.size() > 0){
                    System.debug('****Found Lead');
                    String ldCRN = leadList[0].crn__c; 
                    String ldMobile = leadList[0].MobilePhone; 
                    String ldLastName = (leadList[0].LastName != null && (leadList[0].LastName.containsIgnoreCase('ivr lead') || leadList[0].LastName.containsIgnoreCase('credit contract') || leadList[0].LastName.containsIgnoreCase('buy now')) ? null : leadList[0].LastName);
                    String ldMedium = leadList[0].Lead_Medium__c;
                    Boolean specialCharacterInName = false;

                    if(ldLastName != null){
                        String SPECIAL_CHAR_PATTERN = '[^\\w\\*]';
                        Pattern p = Pattern.compile(SPECIAL_CHAR_PATTERN);
                        Matcher pm = p.matcher(ldLastName);
                        while (pm.find()) 
                        {
                            if(pm.group(0) <> ' ')
                            {
                                specialCharacterInName = true;
                                System.debug(pm.group(0));
                                break;
                            }
                        }
                    }

                    Boolean isLeadFromNZ = false;
                    Boolean isLeadFromAUCT = false;
                    Boolean isLeadFromAUFR = false;

                    //find possible territory
                    Territory__c probTerritory = R4KLeadController.findTerritory(leadList[0].PostalCode, (isLeadFromNZ ? 'NZ' : 'AU'), (leadList[0].Form_Type__c == 'RENT4KEEPS ENQUIRY'));
                    System.debug('##probTerritory ' + probTerritory.Name);
                    paWrap.probTerritory = probTerritory;
                    String leadOwnerId = probTerritory.OwnerId;

                    if(probTerritory.State_Master_State__c != 'NZ' && probTerritory.Company_Territory__c){
                        isLeadFromAUCT = true;
                    }else if(probTerritory.State_Master_State__c != 'NZ' && !probTerritory.Company_Territory__c){
                        isLeadFromAUFR = true;
                    }else if(probTerritory.State_Master_State__c == 'NZ'){
                        isLeadFromNZ = true;
                    }

                    String searchParameters = 'Search Parameters \n' + 'CRN - ' + (ldCRN == null ? '' : ldCRN) + ', ' + 'Mobile - ' + (ldMobile == null ? '' : ldMobile) + ', ' + 'LastName - ' + (ldLastName == null ? '' : ldLastName);
                    String autoAllocationLogs = 'Did not find a probable account';
                    List<Account> accts = new List<Account>();
                    List<Account> allAccts = new List<Account>();
                    List<String> territoryIdsWithRecordAccess = new List<String>();
                    List<String> territoryNamesWithRecordAccess = new List<String>();
                    Account probAcct;
                    
                    List<Territory__c> allterritories = [SELECT Id, Name, Company_Territory__c,OwnerId FROM Territory__c WHERE Is_Credit_Contract__c = true AND OwnerId = :leadOwnerId LIMIT 200];
                    for(Territory__c territory : allterritories){
                        if(String.valueOf(territory.OwnerId).substring(0,15).equals(String.valueOf(leadOwnerId).substring(0,15))){
                            territoryIdsWithRecordAccess.add(territory.Id);
                            territoryNamesWithRecordAccess.add(territory.Name);
                        }
                    }
                    System.debug(territoryIdsWithRecordAccess);
                    System.debug(territoryNamesWithRecordAccess);

                    String originalquery = 'select id,Name,FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,No_Of_Active_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,Territory_Short_Name__c,Serviceability__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Collection_Outcome1__c,Last_Collection_Activity__r.Name, ' + 
                                            'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,OwnerId,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c,Remaining_Amount_Active_Agreements__c,Total_Paid_Amount_Active_Only__c,Actual_Arrears__c,Actual_Arrears_after_variation__c, '+
                                            'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c,Enquiry_Date__c,Enquiry_Status__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,No_of_times_lead_has_been_converted__c, '+
                                            'MyGov_Final_Page__c,Bank_Final_Page__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,Latest_Agreement_Created_Date__c,Total_Agreement_Amount_Active_Only__c,Agreement_Completed_Date__c,Last_Active_Agreement_Date_Rollup__c,Days_Since_Expected_Payment__c,WrittenOff_s_Count__c,Last_Default_Letter_Sent_Date__c, '+
                                            'Rep_Responsible_For_Converting_Lead__c,Rep_Responsible_For_Converting_Lead__r.Name,Territory_Number__r.Name,Rent4Keeps_Account__c,Territory_Number__r.Is_Credit_Contract__c,RO_Online__c,Photo_Id_Front__c,Photo_Id_Back__c ' + 
                                            'from Account where LastName!=null AND (Territory_Number__r.Name = \'1000\' OR Territory_Number__r.Name IN: territoryNamesWithRecordAccess OR Territory_Number__r.Is_Credit_Contract__c = false) AND (NOT PersonMobilePhone LIKE \'60%\') AND (NOT PersonMobilePhone LIKE \'1760%\') AND (NOT PersonMobilePhone LIKE \'2666%\')';
                    if(isLeadFromNZ)
                        originalquery += ' and State_Master_State__c=\'NZ\' ';
                    else
                        originalquery += ' and State_Master_State__c!=\'NZ\' ';
                                        
                    String searchquery = originalquery;
                    if(leadList[0].Lead_Medium__c == 'Smart IVR' && leadList[0].Identity_Confirmed_By_Customer__c && ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && allAccts.size()==0)
                    {
                        Integer ldDOB = Integer.valueOf(ldCRN);
                        searchquery = originalquery;
                        searchquery += ' and Birthdate__c <> null and (CALENDAR_YEAR(Birthdate__c) = ' + ldDOB + ' AND PersonMobilePhone =\''+ ldMobile+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on DOB, Mobile';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && ldLastName!=null && ldLastName!='' && !specialCharacterInName && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') and LastName =\''+ldLastName+'\' AND PersonMobilePhone =\''+ ldMobile+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on CRN, Mobile, Lastname';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonMobilePhone =\''+ ldMobile+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on CRN, Mobile';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldCRN != null && ldCRN!='' && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and (Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on CRN';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldMobile != null && ldMobile!='' && ldLastName!=null && ldLastName!='' && !specialCharacterInName && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and (PersonMobilePhone =\''+ldMobile+'\' AND LastName =\''+ ldLastName+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on Mobile, Lastname';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldMobile != null && ldMobile!='' && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and PersonMobilePhone =\''+ldMobile+'\'';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on Mobile and is recent application';
                        allAccts = Database.query(searchquery);
                    }

                    Account ccAcct,clAcct;
                    if(allAccts.size() > 0){
                        for(Integer a=0; a<allAccts.size(); a++){
                            System.debug('****' + allAccts[a].Customer_No__c + ' ' + allAccts[a].Territory_Number__r.Name);
                            if(((territoryNamesWithRecordAccess.contains(allAccts[a].Territory_Number__r.Name) && ccAcct == null) || allAccts[a].Territory_Number__r.Name == '1000') && allAccts[a].Territory_Number__r.Is_Credit_Contract__c){
                                ccAcct = allAccts[a];
                                autoAllocationLogs += ('\n' + 'CC Match - ' + allAccts[a].Customer_No__c);
                            }
                            if(clAcct == null && !allAccts[a].Territory_Number__r.Is_Credit_Contract__c){
                                clAcct = allAccts[a];
                                autoAllocationLogs += ('\n' + 'CL Match - ' + allAccts[a].Customer_No__c);
                            }
                        }
                    }
                    paWrap.ccAcct = ccAcct;
                    paWrap.clAcct = clAcct;
                    paWrap.searchLogs = (searchParameters + '\n\n' + autoAllocationLogs);
                    return paWrap;
                }
            }else if(acctId != null && acctId != ''){
                List<Account> acctList = [SELECT Id,FirstName,LastName,PersonEmail,PersonMobilePhone,PersonMailingPostalCode,Centrepay_Ref_No__c,WINZ_No__c,OwnerId, 
                                            Territory_Number__c,Territory_Number__r.Name,Territory_Number__r.Short_Name__c,Territory_Number__r.Is_Credit_Contract__c,
                                            Enquiry_Date__c,Enquiry_Status__c,Birthdate__c,Territory_Number__r.Company_Territory__c,Probable_Account__c,Probable_Territory__c,
                                            Territory_Number__r.State_Master_State__c                            
                                            FROM Account WHERE Id = :acctId LIMIT 1];
                if(acctList.size() > 0 && acctList[0].PersonMailingPostalCode != null){
                    String ldCRN = acctList[0].Centrepay_Ref_No__c; 
                    String ldMobile = acctList[0].PersonMobilePhone; 
                    String ldLastName = (acctList[0].LastName != null && (acctList[0].LastName.containsIgnoreCase('ivr lead') || acctList[0].LastName.containsIgnoreCase('credit contract') || acctList[0].LastName.containsIgnoreCase('buy now')) ? null : acctList[0].LastName);
                    Integer ldDOB = (acctList[0].Birthdate__c != null ? acctList[0].Birthdate__c.year() : null);
                    
                    Boolean specialCharacterInName = false;
                    if(ldLastName != null){
                        String SPECIAL_CHAR_PATTERN = '[^\\w\\*]';
                        Pattern p = Pattern.compile(SPECIAL_CHAR_PATTERN);
                        Matcher pm = p.matcher(ldLastName);
                        while (pm.find()) 
                        {
                            if(pm.group(0) <> ' ')
                            {
                                specialCharacterInName = true;
                                System.debug(pm.group(0));
                                break;
                            }
                        }
                    }

                    //find possible territory
                    Territory__c probTerritory = R4KLeadController.findTerritory(acctList[0].PersonMailingPostalCode, (acctList[0].Territory_Number__r.State_Master_State__c == 'NZ' ? 'NZ' : 'AU'), !acctList[0].Territory_Number__r.Is_Credit_Contract__c);
                    System.debug('##probTerritory ' + probTerritory.Name);
                    paWrap.probTerritory = probTerritory;
                    String leadOwnerId = probTerritory.OwnerId;

                    String searchParameters = 'Search Parameters \n' + 'CRN - ' + (ldCRN == null ? '' : ldCRN) + ', ' + 'Mobile - ' + (ldMobile == null ? '' : ldMobile) + ', ' + 'LastName - ' + (ldLastName == null ? '' : ldLastName) + ', ' + 'DOB - ' + (ldDOB == null ? null : ldDOB);
                    String autoAllocationLogs = 'Did not find a probable account';
                    List<Account> accts = new List<Account>();
                    List<Account> allAccts = new List<Account>();
                    List<String> territoryIdsWithRecordAccess = new List<String>();
                    List<String> territoryNamesWithRecordAccess = new List<String>();
                    Account probAcct;

                    List<Territory__c> allterritories = [SELECT Id, Name, Company_Territory__c,OwnerId FROM Territory__c WHERE Is_Credit_Contract__c = true AND OwnerId = :leadOwnerId LIMIT 200];
                    for(Territory__c territory : allterritories){
                        if(String.valueOf(territory.OwnerId).substring(0,15).equals(String.valueOf(leadOwnerId).substring(0,15))){
                            territoryIdsWithRecordAccess.add(territory.Id);
                            territoryNamesWithRecordAccess.add(territory.Name);
                        }
                    }
                    System.debug(territoryIdsWithRecordAccess);
                    System.debug(territoryNamesWithRecordAccess);

                    String originalquery = 'select id,Name,FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,No_Of_Active_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,Territory_Short_Name__c,Serviceability__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Collection_Outcome1__c,Last_Collection_Activity__r.Name, ' + 
                                            'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,OwnerId,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c,Remaining_Amount_Active_Agreements__c,Total_Paid_Amount_Active_Only__c,Actual_Arrears__c,Actual_Arrears_after_variation__c, '+
                                            'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c,Enquiry_Date__c,Enquiry_Status__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,No_of_times_lead_has_been_converted__c, '+
                                            'MyGov_Final_Page__c,Bank_Final_Page__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,Latest_Agreement_Created_Date__c,Total_Agreement_Amount_Active_Only__c,Agreement_Completed_Date__c,Last_Active_Agreement_Date_Rollup__c,Days_Since_Expected_Payment__c,WrittenOff_s_Count__c,Last_Default_Letter_Sent_Date__c, '+
                                            'Rep_Responsible_For_Converting_Lead__c,Rep_Responsible_For_Converting_Lead__r.Name,Territory_Number__r.Name,Rent4Keeps_Account__c,Territory_Number__r.Is_Credit_Contract__c,RO_Online__c,Photo_Id_Front__c,Photo_Id_Back__c ' + 
                                            'from Account where LastName!=null AND Territory_Number__r.Name != \'1000\' AND (Territory_Number__r.Name IN: territoryNamesWithRecordAccess OR Territory_Number__r.Is_Credit_Contract__c = false) AND (NOT PersonMobilePhone LIKE \'60%\') AND (NOT PersonMobilePhone LIKE \'1760%\') AND (NOT PersonMobilePhone LIKE \'2666%\')';
                    if(acctList[0].Territory_Number__r.State_Master_State__c == 'NZ')
                        originalquery += ' and State_Master_State__c=\'NZ\' ';
                    else
                        originalquery += ' and State_Master_State__c!=\'NZ\' ';
                                        
                    String searchquery = originalquery;
                    if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && ldLastName!=null && ldLastName!='' && !specialCharacterInName && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') and LastName =\''+ldLastName+'\' AND PersonMobilePhone =\''+ ldMobile+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on CRN, Mobile, Lastname';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonMobilePhone =\''+ ldMobile+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on CRN, Mobile';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldCRN != null && ldCRN!='' && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and (Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on CRN';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldMobile != null && ldMobile!='' && ldLastName!=null && ldLastName!='' && !specialCharacterInName && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and (PersonMobilePhone =\''+ldMobile+'\' AND LastName =\''+ ldLastName+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on Mobile, Lastname';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldMobile != null && ldMobile!='' && ldDOB != null && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and Birthdate__c <> null and (CALENDAR_YEAR(Birthdate__c) = ' + ldDOB + ' AND PersonMobilePhone =\''+ ldMobile+'\')';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on Mobile and is recent application';
                        allAccts = Database.query(searchquery);
                    }
                    if(ldMobile != null && ldMobile!='' && allAccts.size()==0)
                    {
                        searchquery = originalquery;
                        searchquery += ' and PersonMobilePhone =\''+ldMobile+'\'';
                        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 10'; 
                        system.debug('searchquery: '+searchquery); 
                        autoAllocationLogs = 'Found Full Match based on Mobile and is recent application';
                        allAccts = Database.query(searchquery);
                    }

                    Account ccAcct,clAcct;
                    if(allAccts.size() > 0){
                        for(Integer a=0; a<allAccts.size(); a++){
                            System.debug('****' + allAccts[a].Customer_No__c + ' ' + allAccts[a].Territory_Number__r.Name);
                            if(territoryNamesWithRecordAccess.contains(allAccts[a].Territory_Number__r.Name) && ccAcct == null && allAccts[a].Territory_Number__r.Name != '1000' && acctList[0].Territory_Number__r.Is_Credit_Contract__c){
                                ccAcct = allAccts[a];
                                autoAllocationLogs += ('\n' + 'CC Match - ' + allAccts[a].Customer_No__c);
                            }
                            if(clAcct == null && !allAccts[a].Territory_Number__r.Is_Credit_Contract__c){
                                clAcct = allAccts[a];
                                autoAllocationLogs += ('\n' + 'CL Match - ' + allAccts[a].Customer_No__c);
                            }
                        }
                    }
                    paWrap.ccAcct = ccAcct;
                    paWrap.clAcct = clAcct;
                    paWrap.searchLogs = (searchParameters + '\n\n' + autoAllocationLogs);
                    return paWrap;
                }
            }
            return paWrap;
        }catch(Exception ex){
            System.debug('Exception - ' + ex.getLineNumber());
            ErrorLog.addErrorLog('R4KLeadController','findProbableAccount',ldId + '-' + acctId,ex.getMessage() + ' Line ' + ex.getLineNumber(),String.valueOf(ex.getLineNumber()));
            return paWrap;
        }
    }
    
    //find territory based on postcode
    public static Territory__c findTerritory(String postcode, String country, Boolean isCL){
        try{
            List<PostCode__c> postcodes = new List<PostCode__c>();
            Map<String, Default_Lead__c> mapDLobj = new Map<String, Default_Lead__c>();
            if(country == 'NZ'){
                if(isCL){
                    postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c = 'NZ' AND Territory__r.Is_Credit_Contract__c = false];
                }else{
                    postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c = 'NZ' AND Territory__r.Is_Credit_Contract__c = true];
                }
            }else{
                if(isCL){
                    postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c != 'NZ' AND Territory__r.Is_Credit_Contract__c = false];
                }else{
                    postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c != 'NZ' AND Territory__r.Is_Credit_Contract__c = true];
                }
            }
            
            String probTerrId;
            if(postcodes.size()>0){
                probTerrId = postcodes[0].Territory__c;
            }else if(postcode <> null && postcode.trim() <> ''){
                String startsWith = (postcode == '0000' ? '0000' : ((country == 'NZ') ? 'NZ' : (postcode <> null && postcode.trim() <> '' ? postcode.substring(0,1) : '')));
                List<DEFAULT_LEAD__C> dlList = [SELECT ID,Name,Salesforce_user_id__c,starts_with__c,Territory_id__c FROM DEFAULT_LEAD__C];
                for(Default_Lead__c dl:dlList){
                    mapDLobj.put(dl.starts_with__c,dl);
                }
                if(mapDLobj.get(startsWith).Salesforce_user_id__c!=null){
                    probTerrId = mapDLobj.get(startsWith).Territory_id__c;
                }
            }
            if(probTerrId != null){
                return [SELECT Id,OwnerId,Company_Territory__c,State_Master_State__c,Name,Lead_Phone__c,SMS_Lead_Phone__c,Short_Name__c,SMSTemplate__c,SMSTemplate__r.GENSMS_Lead_Action_Key__c,SMSTemplate__r.JMPQ_Lead_Action_Key__c FROM Territory__c WHERE Id = :probTerrId LIMIT 1];
            }else{
                return [SELECT Id,OwnerId,Company_Territory__c,State_Master_State__c,Name,Lead_Phone__c,SMS_Lead_Phone__c,Short_Name__c,SMSTemplate__c,SMSTemplate__r.GENSMS_Lead_Action_Key__c,SMSTemplate__r.JMPQ_Lead_Action_Key__c FROM Territory__c WHERE Name = '1000' LIMIT 1];
            }
        }catch(Exception ex){
            ErrorLog.addErrorLog('R4KLeadController','findTerritory','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
            return [SELECT Id,OwnerId,Company_Territory__c,State_Master_State__c,Name,Lead_Phone__c,SMS_Lead_Phone__c,Short_Name__c,SMSTemplate__c,SMSTemplate__r.GENSMS_Lead_Action_Key__c,SMSTemplate__r.JMPQ_Lead_Action_Key__c FROM Territory__c WHERE Name = '1000' LIMIT 1];
        }
    }

    public static void convertToApplicant(Lead ld, Account acct, String bucket){
        try{
            Boolean sendCollectionsSMS = bucket == 'Collection' ? true : false;
            Boolean sendWeCareSMS = (bucket == 'Delivery Status' || bucket == 'Account Enquiry' || bucket == 'Service Enquiry' || bucket == 'Other Enquiry') ? true : false;
            Boolean sendCLOSMS = (bucket == 'Recent Application' || bucket == 'New Enquiry') ? true : false;

            System.debug('##sendCollectionsSMS ' + sendCollectionsSMS);
            System.debug('##sendWeCareSMS ' + sendWeCareSMS);
            System.debug('##sendCLOSMS ' + sendCLOSMS);

            Account acctToUp = new Account();
            acctToUp.Id = acct.Id;
            acctToUp.Enquiry_Date__c = Date.today();
            acctToUp.Enquiry_DateTime__c = DateTime.now();

            if(ld.Form_Type__c == 'APPLY NOW'){
                if(!ld.Opt_In_Info_From_Rent4keeps__c && (acct.Enquiry_Date__c == null || acct.Enquiry_Date__c.daysBetween(Date.today()) > 30)){
                    acctToUp.Rent4Keeps_Account__c = null;
                }else if(ld.Opt_In_Info_From_Rent4keeps__c){
                    acctToUp.Rent4Keeps_Account__c = ld.Rent4Keeps_Account__c;
                }
                System.debug('********acctToUp.Rent4Keeps_Account__c ' + acctToUp.Rent4Keeps_Account__c);
            }

            acctToUp.Rep_Responsible_For_Converting_Lead__c = null;
            acctToUp.Rep_Name__c = 'Hybrid Application';
            acctToUp.Enquiry_Status__c = (sendWeCareSMS || sendCollectionsSMS ? 'Existing Account Enquiry' : 'Enquiry');

            if(acct.Company_Territory__c){
                String empStateMasterState = (acct.State_Master_State__c == 'NSW' ? 'NSW' : (acct.State_Master_State__c == 'NZ' ? 'NZ' : 'VIC')); //should be changed later
                List<Employee__c> employeeList = [SELECT Id,Name,Territory__c,Territory__r.State_Master_State__c FROM Employee__c WHERE Name in ('We Care','Collections','Hybrid Application') AND Territory__r.State_Master_State__c =: empStateMasterState AND Territory__r.Is_Credit_Contract__c = true ORDER BY Name ASC];
                Employee__c hybridEmployee;
                Employee__c wecareEmployee;
                Employee__c collectionsEmployee;
                
                for(Integer e=0; e<employeeList.size(); e++){
                    if(employeeList[e].Name == 'Collections'){
                        collectionsEmployee = employeeList[e];
                    }else if(employeeList[e].Name == 'We Care'){
                        wecareEmployee = employeeList[e];
                    }else if(employeeList[e].Name == 'Hybrid Application'){
                        hybridEmployee = employeeList[e];
                    }
                }
                if(sendWeCareSMS){
                    acctToUp.Rep_Responsible_For_Converting_Lead__c = (wecareEmployee <> null ? wecareEmployee.Id : hybridEmployee.Id);
                    acctToUp.Rep_Name__c = wecareEmployee <> null ? wecareEmployee.Name : hybridEmployee.Name;
                }else if(sendCollectionsSMS){
                    acctToUp.Rep_Responsible_For_Converting_Lead__c = (collectionsEmployee <> null ? collectionsEmployee.Id : hybridEmployee.Id);
                    acctToUp.Rep_Name__c = collectionsEmployee <> null ? collectionsEmployee.Name : hybridEmployee.Name;
                }else{
                    acctToUp.Enquiry_Status__c = 'Enquiry';
                    acctToUp.Rep_Responsible_For_Converting_Lead__c = acct.Rep_Responsible_For_Converting_Lead__c == null ? hybridEmployee.Id : acct.Rep_Responsible_For_Converting_Lead__c;
                    acctToUp.Rep_Name__c = acct.Rep_Responsible_For_Converting_Lead__c <> null ? acct.Rep_Responsible_For_Converting_Lead__r.Name : hybridEmployee.Name;
                }
            }

            //Make all Credit Matrix values blank as an Enquiry is created
            if(bucket != 'Recent Application' && bucket != 'New Enquiry'){
                acctToUp.CM_Scheduled_Amount__c=null;
                acctToUp.CM_COGS__c=null;
                acctToUp.CM_Product_Category__c=null;
                acctToUp.CM_Serviceable__c=null;
                acctToUp.CM_No_of_Missed_Payments_Last_6_FN__c=null;
                acctToUp.CM_Combined_Dollar_Exposure__c=null;
                acctToUp.CM_No_of_Days_Missed_Since_Last_Payments__c=null;
                acctToUp.CM_Equifax_Rental_Default__c=null;
                acctToUp.CM_Equifax_Non_Rental_Default__c=null;
                acctToUp.Product_Category_Selected__c=null;
                acctToUp.Product_COGS_for_Agreement__c=null;
                acctToUp.Product_RRP_for_Agreement__c=null;
                acctToUp.AgreementId_for_Current_Enquiry__c=null;
                acctToUp.CM_Product_Category_Comments__c=null;
                acctToUp.CM_COGS_Comments__c=null;
                acctToUp.CM_Scheduled_Amount_Comments__c=null;
                acctToUp.CM_OutstandingDefRental_Comp_Comments__c=null;
                acctToUp.CM_OutstandingDefNonRental_Comp_Comments__c =null;
                acctToUp.CM_Equifax_Score_Comments__c=null;
                acctToUp.CM_days_since_last_Payment_Comments__c=null;
                acctToUp.CM_Missed_from_last_6_FN_pymts_Comments__c=null;
                acctToUp.CM_Serviceablilty_Comments__c=null;
                acctToUp.CM_Bankruptcy_Part_9_Agreements_Comments__c=null;
                acctToUp.CM_Reason_to_go_forward__c=null;
                acctToUp.Address_Verified__c=false;
                acctToUp.Income_Verified__c=false;
                acctToUp.Expense_Verified__c=false;
                acctToUp.Address_Verification_Type__c=null;
                acctToUp.Income_Verification_Type__c=null;
                acctToUp.Expense_Verification_Type__c=null;
                acctToUp.Other_Rental_Company_Details__c=null;
                acctToUp.myGov_Payment_Details__c=null;
                
                acctToUp.CAM_Basic__c = false;
                acctToUp.CAM_Contact__c = false;
                acctToUp.CAM_Income__c = false;
                acctToUp.CAM_Expense__c = false;
                acctToUp.CAM_Equifax__c = false;
                acctToUp.CAM_Credit_Matrix__c = false;
                acctToUp.CAM_Referees__c = false;
                acctToUp.CAM_Support_Docs__c = false;
                acctToUp.CAM_Submit__c = false;
                
                acctToUp.Referees_Contacted_for_Current_Enquiry__c=0;
                acctToUp.No_of_times_lead_has_been_converted__c = acct.No_of_times_lead_has_been_converted__c;
                acctToUp.TR4K_Link_Status__c = null;

                acctToUp.Bank_Institution__c=null;
                acctToUp.SMS_for_MyGov_Sent__c=false;
                acctToUp.SMS_for_BankStatement_Sent__c=false;
                acctToUp.AccessID_BankStatement__c=null;
                acctToUp.AccessID_MyGov__c=null;
                acctToUp.AccessID_MyGov__c=null;
                acctToUp.Hybrid_URL_BankStatement__c=null;
                acctToUp.Hybrid_URL_MyGov__c=null;
                acctToUp.BankStatement_Status__c=null;
                acctToUp.MyGov_Status__c=null;
                acctToUp.BankStatement_Date__c=null;
                acctToUp.MyGov_Date__c=null;
                acctToUp.MyGov_Final_Page__c = false;
                acctToUp.Bank_Final_Page__c = false;
                acctToUp.BankStatement_Amend__c = false;
            
                acctToUp.Equifax_SMS_Consent_Sent__c=false;
                acctToUp.Equifax_SMS_Consent_Received__c=false;
                acctToUp.RO_Online__c = false;
                acctToUp.Basic_Info_Online__c = false;
                acctToUp.Income_Online__c = false;
                acctToUp.Expense_Online__c = false;
                acctToUp.Is_PhotoId_Attached_After_Enquiry__c = false;
            
                acctToUp.Hybrid_Link_Allocation_Datetime__c = null;
                acctToUp.Hybrid_Link_Finish_Datetime__c = null;
            
                acctToUp.Consent_URL__c = null;
                acctToUp.Consent_URLSent_DateTime__c = null;
                acctToUp.Consent_URL_Opened_DateTime__c = null;
                acctToUp.Consent_URL_Device_Info__c = null;
                acctToUp.Consent_URL_Latitude__c = null;
                acctToUp.Consent_URL_Longitude__c = null;
                acctToUp.Consent_URL_Address__c = null;
            }
            update acctToUp;
                    
            NewEnquirySectionController nesc = new NewEnquirySectionController();
            nesc.doConvert(ld.Id,acctToUp);
            nesc.calculateCallTime(acctToUp.Id,ld.Id);
            
            if(sendWeCareSMS){
                LeadAssignmentController.createCase(ld.Id,acct.Id,bucket,ld.Lead_Medium__c == 'Smart IVR' || ld.Lead_Medium__c == 'Direct Call' ? 'Phone' : 'Web');
            }
        }catch(Exception ex){
            ErrorLog.addErrorLog('R4KLeadController','convertToApplicant',ld.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        }
    }

    public class ProbableAccountWrapper{
        public Account ccAcct{get;set;}
        public Account clAcct{get;set;}
        public String searchLogs{get;set;}
        public Territory__c probTerritory{get;set;}
    }
        
}