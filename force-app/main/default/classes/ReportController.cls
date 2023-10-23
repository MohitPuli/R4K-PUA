public with sharing class ReportController
{

public List<LeadWrapper> leadWrapperList{get;set;}
public List<AccountWrapper> accountWrapperList{get;set;}
public List<OpportunityWrapper> oppWrapperList{get;set;}
public Integer leadsSize{get;set;}
public Integer acctsSize{get;set;}
public Integer oppsSize{get;set;}
public User user{get;set;}

public void initAppsInProgress()
{
    leadWrapperList = new List<LeadWrapper>();
    accountWrapperList = new List<AccountWrapper>();
    oppWrapperList = new List<OpportunityWrapper>();
    List<String> oppIds = new List<String>();
    Date cutOffDate = Date.newInstance(2022,1,1);
    
    user = [SELECT Id,Name,Alias FROM User WHERE Id =: UserInfo.getUserId() LIMIT 1];
    
    List<Lead> leadList = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,contact_desc__c,Forwarded_Date__c,Forwarded_From__c,Territory_Number__r.Short_Name__c,Territory_Short_Name__c,
                            Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Phone_Recording__c,Owner.Name,CreatedDate,Hours_Since_Lead_Created__c, 
                            OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Days_and_Hours_Since_Lead_Created__c,
                            Call_Time_Charged_minutes__c,Territory_State__c,TwilioRecordingSid__c,TwilioCallSid__c
                            FROM Lead WHERE IsConverted = false AND CreatedDate = LAST_N_DAYS:90 ORDER BY CreatedDate DESC];
    
    List<Opportunity> oppList = [SELECT Id,Name,Approval_DateTime__c,Approval_Status__c,StageName,Rep_Name__c,Rep_Name__r.Name,Rep_Responsible_For_Signing__c,Rep_Responsible_For_Signing__r.Name,Next_Agreement_Stage__c,
                                 Contract_No__c,AccountId,Account.Customer_No__c,Account.Territory_Short_Name__c,Territory_Short_Name__c,Account.PersonMobilePhone,No_of_Days_since_Agreement_is_created__c,Amount,CreatedDate,
                                 Is_Tax_Invoice_Signed__c,Is_Product_Sourced__c,Is_Purchase_Receipt_Tax_Invoice_Attached__c    
                                 FROM Opportunity WHERE 
                                 RecordType.Name <> 'Trak SIM' AND 
                                 StageName = 'Goods Delivered' AND 
                                 (TaxInvoice_Signed_DateTime__c=null OR (TaxInvoice_Signed_DateTime__c!=null AND Is_Purchase_Receipt_Tax_Invoice_Attached__c=false)) AND 
                                 Is_Credit_Contract__c = true AND Account.Territory_Number__r.Is_Credit_Contract__c = true
                                 ORDER BY CreatedDate DESC];

    for(Integer l=0; l<leadList.size(); l++)
    {
        LeadWrapper wrap = new LeadWrapper();
        wrap.lead = leadList[l];
        wrap.isSelected = false;
        wrap.isMasterRecord = false;
        
        if(leadWrapperList.size() < 200 || (user.Alias <> '100' && leadWrapperList.size() < 500))
        {
            leadWrapperList.add(wrap);
        }else
        {
            break;
        }
    }
    
    for(Integer o=0; o<oppList.size(); o++)
    {
        OpportunityWrapper wrap = new OpportunityWrapper();
        wrap.opp = oppList[o];
        wrap.isSelected = false;
        wrap.status = (oppList[o].Is_Tax_Invoice_Signed__c && !oppList[o].Is_Purchase_Receipt_Tax_Invoice_Attached__c ? 'Outstanding Purchase Receipt' : (!oppList[o].Is_Tax_Invoice_Signed__c && oppList[o].Approval_Status__c == 'Approved' ? 'Outstanding To Sign' : (oppList[o].Approval_Status__c == null ? 'Outstanding Submission' : oppList[o].Approval_Status__c)));
        wrap.timeSinceFormatted = '';
        Long dt1Long = oppList[o].CreatedDate.getTime();
        Long dt2Long = DateTime.now().getTime();
        Long milliseconds = dt2Long - dt1Long;
        Long seconds = milliseconds / 1000;
        Long minutes = seconds / 60;
        Long hours = minutes / 60;
        Long days = hours / 24;
        wrap.timeSinceFormatted = days + ' Days ' + Math.mod(hours,24) + ' Hours';
        
        if(oppWrapperList.size() < 200 || (user.Alias <> '100' && oppWrapperList.size() < 500))
        {
            oppWrapperList.add(wrap);
            oppIds.add(oppList[o].Id);
        }else
        {
            break;
        }
    }
    
    List<Account> acctList = [SELECT Id,Name,Customer_No__c,FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,OwnerId,
                                Hybrid_Link_Status__c,Territory_Short_Name__c,Enquiry_Date__c,Product_Interested_In__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_DateTime__c,Enquiry_Notes__c,PUA_Status__c,Hybrid_Link_Finish_Datetime__c 
                                FROM Account WHERE 
                                Enquiry_Status__c = 'Enquiry' AND 
                                ((Enquiry_Date__c = LAST_N_DAYS:40 AND State_Master_State__c = 'NZ') OR (PUA_Status__c = 'Approved' AND Hybrid_Link_Finish_Datetime__c = LAST_N_DAYS:40 AND Territory_Number__r.Name != '1000')) AND
                                AgreementId_For_Current_Enquiry__c NOT IN: oppIds AND Territory_Number__r.Is_Credit_Contract__c = true ORDER BY Enquiry_Date__c DESC];
    
    Set<String> custNumList = new Set<String>();
    Map<String,Cart_Item__c> cartItemMap = new Map<String,Cart_Item__c>();
    for(Integer a=0; a<acctList.size(); a++){
        custNumList.add(acctList[a].Customer_No__c);
    }
    List<Cart_Item__c> cartItems = [SELECT Id,Product_Inventory__c,Product_Inventory__r.ProductName__c,Account__c,Account__r.Customer_No__c FROM Cart_Item__c WHERE Account__r.Customer_No__c in :custNumList];
    for(Integer c=0; c<cartItems.size(); c++){
        cartItemMap.put(cartItems[c].Account__r.Customer_No__c,cartItems[c]);
    }

    for(Integer a=0; a<acctList.size(); a++)
    {
        AccountWrapper wrap = new AccountWrapper();
        wrap.acct = acctList[a];
        wrap.isSelected = false;
        wrap.status = acctList[a].Hybrid_Link_Allocation_Datetime__c != null ? acctList[a].Hybrid_Link_Status__c : (acctList[a].Hybrid_Link_Status__c == 'Hybrid Sent' ? '' : acctList[a].Hybrid_Link_Status__c);
        wrap.timeSinceFormatted = '';
        wrap.product = (cartItemMap.containsKey(acctList[a].Customer_No__c) ? cartItemMap.get(acctList[a].Customer_No__c).Product_Inventory__r.ProductName__c : acctList[a].Product_Interested_In__c);
        if(acctList[a].Enquiry_DateTime__c != null)
        { 
            wrap.timeSinceFormatted = ReportController.getFormattedTimeSince(acctList[a].Enquiry_DateTime__c);
        }
        if(acctList[a].Hybrid_Link_Finish_Datetime__c != null)
        { 
            wrap.timeSinceApproval = ReportController.getFormattedTimeSince(acctList[a].Hybrid_Link_Finish_Datetime__c);
        }

        if(accountWrapperList.size() < 200 || (user.Alias <> '100' && accountWrapperList.size() < 500))
        {
            accountWrapperList.add(wrap);
        }else
        {
            break;
        }
    }
    
    leadsSize = leadList.size();
    acctsSize = acctList.size();
    oppsSize = oppList.size();
}

public static String getFormattedTimeSince(Datetime dt){
    Long dt1Long = dt.getTime();
    Long dt2Long = DateTime.now().getTime();
    Long milliseconds = dt2Long - dt1Long;
    Long seconds = milliseconds / 1000;
    Long minutes = seconds / 60;
    Long hours = minutes / 60;
    Long days = hours / 24;
    return (days + ' Days ' + Math.mod(hours,24) + ' Hours');
} 

public void getSelectedLeads()
{
    String acctId = Apexpages.currentPage().getParameters().get('acctId');
    selectedAccount = null;
    selectedLeadWrapperList = new List<LeadWrapper>();
    
    for(Integer i=0; i<leadWrapperList.size(); i++)
    {
        if(leadWrapperList[i].isSelected)
        {
            LeadWrapper lw = new LeadWrapper();
            lw.lead = leadWrapperList[i].lead;
            lw.isSelected = true;
            lw.isMasterRecord = false;
            selectedLeadWrapperList.add(lw);
        }
    }
    
    if(acctId != null && acctId.trim() != '')
    {
        selectedAccount = [SELECT Id,FirstName,LastName,Customer_No__c,PersonMobilePhone,Territory_Short_Name__c,No_of_times_lead_has_been_converted__c,OwnerId FROM Account WHERE Id =: acctId LIMIT 1];
    }
}

