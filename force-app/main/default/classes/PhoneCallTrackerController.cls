public class PhoneCallTrackerController
{

public List<ConversationsWrapper> conversationWrapperList{get;set;}
public List<ConversationsWrapper> ogconversationWrapperList{get;set;}
public String twilioUser {get;set;}
//public String profileName {get;set;}
public String twilioProfile {get;set;}
public String userState {get;set;}
public String currentEmpId {get;set;}
public String currentEmpName {get;set;}
public String currentPerson {get;set;}
public Boolean hideCheckBox {get;set;}
public Double offset{get{
        TimeZone tz = UserInfo.getTimeZone();
        //Milliseconds to Day
        return tz.getOffset(DateTime.now()) / (1000 * 3600 * 24.0);
    }}

public void getConversationHistory()
{
    hideCheckBox = true;
    conversationWrapperList = new List<ConversationsWrapper>();
    ogconversationWrapperList = new List<ConversationsWrapper>();
    List<PhoneCall__c> recentPhoneCalls = new List<PhoneCall__c>();
    List<PhoneCall__c> incomingPhoneCalls = new List<PhoneCall__c>();
    List<smagicinteract__smsMagic__c> incomingSMSMagic = new List<smagicinteract__smsMagic__c>();
    
    String currentUser = Apexpages.currentPage().getParameters().get('tu');
    currentPerson = Apexpages.currentPage().getParameters().get('tp');
    String twilioOtherProfile = Apexpages.currentPage().getParameters().get('top');
    //Get the Twilio Users
    User u = [select id, Twilio_Users__c,State__c,User_Category__c,Twilio_PersonNames__C, Twilio_Profile__c from User where id =: UserInfo.getUserId()];
    
    if(!Test.IsRunningTest())
        twilioProfile = u.Twilio_Profile__c;
    if(twilioOtherProfile!=null && twilioOtherProfile!='')
        twilioProfile = twilioOtherProfile;
    system.debug('twilioProfile: '+twilioProfile);
    Id profileId= UserInfo.getProfileId();
    List<Employee__c> emps = [select id,name from Employee__c where Twilio_PersonName__c=:currentPerson];
    if(emps.size()>0)
        currentEmpId = emps[0].Id;
    //if(!Test.IsRunningTest())
    //    profileName=[Select Id,Name from Profile where Id=:profileId].Name;
    
     //Recent Conversations
     if(twilioProfile=='Darranda Collections' && currentUser!=null && currentUser!='' && currentUser.startsWith('NZ-'))
     {
         recentPhoneCalls = [select id, name, Call_Type__c,SMS_Status__c, SMS_Message__c,Call_time_seconds__c,CreatedDate,CreatedDateTime__c,Call_Forwarded_To__c,Medium__c, 
                         Phone_Recording__c,Type__c,PersonName__c,Account__c,Account__r.Name,Lead__c,Lead__r.Name,Employee__c,Employee__r.Name,Mobile__c,CallStartDateTime__c,FinishDateTime__c,Lead__r.Account__c,Lead__r.Probable_Account__c,
                         Lead__r.Account__r.OwnerId,Lead__r.Probable_Account__r.OwnerId,Lead__r.OwnerId,Account__r.OwnerId,
                             Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Lead__r.Account__r.Enquiry_Status__c,Account__r.Enquiry_Status__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.SMS_Mobile__c,Account__r.SMS_Mobile__c,
                             Lead__r.Probable_Territory__r.State_Master_State__c,Account__r.Probable_Territory__r.State_Master_State__c
                             from PhoneCall__c
                             where type__c in ('Darranda Collectons','Darranda NZ Collectons') and ((Call_Type__c='Missed' and PersonName__c=:currentPerson) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c ='Incoming SMS')) and Read__c=false order by CreatedDate desc LIMIT 300 ]; 
     }
     else if(twilioProfile=='Darranda Collections' && currentUser!=null && currentUser!='' && currentUser.startsWith('AU-'))
     { 
         recentPhoneCalls = [select id, name, Call_Type__c,SMS_Status__c, SMS_Message__c,Call_time_seconds__c,CreatedDate,CreatedDateTime__c,Call_Forwarded_To__c,Medium__c,
                         Phone_Recording__c,Type__c,PersonName__c,Account__c,Account__r.Name,Lead__c,Lead__r.Name,Employee__c,Employee__r.Name,Mobile__c,CallStartDateTime__c,FinishDateTime__c,Lead__r.Account__c,Lead__r.Probable_Account__c,
                         Lead__r.Account__r.OwnerId,Lead__r.Probable_Account__r.OwnerId,Lead__r.OwnerId,Account__r.OwnerId,
                         Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Lead__r.Account__r.Enquiry_Status__c,Account__r.Enquiry_Status__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.SMS_Mobile__c,Account__r.SMS_Mobile__c,
                         Lead__r.Probable_Territory__r.State_Master_State__c,Account__r.Probable_Territory__r.State_Master_State__c 
                         from PhoneCall__c 
                         where type__c in ('Darranda Collectons','Darranda AU Collectons') and ((Call_Type__c='Missed' and PersonName__c=:currentPerson) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c ='Incoming SMS')) and Read__c=false order by CreatedDate desc LIMIT 300 ]; 
     }
     else
     {
         recentPhoneCalls = [select id, name, Call_Type__c,SMS_Status__c, SMS_Message__c,Call_time_seconds__c,CreatedDate,CreatedDateTime__c,Call_Forwarded_To__c,Medium__c,
                         Phone_Recording__c,Type__c,PersonName__c,Account__c,Account__r.Name,Lead__c,Lead__r.Name,Employee__c,Employee__r.Name,Mobile__c,CallStartDateTime__c,FinishDateTime__c,Lead__r.Account__c,Lead__r.Probable_Account__c,
                         Lead__r.Account__r.OwnerId,Lead__r.Probable_Account__r.OwnerId,Lead__r.OwnerId,Account__r.OwnerId,
                         Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Lead__r.Account__r.Enquiry_Status__c,Account__r.Enquiry_Status__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.SMS_Mobile__c,Account__r.SMS_Mobile__c,
                         Lead__r.Probable_Territory__r.State_Master_State__c,Account__r.Probable_Territory__r.State_Master_State__c
                         from PhoneCall__c
                         where type__c=:twilioProfile and ((Call_Type__c='Missed' and PersonName__c=:currentPerson) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c ='Incoming SMS')) and Read__c=false order by CreatedDate desc LIMIT 300]; 
     }
     if(twilioProfile=='Darranda CLO' || Test.isRunningTest())
     {
         incomingSMSMagic = [select id,name,smagicinteract__PhoneNumber__c,smagicinteract__Lead__c,smagicinteract__Lead__r.Name,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,smagicinteract__Lead__r.Account__r.Enquiry_Status__c,smagicinteract__Account__r.Enquiry_Status__c,
             smagicinteract__Account__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Lead__r.Account__c,smagicinteract__Lead__r.Probable_Account__c,
             smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Direction__c,smagicinteract__deliveryStatus__c, 
             smagicinteract__Lead__r.Account__r.OwnerId,smagicinteract__Lead__r.Probable_Account__r.OwnerId,smagicinteract__Lead__r.OwnerId,smagicinteract__Account__r.OwnerId,
             smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c,smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c
             from smagicinteract__smsMagic__c where smagicinteract__SenderId__c='61480090631' and smagicinteract__Direction__c='IN' and Read__c=false order by CreatedDate desc LIMIT 300];
     }
     else if(twilioProfile=='NSW CLO')
     {
         incomingSMSMagic = [select id,name,smagicinteract__PhoneNumber__c,smagicinteract__Lead__c,smagicinteract__Lead__r.Name,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,smagicinteract__Lead__r.Account__r.Enquiry_Status__c,smagicinteract__Account__r.Enquiry_Status__c,
             smagicinteract__Account__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Lead__r.Account__c,smagicinteract__Lead__r.Probable_Account__c,
             smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Direction__c,smagicinteract__deliveryStatus__c,
             smagicinteract__Lead__r.Account__r.OwnerId,smagicinteract__Lead__r.Probable_Account__r.OwnerId,smagicinteract__Lead__r.OwnerId,smagicinteract__Account__r.OwnerId,
             smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c,smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c
             from smagicinteract__smsMagic__c where smagicinteract__SenderId__c='61480090632' and smagicinteract__Direction__c='IN' and Read__c=false order by CreatedDate desc LIMIT 300];
     }
     else if(twilioProfile=='R4K LICENSING')
     {
         incomingSMSMagic = [select id,name,smagicinteract__PhoneNumber__c,smagicinteract__Lead__c,smagicinteract__Lead__r.Name,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,smagicinteract__Lead__r.Account__r.Enquiry_Status__c,smagicinteract__Account__r.Enquiry_Status__c,
             smagicinteract__Account__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Lead__r.Account__c,smagicinteract__Lead__r.Probable_Account__c,
             smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Direction__c,smagicinteract__deliveryStatus__c,
             smagicinteract__Lead__r.Account__r.OwnerId,smagicinteract__Lead__r.Probable_Account__r.OwnerId,smagicinteract__Lead__r.OwnerId,smagicinteract__Account__r.OwnerId,
             smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c,smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c
             from smagicinteract__smsMagic__c where smagicinteract__SenderId__c='61488884542' and smagicinteract__Direction__c='IN' and Read__c=false order by CreatedDate desc LIMIT 300];
     }
     else if(twilioProfile=='NZ CLO')
     {
         incomingSMSMagic = [select id,name,smagicinteract__PhoneNumber__c,smagicinteract__Lead__c,smagicinteract__Lead__r.Name,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,smagicinteract__Lead__r.Account__r.Enquiry_Status__c,
             smagicinteract__Account__r.Enquiry_Status__c,smagicinteract__Account__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Lead__r.Account__c,smagicinteract__Lead__r.Probable_Account__c,
             smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__c,smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__r.Name,smagicinteract__Direction__c,smagicinteract__deliveryStatus__c,
             smagicinteract__Lead__r.Account__r.OwnerId,smagicinteract__Lead__r.Probable_Account__r.OwnerId,smagicinteract__Lead__r.OwnerId,smagicinteract__Account__r.OwnerId,
             smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c,smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c
             from smagicinteract__smsMagic__c  where smagicinteract__SenderId__c='3201' and smagicinteract__Direction__c='IN' and Read__c=false order by CreatedDate desc LIMIT 300];
     }
    
    if(recentPhoneCalls.size()>0)
    {
        for(PhoneCall__c pc : recentPhoneCalls)
        {
            ConversationsWrapper cw = new ConversationsWrapper();
            cw.leadId = pc.Lead__c;
            cw.leadName = pc.Lead__r.Name;
            cw.empId = pc.Employee__c;
            cw.leadOwnerId = pc.Lead__r.OwnerId;
            cw.empName = pc.Employee__r.Name;
            cw.accountId = pc.Account__c;
            cw.accountName = pc.Account__r.Name;
            cw.accountOwnerId = pc.Account__r.OwnerId;
            cw.convertedAccountId = pc.Lead__r.Account__c;
            cw.convertedAccountOwnerId = pc.Lead__r.Account__r.OwnerId;
            cw.probableAccountId = pc.Lead__r.Probable_Account__c;
            cw.probableAccountOwnerId = pc.Lead__r.Probable_Account__r.OwnerId;
            cw.mobileNo = pc.Mobile__c;
            cw.callType = pc.Call_Type__c;
            cw.smsText = pc.SMS_Message__c;
            cw.createdDate = pc.CreatedDate + offSet;
            cw.repResponsibleId = (pc.Lead__c <> null && pc.Lead__r.Account__c <> null && pc.Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c : (pc.Account__c <> null && pc.Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.Account__r.Rep_Responsible_For_Converting_Lead__c : null));
            cw.repResponsibleName = (pc.Lead__c <> null && pc.Lead__r.Account__c <> null && pc.Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name : (pc.Account__c <> null && pc.Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.Account__r.Rep_Responsible_For_Converting_Lead__r.Name : 'Not Assigned'));
            cw.enquiryStatus = (pc.Lead__c <> null && pc.Lead__r.Account__c <> null && pc.Lead__r.Account__r.Enquiry_Status__c <> null ? pc.Lead__r.Account__r.Enquiry_Status__c : pc.Account__c <> null && pc.Account__r.Enquiry_Status__c <> null ? pc.Account__r.Enquiry_Status__c : pc.Lead__c <> null && pc.Lead__r.Account__r.Enquiry_Status__c <> null ? pc.Lead__r.Account__r.Enquiry_Status__c : ''); 
            cw.recordName = pc.Name;
            cw.recordId = pc.Id;
            cw.phoneCall = pc;
            cw.isTagged = (cw.leadId!=null && cw.leadId!='') || (cw.accountId!=null && cw.accountId!='') ? true : false;
            if(pc.Lead__c!=null)
            {
                cw.region = pc.Lead__r.Probable_Territory__c!=null && (pc.Lead__r.Probable_Territory__r.State_Master_State__c=='QLD' || pc.Lead__r.Probable_Territory__r.State_Master_State__c=='WA') ? 'QLD' : pc.Lead__r.Probable_Territory__c!=null && pc.Lead__r.Probable_Territory__r.State_Master_State__c=='NSW' ? 'NSW' : pc.Lead__r.Probable_Territory__c!=null && pc.Lead__r.Probable_Territory__r.State_Master_State__c=='NZ' ? 'NZ' : 'VIC';
            }
            else if(pc.Account__c!=null)
            {
                cw.region = pc.Account__r.Probable_Territory__c!=null && (pc.Account__r.Probable_Territory__r.State_Master_State__c=='QLD' || pc.Account__r.Probable_Territory__r.State_Master_State__c=='WA') ? 'QLD' : pc.Account__r.Probable_Territory__c!=null && pc.Account__r.Probable_Territory__r.State_Master_State__c=='NSW' ? 'NSW' : pc.Account__r.Probable_Territory__c!=null && pc.Account__r.Probable_Territory__r.State_Master_State__c=='NZ' ? 'NZ' : 'VIC';
            }
            else
                cw.region = 'VIC';
            conversationWrapperList.add(cw);
            
            if(conversationWrapperList.size() == 100)
            {
                break;
            }
        }
    }
    
    if(incomingSMSMagic.size()>0)
    {
        for(smagicinteract__smsMagic__c pc : incomingSMSMagic)
        {
            ConversationsWrapper cw = new ConversationsWrapper();
            cw.leadId = pc.smagicinteract__Lead__c;
            cw.leadName = pc.smagicinteract__Lead__r.Name;
            cw.leadOwnerId = pc.smagicinteract__Lead__r.OwnerId;
            cw.accountId = pc.smagicinteract__Account__c;
            cw.accountName = pc.smagicinteract__Account__r.Name;
            cw.accountOwnerId = pc.smagicinteract__Account__r.OwnerId;
            cw.convertedAccountId = pc.smagicinteract__Lead__r.Account__c;
            cw.convertedAccountOwnerId = pc.smagicinteract__Lead__r.Account__r.OwnerId;
            cw.probableAccountId = pc.smagicinteract__Lead__r.Probable_Account__c;
            cw.probableAccountOwnerId = pc.smagicinteract__Lead__r.Probable_Account__r.OwnerId;
            cw.mobileNo = pc.smagicinteract__PhoneNumber__c;
            cw.callType = 'Incoming SMS';
            cw.smsText = pc.smagicinteract__SMSText__c;
            cw.createdDate = pc.CreatedDate + offSet;
            cw.repResponsibleId = (pc.smagicinteract__Lead__c <> null && pc.smagicinteract__Lead__r.Account__c <> null && pc.smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c : (pc.smagicinteract__Account__c <> null && pc.smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__c : null));
            cw.repResponsibleName = (pc.smagicinteract__Lead__c <> null && pc.smagicinteract__Lead__r.Account__c <> null && pc.smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.smagicinteract__Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name : (pc.smagicinteract__Account__c <> null && pc.smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__c <> null ? pc.smagicinteract__Account__r.Rep_Responsible_For_Converting_Lead__r.Name : 'Not Assigned'));           
            cw.enquiryStatus = (pc.smagicinteract__Lead__c <> null && pc.smagicinteract__Lead__r.Account__c <> null && pc.smagicinteract__Lead__r.Account__r.Enquiry_Status__c <> null ? pc.smagicinteract__Lead__r.Account__r.Enquiry_Status__c : pc.smagicinteract__Account__c <> null && pc.smagicinteract__Account__r.Enquiry_Status__c <> null ? pc.smagicinteract__Account__r.Enquiry_Status__c : pc.smagicinteract__Lead__c <> null && pc.smagicinteract__Lead__r.Account__r.Enquiry_Status__c <> null ? pc.smagicinteract__Lead__r.Account__r.Enquiry_Status__c : '');           
            cw.recordId = pc.Id;
            cw.recordName = pc.Name;
            cw.smsMagic = pc;
            cw.isTagged = (cw.leadId!=null && cw.leadId!='') || (cw.accountId!=null && cw.accountId!='') ? true : false;
            if(pc.smagicinteract__Lead__c!=null)
            {
                cw.region = pc.smagicinteract__Lead__r.Probable_Territory__c!=null && (pc.smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c=='QLD' || pc.smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c=='WA') ? 'QLD' : pc.smagicinteract__Lead__r.Probable_Territory__c!=null && pc.smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c=='NSW' ? 'NSW' : pc.smagicinteract__Lead__r.Probable_Territory__c!=null && pc.smagicinteract__Lead__r.Probable_Territory__r.State_Master_State__c=='NZ' ? 'NZ' : 'VIC';
            }
            else if(pc.smagicinteract__Account__c!=null)
            {
                cw.region = pc.smagicinteract__Account__r.Probable_Territory__c!=null && (pc.smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c=='QLD' || pc.smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c=='WA') ? 'QLD' : pc.smagicinteract__Account__r.Probable_Territory__c!=null && pc.smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c=='NSW' ? 'NSW' : pc.smagicinteract__Account__r.Probable_Territory__c!=null && pc.smagicinteract__Account__r.Probable_Territory__r.State_Master_State__c=='NZ' ? 'NZ' : 'VIC';
            }
            else
                cw.region = 'VIC';
            conversationWrapperList.add(cw);
            
            if(conversationWrapperList.size() == 100)
            {
                break;
            }
        }
        conversationWrapperList.sort();
    }
    system.debug('conversationWrapperList: '+conversationWrapperList.size());
    ogconversationWrapperList.addAll(conversationWrapperList);
}

public void filterConversations()
{
    String filterCriteria = ApexPages.CurrentPage().getParameters().get('filterCriteria');
    List<ConversationsWrapper> filteredConversations = new List<ConversationsWrapper>();
    system.debug('oglist: '+ogconversationWrapperList.size()+' filterCriteria: '+filterCriteria);
    if(filterCriteria=='Stop')
        hideCheckBox = false;
    else
        hideCheckBox = true;
    if(ogconversationWrapperList.size()>0)
    {
        for(ConversationsWrapper cw : ogconversationWrapperList)
        {
            if(((filterCriteria=='Not Assigned' || filterCriteria=='Hybrid Application') && cw.isTagged && (cw.enquiryStatus=='Enquiry' || cw.enquiryStatus=='Applicant' || cw.enquiryStatus=='') && cw.repResponsibleName==filterCriteria) 
                || (filterCriteria=='Stop' && cw.smsText!=null && (cw.smsText.containsIgnoreCase('stop') || cw.smsText.containsIgnoreCase('withdraw')) && cw.isTagged && (cw.enquiryStatus=='Enquiry' || cw.enquiryStatus=='Applicant' || cw.enquiryStatus==''))
                || (filterCriteria=='Untagged' && !cw.isTagged) )
            {
                filteredConversations.add(cw);
            }
        }
        system.debug('filteredConversations: '+filteredConversations.size());
        if(filteredConversations.size()>0)
        {
            conversationWrapperList = new List<ConversationsWrapper>();
            conversationWrapperList.addAll(filteredConversations);
            conversationWrapperList.sort();
        }else{
            conversationWrapperList = new List<ConversationsWrapper>();
        }
    }
}