public PageReference mergeLeads()
{
    try
    {
        System.debug('leadCount : ' + Apexpages.currentPage().getParameters().get('leadCount'));
        String acctId = Apexpages.currentPage().getParameters().get('acctId');
        Lead masterLead;
        String masterLeadId;
        List<Lead> duplicateLeads = new List<Lead>();
        List<String> ucLeadIds = new List<String>();
        Decimal totalCallTime = 0;
        Integer parsedLeadsCounter = 0;
        DateTime masterLeadCreatedTime;
        DateTime masterLeadFinishTime;
        Integer leadCount = Integer.valueOf(Apexpages.currentPage().getParameters().get('leadCount'));
        List<LeadWrapper> actionLeadWrapperList = leadCount > 1 ? selectedLeadWrapperList : leadWrapperList;
        
        String masterFirstName;
        String masterLastName;
        String masterEmail;
        String masterPostalCode;
        String masterStreet;
        String masterCity;
        String masterState;
        String masterDesiredProduct;
        String masterNatureOfEnquiry;
        String masterhowDidYouHear;
        String masterReasonForEnquiry;
        String masterMobile;
        String masterMedium;
        String masterTerrState;
        String masterCRN;
        String masterCallSID;
        String masterRecordingSID;
        
        System.debug('leadCount : ' + leadCount);
        System.debug('selectedAccount : ' + selectedAccount);
        System.debug('acctId : ' + acctId);
        
        for(Integer i=0; i<actionLeadWrapperList.size(); i++)
        {
            if(actionLeadWrapperList[i].isSelected && (actionLeadWrapperList[i].isMasterRecord || leadCount == 1))
            {
                masterLeadId = actionLeadWrapperList[i].lead.Id;
                totalCallTime += (actionLeadWrapperList[i].lead.Call_Time_Charged_minutes__c == null ? 0 : actionLeadWrapperList[i].lead.Call_Time_Charged_minutes__c); 
                masterLeadCreatedTime = actionLeadWrapperList[i].lead.CreatedDate;
                
                masterFirstName = actionLeadWrapperList[i].lead.FirstName;
                masterLastName = actionLeadWrapperList[i].lead.LastName;
                masterEmail = actionLeadWrapperList[i].lead.Email;
                masterPostalCode = actionLeadWrapperList[i].lead.PostalCode;
                masterStreet = actionLeadWrapperList[i].lead.Street;
                masterCity = actionLeadWrapperList[i].lead.City;
                masterState = actionLeadWrapperList[i].lead.State;
                masterDesiredProduct = actionLeadWrapperList[i].lead.Desired_Product__c;
                masterNatureOfEnquiry = actionLeadWrapperList[i].lead.contact_desc__c;
                masterhowDidYouHear = actionLeadWrapperList[i].lead.did_your_hear__c;
                masterReasonForEnquiry = actionLeadWrapperList[i].lead.Reason_for_Enquiry__c;
                masterMobile = actionLeadWrapperList[i].lead.MobilePhone;
                masterMedium = actionLeadWrapperList[i].lead.Lead_Medium__c;
                masterCRN = actionLeadWrapperList[i].lead.crn__c;
                masterTerrState = actionLeadWrapperList[i].lead.Territory_State__c;
                masterCallSID = actionLeadWrapperList[i].lead.TwilioCallSid__c;
                masterRecordingSID = actionLeadWrapperList[i].lead.TwilioRecordingSid__c;
                break;
            }
        } 
        
        System.debug('masterLeadId : ' + masterLeadId);
        System.debug('DateTime : ' + masterLeadCreatedTime);
        System.debug('Date : ' + masterLeadCreatedTime.date());
        System.debug('Hours : ' + masterLeadCreatedTime.hour());
        System.debug('Minutes : ' + masterLeadCreatedTime.minute());
        System.debug('Seconds : ' + masterLeadCreatedTime.second());
        
        if(leadCount > 1)
        {   
            Integer duplicateLeadCounter = 0;
            for(Integer k=0; k<actionLeadWrapperList.size(); k++)
            {
                if(actionLeadWrapperList[k].isSelected && !actionLeadWrapperList[k].isMasterRecord)
                {
                    totalCallTime += (actionLeadWrapperList[k].lead.Call_Time_Charged_minutes__c == null ? 0 : actionLeadWrapperList[k].lead.Call_Time_Charged_minutes__c); 
                    
                    masterFirstName = masterFirstName == null ? actionLeadWrapperList[k].lead.FirstName : masterFirstName;
                    masterLastName = masterLastName == null ? actionLeadWrapperList[k].lead.LastName : masterLastName;
                    masterEmail = masterEmail == null ? actionLeadWrapperList[k].lead.Email : masterEmail;
                    masterPostalCode = masterPostalCode == null ? actionLeadWrapperList[k].lead.PostalCode : masterPostalCode;
                    masterStreet = masterStreet == null ? actionLeadWrapperList[k].lead.Street : masterStreet;
                    masterCity = masterCity == null ? actionLeadWrapperList[k].lead.City : masterCity;
                    masterState = masterState == null ? actionLeadWrapperList[k].lead.State : masterState;
                    masterDesiredProduct = masterDesiredProduct == null ? actionLeadWrapperList[k].lead.Desired_Product__c : masterDesiredProduct;
                    masterNatureOfEnquiry = masterNatureOfEnquiry == null ? actionLeadWrapperList[k].lead.contact_desc__c : masterNatureOfEnquiry;
                    masterhowDidYouHear = masterhowDidYouHear == null ? actionLeadWrapperList[k].lead.did_your_hear__c : masterhowDidYouHear;
                    masterReasonForEnquiry = masterReasonForEnquiry == null ? actionLeadWrapperList[k].lead.Reason_for_Enquiry__c : masterReasonForEnquiry;
                    
                    if((actionLeadWrapperList[k].lead.TwilioCallSid__c <> null && masterCallSID == null) || (actionLeadWrapperList[k].lead.TwilioCallSid__c <> null && actionLeadWrapperList[k].lead.TwilioRecordingSid__c <> null && masterRecordingSID == null))
                    {
                        masterCallSID = actionLeadWrapperList[k].lead.TwilioCallSid__c;
                        masterRecordingSID = actionLeadWrapperList[k].lead.TwilioRecordingSid__c;
                    }
                    
                    duplicateLeadCounter++;
                    
                    if(duplicateLeadCounter == (leadCount - 1))
                    {
                        break;
                    }
                }
            }
            
            System.debug('duplicateLeadCounter : ' + duplicateLeadCounter); 
            
            System.debug('DateTime : ' + masterLeadCreatedTime);
            System.debug('Date : ' + masterLeadCreatedTime.date());
            System.debug('Hours : ' + masterLeadCreatedTime.hour());
            System.debug('Minutes : ' + masterLeadCreatedTime.minute());
            System.debug('Seconds : ' + masterLeadCreatedTime.second());
            
            masterLeadCreatedTime = DateTime.newInstance(masterLeadCreatedTime.year(),masterLeadCreatedTime.month(),masterLeadCreatedTime.day(),masterLeadCreatedTime.hour(),masterLeadCreatedTime.minute(),masterLeadCreatedTime.second());
            masterLeadFinishTime = masterLeadCreatedTime <> null ? masterLeadCreatedTime.addMinutes(Integer.valueOf(totalCallTime)) : null;
            
            
            System.debug('DateTime : ' + masterLeadCreatedTime);
            System.debug('Date : ' + masterLeadCreatedTime.date());
            System.debug('Hours : ' + masterLeadCreatedTime.hour());
            System.debug('Minutes : ' + masterLeadCreatedTime.minute());
            System.debug('Seconds : ' + masterLeadCreatedTime.second());
            
            System.debug('****totalCallTime ' + totalCallTime);
            
            System.debug('****masterLeadFinishTime ' + masterLeadFinishTime);
            System.debug('Date : ' + masterLeadFinishTime.date());
            System.debug('Hours : ' + masterLeadFinishTime.hour());
            System.debug('Minutes : ' + masterLeadFinishTime.minute());
            System.debug('Seconds : ' + masterLeadFinishTime.second());
            
            for(Integer j=0; j<actionLeadWrapperList.size(); j++)
            {
                if(actionLeadWrapperList[j].isSelected && actionLeadWrapperList[j].isMasterRecord)
                {
                    System.debug('masterLeadId : ' + actionLeadWrapperList[j].lead.Id);
                    masterLeadId = actionLeadWrapperList[j].lead.Id;
                    masterLead = new Lead(Id=actionLeadWrapperList[j].lead.Id,FirstName=masterFirstName,LastName=masterLastName,Reason_for_Enquiry__c=masterReasonForEnquiry,Desired_Product__c=masterDesiredProduct,Street=masterStreet,City=masterCity,State=masterState,PostalCode=masterPostalCode,Email=masterEmail,did_your_hear__c=masterhowDidYouHear,contact_desc__c=masterNatureOfEnquiry,Twilio_Call_Finish_Datetime__c=masterLeadFinishTime,TwilioCallSid__c=masterCallSId,TwilioRecordingSid__c=masterRecordingSID);
                }else if(actionLeadWrapperList[j].isSelected && !actionLeadWrapperList[j].isMasterRecord)
                {
                    duplicateLeads.add(new Lead(Id=actionLeadWrapperList[j].lead.Id));
                }
            }
            
            if(masterLead <> null && duplicateLeads.size() > 0)
            {
                Database.MergeResult[] results = Database.merge(masterLead, duplicateLeads, true);
            }
        }
        
        if(selectedAccount == null && acctId != null && acctId.trim() != '')
        {
            selectedAccount = [SELECT Id,FirstName,LastName,Customer_No__c,PersonMobilePhone,Territory_Short_Name__c,No_of_times_lead_has_been_converted__c,OwnerId FROM Account WHERE Id =: acctId LIMIT 1];
        }
        
        if(selectedAccount != null && masterLeadId != null)
        {
            NewEnquirySectionController nes = new NewEnquirySectionController();
            nes.doConvert(masterLeadId,selectedAccount);
            nes.calculateCallTime(selectedAccount.Id,masterLeadId);
        }
    
        return new PageReference('/apex/WIPPage').setRedirect(true);
    }catch(Exception ex)
    {
        system.debug('Exception: '+ex+' - '+ex.getLineNumber());
        ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.ERROR,'Error!! Please contact the administrator. Exception: '+ex);
        ApexPages.addMessage(errorMsg);
        ErrorLog.addErrorLog('ReportController','mergeLeads','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

/*
public void initPromotion(){
    try{
        promoStartDate = Date.newInstance(2022, 7, 4);
        promoEndDate = Date.newInstance(2022, 8, 14);
        oppWrapList = new List<OpportunityWrapper>();
        oppWrapList2 = new List<OpportunityWrapper>();
        oppWrapList3 = new List<OpportunityWrapper>();
        List<String> oppIds = new List<String>();
        List<String> failedOppIds = new List<String>();
        List<String> failedAcctIds = new List<String>();
        List<String> batchOneOppIds = new List<String>();
        List<String> batchTwoOppIds = new List<String>();
    
        Map<String,List<Payment_Allocation__c>> oppPaymentMap = new Map<String,List<Payment_Allocation__c>>();
        
        List<Opportunity> oppList = [SELECT Id,Name,Total_Paid_Amount__c,TaxInvoice_Signed_DateTime__c,Contract_No__c,
                                     Scheduled_Amount__c,First_Payment_Received_Date__c,Payment_Frequency__c,Fortnightly_Schedule_Payment__c,
                                     AccountId,Account.PersonMobilePhone,Account.PersonEmail,Last_Payment_Upload_Date_Rollup__c,Account.SMS_Mobile__c,
                                     Expected_payment_amount_so_far__c,Actual_Arrears__c,First_Payment_Upload_Date__c,Account.OwnerId,
                                     Account.Agreement_Completed_Date__c,Account.Fortnightly_Scheduled_Payment__c,Account.Schedule_Amount__c,
                                     Account.Payment_Frequncy_Least_Value__c,Agreement_Type__c,Account.Active_Agreements__c,Account.No_Of_Agreements__c 
                                     FROM Opportunity 
                                     WHERE TaxInvoice_Signed_DateTime__c <> null AND 
                                     TaxInvoice_Signed_DateTime__c >=: promoStartDate AND
                                     TaxInvoice_Signed_DateTime__c <=: promoEndDate AND
                                     StageName = 'Goods Delivered' AND
                                     Account.State_Master_State__c <> 'NZ' AND
                                     Account.Territory_State__c <> 'NT' AND
                                     Promo_Actioned_Datetime__c = null AND
                                     Account.PersonEmail <> null
                                     ORDER BY TaxInvoice_Signed_DateTime__c ASC LIMIT 1900];
        System.debug('****oppList ' + oppList.size());
        for(Opportunity opp : oppList){
            oppIds.add(opp.Id);
        }
        List<Payment_Allocation__c> paList = [SELECT Id,Name,Contract__c,Contract__r.Contract_No__c,Payment__c,Actual_Amount__c,
                                              Payment__r.CreatedDate,Payment__r.Name,CreatedDate
                                              FROM Payment_Allocation__c
                                              WHERE Contract__c in: oppIds AND
                                              Actual_Amount__c > 0 AND
                                              Payment__r.Payment_File__r.Is_Realtime_Payment__c = false AND 
                                              Payment__r.CreatedDate >=: promoStartDate
                                              ORDER BY Contract__c,CreatedDate ASC];
        List<Payment_Allocation__c> temppaList;
        for(Payment_Allocation__c pa : paList){
            if(oppPaymentMap.containsKey(pa.Contract__r.Contract_No__c)){
                temppaList = oppPaymentMap.get(pa.Contract__r.Contract_No__c);
                temppaList.add(pa);
                oppPaymentMap.put(pa.Contract__r.Contract_No__c,temppaList);
            }else{
                temppaList = new List<Payment_Allocation__c>();
                temppaList.add(pa);
                oppPaymentMap.put(pa.Contract__r.Contract_No__c,temppaList);
            }
        }
        //System.debug('****oppPaymentMap ' + oppPaymentMap);
        for(Integer i=0; i<oppList.size(); i++){
            if(oppList[i].First_Payment_Upload_Date__c <> null && (oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(oppList[i].First_Payment_Upload_Date__c.date()) <= 14) && ((oppList[i].Payment_Frequency__c == 'Fortnightly' && oppList[i].Total_Paid_Amount__c >= (2 * oppList[i].Scheduled_Amount__c)) || (oppList[i].Payment_Frequency__c == 'Weekly' && oppList[i].Total_Paid_Amount__c >= (4 * oppList[i].Scheduled_Amount__c)))){
                OpportunityWrapper wrap = new OpportunityWrapper();
                wrap.isSelected = false;
                wrap.opp = oppList[i];
                wrap.egiftAmount = Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2) + (Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0) == 0 ? 0 : (5 - Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0)));
                wrap.firstPaymentAmt = 0;
                wrap.secondPaymentAmt = 0;
                wrap.thirdPaymentAmt = 0;
                wrap.fourthPaymentAmt = 0;
                
                temppaList = oppPaymentMap.get(oppList[i].Contract_No__c);
                //System.debug('****temppaList ' + temppaList);
                
                String lastPaymentName;
                String firstPaymentName;
                String secondPaymentName;
                String thirdPaymentName;
                String fourthPaymentName;
                for(Integer j=0; j<temppaList.size(); j++){
                    if(firstPaymentName == null || firstPaymentName == temppaList[j].Payment__r.Name){
                        wrap.firstPaymentDate = temppaList[j].Payment__r.CreatedDate.date();
                        wrap.firstPaymentAmt += temppaList[j].Actual_Amount__c;
                        firstPaymentName = temppaList[j].Payment__r.Name;
                    }else if(firstPaymentName != temppaList[j].Payment__r.Name && (secondPaymentName == null || secondPaymentName == temppaList[j].Payment__r.Name)){
                        wrap.secondPaymentDate = temppaList[j].Payment__r.CreatedDate.date();
                        wrap.secondPaymentAmt += temppaList[j].Actual_Amount__c;
                        secondPaymentName = temppaList[j].Payment__r.Name;
                    }else if(secondPaymentName != null && secondPaymentName != temppaList[j].Payment__r.Name && (thirdPaymentName == null || thirdPaymentName == temppaList[j].Payment__r.Name)){
                        wrap.thirdPaymentDate = temppaList[j].Payment__r.CreatedDate.date();
                        wrap.thirdPaymentAmt += temppaList[j].Actual_Amount__c;
                        thirdPaymentName = temppaList[j].Payment__r.Name;
                    }else if(thirdPaymentName != null && thirdPaymentName != temppaList[j].Payment__r.Name && (fourthPaymentName == null || fourthPaymentName == temppaList[j].Payment__r.Name)){
                        wrap.fourthPaymentDate = temppaList[j].Payment__r.CreatedDate.date();
                        wrap.fourthPaymentAmt += temppaList[j].Actual_Amount__c;
                        fourthPaymentName = temppaList[j].Payment__r.Name;
                    }
                    lastPaymentName = temppaList[j].Payment__r.Name;
                }
                
                if(oppWrapList.size() < 950 && oppList[i].Payment_Frequency__c == 'Fortnightly' && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 14 && wrap.firstPaymentAmt != null && wrap.secondPaymentAmt != null && wrap.firstPaymentAmt >= oppList[i].Scheduled_Amount__c && wrap.secondPaymentAmt >= oppList[i].Scheduled_Amount__c){
                    oppWrapList.add(wrap);
                    batchOneOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchOneOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }else if(oppWrapList.size() < 950 && oppList[i].Payment_Frequency__c == 'Weekly' && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 7 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 7 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 7 && wrap.firstPaymentAmt != null && wrap.secondPaymentAmt != null && wrap.thirdPaymentAmt != null && wrap.fourthPaymentAmt != null && wrap.firstPaymentAmt >= oppList[i].Scheduled_Amount__c && wrap.secondPaymentAmt >= oppList[i].Scheduled_Amount__c && wrap.thirdPaymentAmt >= oppList[i].Scheduled_Amount__c && wrap.fourthPaymentAmt >= oppList[i].Scheduled_Amount__c){
                    oppWrapList.add(wrap);
                    batchOneOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchOneOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }else{
                    failedOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    failedAcctIds.add(oppList[i].AccountId);
                }
            }else{
                failedOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                failedAcctIds.add(oppList[i].AccountId);
            }
        }
        System.debug('****batchOneOppIds ' + batchOneOppIds);
        System.debug('****failedOppIds ' + failedOppIds);
        
        List<Payment__c> failedPaymentList = [SELECT Id,Name,Total_Paid__c,CreatedDate,Payment_File__c,Payment_File__r.File_Name__c,Centrepay_Benefits__c,
                                                ApplicantLookup__c 
                                                FROM Payment__c 
                                                WHERE ApplicantLookup__c in: failedAcctIds AND 
                                                CreatedDate >=: promoStartDate AND
                                                Total_Paid__c > 0 AND
                                                RecordType.Name <> 'Buyout' AND
                                                Payment_File__r.Is_Realtime_Payment__c = false
                                                ORDER BY CreatedDate ASC];
        Map<String,List<Payment__c>> acctPaymentMap = new Map<String,List<Payment__c>>();
        List<Payment__c> tempPaymentList;
        for(Payment__c fp : failedPaymentList){
            if(acctPaymentMap.containsKey(String.valueOf(fp.ApplicantLookup__c).substring(0,15))){
                tempPaymentList = acctPaymentMap.get(String.valueOf(fp.ApplicantLookup__c).substring(0,15));
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }else{
                tempPaymentList = new List<Payment__c>();
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }
        }
        
        for(Integer i=0; i<oppList.size(); i++){
            if(failedOppIds.contains(String.valueOf(oppList[i].Id).substring(0,15))){
                Decimal paymentTotal = 0;
                OpportunityWrapper wrap = new OpportunityWrapper();
                wrap.isSelected = false;
                wrap.opp = oppList[i];
                wrap.egiftAmount = Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2) + (Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0) == 0 ? 0 : (5 - Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0)));
                wrap.firstPaymentAmt = 0;
                wrap.secondPaymentAmt = 0;
                wrap.thirdPaymentAmt = 0;
                wrap.fourthPaymentAmt = 0;
                List<Payment__c> paymentList;
                if(acctPaymentMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                    paymentList = acctPaymentMap.get(String.valueOf(oppList[i].AccountId).substring(0,15));
                }else{
                    paymentList = new List<Payment__c>();
                }
                
                Integer paymentCount = 0;
                Boolean payment1Passed = true;
                Boolean payment2Passed = true;
                Boolean payment3Passed = true;
                Boolean payment4Passed = true;
                Decimal twoPaymentsTotal = 0;
                Decimal fourPaymentsTotal = 0;
                Set<String> benefitTypeSet = new Set<String>();
                Boolean multiBenefits = false;
                Boolean daysGapLessThanNine = false;
                
                for(Integer p=0; p<paymentList.size(); p++){
                    if(!paymentList[p].Payment_File__r.File_Name__c.containsIgnoreCase('Realtime')){
                        paymentTotal += paymentList[p].Total_Paid__c;
                        if(paymentCount == 0){
                            wrap.firstPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.firstPaymentAmt = paymentList[p].Total_Paid__c;
                            twoPaymentsTotal += wrap.firstPaymentAmt;
                            fourPaymentsTotal += wrap.firstPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 1){
                            wrap.secondPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.secondPaymentAmt = paymentList[p].Total_Paid__c;
                            twoPaymentsTotal += wrap.secondPaymentAmt;
                            fourPaymentsTotal += wrap.secondPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 2){
                            wrap.thirdPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.thirdPaymentAmt = paymentList[p].Total_Paid__c;
                            fourPaymentsTotal += wrap.thirdPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 3){
                            wrap.fourthPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.fourthPaymentAmt = paymentList[p].Total_Paid__c;
                            fourPaymentsTotal += wrap.fourthPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }
                        wrap.totalPaidApplicant = paymentTotal;
                        paymentCount++;
                        if(benefitTypeSet.size() > 1){
                            multiBenefits = true;
                        }
                        if(paymentCount == 4){
                            break;
                        }
                    }
                }
                
                if(wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 7 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 7 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 7){
                    daysGapLessThanNine = true;
                }
                
                if(oppWrapList2.size() < 950 && (multiBenefits || daysGapLessThanNine) && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 14 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 14 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 14 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 14 && fourPaymentsTotal >= (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }else if(oppWrapList2.size() < 950 && !multiBenefits && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 14 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 14 && twoPaymentsTotal >= (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }else if(oppWrapList3.size() < 950){
                    //oppWrapList3.add(wrap);
                }
            } 
        }
        System.debug('****batchTwoOppIds ' + batchTwoOppIds);
        System.debug('****oppWrapList ' + oppWrapList.size());
        System.debug('****oppWrapList2 ' + oppWrapList2.size());
        System.debug('****oppWrapList3 ' + oppWrapList3.size());
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','initPromotion','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void initPromotion2(){
    try{
        promoStartDate = Date.newInstance(2022, 7, 4);
        promoEndDate = Date.newInstance(2022, 8, 15);
        oppWrapList = new List<OpportunityWrapper>();
        oppWrapList2 = new List<OpportunityWrapper>();
        oppWrapList3 = new List<OpportunityWrapper>();
        List<String> oppIds = new List<String>();
        List<String> failedOppIds = new List<String>();
        List<String> failedAcctIds = new List<String>();
        List<String> batchOneOppIds = new List<String>();
        List<String> batchTwoOppIds = new List<String>();
        Map<String,List<Payment_Allocation__c>> oppPaymentMap = new Map<String,List<Payment_Allocation__c>>();
        Boolean showExceptionOpps = Test.isRunningTest() ? false : (Apexpages.currentPage().getURL().containsIgnoreCase('PromotionAgreementsExceptionPage') ? true : false);
        
        List<Opportunity> oppList = [SELECT Id,Name,Total_Paid_Amount__c,TaxInvoice_Signed_DateTime__c,Contract_No__c,
                                     Scheduled_Amount__c,First_Payment_Received_Date__c,Payment_Frequency__c,Fortnightly_Schedule_Payment__c,
                                     AccountId,Account.PersonMobilePhone,Account.PersonEmail,Last_Payment_Upload_Date_Rollup__c,Account.SMS_Mobile__c,
                                     Expected_payment_amount_so_far__c,Actual_Arrears__c,First_Payment_Upload_Date__c,Account.OwnerId,Taxinvoice_Signed_Date__c,
                                     Account.Agreement_Completed_Date__c,Account.Fortnightly_Scheduled_Payment__c,Account.Schedule_Amount__c,
                                     Account.Payment_Frequncy_Least_Value__c,Agreement_Type__c,Account.Active_Agreements__c,Account.No_Of_Agreements__c 
                                     FROM Opportunity 
                                     WHERE TaxInvoice_Signed_DateTime__c <> null AND 
                                     Taxinvoice_Signed_Date__c >=: promoStartDate AND
                                     Taxinvoice_Signed_Date__c <: promoEndDate AND
                                     StageName = 'Goods Delivered' AND
                                     Account.State_Master_State__c <> 'NZ' AND
                                     Account.Territory_State__c <> 'NT' AND
                                     Promo_Actioned_Datetime__c = null AND
                                     Promo_To_Be_Sent_Date__c = null AND
                                     RecordType.Name <> 'Trak SIM'
                                     ORDER BY TaxInvoice_Signed_DateTime__c ASC];
        System.debug('****oppList ' + oppList.size());
        for(Opportunity opp : oppList){
            oppIds.add(opp.Id);
            failedOppIds.add(String.valueOf(opp.Id).substring(0,15));
            failedAcctIds.add(opp.AccountId);
        }
        
        System.debug('****failedOppIds ' + failedOppIds);
        System.debug('****failedAcctIds ' + failedAcctIds);
        Integer tempOppCount = 0;
        Map<String,Integer> acctOppCountMap = new Map<String,Integer>();
        List<Opportunity> actionedGiftOpps = [SELECT Id,AccountId,Name 
                                                FROM Opportunity
                                                WHERE Promo_Actioned_Datetime__c <> null AND
                                                AccountId in: failedAcctIds];
        for(Opportunity opp : actionedGiftOpps){
            tempOppCount = 0;
            if(acctOppCountMap.containsKey(String.valueOf(opp.AccountId).substring(0,15))){
                tempOppCount = acctOppCountMap.get(String.valueOf(opp.AccountId).substring(0,15));
                tempOppCount++;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }else{
                tempOppCount = 1;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }
        }
        System.debug('****acctOppCountMap ' + acctOppCountMap);
                                                
        List<Payment__c> failedPaymentList = [SELECT Id,Name,Total_Paid__c,CreatedDate,Payment_File__c,Payment_File__r.File_Name__c,Centrepay_Benefits__c,
                                                ApplicantLookup__c 
                                                FROM Payment__c 
                                                WHERE ApplicantLookup__c in: failedAcctIds AND 
                                                CreatedDate >=: promoStartDate AND
                                                Total_Paid__c > 0 AND
                                                RecordType.Name <> 'Buyout' AND
                                                Payment_File__r.Is_Realtime_Payment__c = false
                                                ORDER BY CreatedDate ASC];
        Map<String,List<Payment__c>> acctPaymentMap = new Map<String,List<Payment__c>>();
        List<Payment__c> tempPaymentList;
        for(Payment__c fp : failedPaymentList){
            if(acctPaymentMap.containsKey(String.valueOf(fp.ApplicantLookup__c).substring(0,15))){
                tempPaymentList = acctPaymentMap.get(String.valueOf(fp.ApplicantLookup__c).substring(0,15));
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }else{
                tempPaymentList = new List<Payment__c>();
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }
        }
        
        for(Integer i=0; i<oppList.size(); i++){
            if(!acctOppCountMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                Decimal paymentTotal = 0;
                OpportunityWrapper wrap = new OpportunityWrapper();
                wrap.isSelected = false;
                wrap.manualCheckingNeeded = false;
                wrap.opp = oppList[i];
                wrap.egiftAmount = Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2) + (Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0) == 0 ? 0 : (5 - Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0)));
                wrap.firstPaymentAmt = 0;
                wrap.secondPaymentAmt = 0;
                wrap.thirdPaymentAmt = 0;
                wrap.fourthPaymentAmt = 0;
                List<Payment__c> paymentList;
                if(acctPaymentMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                    paymentList = acctPaymentMap.get(String.valueOf(oppList[i].AccountId).substring(0,15));
                }else{
                    paymentList = new List<Payment__c>();
                }
                
                Integer paymentCount = 0;
                Boolean payment1Passed = true;
                Boolean payment2Passed = true;
                Boolean payment3Passed = true;
                Boolean payment4Passed = true;
                Decimal twoPaymentsTotal = 0;
                Decimal fourPaymentsTotal = 0;
                Set<String> benefitTypeSet = new Set<String>();
                Boolean multiBenefits = false;
                Boolean daysGapLessThanNine = false;
                
                for(Integer p=0; p<paymentList.size(); p++){
                    if(!paymentList[p].Payment_File__r.File_Name__c.containsIgnoreCase('Realtime') && paymentList[p].CreatedDate > oppList[i].TaxInvoice_Signed_DateTime__c){
                        paymentTotal += paymentList[p].Total_Paid__c;
                        if(paymentCount == 0){
                            wrap.firstPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.firstPaymentAmt = paymentList[p].Total_Paid__c;
                            twoPaymentsTotal += wrap.firstPaymentAmt;
                            fourPaymentsTotal += wrap.firstPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 1){
                            wrap.secondPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.secondPaymentAmt = paymentList[p].Total_Paid__c;
                            twoPaymentsTotal += wrap.secondPaymentAmt;
                            fourPaymentsTotal += wrap.secondPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 2){
                            wrap.thirdPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.thirdPaymentAmt = paymentList[p].Total_Paid__c;
                            fourPaymentsTotal += wrap.thirdPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 3){
                            wrap.fourthPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.fourthPaymentAmt = paymentList[p].Total_Paid__c;
                            fourPaymentsTotal += wrap.fourthPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }
                        wrap.totalPaidApplicant = paymentTotal;
                        paymentCount++;
                        if(benefitTypeSet.size() > 1){
                            multiBenefits = true;
                        }
                        if(paymentCount == 4){
                            break;
                        }
                    }
                }
                
                if(wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 9 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 9 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 9){
                    daysGapLessThanNine = true;
                }
                
                if((oppList[i].Account.Agreement_Completed_Date__c != null && oppList[i].Account.Agreement_Completed_Date__c.daysBetween(Date.today()) <= 9) || (oppList[i].Total_Paid_Amount__c < (2 * oppList[i].Fortnightly_Schedule_Payment__c)) || (wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 3)){
                    wrap.manualCheckingNeeded = true;
                }
                
                if(!showExceptionOpps && oppWrapList2.size() < 950 && (multiBenefits || daysGapLessThanNine) && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 14 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 14 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 14 && fourPaymentsTotal >= (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }else if(!showExceptionOpps && oppWrapList2.size() < 950 && !multiBenefits && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 14 && twoPaymentsTotal >= (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }else if(showExceptionOpps && oppWrapList3.size() < 700){
                    oppWrapList3.add(wrap);
                }
            } 
        }
        System.debug('****batchTwoOppIds ' + batchTwoOppIds);
        System.debug('****oppWrapList ' + oppWrapList.size());
        System.debug('****oppWrapList2 ' + oppWrapList2.size());
        System.debug('****oppWrapList3 ' + oppWrapList3.size());
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','initPromotion2','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}


public void initPromotion3(){
    try{
        promoStartDate = Date.newInstance(2022, 7, 4);
        promoEndDate = Date.newInstance(2022, 8, 15);
        oppWrapList = new List<OpportunityWrapper>();
        oppWrapList2 = new List<OpportunityWrapper>();
        oppWrapList3 = new List<OpportunityWrapper>();
        List<String> oppIds = new List<String>();
        List<String> failedOppIds = new List<String>();
        List<String> failedAcctIds = new List<String>();
        List<String> batchOneOppIds = new List<String>();
        List<String> batchTwoOppIds = new List<String>();
        Map<String,List<Payment_Allocation__c>> oppPaymentMap = new Map<String,List<Payment_Allocation__c>>();
        Boolean showExceptionOpps = Test.isRunningTest() ? false : (Apexpages.currentPage().getURL().containsIgnoreCase('PromotionAgreementsExceptionPage') ? true : false);
        
        List<Opportunity> oppList = [SELECT Id,Name,Total_Paid_Amount__c,TaxInvoice_Signed_DateTime__c,Contract_No__c,
                                     Scheduled_Amount__c,First_Payment_Received_Date__c,Payment_Frequency__c,Fortnightly_Schedule_Payment__c,
                                     AccountId,Account.PersonMobilePhone,Account.PersonEmail,Last_Payment_Upload_Date_Rollup__c,Account.SMS_Mobile__c,
                                     Expected_payment_amount_so_far__c,Actual_Arrears__c,First_Payment_Upload_Date__c,Account.OwnerId,Taxinvoice_Signed_Date__c,
                                     Account.Agreement_Completed_Date__c,Account.Fortnightly_Scheduled_Payment__c,Account.Schedule_Amount__c,
                                     Account.Payment_Frequncy_Least_Value__c,Agreement_Type__c,Account.Active_Agreements__c,Account.No_Of_Agreements__c 
                                     FROM Opportunity 
                                     WHERE TaxInvoice_Signed_DateTime__c <> null AND 
                                     Taxinvoice_Signed_Date__c >=: promoStartDate AND
                                     Taxinvoice_Signed_Date__c <: promoEndDate AND
                                     StageName = 'Goods Delivered' AND
                                     Account.State_Master_State__c <> 'NZ' AND
                                     Account.Territory_State__c <> 'NT' AND
                                     Promo_Actioned_Datetime__c = null AND
                                     Promo_To_Be_Sent_Date__c = null AND
                                     RecordType.Name <> 'Trak SIM'
                                     ORDER BY TaxInvoice_Signed_DateTime__c ASC];
        System.debug('****oppList ' + oppList.size());
        for(Opportunity opp : oppList){
            oppIds.add(opp.Id);
            failedOppIds.add(String.valueOf(opp.Id).substring(0,15));
            failedAcctIds.add(opp.AccountId);
        }
        
        System.debug('****failedOppIds ' + failedOppIds);
        System.debug('****failedAcctIds ' + failedAcctIds);
        Integer tempOppCount = 0;
        Map<String,Integer> acctOppCountMap = new Map<String,Integer>();
        List<Opportunity> actionedGiftOpps = [SELECT Id,AccountId,Name 
                                                FROM Opportunity
                                                WHERE Promo_Actioned_Datetime__c <> null AND
                                                AccountId in: failedAcctIds];
        for(Opportunity opp : actionedGiftOpps){
            tempOppCount = 0;
            if(acctOppCountMap.containsKey(String.valueOf(opp.AccountId).substring(0,15))){
                tempOppCount = acctOppCountMap.get(String.valueOf(opp.AccountId).substring(0,15));
                tempOppCount++;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }else{
                tempOppCount = 1;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }
        }
        System.debug('****acctOppCountMap ' + acctOppCountMap);
                                                
        List<Payment__c> failedPaymentList = [SELECT Id,Name,Total_Paid__c,CreatedDate,Payment_File__c,Payment_File__r.File_Name__c,Centrepay_Benefits__c,
                                                ApplicantLookup__c 
                                                FROM Payment__c 
                                                WHERE ApplicantLookup__c in: failedAcctIds AND 
                                                CreatedDate >=: promoStartDate AND
                                                Total_Paid__c > 0 AND
                                                RecordType.Name <> 'Buyout' AND
                                                Payment_File__r.Is_Realtime_Payment__c = false
                                                ORDER BY CreatedDate ASC];
        Map<String,List<Payment__c>> acctPaymentMap = new Map<String,List<Payment__c>>();
        List<Payment__c> tempPaymentList;
        for(Payment__c fp : failedPaymentList){
            if(acctPaymentMap.containsKey(String.valueOf(fp.ApplicantLookup__c).substring(0,15))){
                tempPaymentList = acctPaymentMap.get(String.valueOf(fp.ApplicantLookup__c).substring(0,15));
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }else{
                tempPaymentList = new List<Payment__c>();
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }
        }
        
        for(Integer i=0; i<oppList.size(); i++){
            if(!acctOppCountMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                Decimal paymentTotal = 0;
                OpportunityWrapper wrap = new OpportunityWrapper();
                wrap.isSelected = false;
                wrap.manualCheckingNeeded = false;
                wrap.manualCheckingReason = '';
                wrap.opp = oppList[i];
                wrap.egiftAmount = Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2) + (Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0) == 0 ? 0 : (5 - Math.mod((Long)Math.floor(oppList[i].Fortnightly_Schedule_Payment__c * 2),(Long)5.0)));
                wrap.firstPaymentAmt = 0;
                wrap.secondPaymentAmt = 0;
                wrap.thirdPaymentAmt = 0;
                wrap.fourthPaymentAmt = 0;
                List<Payment__c> paymentList;
                if(acctPaymentMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                    paymentList = acctPaymentMap.get(String.valueOf(oppList[i].AccountId).substring(0,15));
                }else{
                    paymentList = new List<Payment__c>();
                }
                
                Integer paymentCount = 0;
                Boolean payment1Passed = true;
                Boolean payment2Passed = true;
                Boolean payment3Passed = true;
                Boolean payment4Passed = true;
                Decimal twoPaymentsTotal = 0;
                Decimal fourPaymentsTotal = 0;
                Decimal twoThreePaymentsTotal = 0;
                Decimal twoFivePaymentsTotal = 0;
                Set<String> benefitTypeSet = new Set<String>();
                Boolean multiBenefits = false;
                Boolean daysGapLessThanNine = false;
                
                for(Integer p=0; p<paymentList.size(); p++){
                    if(!paymentList[p].Payment_File__r.File_Name__c.containsIgnoreCase('Realtime') && paymentList[p].CreatedDate > oppList[i].TaxInvoice_Signed_DateTime__c){
                        paymentTotal += paymentList[p].Total_Paid__c;
                        if(paymentCount == 0){
                            wrap.firstPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.firstPaymentAmt = paymentList[p].Total_Paid__c;
                            twoPaymentsTotal += wrap.firstPaymentAmt;
                            fourPaymentsTotal += wrap.firstPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 1){
                            wrap.secondPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.secondPaymentAmt = paymentList[p].Total_Paid__c;
                            twoPaymentsTotal += wrap.secondPaymentAmt;
                            fourPaymentsTotal += wrap.secondPaymentAmt;
                            twoThreePaymentsTotal += wrap.secondPaymentAmt;
                            twoFivePaymentsTotal += wrap.secondPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 2){
                            wrap.thirdPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.thirdPaymentAmt = paymentList[p].Total_Paid__c;
                            fourPaymentsTotal += wrap.thirdPaymentAmt;
                            twoThreePaymentsTotal += wrap.thirdPaymentAmt;
                            twoFivePaymentsTotal += wrap.thirdPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 3){
                            wrap.fourthPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.fourthPaymentAmt = paymentList[p].Total_Paid__c;
                            fourPaymentsTotal += wrap.fourthPaymentAmt;
                            twoFivePaymentsTotal += wrap.fourthPaymentAmt;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 4){
                            wrap.fifthPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.fifthPaymentAmt = paymentList[p].Total_Paid__c;
                            twoFivePaymentsTotal += wrap.fifthPaymentAmt;
                        }
                        wrap.totalPaidApplicant = paymentTotal;
                        paymentCount++;
                        if(benefitTypeSet.size() > 1){
                            multiBenefits = true;
                        }
                        if(paymentCount == 5){
                            break;
                        }
                    }
                }
                
                if(wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 9 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 9 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 9){
                    daysGapLessThanNine = true;
                }
                
                if((oppList[i].Account.Agreement_Completed_Date__c != null && oppList[i].Account.Agreement_Completed_Date__c.daysBetween(Date.today()) <= 21) || (oppList[i].Total_Paid_Amount__c < (2 * oppList[i].Fortnightly_Schedule_Payment__c)) || (wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 3)){
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += 'Agmt Comp - ';
                }
                
                if(!showExceptionOpps && oppWrapList2.size() < 950 && (multiBenefits || daysGapLessThanNine) && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 16 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 16 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 16 && fourPaymentsTotal >= ((2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c) - 2)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    
                    if(fourPaymentsTotal < (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                        wrap.manualCheckingNeeded = true;
                        wrap.manualCheckingReason += '$2 Variance - ';
                    }
                }
                else if(!showExceptionOpps && oppWrapList2.size() < 950 && (multiBenefits || daysGapLessThanNine) && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && wrap.fourthPaymentDate != null && wrap.fifthPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 16 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 16 && wrap.thirdPaymentDate.daysBetween(wrap.fourthPaymentDate) <= 16 && wrap.fourthPaymentDate.daysBetween(wrap.fifthPaymentDate) <= 16 && twoFivePaymentsTotal >= ((2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c) - 2)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += '1st Pmt - ';
                    if(twoFivePaymentsTotal < (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                        wrap.manualCheckingReason += '$2 Variance - ';
                    }
                }
                else if(!showExceptionOpps && oppWrapList2.size() < 950 && !multiBenefits && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 16 && twoPaymentsTotal >= ((2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c) - 2)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    
                    if(twoPaymentsTotal < (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                        wrap.manualCheckingNeeded = true;
                        wrap.manualCheckingReason += '$2 Variance - ';
                    }
                }
                else if(!showExceptionOpps && oppWrapList2.size() < 950 && !multiBenefits && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 16 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 16 && twoThreePaymentsTotal >= ((2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c) - 2)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += '1st Pmt - ';
                    
                    if(twoThreePaymentsTotal < (2 * oppList[i].Account.Fortnightly_Scheduled_Payment__c)){
                        wrap.manualCheckingReason += '$2 Variance - ';
                    }
                }
                else if(showExceptionOpps && oppWrapList3.size() < 700){
                    oppWrapList3.add(wrap);
                }
            } 
        }
        System.debug('****batchTwoOppIds ' + batchTwoOppIds);
        System.debug('****oppWrapList ' + oppWrapList.size());
        System.debug('****oppWrapList2 ' + oppWrapList2.size());
        System.debug('****oppWrapList3 ' + oppWrapList3.size());
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','initPromotion3','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void getPromosToSend(){
    try{
        promoStartDate = Date.newInstance(2022, 7, 4);
        promoEndDate = Date.newInstance(2022, 8, 15);
        List<Opportunity> oppList = [SELECT Id,Name,Total_Paid_Amount__c,TaxInvoice_Signed_DateTime__c,Contract_No__c, 
                                     Scheduled_Amount__c,First_Payment_Received_Date__c,Payment_Frequency__c,Fortnightly_Schedule_Payment__c,
                                     AccountId,Account.PersonMobilePhone,Account.PersonEmail,Last_Payment_Upload_Date_Rollup__c,Account.SMS_Mobile__c,
                                     Expected_payment_amount_so_far__c,Actual_Arrears__c,First_Payment_Upload_Date__c,Account.OwnerId,Taxinvoice_Signed_Date__c,
                                     Account.Agreement_Completed_Date__c,Account.Fortnightly_Scheduled_Payment__c,Account.Schedule_Amount__c,
                                     Account.Payment_Frequncy_Least_Value__c,Agreement_Type__c,Account.Active_Agreements__c,Account.No_Of_Agreements__c,
                                     Promo_Gift_Amount__c,Promo_Actioned_Datetime__c,Promo_To_Be_Sent_Date__c 
                                     FROM Opportunity WHERE
                                     Taxinvoice_Signed_Date__c >=: promoStartDate AND
                                     Taxinvoice_Signed_Date__c <: promoEndDate AND
                                     StageName = 'Goods Delivered' AND 
                                     Promo_To_Be_Sent_Date__c = LAST_N_DAYS:7 AND 
                                     Promo_Actioned_Datetime__c = null AND
                                     RecordType.Name <> 'Trak SIM'
                                     ORDER BY TaxInvoice_Signed_DateTime__c ASC LIMIT 100];
        oppWrapList = new List<OpportunityWrapper>();
        for(Integer i=0; i<oppList.size(); i++){
            OpportunityWrapper wrap = new OpportunityWrapper();
            wrap.isSelected = false;
            wrap.opp = oppList[i];
            wrap.egiftAmount = oppList[i].Promo_Gift_Amount__c;
            oppWrapList.add(wrap);
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','getPromosToSend','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public PageReference sendPromotionCSV(){
    try{
        String passHeaderRow = 'Id,Amount\n';
        String passRows = '';
        String passFinalString = '';
        
        for(OpportunityWrapper wrap : oppWrapList2){
            passRows += wrap.opp.Id;
            passRows += ',';
            passRows += wrap.egiftAmount;
            passRows += '\n';
        }
        
        passFinalString = passHeaderRow + passRows;
        
        List<Messaging.Emailfileattachment> finalEmailAttachmentList = new List<Messaging.Emailfileattachment>();
        Blob csvBlob = Blob.valueOf(passfinalString);
        string csvname = 'Passed Opps_' + Date.today().format() + '.csv';
        String fileType = 'csv';
        Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
        efa.setFileName(csvname);
        efa.setBody(csvBlob);
        finalEmailAttachmentList.add(efa);
        
        Messaging.reserveSingleEmailCapacity(1);
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage finalEmail = new Messaging.SingleEmailMessage();
        finalEmail.setSubject('Promotion Opps');
        finalEmail.setToAddresses(new list<string> {'mohit@rent4keeps.com.au'});
        finalEmail.setHtmlBody('Please find the attachments.');
        finalEmail.setFileAttachments(finalEmailAttachmentList);
        emails.add(finalEmail); 
        Messaging.sendEmail(emails);

        return new PageReference('/apex/PromotionAgreementsPageClone').setRedirect(true);    
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','sendPromotionCSV','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
} 

public PageReference sendPromotionSMS(){
    try{
        List<Opportunity> promoOpps = new List<Opportunity>();
        List <smagicinteract__smsmagic__c> smsObjectList = new List <smagicinteract__smsmagic__c>();
        String smsTemplateForCust;
        List<OpportunityWrapper> combinedOppWrapList = new List<OpportunityWrapper>();
        combinedOppWrapList.addAll(oppWrapList);
        //combinedOppWrapList.addAll(oppWrapList2);
        //combinedOppWrapList.addAll(oppWrapList3);
        System.debug('****combinedOppWrapList ' + combinedOppWrapList.size());
        
        for(OpportunityWrapper wrap : combinedOppWrapList){
            if(wrap.isSelected){
                smsTemplateForCust = 'We hope you are enjoying your new product\n' +
                                        'You qualified for the rent4keeps ‘Our Shout’ promotion and you get 1 month FREE!\n' +
                                        'This is provided in an e-Gift Voucher that will be emailed to your email address on your rental agreement in the next 7days.\n' +
                                        'Please check your junk mail and main inbox\n' +
                                        'This voucher works across major retailers department stores and supermarkets\n' +
                                        'We hope you enjoy the e-Gift Voucher and thank you for using rent4keeps\n' +
                                        'https://rent4keeps.com.au/\n' +
                                        'Ts&Cs Apply\n' +
                                        'Stop to Opt-Out';
                smagicinteract__smsMagic__c smsObject = new smagicinteract__smsMagic__c();
                smsObject.smagicinteract__SenderId__c = 'rent4keeps';
                smsObject.smagicinteract__Name__c = 'Promotion-OurShout'; // records name
                smsObject.smagicinteract__Account__c = wrap.opp.AccountId;
                smsObject.smagicinteract__Opportunity__c = wrap.opp.Id;
                smsObject.OwnerId = wrap.opp.Account.OwnerId;
                smsObject.smagicinteract__ObjectType__c = 'Opportunity'; // record type
                smsObject.smagicinteract__disableSMSOnTrigger__c = 0; // this field either be 0 or 1, if you specify the value as 1 then sms will not get send but entry of sms will get create under SMS History object
                smsObject.smagicinteract__external_field__c = smagicinteract.ApexAPI.generateUniqueKey();
                smsObject.smagicinteract__PhoneNumber__c = wrap.opp.Account.SMS_Mobile__c;//'61449066375'; ////
                smsObject.smagicinteract__SMSText__c = smsTemplateForCust; 
                smsObjectList.add(smsObject); 
                
                Opportunity opp = new Opportunity();
                opp.Id = wrap.opp.Id;
                opp.Promo_Actioned_Datetime__c = DateTime.now();
                //opp.Promo_Gift_Amount__c = wrap.egiftAmount;
                promoOpps.add(opp);
            }
        }
        
        if(smsObjectList.size() > 0){
            //send SMS
            system.debug('##EndSMS: '+smsObjectList.size());
            String response = smagicinteract.ApexAPI.pushSMSCallout(smsObjectList);
            Database.insert(smsObjectList,false);
        }
        if(promoOpps.size() > 0){
            update promoOpps;
        }
        return new PageReference('/apex/PromotionAgreementsToSendPage').setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','sendPromotionSMS','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void initBudgetSaver(){
    try{
        promoStartDate = Date.newInstance(2022, 8, 15);
        promoEndDate = Date.newInstance(2022, 9, 26);
        oppWrapList = new List<OpportunityWrapper>();
        oppWrapList2 = new List<OpportunityWrapper>();
        oppWrapList3 = new List<OpportunityWrapper>();
        List<String> oppIds = new List<String>();
        List<String> failedOppIds = new List<String>();
        List<String> failedAcctIds = new List<String>();
        List<String> batchOneOppIds = new List<String>();
        List<String> batchTwoOppIds = new List<String>();
        Map<String,List<Payment_Allocation__c>> oppPaymentMap = new Map<String,List<Payment_Allocation__c>>();
        
        List<Opportunity> oppList = [SELECT Id,Name,Total_Paid_Amount__c,TaxInvoice_Signed_DateTime__c,Contract_No__c,
                                     Scheduled_Amount__c,First_Payment_Received_Date__c,Payment_Frequency__c,Fortnightly_Schedule_Payment__c,
                                     AccountId,Account.PersonMobilePhone,Account.PersonEmail,Last_Payment_Upload_Date_Rollup__c,Account.SMS_Mobile__c,
                                     Expected_payment_amount_so_far__c,Actual_Arrears__c,First_Payment_Upload_Date__c,Account.OwnerId,Taxinvoice_Signed_Date__c,
                                     Account.Agreement_Completed_Date__c,Account.Fortnightly_Scheduled_Payment__c,Account.Schedule_Amount__c,
                                     Account.Payment_Frequncy_Least_Value__c,Agreement_Type__c,Account.Active_Agreements__c,Account.No_Of_Agreements__c 
                                     FROM Opportunity 
                                     WHERE TaxInvoice_Signed_DateTime__c <> null AND 
                                     Taxinvoice_Signed_Date__c >=: promoStartDate AND
                                     Taxinvoice_Signed_Date__c <: promoEndDate AND
                                     StageName = 'Goods Delivered' AND
                                     Account.State_Master_State__c <> 'NZ' AND
                                     Account.Territory_State__c <> 'NT' AND
                                     Promo_Actioned_Datetime__c = null AND
                                     Promo_To_Be_Sent_Date__c = null AND
                                     RecordType.Name <> 'Trak SIM'
                                     ORDER BY TaxInvoice_Signed_DateTime__c ASC];
        System.debug('****oppList ' + oppList.size());
        for(Opportunity opp : oppList){
            oppIds.add(opp.Id);
            failedOppIds.add(String.valueOf(opp.Id).substring(0,15));
            failedAcctIds.add(opp.AccountId);
        }
        
        System.debug('****failedOppIds ' + failedOppIds);
        System.debug('****failedAcctIds ' + failedAcctIds);
        Integer tempOppCount = 0;
        Map<String,Integer> acctOppCountMap = new Map<String,Integer>();
        List<Opportunity> actionedGiftOpps = [SELECT Id,AccountId,Name 
                                                FROM Opportunity
                                                WHERE TaxInvoice_Signed_DateTime__c <> null AND 
                                                TaxInvoice_Signed_DateTime__c >=: promoStartDate AND
                                                TaxInvoice_Signed_DateTime__c <=: promoEndDate AND
                                                Promo_Actioned_Datetime__c <> null AND
                                                AccountId in: failedAcctIds];
        for(Opportunity opp : actionedGiftOpps){
            tempOppCount = 0;
            if(acctOppCountMap.containsKey(String.valueOf(opp.AccountId).substring(0,15))){
                tempOppCount = acctOppCountMap.get(String.valueOf(opp.AccountId).substring(0,15));
                tempOppCount++;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }else{
                tempOppCount = 1;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }
        }
        System.debug('****acctOppCountMap ' + acctOppCountMap);
                                                
        List<Payment__c> failedPaymentList = [SELECT Id,Name,Total_Paid__c,CreatedDate,Payment_File__c,Payment_File__r.File_Name__c,Centrepay_Benefits__c,
                                                ApplicantLookup__c 
                                                FROM Payment__c 
                                                WHERE ApplicantLookup__c in: failedAcctIds AND 
                                                CreatedDate >=: promoStartDate AND
                                                Total_Paid__c > 0 AND
                                                RecordType.Name <> 'Buyout' AND
                                                Payment_File__r.Is_Realtime_Payment__c = false
                                                ORDER BY CreatedDate ASC];
        Map<String,List<Payment__c>> acctPaymentMap = new Map<String,List<Payment__c>>();
        List<Payment__c> tempPaymentList;
        for(Payment__c fp : failedPaymentList){
            if(acctPaymentMap.containsKey(String.valueOf(fp.ApplicantLookup__c).substring(0,15))){
                tempPaymentList = acctPaymentMap.get(String.valueOf(fp.ApplicantLookup__c).substring(0,15));
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }else{
                tempPaymentList = new List<Payment__c>();
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }
        }
        
        for(Integer i=0; i<oppList.size(); i++){
            if(!acctOppCountMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                Decimal paymentTotal = 0;
                OpportunityWrapper wrap = new OpportunityWrapper();
                wrap.isSelected = false;
                wrap.manualCheckingNeeded = false;
                wrap.opp = oppList[i];
                wrap.egiftAmount = (oppList[i].Fortnightly_Schedule_Payment__c >= 50 ? 150 : 50);
                wrap.firstPaymentAmt = 0;
                wrap.secondPaymentAmt = 0;
                wrap.thirdPaymentAmt = 0;
                wrap.fourthPaymentAmt = 0;
                List<Payment__c> paymentList;
                if(acctPaymentMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                    paymentList = acctPaymentMap.get(String.valueOf(oppList[i].AccountId).substring(0,15));
                }else{
                    paymentList = new List<Payment__c>();
                }
                
                Set<String> benefitTypeSet = new Set<String>();
                Boolean multiBenefits = false;
                Boolean daysGapLessThanNine = false;
                Integer paymentCount = 0;
                
                for(Integer p=0; p<paymentList.size(); p++){
                    if(!paymentList[p].Payment_File__r.File_Name__c.containsIgnoreCase('Realtime') && paymentList[p].CreatedDate > oppList[i].TaxInvoice_Signed_DateTime__c){
                        paymentTotal += paymentList[p].Total_Paid__c;
                        if(paymentCount == 0){
                            wrap.firstPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.firstPaymentAmt = paymentList[p].Total_Paid__c;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }else if(paymentCount == 1){
                            wrap.secondPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.secondPaymentAmt = paymentList[p].Total_Paid__c;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                        }
                        wrap.totalPaidApplicant = paymentTotal;
                        paymentCount++;
                        if(benefitTypeSet.size() > 1){
                            multiBenefits = true;
                        }
                        if(paymentCount == 2){
                            break;
                        }
                    }
                }
                
                if(wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 9){
                    daysGapLessThanNine = true;
                }
                
                if((oppList[i].Account.Agreement_Completed_Date__c != null && oppList[i].Account.Agreement_Completed_Date__c.daysBetween(Date.today()) <= 9) || (oppList[i].Total_Paid_Amount__c < oppList[i].Fortnightly_Schedule_Payment__c) || (wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 3)){
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += 'Agmt Comp - ';
                }
                if((oppList[i].Total_Paid_Amount__c < oppList[i].Fortnightly_Schedule_Payment__c)){
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += 'Less than 1pmt - ';
                }
                if((wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 3)){
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += 'First Pmt - ';
                }
                
                if(oppWrapList2.size() < 500 && (multiBenefits || daysGapLessThanNine) && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 14 && wrap.totalPaidApplicant >= oppList[i].Account.Fortnightly_Scheduled_Payment__c){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }else if(oppWrapList2.size() < 500 && !multiBenefits && wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentAmt >= oppList[i].Account.Fortnightly_Scheduled_Payment__c){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                }
            } 
        }
        System.debug('****batchTwoOppIds ' + batchTwoOppIds);
        System.debug('****oppWrapList ' + oppWrapList.size());
        System.debug('****oppWrapList2 ' + oppWrapList2.size());
        System.debug('****oppWrapList3 ' + oppWrapList3.size());
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','initBudgetSaver','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void initBudgetSaver2(){
    try{
        promoStartDate = Date.newInstance(2022, 8, 15);
        promoEndDate = Date.newInstance(2022, 9, 26);
        oppWrapList = new List<OpportunityWrapper>();
        oppWrapList2 = new List<OpportunityWrapper>();
        oppWrapList3 = new List<OpportunityWrapper>();
        List<String> oppIds = new List<String>();
        List<String> failedOppIds = new List<String>();
        List<String> failedAcctIds = new List<String>();
        List<String> batchOneOppIds = new List<String>();
        List<String> batchTwoOppIds = new List<String>();
        Map<String,List<Payment_Allocation__c>> oppPaymentMap = new Map<String,List<Payment_Allocation__c>>();
        
        List<Opportunity> oppList = [SELECT Id,Name,Total_Paid_Amount__c,TaxInvoice_Signed_DateTime__c,Contract_No__c,
                                     Scheduled_Amount__c,First_Payment_Received_Date__c,Payment_Frequency__c,Fortnightly_Schedule_Payment__c,
                                     AccountId,Account.PersonMobilePhone,Account.PersonEmail,Last_Payment_Upload_Date_Rollup__c,Account.SMS_Mobile__c,
                                     Expected_payment_amount_so_far__c,Actual_Arrears__c,First_Payment_Upload_Date__c,Account.OwnerId,Taxinvoice_Signed_Date__c,
                                     Account.Agreement_Completed_Date__c,Account.Fortnightly_Scheduled_Payment__c,Account.Schedule_Amount__c,
                                     Account.Payment_Frequncy_Least_Value__c,Agreement_Type__c,Account.Active_Agreements__c,Account.No_Of_Agreements__c 
                                     FROM Opportunity 
                                     WHERE TaxInvoice_Signed_DateTime__c <> null AND 
                                     Taxinvoice_Signed_Date__c >=: promoStartDate AND
                                     Taxinvoice_Signed_Date__c <: promoEndDate AND
                                     StageName = 'Goods Delivered' AND
                                     Account.State_Master_State__c <> 'NZ' AND
                                     Account.Territory_State__c <> 'NT' AND
                                     Promo_Actioned_Datetime__c = null AND
                                     Promo_To_Be_Sent_Date__c = null AND
                                     RecordType.Name <> 'Trak SIM'
                                     ORDER BY TaxInvoice_Signed_DateTime__c ASC];
        System.debug('****oppList ' + oppList.size());
        for(Opportunity opp : oppList){
            oppIds.add(opp.Id);
            failedOppIds.add(String.valueOf(opp.Id).substring(0,15));
            failedAcctIds.add(opp.AccountId);
        }
        
        System.debug('****failedOppIds ' + failedOppIds);
        System.debug('****failedAcctIds ' + failedAcctIds);
        Integer tempOppCount = 0;
        Map<String,Integer> acctOppCountMap = new Map<String,Integer>();
        List<Opportunity> actionedGiftOpps = [SELECT Id,AccountId,Name 
                                                FROM Opportunity
                                                WHERE TaxInvoice_Signed_DateTime__c <> null AND 
                                                TaxInvoice_Signed_DateTime__c >=: promoStartDate AND
                                                TaxInvoice_Signed_DateTime__c <=: promoEndDate AND
                                                Promo_Actioned_Datetime__c <> null AND
                                                AccountId in: failedAcctIds];
        for(Opportunity opp : actionedGiftOpps){
            tempOppCount = 0;
            if(acctOppCountMap.containsKey(String.valueOf(opp.AccountId).substring(0,15))){
                tempOppCount = acctOppCountMap.get(String.valueOf(opp.AccountId).substring(0,15));
                tempOppCount++;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }else{
                tempOppCount = 1;
                acctOppCountMap.put(String.valueOf(opp.AccountId).substring(0,15),tempOppCount);
            }
        }
        System.debug('****acctOppCountMap ' + acctOppCountMap);
                                                
        List<Payment__c> failedPaymentList = [SELECT Id,Name,Total_Paid__c,CreatedDate,Payment_File__c,Payment_File__r.File_Name__c,Centrepay_Benefits__c,
                                                ApplicantLookup__c 
                                                FROM Payment__c 
                                                WHERE ApplicantLookup__c in: failedAcctIds AND 
                                                CreatedDate >=: promoStartDate AND
                                                Total_Paid__c > 0 AND
                                                RecordType.Name <> 'Buyout' AND
                                                Payment_File__r.Is_Realtime_Payment__c = false
                                                ORDER BY CreatedDate ASC];
        Map<String,List<Payment__c>> acctPaymentMap = new Map<String,List<Payment__c>>();
        List<Payment__c> tempPaymentList;
        for(Payment__c fp : failedPaymentList){
            if(acctPaymentMap.containsKey(String.valueOf(fp.ApplicantLookup__c).substring(0,15))){
                tempPaymentList = acctPaymentMap.get(String.valueOf(fp.ApplicantLookup__c).substring(0,15));
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }else{
                tempPaymentList = new List<Payment__c>();
                tempPaymentList.add(fp);
                acctPaymentMap.put(String.valueOf(fp.ApplicantLookup__c).substring(0,15),tempPaymentList);
            }
        }
        
        for(Integer i=0; i<oppList.size(); i++){
            if(!acctOppCountMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                Decimal paymentTotal = 0;
                OpportunityWrapper wrap = new OpportunityWrapper();
                wrap.isSelected = false;
                wrap.manualCheckingNeeded = false;
                wrap.manualCheckingReason = '';
                wrap.opp = oppList[i];
                wrap.egiftAmount = (oppList[i].Fortnightly_Schedule_Payment__c >= 50 ? 150 : 50);
                wrap.firstPaymentAmt = 0;
                wrap.secondPaymentAmt = 0;
                wrap.thirdPaymentAmt = 0;
                wrap.fourthPaymentAmt = 0;
                List<Payment__c> paymentList;
                if(acctPaymentMap.containsKey(String.valueOf(oppList[i].AccountId).substring(0,15))){
                    paymentList = acctPaymentMap.get(String.valueOf(oppList[i].AccountId).substring(0,15));
                }else{
                    paymentList = new List<Payment__c>();
                }
                
                Set<String> benefitTypeSet = new Set<String>();
                Boolean multiBenefits = false;
                Boolean daysGapLessThanNine = false;
                Integer paymentCount = 0;
                Decimal twoPaymentsTotal = 0;
                Decimal twoThreePaymentsTotal = 0;
                
                for(Integer p=0; p<paymentList.size(); p++){
                    if(!paymentList[p].Payment_File__r.File_Name__c.containsIgnoreCase('Realtime') && paymentList[p].CreatedDate > oppList[i].TaxInvoice_Signed_DateTime__c){
                        paymentTotal += paymentList[p].Total_Paid__c;
                        if(paymentCount == 0){
                            wrap.firstPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.firstPaymentAmt = paymentList[p].Total_Paid__c;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                            twoPaymentsTotal += paymentList[p].Total_Paid__c;
                        }else if(paymentCount == 1){
                            wrap.secondPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.secondPaymentAmt = paymentList[p].Total_Paid__c;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                            twoPaymentsTotal += paymentList[p].Total_Paid__c;
                            twoThreePaymentsTotal += paymentList[p].Total_Paid__c;
                        }else if(paymentCount == 2){
                            wrap.thirdPaymentDate = paymentList[p].CreatedDate.date();
                            wrap.thirdPaymentAmt = paymentList[p].Total_Paid__c;
                            benefitTypeSet.add(paymentList[p].Centrepay_Benefits__c);
                            twoThreePaymentsTotal += paymentList[p].Total_Paid__c;
                        }
                        wrap.totalPaidApplicant = paymentTotal;
                        paymentCount++;
                        if(benefitTypeSet.size() > 1){
                            multiBenefits = true;
                        }
                        if(paymentCount == 3){
                            break;
                        }
                    }
                }
                
                if(wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 9){
                    daysGapLessThanNine = true;
                }
                
                if((oppList[i].Account.Agreement_Completed_Date__c != null && oppList[i].Account.Agreement_Completed_Date__c.daysBetween(Date.today()) <= 9) || (oppList[i].Total_Paid_Amount__c < oppList[i].Fortnightly_Schedule_Payment__c) || (wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 3)){
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += 'Agmt Comp - ';
                }
                if((oppList[i].Total_Paid_Amount__c < oppList[i].Fortnightly_Schedule_Payment__c)){
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += 'Less than 1pmt - ';
                }
                if((wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 3)){
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += 'First Pmt - ';
                }
                
                if(oppWrapList2.size() < 500 && (multiBenefits || daysGapLessThanNine) && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 16 && (twoPaymentsTotal >= oppList[i].Account.Fortnightly_Scheduled_Payment__c - 1)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    
                    if(twoPaymentsTotal < oppList[i].Account.Fortnightly_Scheduled_Payment__c){
                        wrap.manualCheckingNeeded = true;
                        wrap.manualCheckingReason += '$1 Variance - ';
                    }
                }else if(oppWrapList2.size() < 500 && !multiBenefits && wrap.firstPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentAmt >= (oppList[i].Account.Fortnightly_Scheduled_Payment__c - 1)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    
                    if(wrap.firstPaymentAmt < oppList[i].Account.Fortnightly_Scheduled_Payment__c){
                        wrap.manualCheckingNeeded = true;
                        wrap.manualCheckingReason += '$1 Variance - ';
                    }
                }else if(oppWrapList2.size() < 500 && (multiBenefits || daysGapLessThanNine) && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && wrap.thirdPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 16 && wrap.secondPaymentDate.daysBetween(wrap.thirdPaymentDate) <= 16 && (twoThreePaymentsTotal >= oppList[i].Account.Fortnightly_Scheduled_Payment__c - 1)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += '1st Pmt - ';
                    
                    if(twoThreePaymentsTotal < oppList[i].Account.Fortnightly_Scheduled_Payment__c){
                        wrap.manualCheckingNeeded = true;
                        wrap.manualCheckingReason += '$1 Variance - ';
                    }
                }else if(oppWrapList2.size() < 500 && !multiBenefits && wrap.firstPaymentDate != null && wrap.secondPaymentDate != null && oppList[i].TaxInvoice_Signed_DateTime__c.date().daysBetween(wrap.firstPaymentDate) <= 19 && wrap.firstPaymentDate.daysBetween(wrap.secondPaymentDate) <= 16 && wrap.secondPaymentAmt >= (oppList[i].Account.Fortnightly_Scheduled_Payment__c - 1)){
                    oppWrapList2.add(wrap);
                    batchTwoOppIds.add(String.valueOf(oppList[i].Id).substring(0,15));
                    System.debug('****batchTwoOppIds ' + String.valueOf(oppList[i].Id).substring(0,15));
                    wrap.manualCheckingNeeded = true;
                    wrap.manualCheckingReason += '1st Pmt - ';
                    
                    if(wrap.secondPaymentAmt < oppList[i].Account.Fortnightly_Scheduled_Payment__c){
                        wrap.manualCheckingNeeded = true;
                        wrap.manualCheckingReason += '$1 Variance - ';
                    }
                }
            } 
        }
        System.debug('****batchTwoOppIds ' + batchTwoOppIds);
        System.debug('****oppWrapList ' + oppWrapList.size());
        System.debug('****oppWrapList2 ' + oppWrapList2.size());
        System.debug('****oppWrapList3 ' + oppWrapList3.size());
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','initBudgetSaver2','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void checkRecordAccess(){
    try{
        String acctId = Apexpages.currentPage().getParameters().get('acctId');
        String ldOwnerId = Apexpages.currentPage().getParameters().get('ldOwnerId');
        List<UserRecordAccess> leadOwnerAccess = [SELECT RecordId,HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: ldOwnerId AND RecordId =: acctId];
        recordaccess = leadOwnerAccess.size() > 0 ? leadOwnerAccess[0].HasReadAccess : false;
        System.debug('****recordaccess ' + recordaccess);
        System.debug('****leadOwnerAccess ' + leadOwnerAccess);
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','checkRecordAccess','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void initIncomeExpenseSummary()
{
    String acctId = Apexpages.currentPage().getParameters().get('id');
    try
    {
        liabilitiesWrapList = new List<ExpenseWrapper>();
        essentialWrapList = new List<ExpenseWrapper>();
        otherWrapList = new List<ExpenseWrapper>();
        bankEmpIncome = 0;
        bankClinkIncome = 0;
        bankOtherIncome = 0;
        bankTransferSavings = 0;
        List<AggregateResult> bankCategResults;
        Map<String,Decimal> categoryAmountMap = new Map<String,Decimal>();
        acct = [SELECT Id,FirstName,LastName,Name,PersonMailingCity FROM Account WHERE Id =: acctId LIMIT 1];
        List<String> bankGenCategoryList = new List<String>{'Rent','Utilities','Groceries','Insurance','Telecommunications','Subscription TV','Automotive / Transport / Travel','Personal Care','Entertainment & Dining Out','Health','Home Improvement & Retail','Education and Childcare','Gyms and other memberships','Uncategorised Expense'};
        List<BankStatement_Generic_Category__c> appCategoryResults = [SELECT Fortnightly_Amount__c,Category_Group__c,Name,ScoreGroceries__c,ScoreRent__c,ScoreUtilities__c
                                                                FROM BankStatement_Generic_Category__c 
                                                                WHERE BankStatement_R4K_Category__r.Account__c =: acctId
                                                                AND (Category_Group__c in: bankGenCategoryList OR Category_Group__c in ('Wages','Centrelink','Other Income','Liabilities'))
                                                                AND CreatedDate = LAST_N_DAYS:30
                                                                ORDER BY Category_Group__c ASC];
        
        for(BankStatement_Generic_Category__c bgc : appCategoryResults)
        {
            if(categoryAmountMap.containsKey(bgc.Category_Group__c))
            {
                categoryAmountMap.put(bgc.Category_Group__c,categoryAmountMap.get(bgc.Category_Group__c) + (bgc.Fortnightly_Amount__c == null ? 0 : bgc.Fortnightly_Amount__c));    
            }else
            {
                categoryAmountMap.put(bgc.Category_Group__c,(bgc.Fortnightly_Amount__c == null ? 0 : bgc.Fortnightly_Amount__c));
            }
            
            if(bgc.Category_Group__c == 'Wages')
            {
                bankEmpIncome = (bgc.Fortnightly_Amount__c == null ? 0 : bgc.Fortnightly_Amount__c);
            }else if(bgc.Category_Group__c == 'Centrelink')
            {
                bankClinkIncome = (bgc.Fortnightly_Amount__c == null ? 0 : bgc.Fortnightly_Amount__c);
            }else if(bgc.Category_Group__c == 'Other Income')
            {
                bankOtherIncome = (bgc.Fortnightly_Amount__c == null ? 0 : bgc.Fortnightly_Amount__c);
            }else if(bgc.Category_Group__c == 'Liabilities')
            {
                ExpenseWrapper wrap = new ExpenseWrapper();
                wrap.category = bgc.Name;
                wrap.fnAmount = Math.abs(bgc.Fortnightly_Amount__c == null ? 0 : bgc.Fortnightly_Amount__c);
                wrap.suburbAvg = 0;
                wrap.r4kAvg = 0;
                liabilitiesWrapList.add(wrap);
            }
            scoreRent = bgc.ScoreRent__c;
            scoreGroceries = bgc.ScoreGroceries__c;
            scoreUtilities = bgc.ScoreUtilities__c;
        }
           
        List<BankStatement_Transaction__c> externalTransfers = [SELECT Id,Description__c,Debit_Amount__c FROM BankStatement_Transaction__c 
                                                                WHERE BankStatement_Generic_Category__r.Name = 'External Transfers'
                                                                AND Debit_Amount__c > 0 AND BankStatement_Generic_Category__r.BankStatement_R4K_Category__r.Account__c =: acctId
                                                                AND CreatedDate = LAST_N_DAYS:30];
        for(BankStatement_Transaction__c ext : externalTransfers)
        {
            if(ext.Description__c != null && (ext.Description__c.containsIgnoreCase(acct.Name) || ext.Description__c.containsIgnoreCase(acct.FirstName) || ext.Description__c.containsIgnoreCase(acct.LastName)))
            {
                bankTransferSavings += ext.Debit_Amount__c;
            }
        }
        bankTransferSavings = ((bankTransferSavings * 14) / 95); 
        
        for(String cag : bankGenCategoryList)
        {
            ExpenseWrapper wrap = new ExpenseWrapper();
            wrap.category = cag;
            wrap.categoryDescription = cag;
            wrap.fnAmount = Math.abs((!categoryAmountMap.containsKey(cag) ? 0 : categoryAmountMap.get(cag)));
            wrap.suburbAvg = 0;
            wrap.r4kAvg = 0;
            
            if(cag == 'Rent' || cag == 'Utilities' || cag == 'Groceries' || cag == 'Telecommunications' || cag == 'Insurance' || cag == 'Health' || cag == 'Automotive / Transport / Travel')
            {
                if(acct.PersonMailingCity != null)
                {
                    bankCategResults = [SELECT AVG(Fortnightly_Amount__c) avg FROM BankStatement_Generic_Category__c 
                                                                WHERE Name =: cag AND BankStatement_R4K_Category__r.Account__r.Territory_State__c <> 'NZ' 
                                                                AND Total_Amount__c <> null AND Total_Amount__c <> 0 
                                                                AND BankStatement_R4K_Category__r.Account__r.PersonMailingCity =: acct.PersonMailingCity GROUP BY Name LIMIT 15000];
                    if(bankCategResults.size() > 0)
                    {
                        wrap.suburbAvg = Math.abs((Decimal)bankCategResults[0].get('avg'));
                    }
                }
                bankCategResults = [SELECT AVG(Fortnightly_Amount__c) avg FROM BankStatement_Generic_Category__c 
                                                                WHERE Name =: cag AND BankStatement_R4K_Category__r.Account__r.Territory_State__c <> 'NZ' 
                                                                AND Total_Amount__c <> null AND Total_Amount__c <> 0
                                                                AND BankStatement_R4K_Category__r.Account__r.Last_Active_Agreement_Date_Rollup__c = LAST_N_DAYS:90
                                                                 GROUP BY Name LIMIT 15000];
                if(bankCategResults.size() > 0)
                {
                    wrap.r4kAvg = Math.abs((Decimal)bankCategResults[0].get('avg'));
                }
                
                if(cag == 'Rent')
                {
                    wrap.score = scoreRent;
                }
                if(cag == 'Groceries')
                {
                    wrap.score = scoreGroceries;
                }
                if(cag == 'Utilities')
                {
                    wrap.score = scoreUtilities;
                }
                
                essentialWrapList.add(wrap); 
            }else
            {
                if(cag == 'Uncategorised Expense')
                {
                    wrap.fnAmount = wrap.fnAmount - bankTransferSavings;
                }
                otherWrapList.add(wrap); 
            }                                                   
        }                                                       
    }catch(Exception ex){
        ErrorLog.addErrorLog('ReportController','initIncomeExpenseSummary',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }                                                            
}

public Decimal bankEmpIncome{get;set;}
public Decimal bankClinkIncome{get;set;}
public Decimal bankOtherIncome{get;set;}
public Decimal bankTransferSavings{get;set;}
public Account acct{get;set;}
public Decimal scoreRent{get;set;}
public Decimal scoreGroceries{get;set;}
public Decimal scoreUtilities{get;set;}

public class ExpenseWrapper
{
    public String category{get;set;}
    public String categoryDescription{get;set;}
    public Decimal fnAmount{get;set;}
    public Decimal suburbAvg{get;set;}
    public Decimal r4kAvg{get;set;}
    public Decimal score{get;set;}
}
public List<ExpenseWrapper> expenseWrapList{get;set;}
public List<ExpenseWrapper> liabilitiesWrapList{get;set;}
public List<ExpenseWrapper> essentialWrapList{get;set;}
public List<ExpenseWrapper> otherWrapList{get;set;}

public Date promoStartDate{get;set;}
public Date promoEndDate{get;set;}*/
public List<OpportunityWrapper> oppWrapList{get;set;}
public List<OpportunityWrapper> oppWrapList2{get;set;}
public List<OpportunityWrapper> oppWrapList3{get;set;}

public class LeadWrapper
{
    public Lead lead{get;set;}
    public Boolean isSelected{get;set;}
    public Boolean isMasterRecord{get;set;}
}

public class AccountWrapper
{
    public Account acct{get;set;}
    public Boolean isSelected{get;set;}
    public String status{get;set;}
    public String timeSinceFormatted{get;set;}
    public String timeSinceApproval{get;set;}
    public String product{get;set;}
}
 
public class OpportunityWrapper
{
    public Opportunity opp{get;set;}
    public Boolean isSelected{get;set;}
    public String status{get;set;}
    public String timeSinceFormatted{get;set;}
    /*public Decimal egiftAmount{get;set;}
    public Date firstPaymentDate{get;set;}
    public Date secondPaymentDate{get;set;}
    public Date thirdPaymentDate{get;set;}
    public Date fourthPaymentDate{get;set;}
    public Date fifthPaymentDate{get;set;}
    public Decimal firstPaymentAmt{get;set;}
    public Decimal secondPaymentAmt{get;set;}
    public Decimal thirdPaymentAmt{get;set;}
    public Decimal fourthPaymentAmt{get;set;}
    public Decimal fifthPaymentAmt{get;set;}
    public Decimal totalPaidApplicant{get;set;}
    public Boolean manualCheckingNeeded{get;set;}
    public String manualCheckingReason{get;set;}*/
}

public Account selectedAccount{get;set;}
public List<Lead> unconvertedLeads{get;set;}
public List<LeadWrapper> selectedLeadWrapperList{get;set;} 

//public Boolean recordaccess{get;set;}

}