public void convertToDNP()
{
    try
    {
    //Convert to DNP
    if(conversationWrapperList.size()>0 && currentEmpId!=null && currentEmpId!='')
    {
        String currentDateStr = Datetime.now().format('dd-MM-yyyy');
        RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Enquiry' limit 1];
        for(ConversationsWrapper cw : conversationWrapperList)
        {
            if(cw.isSelected && (cw.leadId!=null || cw.accountId!=null))
            {
            String leadConvertedAccountId=cw.leadId!=null && cw.convertedAccountId!=null? cw.convertedAccountId : null;
            NewEnquirySectionController nes = new NewEnquirySectionController();
            if(leadConvertedAccountId!=null)
            {
                Account acctToUp = new Account();
                acctToUp.Id = leadConvertedAccountId;
                acctToUp.OwnerId = cw.convertedAccountOwnerId;
                acctToUp.Rep_Responsible_For_Converting_Lead__c = currentEmpId;
                acctToUp.Enquiry_Date__c = Date.today();
                acctToUp.Enquiry_Datetime__c = Datetime.now();
                acctToUp.Enquiry_Status__c = 'DNP - Did Not Proceed';
                acctToUp.Reason_why_application_did_not_go_ahead__c = 'Not able to contact the applicant by '+twilioProfile+' - '+currentPerson+' on '+currentDateStr;
                update acctToUp; 
            }
            else 
            {
                //Create a new applicant and convert the lead
                CollectionBotController cbc = new CollectionBotController();
                cbc.twilioPersonName=currentPerson;
                //String hybridEmployeeId = !mapHybridEmployee.isEmpty() ? mapHybridEmployee.get(ld.Territory_Number__r.State_Master_State__c) : null;
                String probableAccountId = cw.probableAccountId!=null && cw.probableAccountId!='' ? cw.probableAccountId : cw.accountId;
                String probableAccountOwnerId = cw.probableAccountId!=null && cw.probableAccountId!='' ? cw.probableAccountOwnerId : cw.accountOwnerId;
                Boolean toConvertProbableAcount = cw.probableAccountId!=null && cw.probableAccountId!='' ? true: false;
                Account createdAcct = new Account();
                if(probableAccountId!=null)
                {
                    createdAcct.Id = probableAccountId;
                    createdAcct.OwnerId = probableAccountOwnerId;
                    createdAcct.Enquiry_Date__c = Date.today();
                    createdAcct.Enquiry_Datetime__c = Datetime.now();
                    createdAcct.Enquiry_Status__c = 'DNP - Did Not Proceed';
                    createdAcct.Reason_why_application_did_not_go_ahead__c = 'Not able to contact the applicant by '+twilioProfile+' - '+currentPerson+' on '+currentDateStr;
                    createdAcct.Rep_Responsible_For_Converting_Lead__c = currentEmpId;
                    update createdAcct;
                    system.debug('##Converting Lead to probable applicant');
                    if(toConvertProbableAcount)
                        nes.doConvertFunc(cw.leadId,createdAcct);
                }else if(cw.leadId!=null){
                    Lead ldObj = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                    Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                    OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                    Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                    Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c
                    from Lead where id=:cw.leadId];
                    
                    if(ldObj!=null)
                    {
                    List<Credit_Guideline__c> creditGuidelines = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: ldObj.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
                    String creditGuidelinesId='';
                    if(creditGuidelines.size()>0)
                        creditGuidelinesId = creditGuidelines[0].Id;
                    createdAcct = cbc.createApplicant(ldObj, currentEmpId, 'DNP - Did Not Proceed',personAccountRecordType.Id,creditGuidelinesId);
                    system.debug('##Converting Lead to new applicant');
                    nes.doConvertFunc(cw.leadId,createdAcct);
                    }
                }else
                    system.debug('##No Lead or Account to convert: LeadId: '+cw.leadId+' - AcctId: '+cw.accountId);
                
                ///////////////////////////////////////////
            }
            }
    }
    getConversationHistory();
    ApexPages.currentPage().getParameters().put('filterCriteria','Stop');
    filterConversations();
    
    }
    ////////////////////////////////////////////////////////
    }
    catch(Exception ex){
        system.debug('Exception: '+ex+ ' ##'+ex.getLineNumber());
        ErrorLog.addErrorLog('PhoneCallTrackerController','convertToDNP',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public class ConversationsWrapper implements Comparable
{
    public Boolean isSelected {get;set;}
    public String leadId {get;set;}
    public String leadName {get;set;}
    public String leadOwnerId {get;set;}
    public String empId {get;set;}
    public String empName {get;set;}
    public String accountId {get;set;}
    public String accountName {get;set;}
    public String accountOwnerId {get;set;}
    public String convertedAccountId {get;set;}
    public String convertedAccountOwnerId {get;set;}
    public String probableAccountId {get;set;}
    public String probableAccountOwnerId {get;set;}
    public String mobileNo {get;set;}
    public String callType {get;set;}
    public String smsText {get;set;}
    public Datetime createdDate {get;set;}
    public String repResponsibleId {get;set;}
    public String repResponsibleName {get;set;}
    public String recordId{get;set;}
    public String recordName{get;set;}
    public String enquiryStatus{get;set;}
    public PhoneCall__c phoneCall{get;set;}
    public smagicinteract__smsMagic__c smsMagic{get;set;}
    public Boolean isTagged{get;set;}
    public String region{get;set;}
    
    public Integer compareTo(Object instance)
    {
        ConversationsWrapper that = (ConversationsWrapper)instance;
        if (this.createdDate < that.createdDate) return 1;
        if (this.createdDate > that.createdDate) return -1;
        return 0;
    }
}

}