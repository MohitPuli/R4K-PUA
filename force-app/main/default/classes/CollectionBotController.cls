public without sharing class CollectionBotController
{
public List<CollectionWrapper> colWrapLst {get;set;}
public List<AccountWrapper> acctWrapLst {get;set;}
public List<LeadWrapper> leadWrapLst {get;set;}
public List<RefereeWrapper> refWrapLst {get;set;}
public List<LeadSearchWrapper> leadSearchWrapLst {get;set;}
public Integer unassignedCount {get;set;}
public String twilioProfile {get;set;}
public String botStartTime {get;set;}
public String botFinishTime {get;set;}
public Integer paUnlockCount {get;set;}
public Integer wipParkDuration {get;set;}
public Boolean showProductSourcingRecords {get;set;}
public List<Territory__c> terLstForBotUsers {get;set;}
private final String darrandaCollectionForCustomersFlowId = 'FW02cdd51432d3130f0b79cb9781c9ac12';
private final String r4kCollectionForCustomersFlowId = 'FW7fecdfc7e581d68c16a5b9ccc6b68d01';
private final String darrandaCollectionForRefereesFlowId = 'FWe152327307896b4615a53d21e0396f63';
private final String darrandaCLOForExistingCustomersFlowId = 'FW4b5ee2183ff86c04fac72a08d797f8d3';
private final String darrandaCLOForDormantCustomersFlowId = 'FW67ce19b8e1a0b9d26e6b63df10092f89';
private final String fromDarrandaCollectionNumber = '+61488819334';
private final String fromDarrandaCLONumber = '+61390687890';
private final String fromNSWCLONumber = '+61488841355';
private final String fromDarrandaMarketingNumber = '+61390687890';
public Double offset{get{
    TimeZone tz = UserInfo.getTimeZone();
    //Milliseconds to Day
    return tz.getOffset(DateTime.now()) / (1000 * 3600 * 24.0);
}}

//String onlineURL = 'https://r4kfullsb-rent4keeps.cs31.force.com/MOGO'; //sandbox
public String onlineURL {get;set;} //production

//public final String onlineRefereeURL = 'https://r4kfullsb-rent4keeps.cs31.force.com/RefereeEDM'; //sandbox
public String onlineRefereeURL {get;set;} //production

public String callStatusType{get;set;}
public String marketingOption{get;set;}

public Integer counter {get;set;}
public Boolean isValidTimeToCall {get;set;}

public String twilioPersonName {get;set;}
public String currentEmpId {get;set;}
public String testUser {get;set;}
public String region {get;set;}
public String type {get;set;}
public List<Employee__c> employees {get;set;}
public List<SelectOption> employeeOptions {get; set;}
public String selectedRep {get;set;}

public List<PhoneCallTrackerController.ConversationsWrapper> conversationWrapperList{get;set;}

public String collectionOfficer {get;set;}
public String collectionType {get;set;}
public SelectOption[] collectionOfficers { 
    public get;
    private set;
}

public CollectionBotController()
{
    counter =0;
    onlineURL = SiteEndpoint__c.getValues('Online').URL__c;
    onlineRefereeURL = SiteEndpoint__c.getValues('RefereeEDM').URL__c;
}


public void getCollectionOfficers()
{
   String type = ApexPages.CurrentPage().getParameters().get('type');
   List<AggregateResult> colOfficerList;
   if(type=='cc')
       colOfficerList = [SELECT Collection_Officer__c colOfficer, COUNT(Id) officerCount 
           FROM Collection_Activity__c WHERE Collection_Outcome1__c in ('In Progress') and (Ignore_Date__c=null or Ignore_Date__c<>TODAY) 
           and (Expected_Collection_Date__c <= TODAY or Expected_Collection_Date__c = null) AND Applicant__r.PersonMobilePhone <> null AND ((Applicant__r.Active_Agreements__c > 0 and Collection_Officer__c<>'AEE') OR (Collection_Officer__c='AEE'))
           AND Applicant__r.Enquiry_Status__c <> 'Deceased' AND Applicant__r.Enquiry_Status__c <> 'Incarcerated' AND Applicant__r.Is_IDR__c = false and Collection_Officer__c!=null and Agreement__c<>null
           GROUP BY Collection_Officer__c ORDER BY COUNT(Collection_Officer__c) DESC];
   else
       colOfficerList = [SELECT Collection_Officer__c colOfficer, COUNT(Id) officerCount 
           FROM Collection_Activity__c WHERE Collection_Outcome1__c in ('In Progress') and (Ignore_Date__c=null or Ignore_Date__c<>TODAY) 
           and (Expected_Collection_Date__c <= TODAY or Expected_Collection_Date__c = null) AND Applicant__r.PersonMobilePhone <> null AND ((Applicant__r.Active_Agreements__c > 0 and Collection_Officer__c<>'AEE') OR (Collection_Officer__c='AEE'))
           AND Applicant__r.Enquiry_Status__c <> 'Deceased' AND Applicant__r.Enquiry_Status__c <> 'Incarcerated' AND Applicant__r.Is_IDR__c = false and Collection_Officer__c!=null and Agreement__c=null
           GROUP BY Collection_Officer__c ORDER BY COUNT(Collection_Officer__c) DESC];
    
    this.collectionOfficers = new SelectOption[]{};
    system.debug('colOfficerList: '+colOfficerList);
    this.collectionOfficers.add(new SelectOption('','--Select--'));
    if(colOfficerList.size()>0)
    {
        for(AggregateResult ag : colOfficerList)
        {
            this.collectionOfficers.add(new SelectOption(String.valueOf(ag.get('colOfficer')),String.valueOf(ag.get('colOfficer')) + ' - '+Integer.valueOf(ag.get('officerCount')) + ' records'));
        }
    }
}

public void clearAndGetOpenCollections()
{
    String officer = ApexPages.CurrentPage().getParameters().get('of');
    String type = ApexPages.CurrentPage().getParameters().get('type');
    system.debug('officer: '+officer);

    getOpenCollections();
    
    if(colWrapLst.size()>0)
    {
        List<Collection_Activity__c> colActs = new List<Collection_Activity__c>();
        for(CollectionWrapper cw : colWrapLst)
        {
            if(cw.colAct.Bot_Call_Datetime__c!=null || Test.isRunningTest())
            {
                Date botDate = date.newinstance(cw.colAct.Bot_Call_Datetime__c.year(), cw.colAct.Bot_Call_Datetime__c.month(), cw.colAct.Bot_Call_Datetime__c.day());
                if(botDate!=Date.today())
                {
                    Collection_Activity__c col = new Collection_Activity__c();
                    col.Id = cw.colAct.Id;
                    col.Bot_Call_status__c = null;
                    colActs.add(col);
                }
            }
        }
        
        if(colActs.size()>0)
            update colActs;
    }
    getCollectionOfficers();
}

public void clearAndGetOpenMarketingEnquiries()
{
    getOpenMarketingEnquiries();
    
    if(acctWrapLst.size()>0)
    {
        List<Account> accts = new List<Account>();
        for(AccountWrapper aw : acctWrapLst)
        {
            if(aw.acct.Bot_Call_Datetime__c!=null || Test.isRunningTest())
            {
                Date botDate = date.newinstance(aw.acct.Bot_Call_Datetime__c.year(), aw.acct.Bot_Call_Datetime__c.month(), aw.acct.Bot_Call_Datetime__c.day());
                if(botDate!=Date.today())
                {
                    Account at = new Account();
                    at.Id = aw.acct.Id;
                    at.Bot_Call_status__c = null;
                    //at.Customer_Speech_Message__c = null;
                    accts.add(at);
                }
            }
        }
        
        if(accts.size()>0)
            update accts;
    }
}

public void getEmployeesToAssign()
{
    String state = ApexPages.CurrentPage().getParameters().get('state');
    String employeeSOQL = 'Select id,name from Employee__c where Territory__r.Is_Credit_Contract__c=true and Territory__r.Company_Territory__c=true and name<>\'Hybrid Application\' and Territory__r.Status__c=\'Active\' and Status__c=\'Active\'';
    employeeSOQL = employeeSOQL + (state=='NSW' ? ' and Territory__r.State_Master_State__c=\'NSW\'' : state=='QLD' ? ' and (Territory__r.State_Master_State__c=\'QLD\' or Territory__r.State_Master_State__c=\'WA\')' : ' and (Territory__r.State_Master_State__c=\'VIC\' or Territory__r.State_Master_State__c=\'SA\')');
    employees= Database.query(employeeSOQL);
    
    employeeOptions = new List<SelectOption>();
    employeeOptions.add(new SelectOption('','--Select--'));
    if(employees.size()>0)
    {
    for(Employee__c emp : employees) {
        employeeOptions.add(new SelectOption(emp.Id, emp.Name));
    }
    }
}

public void assignRepResponsible()
{
    List<Account> acctsToUp = new List<Account>();
    try
    {
        if(acctWrapLst.size()>0)
        {
            String randomNumber=SecretUtil.generateRandomNumber();
            for(AccountWrapper cw : acctWrapLst)
            {
                if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
                {
                        Account acctToUp = new Account();
                        acctToUp.Id = cw.acct.Id;
                        acctToUp.Rep_Responsible_For_Converting_Lead__c = selectedRep;
                        acctsToUp.add(acctToUp);
                }
            }
            if(acctsToUp.size()>0)
                update acctsToUp;
            getWIPUnassignedLeads();
                
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','assignRepResponsible',twilioProfile,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void getCountOfEachType(){
    List<AggregateResult> aggResult = new List<AggregateResult>();
    aprCount = 0;
    incSMSCount = 0;
    misCallCount = 0;
    nonStartCount = 0;
    aippiCount = 0;
    aipbsCount = 0;
    aippaCount = 0;

    System.debug('##region ' + region);

    String aprCountQuery = 'select count(id) from Account where PUA_Status__c in (\'Approved\') and Rep_Responsible_For_Converting_Lead__r.Name = \'Hybrid Application\' and Enquiry_Date__c = LAST_N_DAYS:60 and State_Master_State__c in ' + 
                            (region == 'NSW' ? '(\'NSW\')' : region == 'QLD' ? '(\'QLD\', \'WA\')' : '(\'VIC\', \'SA\')') +  
                            'and Company_Territory__c=true';
    aggResult = Database.query(aprCountQuery);
    aprCount = (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    aggResult = [select count(id) from smagicinteract__smsMagic__c where smagicinteract__SenderId__c='61488884542' and smagicinteract__Direction__c='IN' and Read__c=false];
    incSMSCount = (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    PhoneCallTrackerController pct = new PhoneCallTrackerController();
    pct.getConversationHistory();
    
    system.debug('oglist: '+pct.ogconversationWrapperList.size()+' region: '+region);

    if(pct.ogconversationWrapperList.size()>0)
    {
        for(PhoneCallTrackerController.ConversationsWrapper cw : pct.ogconversationWrapperList)
        {
            if(cw.region==region && cw.callType=='Incoming SMS'){
                incSMSCount++;
            }
        }
    }

    String leadType = 'nonst';
    String ldlstSOQL = 'select count(Id)';
                  ldlstSOQL+=  ' from Lead where ';
                  ldlstSOQL+=  'Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and ';
                  ldlstSOQL+=  region =='NSW' ? 'Probable_Territory__r.State_Master_State__c in (\'NSW\'))' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\'))' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\'))';
                  ldlstSOQL+=  ' or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and ';
                  ldlstSOQL+= region =='NSW' ? ' Probable_Territory__r.State_Master_State__c in (\'NSW\')' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\')' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\')';
                  ldlstSOQL+=' and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))';
                  ldlstSOQL+=  leadType =='nonst' ? ' and Hybrid_link_Status__c in (\'5. Not Opened\')' : leadType=='aipbs' ? ' and Hybrid_link_Status__c in (\'2.3 Pending Bank St\')' : leadType=='aipid' ? ' and Hybrid_link_Status__c in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\')' : leadType=='aippa' ? ' and Hybrid_link_Status__c not in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\',\'2.3 Pending Bank St\',\'5. Not Opened\')' : '';
    aggResult = Database.query(ldlstSOQL);
    nonStartCount = (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    leadType = 'aipid';
    ldlstSOQL = 'select count(Id)';
                  ldlstSOQL+=  ' from Lead where ';
                  ldlstSOQL+=  'Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and ';
                  ldlstSOQL+=  region =='NSW' ? 'Probable_Territory__r.State_Master_State__c in (\'NSW\'))' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\'))' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\'))';
                  ldlstSOQL+=  ' or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and ';
                  ldlstSOQL+= region =='NSW' ? ' Probable_Territory__r.State_Master_State__c in (\'NSW\')' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\')' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\')';
                  ldlstSOQL+=' and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))';
                  ldlstSOQL+=  leadType =='nonst' ? ' and Hybrid_link_Status__c in (\'5. Not Opened\')' : leadType=='aipbs' ? ' and Hybrid_link_Status__c in (\'2.3 Pending Bank St\')' : leadType=='aipid' ? ' and Hybrid_link_Status__c in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\')' : leadType=='aippa' ? ' and Hybrid_link_Status__c not in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\',\'2.3 Pending Bank St\',\'5. Not Opened\')' : '';
    aggResult = Database.query(ldlstSOQL);
    aippiCount = (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    leadType = 'aipbs';
    ldlstSOQL = 'select count(Id)';
                  ldlstSOQL+=  ' from Lead where ';
                  ldlstSOQL+=  'Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and ';
                  ldlstSOQL+=  region =='NSW' ? 'Probable_Territory__r.State_Master_State__c in (\'NSW\'))' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\'))' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\'))';
                  ldlstSOQL+=  ' or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and ';
                  ldlstSOQL+= region =='NSW' ? ' Probable_Territory__r.State_Master_State__c in (\'NSW\')' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\')' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\')';
                  ldlstSOQL+=' and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))';
                  ldlstSOQL+=  leadType =='nonst' ? ' and Hybrid_link_Status__c in (\'5. Not Opened\')' : leadType=='aipbs' ? ' and Hybrid_link_Status__c in (\'2.3 Pending Bank St\')' : leadType=='aipid' ? ' and Hybrid_link_Status__c in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\')' : leadType=='aippa' ? ' and Hybrid_link_Status__c not in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\',\'2.3 Pending Bank St\',\'5. Not Opened\')' : '';
    aggResult = Database.query(ldlstSOQL);
    aipbsCount = (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    leadType = 'aippa';
    ldlstSOQL = 'select count(Id)';
                  ldlstSOQL+=  ' from Lead where ';
                  ldlstSOQL+=  'Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and ';
                  ldlstSOQL+=  region =='NSW' ? 'Probable_Territory__r.State_Master_State__c in (\'NSW\'))' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\'))' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\'))';
                  ldlstSOQL+=  ' or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and ';
                  ldlstSOQL+= region =='NSW' ? ' Probable_Territory__r.State_Master_State__c in (\'NSW\')' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\')' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\')';
                  ldlstSOQL+=' and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))';
                  ldlstSOQL+=  leadType =='nonst' ? ' and Hybrid_link_Status__c in (\'5. Not Opened\')' : leadType=='aipbs' ? ' and Hybrid_link_Status__c in (\'2.3 Pending Bank St\')' : leadType=='aipid' ? ' and Hybrid_link_Status__c in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\')' : leadType=='aippa' ? ' and Hybrid_link_Status__c not in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\',\'2.3 Pending Bank St\',\'5. Not Opened\')' : '';
    aggResult = Database.query(ldlstSOQL);
    aippaCount = (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    Set<String> ldIds = new Set<String>();
    Set<String> acctIds = new Set<String>();
    leadType = null;
    ldlstSOQL = 'select Id, Account__c';
                  ldlstSOQL+=  ' from Lead where ';
                  ldlstSOQL+=  'Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and ';
                  ldlstSOQL+=  region =='NSW' ? 'Probable_Territory__r.State_Master_State__c in (\'NSW\'))' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\'))' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\'))';
                  ldlstSOQL+=  ' or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and ';
                  ldlstSOQL+= region =='NSW' ? ' Probable_Territory__r.State_Master_State__c in (\'NSW\')' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\')' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\')';
                  ldlstSOQL+=' and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))';
                  ldlstSOQL+=  leadType =='nonst' ? ' and Hybrid_link_Status__c in (\'5. Not Opened\')' : leadType=='aipbs' ? ' and Hybrid_link_Status__c in (\'2.3 Pending Bank St\')' : leadType=='aipid' ? ' and Hybrid_link_Status__c in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\')' : leadType=='aippa' ? ' and Hybrid_link_Status__c not in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\',\'2.3 Pending Bank St\',\'5. Not Opened\')' : '';
    List<Lead> ldLst = Database.query(ldlstSOQL);
    String currentPerson = ApexPages.CurrentPage().getParameters().get('tp');
    if(ldLst.size()>0)
    {
        for(Lead ld : ldLst)
        {
            ldIds.add(ld.Id);
            if(ld.Account__c != null){
                acctIds.add(ld.Account__c);
            }
        }
    }

    aggResult = [select count(id) from PhoneCall__c
                    where type__c=:twilioProfile and ((Call_Type__c='Missed' and PersonName__c=:currentPerson) or (Call_Type__c='Missed' and PersonName__c=null)) and 
                    Read__c=false and CreatedDate=Last_N_Days:6 AND
                    (Lead__c in :ldIds OR Account__c in :acctIds) ];
    misCallCount = (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    aggResult = [SELECT count(Id)
                    FROM smagicinteract__smsMagic__c 
                    WHERE (smagicinteract__Lead__c in :ldIds OR smagicinteract__Account__c in :acctIds) AND 
                    PB_SMS_Text__c = 'CALL NOW' AND Read__c = false and CreatedDate=Last_N_Days:6];
    misCallCount += (aggResult.size() > 0 ? (Integer)aggResult[0].get('expr0') : 0);

    System.debug('##aprCount ' + aprCount);
    System.debug('##incSMSCount ' + incSMSCount);
    System.debug('##misCallCount ' + misCallCount);
    System.debug('##nonStartCount ' + nonStartCount);
    System.debug('##aippiCount ' + aippiCount);
    System.debug('##aipbsCount ' + aipbsCount);
    System.debug('##aippaCount ' + aippaCount);
}

public void getWIPUnassignedLeads()
{
    twilioPersonName = ApexPages.CurrentPage().getParameters().get('tp');
    testUser = ApexPages.CurrentPage().getParameters().get('tUser');
    region = ApexPages.CurrentPage().getParameters().get('region');
    type = ApexPages.CurrentPage().getParameters().get('type');
    currentEmpId = ApexPages.CurrentPage().getParameters().get('eid');

    TwilioCallerRESTService tcs = new TwilioCallerRESTService();
    tcs.getUserDetails();
    twilioProfile = tcs.twilioProfile;
    if(Test.isRunningTest() && ApexPages.currentPage().getParameters().get('profile') != null && ApexPages.currentPage().getParameters().get('profile') != ''){
        twilioProfile = ApexPages.currentPage().getParameters().get('profile');
    }
    
    system.debug('##twilioProfile: '+twilioProfile+' type: '+type+' twilioPersonName: '+twilioPersonName);

    if(twilioProfile.equalsIgnoreCase('R4K LICENSING')){
        getCountOfEachType();
    }

    if(type!=null && type=='apr' && twilioProfile=='R4K LICENSING')
        getPUAApprovedApplicants();
    else if(type!=null && (type=='call' || type=='sms') && twilioProfile=='R4K LICENSING')
        getFilteredConversations();
    else if(twilioPersonName=='Dean' || twilioPersonName=='Sharon' || twilioPersonName=='Sina' || twilioPersonName=='Gordon' || twilioProfile=='R4K LICENSING' || Test.IsRunningTest())
        getUnAssignedLeads();
    else
        getWIP();
}

public void getPUAApprovedApplicants()
{
    acctWrapLst = new List<AccountWrapper>();
    List<Account> wipacctList;
    if(region=='NSW')
    {
        wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where PUA_Status__c in ('Approved') and Rep_Responsible_For_Converting_Lead__r.Name = 'Hybrid Application' and Enquiry_Date__c = LAST_N_DAYS:60 and State_Master_State__c='NSW' and Company_Territory__c=true order by Enquiry_Date__c desc];
    }
    else if(region=='QLD')
    {
        wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where PUA_Status__c in ('Approved') and Rep_Responsible_For_Converting_Lead__r.Name = 'Hybrid Application' and Enquiry_Date__c = LAST_N_DAYS:60 and (State_Master_State__c='QLD' or State_Master_State__c='WA') and Company_Territory__c=true order by Enquiry_Date__c desc];
    }
    else
    {
        wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where PUA_Status__c in ('Approved') and Rep_Responsible_For_Converting_Lead__r.Name = 'Hybrid Application' and Enquiry_Date__c = LAST_N_DAYS:60 and (State_Master_State__c='VIC' or State_Master_State__c='SA') and Company_Territory__c=true order by Enquiry_Date__c desc];
    }
    
    if(wipacctList.size()>0)
     {
         for(Account at: wipacctList)
         {
             AccountWrapper acctWrap = new AccountWrapper();
             acctWrap.acct = at;
             acctWrapLst.add(acctWrap);
         }
     }
}

public void getWIP()
{
     currentEmpId = ApexPages.CurrentPage().getParameters().get('eid');
     twilioPersonName = ApexPages.CurrentPage().getParameters().get('tp');
     String showProductSourcingValue = ApexPages.CurrentPage().getParameters().get('showProductSourcingValue');
     showProductSourcingRecords = showProductSourcingValue!=null && showProductSourcingValue!='' && showProductSourcingValue=='true' ? true : showProductSourcingValue!=null && showProductSourcingValue!='' && showProductSourcingValue=='false' ? false : showProductSourcingRecords!=null ? showProductSourcingRecords : false;
     
     if(twilioProfile==null)
     {
         TwilioCallerRESTService tcs2 = new TwilioCallerRESTService();
         tcs2.getUserDetails();
         twilioProfile = tcs2.twilioProfile;
     }
     system.debug('twilioProfile: '+twilioProfile);
     Datetime currentTimeGMTVal = Datetime.now();
     Set<String> wipAgmtIds = new Set<String>();
     Map<String,AccountWrapper> mapwipAccountWrap = new Map<String,AccountWrapper>();
     Map<String,String> mapwipLeadWrap = new Map<String,String>();
     acctWrapLst = new List<AccountWrapper>();
     wipParkDuration = wipParkDuration!=null ? wipParkDuration : 0;
     List<AggregateResult> allPCList = new List<AggregateResult>();
     List<AggregateResult> allSMSList = new List<AggregateResult>();
     system.debug('wipParkDuration: '+wipParkDuration);
     if(currentEmpId!=null && currentEmpId!='')  
     {
         List<Account> wipacctList = [select id, name, FirstName,PersonMobilePhone,SMS_Mobile__c,State_Master_State__c,Territory_Short_Name__c,AgreementId_for_Current_Enquiry__c,Enquiry_Date__c,Enquiry_DateTime__c ,Next_Followup_Datetime__c,OwnerId,No_Of_Active_Agreements__c,Enquiry_Status__c,Rent4Keeps_Account__c,
                                 Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Consent_URLSent_DateTime__c,Consent_URL_Opened_DateTime__c,Centrelink_Benefit__c,Product_Description__c,Product_Interested_In__c,Customer_Photo_Id__c,
                                 FamilyReferees_Added_For_Current_Enquiry__c,FamilyReferees_Contacted_Current_Enquiry__c,Referees_Added_For_Current_Enquiry__c,Referees_Contacted_for_Current_Enquiry__c,Referee_Summary__c,Hybrid_Link_Status__c,Last_Referee_Date__c,Next_CAM_Step__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c
                                 from Account where Enquiry_Status__c in ('Enquiry','Applicant') and Rep_Responsible_For_Converting_Lead__c=:currentEmpId and Enquiry_Date__c = LAST_N_DAYS:60 and (Next_Followup_Datetime__c=null or Next_Followup_Datetime__c<=: currentTimeGMTVal) order by Enquiry_Date__c desc];
         
         if(wipacctList.size()>0)
         {
             for(Account at: wipacctList)
             {
                 if(at.AgreementId_for_Current_Enquiry__c!=null && at.AgreementId_for_Current_Enquiry__c!='')
                     wipAgmtIds.add(at.AgreementId_for_Current_Enquiry__c);
                     
                 AccountWrapper acctWrap = new AccountWrapper();
                 acctWrap.acct = at;
                 acctWrap.totRefCount = at.Referees_Added_For_Current_Enquiry__c!=null ? Integer.valueOf(at.Referees_Added_For_Current_Enquiry__c) : 0;
                 acctWrap.totRefFamCount = at.FamilyReferees_Added_For_Current_Enquiry__c!=null ? Integer.valueOf(at.FamilyReferees_Added_For_Current_Enquiry__c) : 0;
                 acctWrap.totRefContactedCount = at.Referees_Contacted_for_Current_Enquiry__c!=null ? Integer.valueOf(at.Referees_Contacted_for_Current_Enquiry__c) : 0;
                 acctWrap.totRefFamContactedCount = at.FamilyReferees_Contacted_Current_Enquiry__c!=null ? Integer.valueOf(at.FamilyReferees_Contacted_Current_Enquiry__c) : 0;
                 acctWrap.toRefExpected = at.No_Of_Active_Agreements__c==0 ? Integer.valueOf(at.Credit_Guideline__r.Easy_Total_No_of_Referees__c) : Integer.valueOf(at.Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c);
                 acctWrap.opp = null;
                 if(at.Enquiry_Datetime__c!=null)
                 {
                     Long dt3Long = at.Enquiry_Datetime__c.getTime();
                     Long leadContactMilliseconds2 = currentTimeGMTVal.getTime() - dt3Long;
                     Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                     Long leadContactMinutes2 = leadContactSeconds2 / 60;
                     Integer valInMinutes = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 1;
                     acctWrap.enquiryDatetimeInDayFormatted = convertMinutesToDays(valInMinutes);
                 }
                 mapwipAccountWrap.put(at.Id, acctWrap);
             }
             
             List<Opportunity> wipoppList = [select id, name,StageName,TaxInvoice_Signed_DateTime__c,Product_Sourcing_Datetime__c,Approval_DateTime__c,Approval_Status__c,Account.Id,Account.State_Master_State__c,Account.Territory_Short_Name__c,Is_Product_Sourced__c,TIApplicantSignatureId__c,TIApplicantInitialId__c,TaxInvoice_Short_Link__c,
                             Account.Name,Account.FirstName,Account.PersonMobilePhone,Account.SMS_Mobile__c,Account.Enquiry_Date__c,Account.OwnerId,Account.No_Of_Active_Agreements__c,Account.Hybrid_Link_Status__c,LastModifiedDate,Account.Credit_Guideline__r.Easy_Total_No_of_Referees__c,Account.Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c
                             from Opportunity where id in: wipAgmtIds and StageName in ('Goods Delivered') and (TaxInvoice_Signed_DateTime__c=null or (TaxInvoice_Signed_DateTime__c!=null and Is_Product_Sourced__c=false)) order by CreatedDate desc];
         
             if(wipoppList.size()>0)
             {
                 for(Opportunity op: wipoppList)
                 {
                     mapwipAccountWrap.get(op.AccountId).opp = op;
                     mapwipAccountWrap.get(op.AccountId).toRefExpected = (op.Account.No_Of_Active_Agreements__c==0 || op.Account.No_Of_Active_Agreements__c==1) ? Integer.valueOf(op.Account.Credit_Guideline__r.Easy_Total_No_of_Referees__c) : Integer.valueOf(op.Account.Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c);
                 }
             }
             
             List<Attachment> wipAtts = [select id,name, parentId,CreatedDate from Attachment where parentId=: wipacctList and (Name like 'Photo Id%' or Name like 'BankStatement%' or Name like 'myGov%') order by CreatedDate desc ];
             if(wipAtts.size()>0)
             {
                 for(Attachment att: wipAtts)
                 {
                     if(mapwipAccountWrap.containsKey(att.parentId) && mapwipAccountWrap.get(att.parentId).latestDocLinkAttachment==null)
                         mapwipAccountWrap.get(att.parentId).latestDocLinkAttachment = att;
                 }
             }
             
             List<Referee__c> wipReferees = [select id,name, Applicant__c,Referee_Added_Datetime__c,Contacted_Date_Time__c,Contacted_On_Date__c,LastModifiedDate from Referee__c where Applicant__c=: wipacctList and Applicant__r.Rep_Responsible_For_Converting_Lead__c=:currentEmpId and (Contacted_On_Date__c!=null or Referee_Added_Datetime__c!=null)  order by LastModifiedDate desc ];
             if(wipReferees.size()>0)
             {
                 for(Referee__c ref: wipReferees)
                 {
                     if(mapwipAccountWrap.containsKey(ref.Applicant__c) && mapwipAccountWrap.get(ref.Applicant__c).latestRefereeActivity==null)
                         mapwipAccountWrap.get(ref.Applicant__c).latestRefereeActivity = ref;
                 }
             }
             
             List<PhoneCall__c> pcList = [select id,name,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where type__c=:twilioProfile and Read__c=false and ((Call_Type__c='Missed' and PersonName__c=:twilioPersonName) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c ='Incoming SMS')) and Account__c =: wipacctList  and CreatedDate=Last_N_Days:2  order by CreatedDate desc];
             //system.debug('pcListForMissed: '+pcList);
             if(pcList.size()>0)
             {
                 for(PhoneCall__c pc : pcList)
                 {
                     if(pc.Account__c!=null && mapwipAccountWrap.containsKey(pc.Account__c) && mapwipAccountWrap.get(pc.Account__c).latestMissedPhoneCall==null)
                     {
                         mapwipAccountWrap.get(pc.Account__c).latestMissedPhoneCall = pc;
                         PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                         cw.accountId = pc.Account__c;
                         cw.callType = pc.Call_Type__c;
                         cw.smsText = pc.SMS_Message__c;
                         cw.createdDate = pc.Createddate + offset;
                         mapwipAccountWrap.get(pc.Account__c).latestCommunicationByCust = cw;
                         mapwipAccountWrap.get(pc.Account__c).isLatestCommunicationByCustHighlighted= false;
                         if(pc.Createddate!=null)
                         {
                             Long dt3Long = pc.CreatedDate.getTime();
                             Long milliseconds = currentTimeGMTVal.getTime() - dt3Long;
                             Long seconds = milliseconds / 1000;
                             Long minutes = seconds / 60;
                             mapwipAccountWrap.get(pc.Account__c).isLatestCommunicationByCustHighlighted = minutes <=10 ? true : false;
                         }
                     }
                 }
             }
             
             allPCList = [select Account__c,Call_Type__c,count(id) from PhoneCall__c where (Call_Type__c in ('Outgoing SMS','Outgoing','Incoming','Incoming SMS') or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c='Missed' and PersonName__c=:twilioPersonName)) and (Account__c =: wipacctList) and CreatedDate=Last_N_Days:10 group by Account__c,Call_Type__c];
             system.debug('allPCList: '+allPCList.size());
             allsmsList = [select smagicinteract__Account__c,smagicinteract__Direction__c,count(id) from smagicinteract__smsMagic__c where (smagicinteract__Account__c =: wipacctList) and CreatedDate=Last_N_Days:10 group by smagicinteract__Account__c,smagicinteract__Direction__c];
             
             //Incoming sms from smsMagic
             List<smagicinteract__smsMagic__c> incomingSMSMagic =  [select id,name,smagicinteract__PhoneNumber__c,smagicinteract__Lead__c,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,
                     smagicinteract__Direction__c,smagicinteract__deliveryStatus__c
                     from smagicinteract__smsMagic__c  where smagicinteract__Direction__c='IN' and smagicinteract__Account__c =: wipacctList and CreatedDate=Last_N_Days:2 order by CreatedDate desc];
             if(incomingSMSMagic.size()>0)
             {
                 for(smagicinteract__smsMagic__c pc : incomingSMSMagic)
                 {
                     if(pc.smagicinteract__Account__c!=null && mapwipAccountWrap.containsKey(pc.smagicinteract__Account__c) && (mapwipAccountWrap.get(pc.smagicinteract__Account__c).latestCommunicationByCust==null || (mapwipAccountWrap.get(pc.smagicinteract__Account__c).latestCommunicationByCust!=null && (pc.CreatedDate + offset) > mapwipAccountWrap.get(pc.smagicinteract__Account__c).latestCommunicationByCust.createdDate)))
                     {
                         PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                         cw.accountId = pc.smagicinteract__Account__c;
                         cw.callType = 'Incoming SMS';
                         cw.smsText = pc.smagicinteract__SMSText__c;
                         cw.createdDate = pc.Createddate + offset;
                         mapwipAccountWrap.get(pc.smagicinteract__Account__c).latestCommunicationByCust = cw;
                         if(pc.Createddate!=null)
                         {
                             Long dt3Long = pc.CreatedDate.getTime();
                             Long milliseconds = currentTimeGMTVal.getTime() - dt3Long;
                             Long seconds = milliseconds / 1000;
                             Long minutes = seconds / 60;
                             mapwipAccountWrap.get(pc.smagicinteract__Account__c).isLatestCommunicationByCustHighlighted = minutes <=10 ? true : false;
                         }
                     }
                 }
             }
             
             
             //R4K Latest Call or sms
             List<Lead> leadsForWIP = [select id,name,Account__c,CreatedDate from Lead where Account__c =: wipacctList and isconverted=true and CreatedDate=Last_N_Days:14 order by CreatedDate desc];
             if(leadsForWIP.size()>0)
             {
                 for(Lead ld : leadsForWIP)
                 {
                     mapwipLeadWrap.put(ld.Id,ld.Account__c);
                 }
             }
             
             List<PhoneCall__c> pcR4KList = [select id,name,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where Call_Type__c in ('Outgoing SMS','Outgoing') and (Account__c =: wipacctList or Lead__c =: leadsForWIP) and CreatedDate=Last_N_Days:3 order by CreatedDate desc];
             system.debug('pcR4KList: '+pcR4KList.size());
             if(pcR4KList.size()>0)
             {
                 for(PhoneCall__c pc : pcR4KList)
                 {
                     if(pc.Account__c!=null && mapwipAccountWrap.containsKey(pc.Account__c) && mapwipAccountWrap.get(pc.Account__c).latestPhoneCallFromR4K==null)
                         mapwipAccountWrap.get(pc.Account__c).latestPhoneCallFromR4K = pc;
                     else if(pc.Lead__c!=null && mapwipLeadWrap.get(pc.Lead__c)!=null && mapwipAccountWrap.containsKey(mapwipLeadWrap.get(pc.Lead__c)) && mapwipAccountWrap.get(mapwipLeadWrap.get(pc.Lead__c)).latestPhoneCallFromR4K==null)
                         mapwipAccountWrap.get(mapwipLeadWrap.get(pc.Lead__c)).latestPhoneCallFromR4K = pc;
                 }
             }
             
             List<smagicinteract__smsMagic__c> smsList = [select id,name,smagicinteract__Lead__c,smagicinteract__Account__c,smagicinteract__SMSText__c,CreatedDate from smagicinteract__smsMagic__c where (smagicinteract__Account__c =: wipacctList or smagicinteract__Lead__c =: leadsForWIP) and CreatedDate=Last_N_Days:14 order by CreatedDate desc];
             if(smsList.size()>0)
             {
                 for(smagicinteract__smsMagic__c sm : smsList)
                 {
                     if(sm.smagicinteract__Account__c!=null && mapwipAccountWrap.containsKey(sm.smagicinteract__Account__c) && mapwipAccountWrap.get(sm.smagicinteract__Account__c).latestSMSMagicFromR4K==null)
                         mapwipAccountWrap.get(sm.smagicinteract__Account__c).latestSMSMagicFromR4K = sm;
                     else if(sm.smagicinteract__Lead__c!=null && mapwipLeadWrap.get(sm.smagicinteract__Lead__c)!=null && mapwipAccountWrap.containsKey(mapwipLeadWrap.get(sm.smagicinteract__Lead__c)) && mapwipAccountWrap.get(mapwipLeadWrap.get(sm.smagicinteract__Lead__c)).latestSMSMagicFromR4K==null)
                         mapwipAccountWrap.get(mapwipLeadWrap.get(sm.smagicinteract__Lead__c)).latestSMSMagicFromR4K = sm;
                 }
             }
             
             if(mapwipAccountWrap.size()>0)
             {
                 Long dt2Long = currentTimeGMTVal.getTime();
                 for(AccountWrapper aw : mapwipAccountWrap.values())
                 {
                     CommunicationWrapper cw;
                     if(aw.latestPhoneCallFromR4K!=null && aw.latestSMSMagicFromR4K!=null)
                     {
                         if(aw.latestPhoneCallFromR4K.CreatedDate > aw.latestSMSMagicFromR4K.CreatedDate)
                         {
                             cw = new CommunicationWrapper();
                             cw.id = aw.latestPhoneCallFromR4K.id;
                             cw.type = aw.latestPhoneCallFromR4K.Call_Type__c;
                             cw.smsMessage = aw.latestPhoneCallFromR4K.SMS_Message__c;
                             cw.CreatedDate = aw.latestPhoneCallFromR4K.CreatedDate;
                         }else{
                             cw = new CommunicationWrapper();
                             cw.id = aw.latestSMSMagicFromR4K.id;
                             cw.type = 'Outgoing SMS';
                             cw.smsMessage = aw.latestSMSMagicFromR4K.smagicinteract__SMSText__c;
                             cw.CreatedDate = aw.latestSMSMagicFromR4K.CreatedDate;
                         }
                     }
                     else if(aw.latestPhoneCallFromR4K!=null){    
                         cw = new CommunicationWrapper();
                         cw.id = aw.latestPhoneCallFromR4K.id;
                         cw.type = aw.latestPhoneCallFromR4K.Call_Type__c;
                         cw.smsMessage = aw.latestPhoneCallFromR4K.SMS_Message__c;
                         cw.CreatedDate = aw.latestPhoneCallFromR4K.CreatedDate;
                     }
                     else if(aw.latestSMSMagicFromR4K!=null){    
                         cw = new CommunicationWrapper();
                         cw.id = aw.latestSMSMagicFromR4K.id;
                         cw.type = 'Outgoing SMS';
                         cw.smsMessage = aw.latestSMSMagicFromR4K.smagicinteract__SMSText__c;
                         cw.CreatedDate = aw.latestSMSMagicFromR4K.CreatedDate;
                     }
                     
                     if(cw!=null && cw.CreatedDate!=null)
                     {
                         system.debug('cw: '+cw);
                         Long dt3Long = cw.CreatedDate.getTime();
                         Long leadContactMilliseconds2 = dt2Long - dt3Long;
                         Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                         Long leadContactMinutes2 = leadContactSeconds2 / 60;
                         mapwipAccountWrap.get(aw.acct.Id).latestCommunicationFromR4KInMinutes = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 1;
                         mapwipAccountWrap.get(aw.acct.Id).latestCommunicationFromR4KInDayFormatted = convertMinutesToDays(mapwipAccountWrap.get(aw.acct.Id).latestCommunicationFromR4KInMinutes);
                     }
                     mapwipAccountWrap.get(aw.acct.Id).latestCommunicationFromR4K = cw;
                 }
             }
             ///////////////////
             
             /*AggregateResult[] groupedTotRefCreatedResults = [SELECT Applicant__c, count(id) FROM Referee__c WHERE Applicant__c=:wipacctList and Applicant__r.Rep_Responsible_For_Converting_Lead__c=:currentEmpId  group by Applicant__c];
             
             AggregateResult[] groupedTotRefFamResults = [SELECT Applicant__c, count(id) FROM Referee__c WHERE Relationship__c in ('Family Member') and Applicant__c=:wipacctList and Applicant__r.Rep_Responsible_For_Converting_Lead__c=:currentEmpId group by Applicant__c];
             
             if(groupedTotRefCreatedResults.size()>0)
             {
                 for(AggregateResult ar:groupedTotRefCreatedResults)
                 { 
                     mapwipAccountWrap.get((String)ar.get('Applicant__c')).totRefCount = (Integer)ar.get('expr0');
                 }
             }
             
             if(groupedTotRefFamResults.size()>0)
             {
                 for(AggregateResult ar:groupedTotRefFamResults)
                 { 
                     mapwipAccountWrap.get((String)ar.get('Applicant__c')).totRefFamCount = (Integer)ar.get('expr0');
                 }
             }*/
         }
         
         if(mapwipAccountWrap.size()>0)
         {
             for(AccountWrapper aw : mapwipAccountWrap.values())
             {
                //Get all In/Out Communication count
                Integer allOutgoingComm = 0;
                Integer allIncomingComm = 0;
                Integer allIncomingSMS = 0;
                aw.allOutgoingComm = 0;
                aw.allIncomingComm = 0;
                //mapwipAccountWrap.get(pc.Account__c).allIncomingSMS = 0;
                if(allPCList.size()>0)
                {
                for(AggregateResult ar:allPCList)
                {
                    String pcType = (String)ar.get('Call_Type__c');
                    String pcAcctId = (String)ar.get('Account__c');
                    Integer pcCount = ar.get('expr0')!=null && ar.get('expr0')!='' ? (Integer)ar.get('expr0') : 0;
                    if(pcType=='Incoming' || pcType=='Incoming SMS' || pcType=='Missed')
                    {  
                         if(pcAcctId!=null && pcAcctId==aw.acct.Id)
                         {
                            allIncomingComm = allIncomingComm + pcCount;
                            if(pcType=='Incoming SMS')
                                allIncomingSMS = allIncomingSMS + pcCount;
                         }
                        
                    }else{
                        if(pcAcctId!=null && pcAcctId==aw.acct.Id)
                            allOutgoingComm = allOutgoingComm + pcCount;
                    }
                }
                }
                
                if(allsmsList.size()>0)
                {
                for(AggregateResult ar:allsmsList)
                {
                    String smAcctId = (String)ar.get('smagicinteract__Account__c');
                    String smType = (String)ar.get('smagicinteract__Direction__c');
                    Integer smCount = ar.get('expr0')!=null && ar.get('expr0')!='' ? (Integer)ar.get('expr0') : 0;
                    
                    if(smType=='IN')
                    {
                        if(smAcctId!=null && smAcctId==aw.acct.Id)
                        {
                            allIncomingComm = allIncomingComm + smCount;
                            //allIncomingSMS = allIncomingSMS + smCount;
                        }
                    }
                    else
                    {
                        if(smAcctId!=null && smAcctId==aw.acct.Id)
                            allOutgoingComm = allOutgoingComm + smCount;
                    }
                }
                }
                system.debug('allIncomingComm: '+allIncomingComm + ' allOutgoingComm: '+allOutgoingComm+' allIncomingSMS: '+allIncomingSMS );
                aw.allOutgoingComm = allOutgoingComm;
                aw.allIncomingComm = allIncomingComm;
                ////////////////////////////////////////////////////////////
            
                 String currentStage = 'Hybrid sent';
                 String nextStage = 'Get Consent';
                 Datetime dockLinkDate = aw.latestDocLinkAttachment!=null ? aw.latestDocLinkAttachment.CreatedDate : null;
                 if(dockLinkDate==null)
                     dockLinkDate = aw.acct.Consent_URL_Opened_DateTime__c!=null ? aw.acct.Consent_URL_Opened_DateTime__c : aw.acct.Consent_URLSent_DateTime__c;
                 dockLinkDate = dockLinkDate==null ? aw.acct.Enquiry_Datetime__c : dockLinkDate;
                 if(dockLinkDate==null)
                     dockLinkDate = currentTimeGMTVal;
                 aw.priorityActivityDate = dockLinkDate; //initial value
                 aw.lastActivityInMins = 1;
                 aw.lastActivityInDayFormatted = convertMinutesToDays(aw.lastActivityInMins);
                 
                 Boolean alldocsAttached = ((aw.acct.Centrelink_Benefit__c==null ||  aw.acct.Centrelink_Benefit__c=='') && aw.acct.Equifax_SMS_Consent_Received__c && aw.acct.Is_PhotoId_Attached_After_Enquiry__c && aw.acct.Bank_Final_Page__c) 
                     || (aw.acct.Centrelink_Benefit__c!=null && aw.acct.Equifax_SMS_Consent_Received__c && aw.acct.Is_PhotoId_Attached_After_Enquiry__c && aw.acct.Bank_Final_Page__c && aw.acct.MyGov_Final_Page__c);
                 
                 if(aw.opp!=null)
                 {
                     system.debug('##Opp is present: '+aw.opp.Name);
                     if(aw.opp.TaxInvoice_Signed_DateTime__c!=null && aw.opp.Is_Product_Sourced__c!=null && aw.opp.Is_Product_Sourced__c==false)
                     {
                         currentStage = 'Forms Signed';
                         nextStage = 'Outstanding Purchase Receipt';
                         aw.priorityActivityDate = aw.opp.TaxInvoice_Signed_DateTime__c;
                     }
                     else if(aw.opp.Product_Sourcing_Datetime__c!=null && aw.opp.Approval_Status__c=='Approved')
                     {
                         currentStage = 'Product Sourced';
                         nextStage = '1-Link Signing';
                         aw.priorityActivityDate = aw.opp.Product_Sourcing_Datetime__c!=null ? aw.opp.Product_Sourcing_Datetime__c : aw.opp.Approval_DateTime__c;
                     }else if(aw.opp.Product_Sourcing_Datetime__c==null && aw.opp.Approval_Status__c=='Approved')
                     {
                         currentStage = 'Approved';
                         nextStage = 'Product Sourcing';
                         aw.priorityActivityDate = aw.opp.Approval_DateTime__c;
                     }
                     else if(aw.opp.Product_Sourcing_Datetime__c==null && aw.opp.Approval_Status__c=='Re-Submit')
                     {
                         currentStage = 'Re-Submit';
                         nextStage = 'Approval';
                         aw.priorityActivityDate = aw.opp.LastModifiedDate;
                     }
                     else if(aw.opp.Approval_Status__c=='Re-Submit' && aw.acct.Referees_Contacted_for_Current_Enquiry__c!=null && aw.acct.Referees_Contacted_for_Current_Enquiry__c>=aw.toRefExpected)
                     {
                         currentStage = 'Referees Contacted';
                         nextStage = 'Re-Submit';
                         aw.priorityActivityDate = aw.latestRefereeActivity!=null ? aw.latestRefereeActivity.LastModifiedDate : dockLinkDate;  //To add Last Referee contactedDatetime
                     }
                     else if(aw.opp.Approval_Status__c=='Pending' && aw.acct.Referees_Contacted_for_Current_Enquiry__c!=null && aw.acct.Referees_Contacted_for_Current_Enquiry__c>=aw.toRefExpected)
                     {
                         currentStage = 'Referees Contacted';
                         nextStage = alldocsAttached ? 'Pending Approval' : 'Get all docs';
                         aw.priorityActivityDate = aw.latestRefereeActivity!=null ? aw.latestRefereeActivity.LastModifiedDate : dockLinkDate;  //To add Last Referee contactedDatetime
                     }
                     else if(aw.totRefCount!=null && aw.totRefCount>=aw.toRefExpected && alldocsAttached)
                     {
                         currentStage = 'Referees Added';
                         nextStage = alldocsAttached ? 'Contact Referees' : 'Get all docs';
                         aw.priorityActivityDate = aw.latestRefereeActivity!=null ? aw.latestRefereeActivity.LastModifiedDate : dockLinkDate; // To add Last referee added time
                     }
                     else if(alldocsAttached)
                     {
                         currentStage = 'All docs received';
                         nextStage = 'Add Referees';
                         aw.priorityActivityDate = dockLinkDate;
                     }
                     else if(aw.acct.Hybrid_Link_Status__c=='Referees Added' && !alldocsAttached)
                     {
                         currentStage = 'Referees Added';
                         nextStage = 'Get all docs'; //to be changed depending on the mygov confirmation
                         aw.priorityActivityDate = aw.latestRefereeActivity!=null ? aw.latestRefereeActivity.LastModifiedDate : dockLinkDate;
                     }
                     else if(aw.acct.Consent_URLSent_DateTime__c!=null)
                     {
                         currentStage = 'doc-Link Sent';
                         nextStage = 'Get all docs';
                         aw.priorityActivityDate = dockLinkDate;
                     }
                 }
                 else
                 {
                     if(aw.acct.Referees_Contacted_for_Current_Enquiry__c!=null && aw.acct.Referees_Contacted_for_Current_Enquiry__c>=aw.toRefExpected)
                     {
                         currentStage = 'Referees Contacted';
                         nextStage = alldocsAttached ? 'Pending Approval' : 'Get all docs';
                         aw.priorityActivityDate = aw.latestRefereeActivity!=null ? aw.latestRefereeActivity.LastModifiedDate : dockLinkDate; //To add Last Referee contactedDatetime
                     }
                     else if(aw.totRefCount!=null && aw.totRefCount>=aw.toRefExpected && alldocsAttached)
                     {
                         currentStage = 'Referees Added';
                         nextStage = alldocsAttached ? 'Contact Referees' : 'Get all docs';
                         aw.priorityActivityDate = aw.latestRefereeActivity!=null ? aw.latestRefereeActivity.LastModifiedDate : dockLinkDate; // To add Last referee added time
                     }
                     else if(alldocsAttached)
                     {
                         currentStage = 'All docs received';
                         nextStage = 'Add Referees';
                         aw.priorityActivityDate = dockLinkDate;
                     }
                     else if(aw.acct.Hybrid_Link_Status__c=='Referees Added' && !alldocsAttached)
                     {
                         currentStage = 'Referees Added';
                         nextStage = 'Get all docs'; //to be changed depending on the mygov confirmation
                         aw.priorityActivityDate = aw.latestRefereeActivity!=null ? aw.latestRefereeActivity.LastModifiedDate : dockLinkDate;
                     }
                     else if(aw.acct.Consent_URLSent_DateTime__c!=null)
                     {
                         currentStage = 'doc-Link Sent';
                         nextStage = 'Get all docs';
                         aw.priorityActivityDate = dockLinkDate;
                     }
                 }
                 
                 if(((currentStage=='Hybrid Sent' || aw.acct.Consent_URLSent_DateTime__c!=null) && aw.opp==null) ||  ((currentStage=='Hybrid Sent' || aw.acct.Consent_URLSent_DateTime__c!=null) && aw.opp!=null && aw.opp.TaxInvoice_Signed_DateTime__c==null))
                 { 
                    currentStage=aw.acct.Hybrid_Link_Status__c;
                    if(aw.acct.Hybrid_Link_Status__c=='Hybrid Sent') 
                    {
                        nextStage = 'Get Consent';
                    }else if(aw.acct.Hybrid_Link_Status__c=='Consent Received')
                    {
                        nextStage = 'Add PhotoId';
                    }else if(aw.acct.Hybrid_Link_Status__c=='PhotoId Added')
                    {
                        nextStage = 'Add BankSt';
                    }else if(aw.acct.Referees_Contacted_for_Current_Enquiry__c!=null && aw.acct.Referees_Contacted_for_Current_Enquiry__c>=aw.toRefExpected)
                    {
                        currentStage = 'Referees Contacted';
                        nextStage = alldocsAttached ? 'Pending Approval' : 'Get all docs';
                    }
                    else if(aw.totRefCount!=null && aw.totRefCount>=aw.toRefExpected && alldocsAttached)
                    {
                         currentStage = 'Referees Added';
                         nextStage = 'Contact Referees';
                    }else if(aw.acct.Hybrid_Link_Status__c=='All docs received')
                    {
                        nextStage = 'Add Referees';
                    }
                    else if(aw.acct.Hybrid_Link_Status__c=='Referees Added')
                    {
                        nextStage = 'Get all docs'; //to be changed depending on the mygov confirmation
                    }
                    else if(aw.acct.Hybrid_Link_Status__c=='BankSt Added')
                    {
                        nextStage = 'Add myGov';
                    }
                 }
                 
                 mapwipAccountWrap.get(aw.acct.id).currentStage = currentStage;
                 mapwipAccountWrap.get(aw.acct.id).nextStage = nextStage;
                 
                 //Set the piorityActivityDate for all the outgoing sms and incoming sms/missed
                 if((aw.priorityActivityDate==null && aw.latestCommunicationFromR4K!=null) || (aw.priorityActivityDate!=null && aw.latestCommunicationFromR4K!=null && aw.latestCommunicationFromR4K.CreatedDate > aw.priorityActivityDate))
                        aw.priorityActivityDate=aw.latestCommunicationFromR4K.CreatedDate; 
                 if((aw.priorityActivityDate==null && aw.latestMissedPhoneCall!=null) || (aw.priorityActivityDate!=null && aw.latestMissedPhoneCall!=null && aw.latestMissedPhoneCall.CreatedDate > aw.priorityActivityDate))
                        aw.priorityActivityDate=aw.latestMissedPhoneCall.CreatedDate;
                 ////////////////////////////////////////////////////////////
                 
                 Long dt2Long = currentTimeGMTVal.getTime();
                 if(aw.priorityActivityDate!=null)
                 {
                     Long dt3Long = aw.priorityActivityDate.getTime();
                     Long leadContactMilliseconds2 = dt2Long - dt3Long;
                     Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                     Long leadContactMinutes2 = leadContactSeconds2 / 60;
                     aw.lastActivityInMins = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 1;
                     aw.lastActivityInDayFormatted = convertMinutesToDays(aw.lastActivityInMins);
                 }
                 
             }
         }
         
         List<AccountWrapper> aWraps = new List<AccountWrapper>();
         if(mapwipAccountWrap.values().size()>0)
         {
             for(AccountWrapper aWrap : mapwipAccountWrap.values())
             {
                 if(aWrap.acct.Enquiry_Status__c=='Enquiry' || (aWrap.acct.Enquiry_Status__c=='Applicant' && aWrap.opp!=null && aWrap.opp.Is_Product_Sourced__c!=null && aWrap.opp.Is_Product_Sourced__c==false && showProductSourcingRecords))
                     aWraps.add(aWrap);
             }
         }
         
         acctWrapLst = new List<AccountWrapper>();
         acctWrapLst.addAll(aWraps);
         acctWrapLst.sort();
         system.debug('wipList: '+acctWrapLst.size());
     }
}

public void getUnAssignedLeads2()
{
    try
    {
    system.debug('region: '+region);
    TwilioCallerRESTService tcs = new TwilioCallerRESTService();
    tcs.getUserDetails();
    twilioProfile = tcs.twilioProfile;
    if(Test.isRunningTest() && ApexPages.currentPage().getParameters().get('profile') != null && ApexPages.currentPage().getParameters().get('profile') != ''){
        twilioProfile = ApexPages.currentPage().getParameters().get('profile');
    }
    botStartTime = tcs.botStartTime;
    botFinishTime = tcs.botFinishTime;
    wipParkDuration = tcs.wipParkDuration!=null ? tcs.wipParkDuration : 30;
    terLstForBotUsers = tcs.terLstForBotUsers;
    system.debug('twilioProfile: '+twilioProfile);
    List<Lead> ldLst = new List<Lead>();
    List<Lead> ldWIPLst = new List<Lead>();
    Map<String,Boolean> mapWrapSelection = new Map<String,Boolean>();
    Map<String,Boolean> mapWIPWrapSelection = new Map<String,Boolean>();
    List<String> leadsToCall = new List<String>();
    List<String> leadsToSMS = new List<String>();
    List<Lead> ldsToUnlock = new List<Lead>();
    isValidTimeToCall = false;
    paUnlockCount = 0;
    
    /*if(leadWrapLst!=null && leadWrapLst.size()>0)
    {
        for(LeadWrapper lw : leadWrapLst)
        {
            if(lw.isSelectedToCall!=null && lw.isSelectedToCall)
            {
                system.debug('ldId: '+lw.ld.Id+' ldName: '+lw.ld.Name);
                mapWrapSelection.put(lw.ld.Id, lw.isSelectedToCall);
            }
        }
    }*/
    
    leadWrapLst = new List<LeadWrapper>();
    
    if(twilioProfile=='NSW CLO')
    {
        ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                    Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                    OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                    Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                    Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                    Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c
                    from Lead where 
                    Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='NSW' or Territory_Number__r.Short_Name__c='R4K Dandenong')
                    and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
    
        unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and Territory_Number__r.State_Master_State__c=\'NSW\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
         
    }
    else if(twilioProfile=='NZ CLO')
    {
        ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                    Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                    OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                    Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                    Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                    Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c
                    from Lead where 
                    Territory_Number__r.Company_Territory__c=true and  Territory_Number__r.State_Master_State__c='NZ' 
                    and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
    
    unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and Territory_Number__r.State_Master_State__c=\'NZ\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
    }
    else if(twilioProfile=='R4K LICENSING')
    {
        if(region=='NSW')
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Account__r.PUA_Status__c,Probable_Territory__c,Probable_Territory__r.State_Master_State__c
                        from Lead where 
                        Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name='1000' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned' and Probable_Territory__r.State_Master_State__c='NSW') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Probable_Territory__r.State_Master_State__c='NSW' and Account__r.PUA_Status__c!='Declined' and Account__r.Territory_Number__r.Name='1000' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
    
            unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and Probable_Territory__r.State_Master_State__c=\'NSW\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Probable_Territory__r.State_Master_State__c=\'NSW\' and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
        }
        else if(region=='QLD')
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Account__r.PUA_Status__c,Probable_Territory__c,Probable_Territory__r.State_Master_State__c
                        from Lead where 
                        Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name='1000' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned' and Probable_Territory__r.State_Master_State__c in ('QLD','WA')) or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Probable_Territory__r.State_Master_State__c in ('QLD','WA') and Account__r.PUA_Status__c!='Declined' and Account__r.Territory_Number__r.Name='1000' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
    
            unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\')) or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\') and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
        }
        else
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Account__r.PUA_Status__c,Probable_Territory__c,Probable_Territory__r.State_Master_State__c
                        from Lead where 
                        Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name='1000' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned' and (Probable_Territory__r.State_Master_State__c in ('VIC','SA') or Probable_Territory__c=null)) or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and (Probable_Territory__r.State_Master_State__c in ('VIC','SA') or Probable_Territory__c=null)  and Account__r.PUA_Status__c!='Declined' and Account__r.Territory_Number__r.Name='1000' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
    
            unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and (Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\') or Probable_Territory__c=null)) or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and (Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\') or Probable_Territory__c=null) and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
        }
    }
    else if(twilioProfile=='QLD CLO')
    {
        Date tempQLDStartDate = Date.newInstance(2022,2,1);
        ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                    Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                    OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                    Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                    Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                    Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c
                    from Lead where 
                    Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='QLD' or Territory_Number__r.State_Master_State__c='WA')
                    and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) AND CreatedDate >=: tempQLDStartDate order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
    
        unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and (Territory_Number__r.State_Master_State__c=\'QLD\' or Territory_Number__r.State_Master_State__c=\'WA\') and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
    }
    else if(twilioProfile=='Darranda CLO' || twilioProfile=='Helpdesk')
    {   
        if(Test.isRunningTest())
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                    Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                    OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                    Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                    Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                    Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c
                    from Lead where
                    ((Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='VIC' or Territory_Number__r.State_Master_State__c='SA'  or Territory_Number__r.State_Master_State__c='WA' or Territory_Number__r.State_Master_State__c='QLD')) or Territory_Number__r.Short_Name__c='Greensborough') and Territory_Number__r.Name<>'100' and Lead_Medium__c <> 'TR4K SIM' 
                    and Territory_Number__r.Is_Credit_Contract__c=true and  ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc LIMIT 100];
        }
        else
        {
            if(twilioPersonName=='Sharon')
            {
                ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c
                        from Lead where
                        (Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='VIC' or Territory_Number__r.State_Master_State__c='SA')) and Territory_Number__r.Name<>'1000' and Lead_Medium__c <> 'TR4K SIM' 
                        and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
                unAssignedCount= database.countQuery('select count() from Lead where (Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and (Territory_Number__r.State_Master_State__c=\'VIC\' or Territory_Number__r.State_Master_State__c=\'SA\')) and Territory_Number__r.Name<> \'1000\' and Lead_Medium__c <> \'TR4K SIM\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
            }
            else
            {
                ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c
                        from Lead where
                        (Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='WA' or Territory_Number__r.State_Master_State__c='QLD')) and Territory_Number__r.Name<>'1000' and Lead_Medium__c <> 'TR4K SIM' 
                        and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
                unAssignedCount= database.countQuery('select count() from Lead where (Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and (Territory_Number__r.State_Master_State__c=\'WA\' or Territory_Number__r.State_Master_State__c=\'QLD\')) and Territory_Number__r.Name<> \'1000\' and Lead_Medium__c <> \'TR4K SIM\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
            }
        }
    
    }
    else if(twilioProfile=='Darranda CustomerCare')
    {
        ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                    Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                    OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                    Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                    Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                    Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c
                    from Lead where 
                    ((Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='VIC' or Territory_Number__r.State_Master_State__c='SA')) or Territory_Number__r.Short_Name__c='Greensborough') and Territory_Number__r.Name<>'100' and Lead_Medium__c <> 'TR4K SIM' 
                    and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
     }
     
     if(twilioProfile!='NSW CLO' && twilioProfile!='Darranda CLO' && twilioProfile!='QLD CLO' && twilioProfile!='Helpdesk' && twilioProfile!='R4K LICENSING')
         unAssignedCount=ldLst.size();
       
     system.debug('ldLst.size(): '+ldLst.size()+' terLstForBotUsers.size() '+terLstForBotUsers.size()); 
     
       Map<String,Attachment> mapHybridAttachment = new Map<String,Attachment>();
       Set<String> acctIds = new Set<String>();
       Set<String> leadIds = new Set<String>();
       Map<String,String> mapAppStatus = new Map<String,String>();
       Map<String,PhoneCall__c> mapMissedPhoneCall = new Map<String,PhoneCall__c>();
       Map<String,smagicinteract__smsMagic__c> mapIncomingSMSMagic = new Map<String,smagicinteract__smsMagic__c>();
       Map<String,PhoneCall__c> mapOutgoingPhoneCall = new Map<String,PhoneCall__c>();
       Map<String,smagicinteract__smsMagic__c> mapSMSMagic = new Map<String,smagicinteract__smsMagic__c>();
       if(ldLst.size()>0 && terLstForBotUsers.size()>0)
        {
            for(Lead ld : ldLst)
            {
                leadIds.add(ld.Id);
                if(ld.Account__c!=null)
                    acctIds.add(ld.Account__c);
            }
        }
     List<Attachment> hybridAtts = [select id,name, parentId,CreatedDate from Attachment where parentId in: acctIds and (Name like 'Photo Id%' or Name like 'BankStatement%' or Name like 'myGov%') order by CreatedDate desc ];
     if(hybridAtts.size()>0)
     {
         for(Attachment att: hybridAtts)
         {
             if(!mapHybridAttachment.containsKey(att.parentId))
                 mapHybridAttachment.put(att.parentId,att);
         }
     }
     
     List<Opportunity> oppList = [select id,AccountId,StageName,SCI_listed_on__c,Defaulted_on_Veda_Date__c,Account.Is_IDR__c,Account.No_of_Agreements__c from Opportunity where AccountId in: acctIds];
     if(oppList.size()>0)
     {
         for(String at: acctIds)
         {
             Boolean isSCI=false;
             Boolean isDefaulted=false;
             Boolean isWrittenOff=false;
             Boolean isIDR=false;
             Boolean oppPresent = false;
             String appStatusType = '';
             for(Opportunity opp : oppList)
             {
                 if(at == opp.AccountId)
                 {
                    oppPresent = true;
                    if(opp.SCI_listed_on__c!=null)
                        isSCI=true;
                    if(opp.Defaulted_on_Veda_Date__c!=null)
                        isDefaulted=true;
                    if(opp.StageName=='Written Off / Bad Debt')
                        isWrittenOff=true; 
                    if(opp.Account.Is_IDR__c)
                        isIDR=true;
                 }
             }
             if(isSCI)
                appStatusType='IDR';
             else if(isSCI)
                appStatusType='SCI';
             else if(isDefaulted && isWrittenOff)
                appStatusType='Default and WrittenOff';
             else if(isDefaulted)
                appStatusType='Defaulted';
             else if(isWrittenOff)
                appStatusType='WrittenOff';
            else if(!oppPresent)
                appStatusType='New';
            if(!mapAppStatus.containsKey(at))
                 mapAppStatus.put(at,appStatusType);
         }
     }
     
     //List<PhoneCall__c> pcList = [select id,name,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where type__c=:twilioProfile and Read__c=false and ((Call_Type__c='Missed' and PersonName__c=:twilioPersonName) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c ='Incoming SMS')) and (Account__c in: acctIds or Lead__c in: leadIds) and CreatedDate=Last_N_Days:2  order by CreatedDate desc];
     String twilioOtherPersonName = 'Paul'; //must change the logic based on the active person today
     String twilioNSWOtherPersonName = 'Dean';
     String twilioVICOtherPersonName = 'Sharon';
     String twilioNZOtherPersonName = 'Sina';
     String twilioQLDOtherPersonName = 'Gordon';
     List<PhoneCall__c> pcList = [select id,name,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where type__c=:twilioProfile and Read__c=false and ((Call_Type__c='Missed' and PersonName__c=:twilioPersonName) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c='Missed' and PersonName__c=:twilioOtherPersonName) or (Call_Type__c ='Incoming SMS')) and (Account__c in: acctIds or Lead__c in: leadIds) and CreatedDate=Last_N_Days:6  order by CreatedDate desc];
     if(pcList.size()>0)
     {
         for(PhoneCall__c pc : pcList)
         {
             if(pc.Lead__c!=null && !mapMissedPhoneCall.containsKey(pc.Lead__c))
                 mapMissedPhoneCall.put(pc.Lead__c,pc);
             if(pc.Account__c!=null && !mapMissedPhoneCall.containsKey(pc.Account__c))
                 mapMissedPhoneCall.put(pc.Account__c,pc);
         }
     }
     
     //Incoming sms from smsMagic latestCommunicationByCust mapIncomingSMSMagic
     List<smagicinteract__smsMagic__c> incomingSMSMagic =  [select id,name,smagicinteract__PhoneNumber__c,smagicinteract__Lead__c,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,
                     smagicinteract__Direction__c,smagicinteract__deliveryStatus__c
             from smagicinteract__smsMagic__c  where smagicinteract__Direction__c='IN' and (smagicinteract__Account__c in: acctIds or smagicinteract__Lead__c in: leadIds) and CreatedDate=Last_N_Days:6 order by CreatedDate desc];
     if(incomingSMSMagic.size()>0)
     {
         for(smagicinteract__smsMagic__c pc : incomingSMSMagic)
         {
             if(pc.smagicinteract__Lead__c!=null && !mapIncomingSMSMagic.containsKey(pc.smagicinteract__Lead__c))
                 mapIncomingSMSMagic.put(pc.smagicinteract__Lead__c,pc);
             if(pc.smagicinteract__Account__c!=null && !mapIncomingSMSMagic.containsKey(pc.smagicinteract__Account__c))
                 mapIncomingSMSMagic.put(pc.smagicinteract__Account__c,pc);
         }
     }
     
     //R4K Latest Call or sms
     List<PhoneCall__c> pcR4KList = [select id,name,PersonName__c,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where Call_Type__c in ('Outgoing SMS','Outgoing') and (Account__c in: acctIds or Lead__c =: ldLst) and CreatedDate=Last_N_Days:3 order by CreatedDate desc];
     system.debug('pcR4KList: '+pcR4KList.size());
     if(pcR4KList.size()>0)
     {
         for(PhoneCall__c pc : pcR4KList)
         {
             if(pc.Lead__c!=null && !mapOutgoingPhoneCall.containsKey(pc.Lead__c))
                 mapOutgoingPhoneCall.put(pc.Lead__c,pc);
             if(pc.Account__c!=null && !mapOutgoingPhoneCall.containsKey(pc.Account__c))
                 mapOutgoingPhoneCall.put(pc.Account__c,pc);
         }
     }
     
     List<smagicinteract__smsMagic__c> smsList = [select id,name,smagicinteract__Lead__c,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,smagicinteract__Direction__c from smagicinteract__smsMagic__c where (smagicinteract__Account__c in: acctIds or smagicinteract__Lead__c =: ldLst) and CreatedDate=Last_N_Days:14 order by CreatedDate desc];
     if(smsList.size()>0)
     {
         for(smagicinteract__smsMagic__c sm : smsList)
         {
             if(sm.smagicinteract__Lead__c!=null && !mapSMSMagic.containsKey(sm.smagicinteract__Lead__c))
                 mapSMSMagic.put(sm.smagicinteract__Lead__c,sm);
             if(sm.smagicinteract__Account__c!=null && !mapSMSMagic.containsKey(sm.smagicinteract__Account__c))
                 mapSMSMagic.put(sm.smagicinteract__Account__c,sm);
         }
     }
     ////////////////////////////////////////////////////
     
     //All List of Outgoing and Incoming from last 3 days
     Map<String,AggregateResult> mapAllPC = new Map<String,AggregateResult>();
     Map<String,Integer> mapAllSMS = new Map<String,Integer>();
     
     List<AggregateResult> allPCList = [select Lead__c,Account__c,Call_Type__c,count(id) from PhoneCall__c where (Call_Type__c in ('Outgoing SMS','Outgoing','Incoming','Incoming SMS') or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c='Missed' and PersonName__c=:twilioVICOtherPersonName) or (Call_Type__c='Missed' and PersonName__c=:twilioNZOtherPersonName) or (Call_Type__c='Missed' and PersonName__c=:twilioNSWOtherPersonName) or (Call_Type__c='Missed' and PersonName__c=:twilioQLDOtherPersonName)) and (Account__c in: acctIds or Lead__c =: ldLst) and CreatedDate=Last_N_Days:10 group by Lead__c,Account__c,Call_Type__c];
     system.debug('allPCList: '+allPCList.size());
     List<AggregateResult> allsmsList = [select smagicinteract__Lead__c,smagicinteract__Account__c,smagicinteract__Direction__c,count(id) from smagicinteract__smsMagic__c where (smagicinteract__Account__c in: acctIds or smagicinteract__Lead__c =: ldLst) and CreatedDate=Last_N_Days:10 group by smagicinteract__Lead__c,smagicinteract__Account__c,smagicinteract__Direction__c];
     //////////////////////////////////////////////////////
                    
        if(ldLst.size()>0 && terLstForBotUsers.size()>0)
        {
            Integer count=0;
            Map<String,String> mapHybridAccount = new Map<String,String>();
            for(Lead ld : ldLst)
            {
                //Get Lead Time difference
                Integer timesBotCalled = ld.No_of_times_Bot_Called__c==null ? 0 : Integer.valueOf(ld.No_of_times_Bot_Called__c);
                String stateMasterState = ld.Territory_Number__r.State_Master_State__c;
                String leadMedium = ld.Lead_Medium__c;
                String terShortName = ld.Territory_Number__r.Short_Name__c;
                Time terBotStartTime = ld.Territory_Number__r.Bot_Start_Time__c;
                Time terBotFinishTime = ld.Territory_Number__r.Bot_Finish_Time__c;
            
                Datetime currentTimeGMTVal = Datetime.now();
                Datetime nextBotCallDatetime = ld.Next_Bot_Call_Datetime__c;
                Datetime botCallDatetime = ld.Bot_Call_Datetime__c;
                Datetime leadCreatedDate = ld.CreatedDate;
                Datetime lastCallDatetime = botCallDatetime!=null ? botCallDatetime : leadCreatedDate;
                Long dt1Long = lastCallDatetime.getTime();
                Long dt2Long = currentTimeGMTVal.getTime();
                Long leadContactMilliseconds = dt2Long - dt1Long;
                Long leadContactSeconds = leadContactMilliseconds / 1000;
                Long leadContactMinutes = leadContactSeconds / 60;
                Long leadContactHours = leadContactMinutes / 60;
                
                Decimal totalCOGSActive = 0;
                Decimal totalPaidActive = 0;
                Boolean isHybridLinkOpened = ld.Hybrid_Link_Opened_Datetime__c!=null ? true : false;
                system.debug('#ProbableTerritory: '+ld.Probable_Territory__r.State_Master_State__c+' Id: '+ld.Probable_Territory__c );
                count++;
                
                //Long days = hours / 24;
                system.debug('milliseconds: '+leadContactmilliseconds+' minutes: '+leadContactminutes+' leadContactHours: '+leadContactHours);
                /////////////////////////////////////////
                   
                String botCallStatus = ld.Bot_Call_Status__c;
                
                    LeadWrapper lwrap  = new LeadWrapper();
                    lwrap.ld = ld;
                    lwrap.isHybrid = ld.Rep_Responsible_For_Converting_Lead__c.contains('Hybrid') ? true : false;
                    
                    lwrap.isDuplicate = (ld.Account__c==null || (ld.Account__c!=null && mapHybridAccount.get(ld.Account__c)==null)) ? false : true;
                    if(ld.Account__c!=null && mapHybridAccount.get(ld.Account__c)==null)
                        mapHybridAccount.put(ld.Account__c,ld.Account__c);
                    
                    if(lwrap.isHybrid && !mapHybridAttachment.isEmpty())
                        lwrap.latestDocLinkAttachment = mapHybridAttachment.get(ld.Account__c);
                    if(lwrap.isHybrid && !mapAppStatus.isEmpty())
                        lwrap.appStatus = mapAppStatus.get(ld.Account__c);
                    if(lwrap.isHybrid && !mapMissedPhoneCall.isEmpty())
                    {
                        lwrap.latestMissedPhoneCall = mapMissedPhoneCall.get(ld.Account__c);
                        if(lwrap.latestMissedPhoneCall!=null)
                        {
                            PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                            cw.leadId = ld.Id;
                            cw.accountId = ld.Account__c;
                            cw.callType = lwrap.latestMissedPhoneCall.Call_Type__c;
                            cw.smsText = lwrap.latestMissedPhoneCall.SMS_Message__c;
                            cw.createdDate = lwrap.latestMissedPhoneCall.Createddate;
                            lwrap.latestCommunicationByCust = cw;
                        }
                    }
                    lwrap.autoDeclineReason=ld.Auto_Decline__c ? ld.Reason_For_Auto_Decline__c : null;
                    if(lwrap.isHybrid && ld.Account__r.Equifax_Enquiry_DateTime__c!=null && ld.Account__r.Equifax_Enquiry_DateTime__c.addDays(21) > Datetime.now())
                    {
                        String centrelinkBenefit = ld.Account__r.Centrelink_Benefit__c;
                        Decimal equifaxScore = ld.Account__r.Score_of_Equifax__c;
                        Decimal rentalDefaults = ld.Account__r.Equifax_No_of_Unpaid_Default_Rental__c;
                        Decimal nonRentalDefaults = ld.Account__r.Equifax_No_of_Unpaid_Default_NonRental__c;
                        String autoDeclineReason = '';
                        if(centrelinkBenefit != null && (centrelinkBenefit.containsIgnoreCase('Newstart Allowance') || centrelinkBenefit.containsIgnoreCase('Youth Allowance') || centrelinkBenefit.containsIgnoreCase('JobSeeker')))
                        {
                            autoDeclineReason= (equifaxScore!=null && equifaxScore<=400) ?  autoDeclineReason+'\n'+'Equifax Score - '+equifaxScore+'/400' : autoDeclineReason;
                            autoDeclineReason= (rentalDefaults!=null && rentalDefaults>=1) ?  autoDeclineReason+'\n'+'No. of Rental Defaults - '+rentalDefaults+'/1' : autoDeclineReason;
                            autoDeclineReason= (nonRentalDefaults!=null && nonRentalDefaults>=1) ?  autoDeclineReason+'\n'+'No. of Non Rental Defaults - '+nonRentalDefaults+'/1' : autoDeclineReason;
                        }
                        else
                        {
                            autoDeclineReason= (equifaxScore!=null && equifaxScore<=200) ?  autoDeclineReason+'\n'+'Equifax Score - '+equifaxScore+'/200' : autoDeclineReason;
                            autoDeclineReason= (rentalDefaults!=null && rentalDefaults>=2) ?  autoDeclineReason+'\n'+'No. of Rental Defaults - '+rentalDefaults+'/2' : autoDeclineReason;
                            autoDeclineReason= (nonRentalDefaults!=null && nonRentalDefaults>=3) ?  autoDeclineReason+'\n'+'No. of Non Rental Defaults - '+nonRentalDefaults+'/3' : autoDeclineReason;
                        }
                            lwrap.autoDeclineReason = lwrap.autoDeclineReason!=null ? lwrap.autoDeclineReason + autoDeclineReason : autoDeclineReason;
                    }
                    if(lwrap.isHybrid && !mapIncomingSMSMagic.isEmpty())
                    {
                        if(mapIncomingSMSMagic.get(ld.Account__c)!=null && (lwrap.latestCommunicationByCust==null || (lwrap.latestCommunicationByCust!=null && mapIncomingSMSMagic.get(ld.Account__c).CreatedDate > lwrap.latestCommunicationByCust.createdDate)))
                        {
                            PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                            cw.leadId = ld.Id;
                            cw.accountId = ld.Account__c;
                            cw.callType = 'Incoming SMS';
                            cw.smsText = mapIncomingSMSMagic.get(ld.Account__c).smagicinteract__SMSText__c;
                            cw.createdDate = mapIncomingSMSMagic.get(ld.Account__c).Createddate;
                            lwrap.latestCommunicationByCust = cw;
                        }
                    }
                    
                    if(lwrap.isHybrid)
                    {
                        totalCOGSActive = ld.Account__r.Total_COGS_Active__c;
                        totalPaidActive = ld.Account__r.Total_Paid_Amount_Active_Only__c;
                    }
                    else if(ld.Probable_Account__c!=null)
                    {
                        totalCOGSActive = ld.Probable_Account__r.Total_COGS_Active__c;
                        totalPaidActive = ld.Probable_Account__r.Total_Paid_Amount_Active_Only__c;
                    }
                    if(!mapMissedPhoneCall.isEmpty())
                    {
                        if(lwrap.latestMissedPhoneCall!=null)
                            lwrap.latestMissedPhoneCall = mapMissedPhoneCall.get(ld.Id)!=null && lwrap.latestMissedPhoneCall.CreatedDate < mapMissedPhoneCall.get(ld.Id).CreatedDate ? mapMissedPhoneCall.get(ld.Id) : null;
                        else
                            lwrap.latestMissedPhoneCall = mapMissedPhoneCall.get(ld.Id);
                        
                        if(lwrap.latestMissedPhoneCall!=null)
                        {    
                            PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                            cw.leadId = ld.Id;
                            cw.accountId = ld.Account__c;
                            cw.callType = lwrap.latestMissedPhoneCall.Call_Type__c;
                            cw.smsText = lwrap.latestMissedPhoneCall.SMS_Message__c;
                            cw.createdDate = lwrap.latestMissedPhoneCall.Createddate;
                            lwrap.latestCommunicationByCust = cw;
                        }
                    }
                    
                    if(!mapIncomingSMSMagic.isEmpty() && mapIncomingSMSMagic.get(ld.Id)!=null && (lwrap.latestCommunicationByCust==null || (lwrap.latestCommunicationByCust!=null && mapIncomingSMSMagic.get(ld.Id).CreatedDate > lwrap.latestCommunicationByCust.createdDate)))
                    {
                        PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                        cw.leadId = ld.Id;
                        cw.accountId = ld.Account__c;
                        cw.callType = 'Incoming SMS';
                        cw.smsText = mapIncomingSMSMagic.get(ld.Id).smagicinteract__SMSText__c;
                        cw.createdDate = mapIncomingSMSMagic.get(ld.Id).Createddate;
                        lwrap.latestCommunicationByCust = cw;
                    }
                    
                    if(lwrap.latestCommunicationByCust!=null)
                    {
                        Long dt3Long = lwrap.latestCommunicationByCust.Createddate.getTime();
                        Long milliseconds = dt2Long - dt3Long;
                        Long seconds = milliseconds / 1000;
                        Long minutes = seconds / 60;
                        lwrap.isLatestCommunicationByCustHighlighted = minutes <=10 ? true : false;
                        lwrap.latestCommunicationByCust.CreatedDate = lwrap.latestCommunicationByCust.CreatedDate + offset;
                    }
                    
                    ///////////////////////Get latest communication
                    
                    //Get Outgoing PhoneCall
                    if(lwrap.isHybrid && !mapOutgoingPhoneCall.isEmpty())
                        lwrap.latestPhoneCallFromR4K = mapOutgoingPhoneCall.get(ld.Account__c);
                    if(!mapOutgoingPhoneCall.isEmpty())
                    {
                        if(lwrap.latestPhoneCallFromR4K!=null)
                            lwrap.latestPhoneCallFromR4K = mapOutgoingPhoneCall.get(ld.Id)!=null && lwrap.latestPhoneCallFromR4K.CreatedDate < mapOutgoingPhoneCall.get(ld.Id).CreatedDate ? mapOutgoingPhoneCall.get(ld.Id) : lwrap.latestPhoneCallFromR4K;
                        else
                            lwrap.latestPhoneCallFromR4K = mapOutgoingPhoneCall.get(ld.Id);
                    }
                    ////////////////////////////
                    
                    //Get Outgoing SMSMagic
                    if(lwrap.isHybrid && !mapSMSMagic.isEmpty())
                    {
                        //system.debug('###HybridAccount: '+mapSMSMagic.get(ld.Account__c));
                        lwrap.latestSMSMagicFromR4K = mapSMSMagic.get(ld.Account__c);
                    }
                    if(!mapSMSMagic.isEmpty())
                    {
                        if(lwrap.latestSMSMagicFromR4K!=null)
                        {
                            //system.debug('hybridCreatedDate: '+lwrap.latestSMSMagicFromR4K.CreatedDate +' leadSMSCreatedDate: '+mapSMSMagic.get(ld.Id).CreatedDate);
                            lwrap.latestSMSMagicFromR4K = mapSMSMagic.get(ld.Id)!=null && lwrap.latestSMSMagicFromR4K.CreatedDate < mapSMSMagic.get(ld.Id).CreatedDate ? mapSMSMagic.get(ld.Id) : lwrap.latestSMSMagicFromR4K;
                        }
                        else
                            lwrap.latestSMSMagicFromR4K = mapSMSMagic.get(ld.Id);
                    }
                    ////////////////////////////
                    
                    //Get the latest communication
                     CommunicationWrapper cw;
                     if(lwrap.latestPhoneCallFromR4K!=null && lwrap.latestSMSMagicFromR4K!=null)
                     {
                         if(lwrap.latestPhoneCallFromR4K.CreatedDate > lwrap.latestSMSMagicFromR4K.CreatedDate)
                         {
                             cw = new CommunicationWrapper();
                             cw.id = lwrap.latestPhoneCallFromR4K.id;
                             if(lwrap.latestPhoneCallFromR4K.PersonName__c!=null && lwrap.latestPhoneCallFromR4K.PersonName__c=='Rene')
                                 cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c=='Outgoing' ? 'Outgoing Bot' : 'Outgoing Bot SMS';
                             else
                                 cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c;
                             cw.smsMessage = lwrap.latestPhoneCallFromR4K.SMS_Message__c;
                             cw.CreatedDate = lwrap.latestPhoneCallFromR4K.CreatedDate;
                         }else{
                             cw = new CommunicationWrapper();
                             cw.id = lwrap.latestSMSMagicFromR4K.id;
                             cw.type = 'Outgoing SMS';
                             cw.smsMessage = lwrap.latestSMSMagicFromR4K.smagicinteract__SMSText__c;
                             cw.CreatedDate = lwrap.latestSMSMagicFromR4K.CreatedDate;
                         }
                     }
                     else if(lwrap.latestPhoneCallFromR4K!=null){    
                         cw = new CommunicationWrapper();
                         cw.id = lwrap.latestPhoneCallFromR4K.id;
                         if(lwrap.latestPhoneCallFromR4K.PersonName__c!=null && lwrap.latestPhoneCallFromR4K.PersonName__c=='Rene')
                             cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c=='Outgoing' ? 'Outgoing Bot' : 'Outgoing Bot SMS';
                         else
                             cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c;
                         cw.smsMessage = lwrap.latestPhoneCallFromR4K.SMS_Message__c;
                         cw.CreatedDate = lwrap.latestPhoneCallFromR4K.CreatedDate;
                     }
                     else if(lwrap.latestSMSMagicFromR4K!=null){    
                         cw = new CommunicationWrapper();
                         cw.id = lwrap.latestSMSMagicFromR4K.id;
                         cw.type = 'Outgoing SMS';
                         cw.smsMessage = lwrap.latestSMSMagicFromR4K.smagicinteract__SMSText__c;
                         cw.CreatedDate = lwrap.latestSMSMagicFromR4K.CreatedDate;
                     }
                     
                     if(cw!=null && cw.CreatedDate!=null)
                     {
                         lWrap.priorityActivityDate = cw.CreatedDate;
                         system.debug('cw: '+cw);
                         Long dt3Long = cw.CreatedDate.getTime();
                         Long leadContactMilliseconds2 = dt2Long - dt3Long;
                         Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                         Long leadContactMinutes2 = leadContactSeconds2 / 60;
                         lwrap.lastActivityInMins = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 0;
                         lwrap.lastActivityInDayFormatted = convertMinutesToDays(lwrap.lastActivityInMins);
                         //system.debug('lwrap.lastActivityInMins: '+lwrap.lastActivityInMins+' lwrap.lastActivityInDayFormatted: '+lwrap.lastHybridActivityInDayFormatted);
                     }
                     lwrap.latestCommunicationFromR4K = cw;
                    //////////////////////////////////
                    //////////////////////////////////////////////////////
                    
                    //Get latest activity time by hybrids
                    if(lwrap.isHybrid)
                    {
                        Datetime lastHybridActivityTime = ld.Account__r.Hybrid_Link_Allocation_Datetime__c!=null ? ld.Account__r.Hybrid_Link_Allocation_Datetime__c : ld.Hybrid_Link_Allocation_Datetime__c;
                        if(lwrap.latestDocLinkAttachment!=null)
                        {
                            lastHybridActivityTime = lwrap.latestDocLinkAttachment.CreatedDate;
                        }
                        if(lastHybridActivityTime!=null)
                        {
                            if(lWrap.priorityActivityDate==null || (lWrap.priorityActivityDate!=null && lastHybridActivityTime > lWrap.priorityActivityDate))
                                lWrap.priorityActivityDate = lastHybridActivityTime;
                            Long dt3Long = lastHybridActivityTime.getTime();
                            Long leadContactMilliseconds2 = dt2Long - dt3Long;
                            Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                            Long leadContactMinutes2 = leadContactSeconds2 / 60;
                            lWrap.lastHybridActivityInMins = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 0;
                            lWrap.lastHybridActivityInDayFormatted = convertMinutesToDays(lWrap.lastHybridActivityInMins);
                        }
                    }
                    ///////////////////////////
                    
                    if(count<=350)
                    {
                    //Get all In/Out Communication count
                    Integer allOutgoingComm = 0;
                    Integer allIncomingComm = 0;
                    Integer allIncomingSMS = 0;
                    lWrap.allOutgoingComm = 0;
                    lWrap.allIncomingComm = 0;
                    lWrap.allIncomingSMS = 0;
                    if(allPCList.size()>0)
                    {
                    for(AggregateResult ar:allPCList)
                    {
                        String pcType = (String)ar.get('Call_Type__c');
                        String pcLeadId = (String)ar.get('Lead__c');
                        String pcAcctId = (String)ar.get('Account__c');
                        Integer pcCount = ar.get('expr0')!=null && ar.get('expr0')!='' ? (Integer)ar.get('expr0') : 0;
                        if(pcType=='Incoming' || pcType=='Incoming SMS' || pcType=='Missed')
                        {  
                             if((lWrap.isHybrid && ((pcAcctId!=null && pcLeadId!=null && pcLeadId==ld.Id) || (pcAcctId!=null && pcAcctId==ld.Account__c) || (pcLeadId!=null && pcLeadId==ld.Id)))|| (!lWrap.isHybrid && (pcLeadId!=null && pcLeadId==ld.Id)))
                             {
                                allIncomingComm = allIncomingComm + pcCount;
                                if(pcType=='Incoming SMS')
                                    allIncomingSMS = allIncomingSMS + pcCount;
                             }
                            
                        }else{
                            if((lWrap.isHybrid && ((pcAcctId!=null && pcLeadId!=null && pcLeadId==ld.Id) || (pcAcctId!=null && pcAcctId==ld.Account__c) || (pcLeadId!=null && pcLeadId==ld.Id)))|| (!lWrap.isHybrid && (pcLeadId!=null && pcLeadId==ld.Id)))
                                allOutgoingComm = allOutgoingComm + pcCount;
                        }
                    }
                    }
                    //system.debug(ld.Name+'##allOutgoingComm1: '+allOutgoingComm);
                    
                    if(allsmsList.size()>0)
                    {
                    for(AggregateResult ar:allsmsList)
                    {
                        String smLeadId = (String)ar.get('smagicinteract__Lead__c');
                        String smAcctId = (String)ar.get('smagicinteract__Account__c');
                        String smType = (String)ar.get('smagicinteract__Direction__c');
                        Integer smCount = ar.get('expr0')!=null && ar.get('expr0')!='' ? (Integer)ar.get('expr0') : 0;
                        
                        if(smType=='IN')
                        {
                            if((lWrap.isHybrid && ((smAcctId!=null && smLeadId!=null && smLeadId==ld.Id) || (smAcctId!=null && smAcctId==ld.Account__c) || (smLeadId!=null && smLeadId==ld.Id)))|| (!lWrap.isHybrid && (smLeadId!=null && smLeadId==ld.Id)))
                            {
                                allIncomingComm = allIncomingComm + smCount;
                                allIncomingSMS = allIncomingSMS + smCount;
                            }
                        }
                        else
                        {
                            if((lWrap.isHybrid && ((smAcctId!=null && smLeadId!=null && smLeadId==ld.Id) || (smAcctId!=null && smAcctId==ld.Account__c) || (smLeadId!=null && smLeadId==ld.Id)))|| (!lWrap.isHybrid && (smLeadId!=null && smLeadId==ld.Id)))
                                allOutgoingComm = allOutgoingComm + smCount;
                        }
                    }
                    }
                    system.debug('allIncomingComm: '+allIncomingComm + ' allOutgoingComm: '+allOutgoingComm+' allIncomingSMS: '+allIncomingSMS );
                    lWrap.allOutgoingComm = allOutgoingComm;
                    lWrap.allIncomingComm = allIncomingComm;
                    lWrap.allIncomingSMS = allIncomingSMS;
                    ////////////////////////////////////////////////////////////
                    }
                    
                    //LatestCall time
                    if((botCallDatetime!=null && lWrap.priorityActivityDate==null) || (botCallDatetime!=null && lWrap.priorityActivityDate!=null && botCallDatetime > lWrap.priorityActivityDate))
                    {
                        if(lWrap.priorityActivityDate==null)
                            lWrap.priorityActivityDate = botCallDatetime;
                        Long dt3Long = botCallDatetime.getTime();
                        Long leadContactMilliseconds2 = dt2Long - dt3Long;
                        Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                        Long leadContactMinutes2 = leadContactSeconds2 / 60;
                        lWrap.lastActivityInMins = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 0;
                        lWrap.lastActivityInDayFormatted = convertMinutesToDays(lWrap.lastActivityInMins);
                    }
                    
                    if((lWrap.priorityActivityDate==null && lwrap.latestMissedPhoneCall!=null) || (lWrap.priorityActivityDate!=null && lwrap.latestMissedPhoneCall!=null && lwrap.latestMissedPhoneCall.CreatedDate > lWrap.priorityActivityDate))
                        lWrap.priorityActivityDate=lwrap.latestMissedPhoneCall.CreatedDate; 
                    /*if(lWrap.priorityActivityDate==null || (lWrap.priorityActivityDate!=null && ld.LastModifiedDate > lWrap.priorityActivityDate))
                        lWrap.priorityActivityDate=ld.LastModifiedDate;  */
                    if(lWrap.priorityActivityDate==null)
                        lWrap.priorityActivityDate=ld.LastModifiedDate;
                    ////////////////////////////////////////////////
                    lwrap.contactMinutes = leadContactMinutes;
                    //lwrap.isSelectedToCall = !mapWrapSelection.isEmpty() ? mapWrapSelection.get(ld.Id) : false;
                    lwrap.isSelectedToCall = false;
                    lWrap.isLocked = true;
                    lWrap.isAutomationOn = true;
                    lWrap.minutesToGetUnlocked = 30;
                    Datetime leadCreatedDatetimeWithBuffer = leadCreatedDate.addMinutes(30);
                    Datetime maxOfNextCallDateAndCreatedDateBuffer = nextBotCallDatetime!=null? nextBotCallDatetime : botCallDatetime!=null ? botCallDatetime.addMinutes(30) : leadCreatedDatetimeWithBuffer;
                    if(maxOfNextCallDateAndCreatedDateBuffer!=null)
                    {
                        Long dt3Long = maxOfNextCallDateAndCreatedDateBuffer.getTime();
                        Long leadContactMilliseconds2 = dt3Long - dt2Long;
                        Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                        Long leadContactMinutes2 = leadContactSeconds2 / 60;
                        Long leadContactHours2 = leadContactMinutes2 / 60;
                        lWrap.minutesToGetUnlocked = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 45;
                    } 
                    //system.debug('botCallStatus: '+botCallStatus+' leadContactMinutes: '+leadContactMinutes);
                    
                    //Check the business hours
                    Decimal gmtVal = 11; //daylight saving 10-VIC, 9.5-SA, 12-NZ 10-QLD 8-WA //After October 11-VIC, 10.5-SA, 13-NZ 10-QLD 8-WA
                    Time currentLocalTime = currentTimeGMTVal.timeGMT().addHours(11);
                    if(stateMasterState=='SA')
                    {
                        currentLocalTime = currentTimeGMTVal.timeGMT().addHours(10).addMinutes(30);
                    }
                    else if(stateMasterState=='NZ')
                    {
                        currentLocalTime = currentTimeGMTVal.timeGMT().addHours(13);
                    }
                    Integer currentLocalHour = currentLocalTime.hour();
                    Integer currentLocalMinute = currentLocalTime.minute();
                    system.debug('currentLocalTime: '+currentLocalTime+' currentLocalHour: '+currentLocalHour+' terShortName: '+terShortName);
                    
                    if(terBotStartTime!=null && terBotFinishTime!=null)
                    {
                        Integer terBotStartHour = terBotStartTime.hour();
                        Integer terBotFinshHour = terBotFinishTime.hour();
                        
                        Integer terBotFinishMinute = terBotFinishTime.minute();
                        
                        system.debug('terBotStartHour: '+terBotStartHour+' terBotFinshHour: '+terBotFinshHour+' currentLocalHour: '+currentLocalHour+' terBotFinishMinute: '+terBotFinishMinute+' currentLocalMinute: '+currentLocalMinute);
                        if(currentLocalHour == terBotFinshHour && currentLocalMinute<=terBotFinishMinute)
                            isValidTimeToCall = true;
                        else if(currentLocalHour>=terBotStartHour && currentLocalHour<=terBotFinshHour && currentLocalHour != terBotFinshHour)
                            isValidTimeToCall = true;
                        system.debug('isValidTimeToCall: '+isValidTimeToCall);
                    }
                    ////////////////////////////////////////
                    //system.debug('currentTimeGMTVal: '+currentTimeGMTVal+' nextBotCallDatetime: '+nextBotCallDatetime);
                    
                    if(timesBotCalled>=2 || (botCallDatetime!=null && (botCallStatus=='Call Answered by CLO' || botCallStatus=='Call Answered by WeCare' || botCallStatus=='Missed call by CLO' || botCallStatus=='Missed call by WeCare' || botCallStatus=='Customer Opted out from Rene')) 
                        || (nextBotCallDatetime!=null && nextBotCallDatetime.addMinutes(1)<currentTimeGMTVal) 
                        || (lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. Completed') || (lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. PUA - Approved') || (lwrap.isHybrid && lwrap.latestDocLinkAttachment!=null && lwrap.latestDocLinkAttachment.CreatedDate.addMinutes(wipParkDuration)<currentTimeGMTVal ) || !isValidTimeToCall || leadMedium=='Internal Marketing')
                        lWrap.isLocked = false;
                    if((twilioProfile=='Darranda CLO' || twilioProfile=='NSW CLO' || twilioProfile=='NZ CLO' || twilioProfile=='QLD CLO' || twilioProfile=='Helpdesk' || twilioProfile=='R4K LICENSING') && ((botCallStatus=='Call Answered by CLO' || botCallStatus=='Call Answered by WeCare' || botCallStatus=='Missed call by CLO' || botCallStatus=='Missed call by WeCare' || botCallStatus=='Customer Opted out from Rene') || (lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. Completed' || lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. PUA - Approved' || lwrap.isHybrid && ld.Hybrid_link_Status__c=='2.1 Pending Contacting Referees') || (ld.Hybrid_link_Status__c=='3. Follow-up Required') || (ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && timesBotCalled>1 && isValidTimeToCall) || (ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && !isValidTimeToCall)  || (lWrap.allIncomingComm>0) || ld.Last_Incoming_SMS_DateTime__c!=null || (lWrap.allIncomingSMS>0) || ld.Automation_OutCome__c=='Buyout' || ld.Automation_OutCome__c=='Unlock' || leadMedium=='Internal Marketing' || leadMedium=='Direct Call' || ld.Unlock_Datetime__c!=null))
                    {
                        lWrap.isAutomationOn = false;
                        paUnlockCount++;
                        if(botCallStatus=='Call Answered by CLO' || botCallStatus=='Call Answered by WeCare' || botCallStatus=='Missed call by CLO' || botCallStatus=='Missed call by WeCare' || botCallStatus=='Customer Opted out from Rene')
                            lWrap.unlockReason = botCallStatus;
                        else if(lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. Completed')
                            lWrap.unlockReason = 'Completed Hybrid';
                        else if(lwrap.isHybrid && ld.Hybrid_link_Status__c=='2.1 Pending Contacting Referees')
                            lWrap.unlockReason = 'Pending Contacting Referees';
                        else if(ld.Hybrid_link_Status__c=='3. Follow-up Required')
                            lWrap.unlockReason = 'Follow-up Required';
                        else if(ld.Automation_OutCome__c=='Buyout')
                            lWrap.unlockReason = 'Buyout Customer';
                        else if(leadMedium=='Internal Marketing')
                            lWrap.unlockReason = 'Internal Marketing';
                        else if(leadMedium=='Direct Call')
                            lWrap.unlockReason = 'Direct Call';
                        else if(ld.Automation_OutCome__c=='Unlock')
                            lWrap.unlockReason = 'Manual Unlock';
                        else if(lWrap.allIncomingSMS>0 || ld.Last_Incoming_SMS_DateTime__c!=null)
                            lWrap.unlockReason = 'Incoming SMS';
                        else if(ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && totalCOGSActive > totalPaidActive)
                            lWrap.unlockReason = 'BreakEven - COGS>Paid';
                        else if(ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && totalPaidActive > totalCOGSActive )
                            lWrap.unlockReason = 'BreakEven - Paid>COGS';
                        else if(ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0)
                            lWrap.unlockReason = 'Existing Customer';    
                        else if(lWrap.allIncomingComm>0)
                            lWrap.unlockReason = 'Missed / Incoming Comm';
                        else
                            lWrap.unlockReason='Unlocked';
                    }
                    
                    lWrap.botMedium='CLO call';
                    if(lWrap.isAutomationOn && isValidTimeToCall)
                    {
                        if(botCallDatetime!=null && botCallStatus!='SMS Followup' && nextBotCallDatetime==null && timesBotCalled==1)
                        {
                            system.debug('##BotSMS: '+ld.Name+' - ');
                            lWrap.botMedium='Bot sms';
                            if(leadContactMinutes>=1)
                                leadsToSMS.add(ld.Id);
                        }
                        else{
                            lWrap.botMedium='Bot call';
                            
                            system.debug('##BotCalled for 2nd time after sms followup: '+ld.Name+' - '+(nextBotCallDatetime!=null && currentTimeGMTVal>=nextBotCallDatetime && timesBotCalled==1) +' ##Botcalled after 30 minutes: '+(timesBotCalled==0 && nextBotCallDatetime==null && leadContactMinutes>=30) +' timesBotCalled: '+timesBotCalled);
                            if((nextBotCallDatetime!=null && currentTimeGMTVal>=nextBotCallDatetime && timesBotCalled==1) || (timesBotCalled==0 && nextBotCallDatetime==null && leadContactMinutes>=30) || (botCallDatetime!=null && botCallStatus=='SMS Followup'  && nextBotCallDatetime==null && leadContactMinutes>15))
                                leadsToCall.add(ld.Id);
                        }   
                    }
                    /*else if(!lWrap.isLocked && isValidTimeToCall)
                    {
                        //Send all automated bot SMS
                        //lWrap.lastActivityInMins
                        ///////////////////////////////////
                    }*/
                    system.debug('leadPriorityActivityDate: '+lwrap.priorityActivityDate);
                    if(lWrap.isAutomationOn == false || twilioProfile=='Helpdesk' || testUser=='Helpdesk' || twilioProfile=='NZ CLO')
                    //if(lWrap.isAutomationOn == false)
                    {
                        leadWrapLst.add(lwrap);
                        if(lWrap.isAutomationOn == false)
                        {
                            Lead ldUnlock = new Lead();
                            ldUnlock.Id = lWrap.ld.Id;
                            ldUnlock.Unlock_Datetime__c = Datetime.now();
                            ldsToUnlock.add(ldUnlock);
                        }
                        else
                        {
                            Lead ldUnlock = new Lead();
                            ldUnlock.Id = lWrap.ld.Id;
                            ldUnlock.Unlock_Datetime__c = null;
                            ldsToUnlock.add(ldUnlock);
                        }
                    }
            }
        }
        
        ////////Remove duplicate converted Leads(
        List<LeadWrapper> uniqueLeadLst = new List<LeadWrapper>();
        if(leadWrapLst.size()>0)
        {
            for(LeadWrapper lw: leadWrapLst)
            {
                if(!lw.isDuplicate)
                {
                    uniqueLeadLst.add(lw);
                }
            }
            if(uniqueLeadLst.size()>0)
            {
                leadWrapLst = new List<LeadWrapper>();
                leadWrapLst.addAll(uniqueLeadLst);
            }
                    
        }
        /*if(leadWrapLst.size()>0)
        {
            for(Integer i=0;i<leadWrapLst.size(); i++)
            {
                system.debug('index : '+i+' -- '+leadWrapLst[i].ld.Name);
                if(leadWrapLst[i].isDuplicate)
                {
                    system.debug('removeIndex : '+i+' -- '+leadWrapLst[i].ld.Name);
                    leadWrapLst.remove(i);
                }
            }
        }*/ 
        /////////////////////////////////////////////////////////////////////
        
        leadWrapLst.sort();
        if(ldsToUnlock.size()>0)
            update ldsToUnlock;
        system.debug('leadsToCall: '+leadsToCall+' leadsToSMS: '+leadsToSMS+' isValidTimeToCall: '+isValidTimeToCall);
        
        
        
        /*if(twilioProfile=='NZ CLO')
        {
        if(leadsToCall.size()>0)
            MasterBotController.followUpLead(leadsToCall,'call');
        if(leadsToSMS.size()>0)
            MasterBotController.followUpLead(leadsToSMS,'sms');
        }*/
        }
        catch(Exception ex)
        {
            system.debug('Exception: '+ex);
            ErrorLog.addErrorLog('CollectionBotController','getUnAssignedLeads2',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        }
}

public List<Lead> getPendingLeads(String region, String type)
{
    String ldlstSOQL = 'select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,';
                  ldlstSOQL+=  'Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,';
                  ldlstSOQL+= 'OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,';
                  ldlstSOQL+='Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,';
                  ldlstSOQL+='Account__r.Name,Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,';
                  ldlstSOQL+= 'Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c,Account__r.PUA_Status__c,Probable_Territory__c,Probable_Territory__r.State_Master_State__c';
                  ldlstSOQL+=  ' from Lead where ';
                  ldlstSOQL+=  'Territory_Number__r.Is_Credit_Contract__c=true and ((Territory_Number__r.Name=\'1000\' and IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\' and ';
                  ldlstSOQL+=  region =='NSW' ? 'Probable_Territory__r.State_Master_State__c in (\'NSW\'))' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\'))' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\'))';
                  ldlstSOQL+=  ' or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and ';
                  ldlstSOQL+= region =='NSW' ? ' Probable_Territory__r.State_Master_State__c in (\'NSW\')' : region =='QLD' ? 'Probable_Territory__r.State_Master_State__c in (\'QLD\',\'WA\')' : 'Probable_Territory__r.State_Master_State__c in (\'VIC\',\'SA\')';
                  ldlstSOQL+=' and Account__r.PUA_Status__c!=\'Declined\' and Account__r.Territory_Number__r.Name=\'1000\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))';
                  ldlstSOQL+=  type =='nonst' ? ' and Hybrid_link_Status__c in (\'5. Not Opened\')' : type=='aipbs' ? ' and Hybrid_link_Status__c in (\'2.3 Pending Bank St\')' : type=='aipid' ? ' and Hybrid_link_Status__c in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\')' : type=='aippa' ? ' and Hybrid_link_Status__c not in (\'2.4 Pending PhotoId\',\'2.4 Pending RO\',\'4. Opened\',\'2.3 Pending Bank St\',\'5. Not Opened\')' : '';
                  ldlstSOQL+= ' order by Unlock_Datetime_Num__c asc, LastModifiedDate desc';

        system.debug('ldlstSOQL: '+ldlstSOQL);
        List<Lead> leads = Database.query(ldlstSOQL);
        return leads;
}

public void getUnAssignedLeads()
{
    try
    {
        system.debug('region: '+region);
        TwilioCallerRESTService tcs = new TwilioCallerRESTService();
        tcs.getUserDetails();
        twilioProfile = tcs.twilioProfile;
        if(Test.isRunningTest() && ApexPages.currentPage().getParameters().get('profile') != null && ApexPages.currentPage().getParameters().get('profile') != ''){
            twilioProfile = ApexPages.currentPage().getParameters().get('profile');
        }
        botStartTime = tcs.botStartTime;
        botFinishTime = tcs.botFinishTime;
        wipParkDuration = tcs.wipParkDuration!=null ? tcs.wipParkDuration : 30;
        terLstForBotUsers = tcs.terLstForBotUsers;
        system.debug('twilioProfile: '+twilioProfile);
        List<Lead> ldLst = new List<Lead>();
        List<Lead> ldWIPLst = new List<Lead>();
        Map<String,Boolean> mapWrapSelection = new Map<String,Boolean>();
        Map<String,Boolean> mapWIPWrapSelection = new Map<String,Boolean>();
        List<String> leadsToCall = new List<String>();
        List<String> leadsToSMS = new List<String>();
        List<Lead> ldsToUnlock = new List<Lead>();
        isValidTimeToCall = false;
        paUnlockCount = 0;
        
        
        leadWrapLst = new List<LeadWrapper>();
        
        if(twilioProfile=='NSW CLO')
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c
                        from Lead where 
                        Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='NSW' or Territory_Number__r.Short_Name__c='R4K Dandenong')
                        and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
        
            unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and Territory_Number__r.State_Master_State__c=\'NSW\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
            
        }
        else if(twilioProfile=='NZ CLO')
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c
                        from Lead where 
                        Territory_Number__r.Company_Territory__c=true and  Territory_Number__r.State_Master_State__c='NZ' 
                        and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
        
            unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and Territory_Number__r.State_Master_State__c=\'NZ\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
        }
        else if(twilioProfile=='R4K LICENSING')
        {
            ldLst = getPendingLeads(region,type);
        }
        else if(twilioProfile=='QLD CLO')
        {
            Date tempQLDStartDate = Date.newInstance(2022,2,1);
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c
                        from Lead where 
                        Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='QLD' or Territory_Number__r.State_Master_State__c='WA')
                        and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) AND CreatedDate >=: tempQLDStartDate order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
        
            unAssignedCount= database.countQuery('select count() from Lead where Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and (Territory_Number__r.State_Master_State__c=\'QLD\' or Territory_Number__r.State_Master_State__c=\'WA\') and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
        }
        else if(twilioProfile=='Darranda CLO' || twilioProfile=='Helpdesk')
        {   
            if(Test.isRunningTest())
            {
                ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c
                        from Lead where
                        ((Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='VIC' or Territory_Number__r.State_Master_State__c='SA'  or Territory_Number__r.State_Master_State__c='WA' or Territory_Number__r.State_Master_State__c='QLD')) or Territory_Number__r.Short_Name__c='Greensborough') and Territory_Number__r.Name<>'100' and Lead_Medium__c <> 'TR4K SIM' 
                        and Territory_Number__r.Is_Credit_Contract__c=true and  ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc LIMIT 100];
            }
            else
            {
                if(twilioPersonName=='Sharon')
                {
                    ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                            Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                            OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                            Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                            Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                            Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c
                            from Lead where
                            (Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='VIC' or Territory_Number__r.State_Master_State__c='SA')) and Territory_Number__r.Name<>'1000' and Lead_Medium__c <> 'TR4K SIM' 
                            and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
                    unAssignedCount= database.countQuery('select count() from Lead where (Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and (Territory_Number__r.State_Master_State__c=\'VIC\' or Territory_Number__r.State_Master_State__c=\'SA\')) and Territory_Number__r.Name<> \'1000\' and Lead_Medium__c <> \'TR4K SIM\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
                }
                else
                {
                    ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                            Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                            OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                            Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                            Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                            Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c
                            from Lead where
                            (Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='WA' or Territory_Number__r.State_Master_State__c='QLD')) and Territory_Number__r.Name<>'1000' and Lead_Medium__c <> 'TR4K SIM' 
                            and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
                    unAssignedCount= database.countQuery('select count() from Lead where (Territory_Number__r.Company_Territory__c=true and Territory_Number__r.Is_Credit_Contract__c=true and (Territory_Number__r.State_Master_State__c=\'WA\' or Territory_Number__r.State_Master_State__c=\'QLD\')) and Territory_Number__r.Name<> \'1000\' and Lead_Medium__c <> \'TR4K SIM\' and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c=\'Not Assigned\') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c=\'Hybrid Application\' and Account__r.Enquiry_Status__c in (\'Enquiry\') and Latest_Lead__c=true and Agreement__c=null))');
                }
            }
        
        }
        else if(twilioProfile=='Darranda CustomerCare')
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,
                        Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,
                        OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,
                        Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,
                        Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,
                        Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Last_Automated_Bot_Message__c
                        from Lead where 
                        ((Territory_Number__r.Company_Territory__c=true and (Territory_Number__r.State_Master_State__c='VIC' or Territory_Number__r.State_Master_State__c='SA')) or Territory_Number__r.Short_Name__c='Greensborough') and Territory_Number__r.Name<>'100' and Lead_Medium__c <> 'TR4K SIM' 
                        and Territory_Number__r.Is_Credit_Contract__c=true and ((IsConverted=false and Rep_Responsible_For_Converting_Lead__c='Not Assigned') or (IsConverted=true and Rep_Responsible_For_Converting_Lead__c='Hybrid Application' and Account__r.Enquiry_Status__c in ('Enquiry') and Latest_Lead__c=true and Agreement__c=null)) order by Unlock_Datetime_Num__c asc, LastModifiedDate desc];
        }
        
        if(twilioProfile!='NSW CLO' && twilioProfile!='Darranda CLO' && twilioProfile!='QLD CLO' && twilioProfile!='Helpdesk')
            unAssignedCount=ldLst.size();
        
        system.debug('ldLst.size(): '+ldLst.size()+' terLstForBotUsers.size() '+terLstForBotUsers.size()); 
        
        Map<String,Attachment> mapHybridAttachment = new Map<String,Attachment>();
        Set<String> acctIds = new Set<String>();
        Set<String> leadIds = new Set<String>();
        Map<String,String> mapAppStatus = new Map<String,String>();
        Map<String,PhoneCall__c> mapMissedPhoneCall = new Map<String,PhoneCall__c>();
        Map<String,smagicinteract__smsMagic__c> mapIncomingSMSMagic = new Map<String,smagicinteract__smsMagic__c>();
        Map<String,PhoneCall__c> mapOutgoingPhoneCall = new Map<String,PhoneCall__c>();
        Map<String,smagicinteract__smsMagic__c> mapSMSMagic = new Map<String,smagicinteract__smsMagic__c>();
        if(ldLst.size()>0 && terLstForBotUsers.size()>0)
        {
            for(Lead ld : ldLst)
            {
                leadIds.add(ld.Id);
                if(ld.Account__c!=null)
                    acctIds.add(ld.Account__c);
            }
        }
        List<Attachment> hybridAtts = [select id,name, parentId,CreatedDate from Attachment where parentId in: acctIds and (Name like 'Photo Id%' or Name like 'BankStatement%' or Name like 'myGov%') order by CreatedDate desc ];
        if(hybridAtts.size()>0)
        {
            for(Attachment att: hybridAtts)
            {
                if(!mapHybridAttachment.containsKey(att.parentId))
                    mapHybridAttachment.put(att.parentId,att);
            }
        }
        
        List<Opportunity> oppList = [select id,AccountId,StageName,SCI_listed_on__c,Defaulted_on_Veda_Date__c,Account.Is_IDR__c,Account.No_of_Agreements__c from Opportunity where AccountId in: acctIds];
        if(oppList.size()>0)
        {
            for(String at: acctIds)
            {
                Boolean isSCI=false;
                Boolean isDefaulted=false;
                Boolean isWrittenOff=false;
                Boolean isIDR=false;
                Boolean oppPresent = false;
                String appStatusType = '';
                for(Opportunity opp : oppList)
                {
                    if(at == opp.AccountId)
                    {
                        oppPresent = true;
                        if(opp.SCI_listed_on__c!=null)
                            isSCI=true;
                        if(opp.Defaulted_on_Veda_Date__c!=null)
                            isDefaulted=true;
                        if(opp.StageName=='Written Off / Bad Debt')
                            isWrittenOff=true; 
                        if(opp.Account.Is_IDR__c)
                            isIDR=true;
                    }
                }
                if(isSCI)
                    appStatusType='IDR';
                else if(isSCI)
                    appStatusType='SCI';
                else if(isDefaulted && isWrittenOff)
                    appStatusType='Default and WrittenOff';
                else if(isDefaulted)
                    appStatusType='Defaulted';
                else if(isWrittenOff)
                    appStatusType='WrittenOff';
                else if(!oppPresent)
                    appStatusType='New';
                if(!mapAppStatus.containsKey(at))
                    mapAppStatus.put(at,appStatusType);
            }
        }
        
        //List<PhoneCall__c> pcList = [select id,name,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where type__c=:twilioProfile and Read__c=false and ((Call_Type__c='Missed' and PersonName__c=:twilioPersonName) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c ='Incoming SMS')) and (Account__c in: acctIds or Lead__c in: leadIds) and CreatedDate=Last_N_Days:2  order by CreatedDate desc];
        String twilioOtherPersonName = 'Paul'; //must change the logic based on the active person today
        String twilioNSWOtherPersonName = 'Dean';
        String twilioVICOtherPersonName = 'Sharon';
        String twilioNZOtherPersonName = 'Sina';
        String twilioQLDOtherPersonName = 'Gordon';
        List<PhoneCall__c> pcList = [select id,name,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where type__c=:twilioProfile and Read__c=false and ((Call_Type__c='Missed' and PersonName__c=:twilioPersonName) or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c='Missed' and PersonName__c=:twilioOtherPersonName) or (Call_Type__c ='Incoming SMS')) and (Account__c in: acctIds or Lead__c in: leadIds) and CreatedDate=Last_N_Days:6  order by CreatedDate desc];
        if(pcList.size()>0)
        {
            for(PhoneCall__c pc : pcList)
            {
                if(pc.Lead__c!=null && !mapMissedPhoneCall.containsKey(pc.Lead__c))
                    mapMissedPhoneCall.put(pc.Lead__c,pc);
                if(pc.Account__c!=null && !mapMissedPhoneCall.containsKey(pc.Account__c))
                    mapMissedPhoneCall.put(pc.Account__c,pc);
            }
        }
        
        //Incoming sms from smsMagic latestCommunicationByCust mapIncomingSMSMagic
        List<smagicinteract__smsMagic__c> incomingSMSMagic =  [select id,name,smagicinteract__PhoneNumber__c,smagicinteract__Lead__c,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,
                        smagicinteract__Direction__c,smagicinteract__deliveryStatus__c
                from smagicinteract__smsMagic__c  where smagicinteract__Direction__c='IN' and (smagicinteract__Account__c in: acctIds or smagicinteract__Lead__c in: leadIds) and CreatedDate=Last_N_Days:6 order by CreatedDate desc];
        if(incomingSMSMagic.size()>0)
        {
            for(smagicinteract__smsMagic__c pc : incomingSMSMagic)
            {
                if(pc.smagicinteract__Lead__c!=null && !mapIncomingSMSMagic.containsKey(pc.smagicinteract__Lead__c))
                    mapIncomingSMSMagic.put(pc.smagicinteract__Lead__c,pc);
                if(pc.smagicinteract__Account__c!=null && !mapIncomingSMSMagic.containsKey(pc.smagicinteract__Account__c))
                    mapIncomingSMSMagic.put(pc.smagicinteract__Account__c,pc);
            }
        }
        
        //R4K Latest Call or sms
        List<PhoneCall__c> pcR4KList = [select id,name,PersonName__c,Lead__c,Account__c,Call_Type__c,SMS_Message__c,Createddate,CreatedDateTime__c,Read__c from PhoneCall__c where Call_Type__c in ('Outgoing SMS','Outgoing') and (Account__c in: acctIds or Lead__c =: ldLst) and CreatedDate=Last_N_Days:3 order by CreatedDate desc];
        system.debug('pcR4KList: '+pcR4KList.size());
        if(pcR4KList.size()>0)
        {
            for(PhoneCall__c pc : pcR4KList)
            {
                if(pc.Lead__c!=null && !mapOutgoingPhoneCall.containsKey(pc.Lead__c))
                    mapOutgoingPhoneCall.put(pc.Lead__c,pc);
                if(pc.Account__c!=null && !mapOutgoingPhoneCall.containsKey(pc.Account__c))
                    mapOutgoingPhoneCall.put(pc.Account__c,pc);
            }
        }
        
        List<smagicinteract__smsMagic__c> smsList = [select id,name,smagicinteract__Lead__c,smagicinteract__SMSText__c,CreatedDate,smagicinteract__Account__c,smagicinteract__Direction__c from smagicinteract__smsMagic__c where (smagicinteract__Account__c in: acctIds or smagicinteract__Lead__c =: ldLst) and CreatedDate=Last_N_Days:14 order by CreatedDate desc];
        if(smsList.size()>0)
        {
            for(smagicinteract__smsMagic__c sm : smsList)
            {
                if(sm.smagicinteract__Lead__c!=null && !mapSMSMagic.containsKey(sm.smagicinteract__Lead__c))
                    mapSMSMagic.put(sm.smagicinteract__Lead__c,sm);
                if(sm.smagicinteract__Account__c!=null && !mapSMSMagic.containsKey(sm.smagicinteract__Account__c))
                    mapSMSMagic.put(sm.smagicinteract__Account__c,sm);
            }
        }
        ////////////////////////////////////////////////////
        
        //All List of Outgoing and Incoming from last 3 days
        Map<String,AggregateResult> mapAllPC = new Map<String,AggregateResult>();
        Map<String,Integer> mapAllSMS = new Map<String,Integer>();
        
        List<AggregateResult> allPCList = [select Lead__c,Account__c,Call_Type__c,count(id) from PhoneCall__c where (Call_Type__c in ('Outgoing SMS','Outgoing','Incoming','Incoming SMS') or (Call_Type__c='Missed' and PersonName__c=null) or (Call_Type__c='Missed' and PersonName__c=:twilioVICOtherPersonName) or (Call_Type__c='Missed' and PersonName__c=:twilioNZOtherPersonName) or (Call_Type__c='Missed' and PersonName__c=:twilioNSWOtherPersonName) or (Call_Type__c='Missed' and PersonName__c=:twilioQLDOtherPersonName)) and (Account__c in: acctIds or Lead__c =: ldLst) and CreatedDate=Last_N_Days:10 group by Lead__c,Account__c,Call_Type__c];
        system.debug('allPCList: '+allPCList.size());
        List<AggregateResult> allsmsList = [select smagicinteract__Lead__c,smagicinteract__Account__c,smagicinteract__Direction__c,count(id) from smagicinteract__smsMagic__c where (smagicinteract__Account__c in: acctIds or smagicinteract__Lead__c =: ldLst) and CreatedDate=Last_N_Days:10 group by smagicinteract__Lead__c,smagicinteract__Account__c,smagicinteract__Direction__c];
        //////////////////////////////////////////////////////
                        
        if(ldLst.size()>0 && terLstForBotUsers.size()>0)
        {
            Integer count=0;
            Map<String,String> mapHybridAccount = new Map<String,String>();
            for(Lead ld : ldLst)
            {
                //Get Lead Time difference
                Integer timesBotCalled = ld.No_of_times_Bot_Called__c==null ? 0 : Integer.valueOf(ld.No_of_times_Bot_Called__c);
                String stateMasterState = ld.Territory_Number__r.State_Master_State__c;
                String leadMedium = ld.Lead_Medium__c;
                String terShortName = ld.Territory_Number__r.Short_Name__c;
                Time terBotStartTime = ld.Territory_Number__r.Bot_Start_Time__c;
                Time terBotFinishTime = ld.Territory_Number__r.Bot_Finish_Time__c;
            
                Datetime currentTimeGMTVal = Datetime.now();
                Datetime nextBotCallDatetime = ld.Next_Bot_Call_Datetime__c;
                Datetime botCallDatetime = ld.Bot_Call_Datetime__c;
                Datetime leadCreatedDate = ld.CreatedDate;
                Datetime lastCallDatetime = botCallDatetime!=null ? botCallDatetime : leadCreatedDate;
                Long dt1Long = lastCallDatetime.getTime();
                Long dt2Long = currentTimeGMTVal.getTime();
                Long leadContactMilliseconds = dt2Long - dt1Long;
                Long leadContactSeconds = leadContactMilliseconds / 1000;
                Long leadContactMinutes = leadContactSeconds / 60;
                Long leadContactHours = leadContactMinutes / 60;
                
                Decimal totalCOGSActive = 0;
                Decimal totalPaidActive = 0;
                Boolean isHybridLinkOpened = ld.Hybrid_Link_Opened_Datetime__c!=null ? true : false;
                system.debug('#ProbableTerritory: '+ld.Probable_Territory__r.State_Master_State__c+' Id: '+ld.Probable_Territory__c );
                count++;
                
                //Long days = hours / 24;
                system.debug('milliseconds: '+leadContactmilliseconds+' minutes: '+leadContactminutes+' leadContactHours: '+leadContactHours);
                /////////////////////////////////////////
                
                String botCallStatus = ld.Bot_Call_Status__c;
                
                    LeadWrapper lwrap  = new LeadWrapper();
                    lwrap.ld = ld;
                    lwrap.isHybrid = ld.Rep_Responsible_For_Converting_Lead__c.contains('Hybrid') ? true : false;
                    
                    lwrap.isDuplicate = (ld.Account__c==null || (ld.Account__c!=null && mapHybridAccount.get(ld.Account__c)==null)) ? false : true;
                    if(ld.Account__c!=null && mapHybridAccount.get(ld.Account__c)==null)
                        mapHybridAccount.put(ld.Account__c,ld.Account__c);
                    
                    if(lwrap.isHybrid && !mapHybridAttachment.isEmpty())
                        lwrap.latestDocLinkAttachment = mapHybridAttachment.get(ld.Account__c);
                    if(lwrap.isHybrid && !mapAppStatus.isEmpty())
                        lwrap.appStatus = mapAppStatus.get(ld.Account__c);
                    if(lwrap.isHybrid && !mapMissedPhoneCall.isEmpty())
                    {
                        lwrap.latestMissedPhoneCall = mapMissedPhoneCall.get(ld.Account__c);
                        if(lwrap.latestMissedPhoneCall!=null)
                        {
                            PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                            cw.leadId = ld.Id;
                            cw.accountId = ld.Account__c;
                            cw.callType = lwrap.latestMissedPhoneCall.Call_Type__c;
                            cw.smsText = lwrap.latestMissedPhoneCall.SMS_Message__c;
                            cw.createdDate = lwrap.latestMissedPhoneCall.Createddate;
                            lwrap.latestCommunicationByCust = cw;
                        }
                    }
                    lwrap.autoDeclineReason=ld.Auto_Decline__c ? ld.Reason_For_Auto_Decline__c : null;
                    if(lwrap.isHybrid && ld.Account__r.Equifax_Enquiry_DateTime__c!=null && ld.Account__r.Equifax_Enquiry_DateTime__c.addDays(21) > Datetime.now())
                    {
                        String centrelinkBenefit = ld.Account__r.Centrelink_Benefit__c;
                        Decimal equifaxScore = ld.Account__r.Score_of_Equifax__c;
                        Decimal rentalDefaults = ld.Account__r.Equifax_No_of_Unpaid_Default_Rental__c;
                        Decimal nonRentalDefaults = ld.Account__r.Equifax_No_of_Unpaid_Default_NonRental__c;
                        String autoDeclineReason = '';
                        if(centrelinkBenefit != null && (centrelinkBenefit.containsIgnoreCase('Newstart Allowance') || centrelinkBenefit.containsIgnoreCase('Youth Allowance') || centrelinkBenefit.containsIgnoreCase('JobSeeker')))
                        {
                            autoDeclineReason= (equifaxScore!=null && equifaxScore<=400) ?  autoDeclineReason+'\n'+'Equifax Score - '+equifaxScore+'/400' : autoDeclineReason;
                            autoDeclineReason= (rentalDefaults!=null && rentalDefaults>=1) ?  autoDeclineReason+'\n'+'No. of Rental Defaults - '+rentalDefaults+'/1' : autoDeclineReason;
                            autoDeclineReason= (nonRentalDefaults!=null && nonRentalDefaults>=1) ?  autoDeclineReason+'\n'+'No. of Non Rental Defaults - '+nonRentalDefaults+'/1' : autoDeclineReason;
                        }
                        else
                        {
                            autoDeclineReason= (equifaxScore!=null && equifaxScore<=200) ?  autoDeclineReason+'\n'+'Equifax Score - '+equifaxScore+'/200' : autoDeclineReason;
                            autoDeclineReason= (rentalDefaults!=null && rentalDefaults>=2) ?  autoDeclineReason+'\n'+'No. of Rental Defaults - '+rentalDefaults+'/2' : autoDeclineReason;
                            autoDeclineReason= (nonRentalDefaults!=null && nonRentalDefaults>=3) ?  autoDeclineReason+'\n'+'No. of Non Rental Defaults - '+nonRentalDefaults+'/3' : autoDeclineReason;
                        }
                            lwrap.autoDeclineReason = lwrap.autoDeclineReason!=null ? lwrap.autoDeclineReason + autoDeclineReason : autoDeclineReason;
                    }
                    if(lwrap.isHybrid && !mapIncomingSMSMagic.isEmpty())
                    {
                        if(mapIncomingSMSMagic.get(ld.Account__c)!=null && (lwrap.latestCommunicationByCust==null || (lwrap.latestCommunicationByCust!=null && mapIncomingSMSMagic.get(ld.Account__c).CreatedDate > lwrap.latestCommunicationByCust.createdDate)))
                        {
                            PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                            cw.leadId = ld.Id;
                            cw.accountId = ld.Account__c;
                            cw.callType = 'Incoming SMS';
                            cw.smsText = mapIncomingSMSMagic.get(ld.Account__c).smagicinteract__SMSText__c;
                            cw.createdDate = mapIncomingSMSMagic.get(ld.Account__c).Createddate;
                            lwrap.latestCommunicationByCust = cw;
                        }
                    }
                    
                    if(lwrap.isHybrid)
                    {
                        totalCOGSActive = ld.Account__r.Total_COGS_Active__c;
                        totalPaidActive = ld.Account__r.Total_Paid_Amount_Active_Only__c;
                    }
                    else if(ld.Probable_Account__c!=null)
                    {
                        totalCOGSActive = ld.Probable_Account__r.Total_COGS_Active__c;
                        totalPaidActive = ld.Probable_Account__r.Total_Paid_Amount_Active_Only__c;
                    }
                    if(!mapMissedPhoneCall.isEmpty())
                    {
                        if(lwrap.latestMissedPhoneCall!=null)
                            lwrap.latestMissedPhoneCall = mapMissedPhoneCall.get(ld.Id)!=null && lwrap.latestMissedPhoneCall.CreatedDate < mapMissedPhoneCall.get(ld.Id).CreatedDate ? mapMissedPhoneCall.get(ld.Id) : null;
                        else
                            lwrap.latestMissedPhoneCall = mapMissedPhoneCall.get(ld.Id);
                        
                        if(lwrap.latestMissedPhoneCall!=null)
                        {    
                            PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                            cw.leadId = ld.Id;
                            cw.accountId = ld.Account__c;
                            cw.callType = lwrap.latestMissedPhoneCall.Call_Type__c;
                            cw.smsText = lwrap.latestMissedPhoneCall.SMS_Message__c;
                            cw.createdDate = lwrap.latestMissedPhoneCall.Createddate;
                            lwrap.latestCommunicationByCust = cw;
                        }
                    }
                    
                    if(!mapIncomingSMSMagic.isEmpty() && mapIncomingSMSMagic.get(ld.Id)!=null && (lwrap.latestCommunicationByCust==null || (lwrap.latestCommunicationByCust!=null && mapIncomingSMSMagic.get(ld.Id).CreatedDate > lwrap.latestCommunicationByCust.createdDate)))
                    {
                        PhoneCallTrackerController.ConversationsWrapper cw = new PhoneCallTrackerController.ConversationsWrapper();
                        cw.leadId = ld.Id;
                        cw.accountId = ld.Account__c;
                        cw.callType = 'Incoming SMS';
                        cw.smsText = mapIncomingSMSMagic.get(ld.Id).smagicinteract__SMSText__c;
                        cw.createdDate = mapIncomingSMSMagic.get(ld.Id).Createddate;
                        lwrap.latestCommunicationByCust = cw;
                    }
                    
                    if(lwrap.latestCommunicationByCust!=null)
                    {
                        Long dt3Long = lwrap.latestCommunicationByCust.Createddate.getTime();
                        Long milliseconds = dt2Long - dt3Long;
                        Long seconds = milliseconds / 1000;
                        Long minutes = seconds / 60;
                        lwrap.isLatestCommunicationByCustHighlighted = minutes <=10 ? true : false;
                        lwrap.latestCommunicationByCust.CreatedDate = lwrap.latestCommunicationByCust.CreatedDate + offset;
                    }
                    
                    ///////////////////////Get latest communication
                    
                    //Get Outgoing PhoneCall
                    if(lwrap.isHybrid && !mapOutgoingPhoneCall.isEmpty())
                        lwrap.latestPhoneCallFromR4K = mapOutgoingPhoneCall.get(ld.Account__c);
                    if(!mapOutgoingPhoneCall.isEmpty())
                    {
                        if(lwrap.latestPhoneCallFromR4K!=null)
                            lwrap.latestPhoneCallFromR4K = mapOutgoingPhoneCall.get(ld.Id)!=null && lwrap.latestPhoneCallFromR4K.CreatedDate < mapOutgoingPhoneCall.get(ld.Id).CreatedDate ? mapOutgoingPhoneCall.get(ld.Id) : lwrap.latestPhoneCallFromR4K;
                        else
                            lwrap.latestPhoneCallFromR4K = mapOutgoingPhoneCall.get(ld.Id);
                    }
                    ////////////////////////////
                    
                    //Get Outgoing SMSMagic
                    if(lwrap.isHybrid && !mapSMSMagic.isEmpty())
                    {
                        //system.debug('###HybridAccount: '+mapSMSMagic.get(ld.Account__c));
                        lwrap.latestSMSMagicFromR4K = mapSMSMagic.get(ld.Account__c);
                    }
                    if(!mapSMSMagic.isEmpty())
                    {
                        if(lwrap.latestSMSMagicFromR4K!=null)
                        {
                            //system.debug('hybridCreatedDate: '+lwrap.latestSMSMagicFromR4K.CreatedDate +' leadSMSCreatedDate: '+mapSMSMagic.get(ld.Id).CreatedDate);
                            lwrap.latestSMSMagicFromR4K = mapSMSMagic.get(ld.Id)!=null && lwrap.latestSMSMagicFromR4K.CreatedDate < mapSMSMagic.get(ld.Id).CreatedDate ? mapSMSMagic.get(ld.Id) : lwrap.latestSMSMagicFromR4K;
                        }
                        else
                            lwrap.latestSMSMagicFromR4K = mapSMSMagic.get(ld.Id);
                    }
                    ////////////////////////////
                    
                    //Get the latest communication
                    CommunicationWrapper cw;
                    if(lwrap.latestPhoneCallFromR4K!=null && lwrap.latestSMSMagicFromR4K!=null)
                    {
                        if(lwrap.latestPhoneCallFromR4K.CreatedDate > lwrap.latestSMSMagicFromR4K.CreatedDate)
                        {
                            cw = new CommunicationWrapper();
                            cw.id = lwrap.latestPhoneCallFromR4K.id;
                            if(lwrap.latestPhoneCallFromR4K.PersonName__c!=null && lwrap.latestPhoneCallFromR4K.PersonName__c=='Rene')
                                cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c=='Outgoing' ? 'Outgoing Bot' : 'Outgoing Bot SMS';
                            else
                                cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c;
                            cw.smsMessage = lwrap.latestPhoneCallFromR4K.SMS_Message__c;
                            cw.CreatedDate = lwrap.latestPhoneCallFromR4K.CreatedDate;
                        }else{
                            cw = new CommunicationWrapper();
                            cw.id = lwrap.latestSMSMagicFromR4K.id;
                            cw.type = 'Outgoing SMS';
                            cw.smsMessage = lwrap.latestSMSMagicFromR4K.smagicinteract__SMSText__c;
                            cw.CreatedDate = lwrap.latestSMSMagicFromR4K.CreatedDate;
                        }
                    }
                    else if(lwrap.latestPhoneCallFromR4K!=null){    
                        cw = new CommunicationWrapper();
                        cw.id = lwrap.latestPhoneCallFromR4K.id;
                        if(lwrap.latestPhoneCallFromR4K.PersonName__c!=null && lwrap.latestPhoneCallFromR4K.PersonName__c=='Rene')
                            cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c=='Outgoing' ? 'Outgoing Bot' : 'Outgoing Bot SMS';
                        else
                            cw.type = lwrap.latestPhoneCallFromR4K.Call_Type__c;
                        cw.smsMessage = lwrap.latestPhoneCallFromR4K.SMS_Message__c;
                        cw.CreatedDate = lwrap.latestPhoneCallFromR4K.CreatedDate;
                    }
                    else if(lwrap.latestSMSMagicFromR4K!=null){    
                        cw = new CommunicationWrapper();
                        cw.id = lwrap.latestSMSMagicFromR4K.id;
                        cw.type = 'Outgoing SMS';
                        cw.smsMessage = lwrap.latestSMSMagicFromR4K.smagicinteract__SMSText__c;
                        cw.CreatedDate = lwrap.latestSMSMagicFromR4K.CreatedDate;
                    }
                    
                    if(cw!=null && cw.CreatedDate!=null)
                    {
                        lWrap.priorityActivityDate = cw.CreatedDate;
                        system.debug('cw: '+cw);
                        Long dt3Long = cw.CreatedDate.getTime();
                        Long leadContactMilliseconds2 = dt2Long - dt3Long;
                        Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                        Long leadContactMinutes2 = leadContactSeconds2 / 60;
                        lwrap.lastActivityInMins = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 0;
                        lwrap.lastActivityInDayFormatted = convertMinutesToDays(lwrap.lastActivityInMins);
                        //system.debug('lwrap.lastActivityInMins: '+lwrap.lastActivityInMins+' lwrap.lastActivityInDayFormatted: '+lwrap.lastHybridActivityInDayFormatted);
                    }
                    lwrap.latestCommunicationFromR4K = cw;
                    //////////////////////////////////
                    //////////////////////////////////////////////////////
                    
                    //Get latest activity time by hybrids
                    if(lwrap.isHybrid)
                    {
                        Datetime lastHybridActivityTime = ld.Account__r.Hybrid_Link_Allocation_Datetime__c!=null ? ld.Account__r.Hybrid_Link_Allocation_Datetime__c : ld.Hybrid_Link_Allocation_Datetime__c;
                        if(lwrap.latestDocLinkAttachment!=null)
                        {
                            lastHybridActivityTime = lwrap.latestDocLinkAttachment.CreatedDate;
                        }
                        if(lastHybridActivityTime!=null)
                        {
                            if(lWrap.priorityActivityDate==null || (lWrap.priorityActivityDate!=null && lastHybridActivityTime > lWrap.priorityActivityDate))
                                lWrap.priorityActivityDate = lastHybridActivityTime;
                            Long dt3Long = lastHybridActivityTime.getTime();
                            Long leadContactMilliseconds2 = dt2Long - dt3Long;
                            Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                            Long leadContactMinutes2 = leadContactSeconds2 / 60;
                            lWrap.lastHybridActivityInMins = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 0;
                            lWrap.lastHybridActivityInDayFormatted = convertMinutesToDays(lWrap.lastHybridActivityInMins);
                        }
                    }
                    ///////////////////////////
                    
                    if(count<=350)
                    {
                    //Get all In/Out Communication count
                    Integer allOutgoingComm = 0;
                    Integer allIncomingComm = 0;
                    Integer allIncomingSMS = 0;
                    lWrap.allOutgoingComm = 0;
                    lWrap.allIncomingComm = 0;
                    lWrap.allIncomingSMS = 0;
                    if(allPCList.size()>0)
                    {
                    for(AggregateResult ar:allPCList)
                    {
                        String pcType = (String)ar.get('Call_Type__c');
                        String pcLeadId = (String)ar.get('Lead__c');
                        String pcAcctId = (String)ar.get('Account__c');
                        Integer pcCount = ar.get('expr0')!=null && ar.get('expr0')!='' ? (Integer)ar.get('expr0') : 0;
                        if(pcType=='Incoming' || pcType=='Incoming SMS' || pcType=='Missed')
                        {  
                            if((lWrap.isHybrid && ((pcAcctId!=null && pcLeadId!=null && pcLeadId==ld.Id) || (pcAcctId!=null && pcAcctId==ld.Account__c) || (pcLeadId!=null && pcLeadId==ld.Id)))|| (!lWrap.isHybrid && (pcLeadId!=null && pcLeadId==ld.Id)))
                            {
                                allIncomingComm = allIncomingComm + pcCount;
                                if(pcType=='Incoming SMS')
                                    allIncomingSMS = allIncomingSMS + pcCount;
                            }
                            
                        }else{
                            if((lWrap.isHybrid && ((pcAcctId!=null && pcLeadId!=null && pcLeadId==ld.Id) || (pcAcctId!=null && pcAcctId==ld.Account__c) || (pcLeadId!=null && pcLeadId==ld.Id)))|| (!lWrap.isHybrid && (pcLeadId!=null && pcLeadId==ld.Id)))
                                allOutgoingComm = allOutgoingComm + pcCount;
                        }
                    }
                    }
                    //system.debug(ld.Name+'##allOutgoingComm1: '+allOutgoingComm);
                    
                    if(allsmsList.size()>0)
                    {
                    for(AggregateResult ar:allsmsList)
                    {
                        String smLeadId = (String)ar.get('smagicinteract__Lead__c');
                        String smAcctId = (String)ar.get('smagicinteract__Account__c');
                        String smType = (String)ar.get('smagicinteract__Direction__c');
                        Integer smCount = ar.get('expr0')!=null && ar.get('expr0')!='' ? (Integer)ar.get('expr0') : 0;
                        
                        if(smType=='IN')
                        {
                            if((lWrap.isHybrid && ((smAcctId!=null && smLeadId!=null && smLeadId==ld.Id) || (smAcctId!=null && smAcctId==ld.Account__c) || (smLeadId!=null && smLeadId==ld.Id)))|| (!lWrap.isHybrid && (smLeadId!=null && smLeadId==ld.Id)))
                            {
                                allIncomingComm = allIncomingComm + smCount;
                                allIncomingSMS = allIncomingSMS + smCount;
                            }
                        }
                        else
                        {
                            if((lWrap.isHybrid && ((smAcctId!=null && smLeadId!=null && smLeadId==ld.Id) || (smAcctId!=null && smAcctId==ld.Account__c) || (smLeadId!=null && smLeadId==ld.Id)))|| (!lWrap.isHybrid && (smLeadId!=null && smLeadId==ld.Id)))
                                allOutgoingComm = allOutgoingComm + smCount;
                        }
                    }
                    }
                    system.debug('allIncomingComm: '+allIncomingComm + ' allOutgoingComm: '+allOutgoingComm+' allIncomingSMS: '+allIncomingSMS );
                    lWrap.allOutgoingComm = allOutgoingComm;
                    lWrap.allIncomingComm = allIncomingComm;
                    lWrap.allIncomingSMS = allIncomingSMS;
                    ////////////////////////////////////////////////////////////
                    }
                    
                    //LatestCall time
                    if((botCallDatetime!=null && lWrap.priorityActivityDate==null) || (botCallDatetime!=null && lWrap.priorityActivityDate!=null && botCallDatetime > lWrap.priorityActivityDate))
                    {
                        if(lWrap.priorityActivityDate==null)
                            lWrap.priorityActivityDate = botCallDatetime;
                        Long dt3Long = botCallDatetime.getTime();
                        Long leadContactMilliseconds2 = dt2Long - dt3Long;
                        Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                        Long leadContactMinutes2 = leadContactSeconds2 / 60;
                        lWrap.lastActivityInMins = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 0;
                        lWrap.lastActivityInDayFormatted = convertMinutesToDays(lWrap.lastActivityInMins);
                    }
                    
                    if((lWrap.priorityActivityDate==null && lwrap.latestMissedPhoneCall!=null) || (lWrap.priorityActivityDate!=null && lwrap.latestMissedPhoneCall!=null && lwrap.latestMissedPhoneCall.CreatedDate > lWrap.priorityActivityDate))
                        lWrap.priorityActivityDate=lwrap.latestMissedPhoneCall.CreatedDate; 
                    /*if(lWrap.priorityActivityDate==null || (lWrap.priorityActivityDate!=null && ld.LastModifiedDate > lWrap.priorityActivityDate))
                        lWrap.priorityActivityDate=ld.LastModifiedDate;  */
                    if(lWrap.priorityActivityDate==null)
                        lWrap.priorityActivityDate=ld.LastModifiedDate;
                    ////////////////////////////////////////////////
                    lwrap.contactMinutes = leadContactMinutes;
                    //lwrap.isSelectedToCall = !mapWrapSelection.isEmpty() ? mapWrapSelection.get(ld.Id) : false;
                    lwrap.isSelectedToCall = false;
                    lWrap.isLocked = true;
                    lWrap.isAutomationOn = true;
                    lWrap.minutesToGetUnlocked = 30;
                    Datetime leadCreatedDatetimeWithBuffer = leadCreatedDate.addMinutes(30);
                    Datetime maxOfNextCallDateAndCreatedDateBuffer = nextBotCallDatetime!=null? nextBotCallDatetime : botCallDatetime!=null ? botCallDatetime.addMinutes(30) : leadCreatedDatetimeWithBuffer;
                    if(maxOfNextCallDateAndCreatedDateBuffer!=null)
                    {
                        Long dt3Long = maxOfNextCallDateAndCreatedDateBuffer.getTime();
                        Long leadContactMilliseconds2 = dt3Long - dt2Long;
                        Long leadContactSeconds2 = leadContactMilliseconds2 / 1000;
                        Long leadContactMinutes2 = leadContactSeconds2 / 60;
                        Long leadContactHours2 = leadContactMinutes2 / 60;
                        lWrap.minutesToGetUnlocked = leadContactMinutes2 >= 0? Integer.valueOf(leadContactMinutes2): 45;
                    } 
                    //system.debug('botCallStatus: '+botCallStatus+' leadContactMinutes: '+leadContactMinutes);
                    
                    //Check the business hours
                    Decimal gmtVal = 11; //daylight saving 10-VIC, 9.5-SA, 12-NZ 10-QLD 8-WA //After October 11-VIC, 10.5-SA, 13-NZ 10-QLD 8-WA
                    Time currentLocalTime = currentTimeGMTVal.timeGMT().addHours(11);
                    if(stateMasterState=='SA')
                    {
                        currentLocalTime = currentTimeGMTVal.timeGMT().addHours(10).addMinutes(30);
                    }
                    else if(stateMasterState=='NZ')
                    {
                        currentLocalTime = currentTimeGMTVal.timeGMT().addHours(13);
                    }
                    Integer currentLocalHour = currentLocalTime.hour();
                    Integer currentLocalMinute = currentLocalTime.minute();
                    system.debug('currentLocalTime: '+currentLocalTime+' currentLocalHour: '+currentLocalHour+' terShortName: '+terShortName);
                    
                    if(terBotStartTime!=null && terBotFinishTime!=null)
                    {
                        Integer terBotStartHour = terBotStartTime.hour();
                        Integer terBotFinshHour = terBotFinishTime.hour();
                        
                        Integer terBotFinishMinute = terBotFinishTime.minute();
                        
                        system.debug('terBotStartHour: '+terBotStartHour+' terBotFinshHour: '+terBotFinshHour+' currentLocalHour: '+currentLocalHour+' terBotFinishMinute: '+terBotFinishMinute+' currentLocalMinute: '+currentLocalMinute);
                        if(currentLocalHour == terBotFinshHour && currentLocalMinute<=terBotFinishMinute)
                            isValidTimeToCall = true;
                        else if(currentLocalHour>=terBotStartHour && currentLocalHour<=terBotFinshHour && currentLocalHour != terBotFinshHour)
                            isValidTimeToCall = true;
                        system.debug('isValidTimeToCall: '+isValidTimeToCall);
                    }
                    ////////////////////////////////////////
                    //system.debug('currentTimeGMTVal: '+currentTimeGMTVal+' nextBotCallDatetime: '+nextBotCallDatetime);
                    
                    if(timesBotCalled>=2 || (botCallDatetime!=null && (botCallStatus=='Call Answered by CLO' || botCallStatus=='Call Answered by WeCare' || botCallStatus=='Missed call by CLO' || botCallStatus=='Missed call by WeCare' || botCallStatus=='Customer Opted out from Rene')) 
                        || (nextBotCallDatetime!=null && nextBotCallDatetime.addMinutes(1)<currentTimeGMTVal) 
                        || (lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. Completed') || (lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. PUA - Approved') || (lwrap.isHybrid && lwrap.latestDocLinkAttachment!=null && lwrap.latestDocLinkAttachment.CreatedDate.addMinutes(wipParkDuration)<currentTimeGMTVal ) || !isValidTimeToCall || leadMedium=='Internal Marketing' || (twilioProfile=='R4K LICENSING' && (ld.Last_Automated_Bot_Message__c=='PIS' || ld.Last_Automated_Bot_Message__c=='NA1SMS' || ld.Last_Automated_Bot_Message__c=='NA2SMS' || ld.Last_Automated_Bot_Message__c=='NA3SMS' || ld.Last_Automated_Bot_Message__c=='DNC')))
                        lWrap.isLocked = false;
                    if((twilioProfile=='Darranda CLO' || twilioProfile=='NSW CLO' || twilioProfile=='NZ CLO' || twilioProfile=='QLD CLO' || twilioProfile=='Helpdesk' || twilioProfile=='R4K LICENSING') && ((botCallStatus=='Call Answered by CLO' || botCallStatus=='Call Answered by WeCare' || botCallStatus=='Missed call by CLO' || botCallStatus=='Missed call by WeCare' || botCallStatus=='Customer Opted out from Rene') || (lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. Completed' || lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. PUA - Approved' || lwrap.isHybrid && ld.Hybrid_link_Status__c=='2.1 Pending Contacting Referees') || (ld.Hybrid_link_Status__c=='3. Follow-up Required') || (ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && timesBotCalled>1 && isValidTimeToCall) || (ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && !isValidTimeToCall)  || (lWrap.allIncomingComm>0) || ld.Last_Incoming_SMS_DateTime__c!=null || (lWrap.allIncomingSMS>0) || ld.Automation_OutCome__c=='Buyout' || ld.Automation_OutCome__c=='Unlock' || leadMedium=='Internal Marketing' || leadMedium=='Direct Call' || ld.Unlock_Datetime__c!=null && (twilioProfile=='R4K LICENSING' && (ld.Last_Automated_Bot_Message__c=='PIS' || ld.Last_Automated_Bot_Message__c=='NA1SMS' || ld.Last_Automated_Bot_Message__c=='NA2SMS' || ld.Last_Automated_Bot_Message__c=='NA3SMS' || ld.Last_Automated_Bot_Message__c=='DNC'))))
                    {
                        lWrap.isAutomationOn = false;
                        paUnlockCount++;
system.debug('##unlocked: '+lwrap.ld.Id);
                        if(botCallStatus=='Call Answered by CLO' || botCallStatus=='Call Answered by WeCare' || botCallStatus=='Missed call by CLO' || botCallStatus=='Missed call by WeCare' || botCallStatus=='Customer Opted out from Rene')
                            lWrap.unlockReason = botCallStatus;
                        else if(lwrap.isHybrid && ld.Hybrid_link_Status__c=='1. Completed')
                            lWrap.unlockReason = 'Completed Hybrid';
                        else if(lwrap.isHybrid && ld.Hybrid_link_Status__c=='2.1 Pending Contacting Referees')
                            lWrap.unlockReason = 'Pending Contacting Referees';
                        else if(ld.Hybrid_link_Status__c=='3. Follow-up Required')
                            lWrap.unlockReason = 'Follow-up Required';
                        else if(ld.Automation_OutCome__c=='Buyout')
                            lWrap.unlockReason = 'Buyout Customer';
                        else if(leadMedium=='Internal Marketing')
                            lWrap.unlockReason = 'Internal Marketing';
                        else if(leadMedium=='Direct Call')
                            lWrap.unlockReason = 'Direct Call';
                        else if(ld.Automation_OutCome__c=='Unlock')
                            lWrap.unlockReason = 'Manual Unlock';
                        else if(lWrap.allIncomingSMS>0 || ld.Last_Incoming_SMS_DateTime__c!=null)
                            lWrap.unlockReason = 'Incoming SMS';
                        else if(ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && totalCOGSActive > totalPaidActive)
                            lWrap.unlockReason = 'BreakEven - COGS>Paid';
                        else if(ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0 && totalPaidActive > totalCOGSActive )
                            lWrap.unlockReason = 'BreakEven - Paid>COGS';
                        else if(ld.Account__c!=null && ld.Account__r.No_of_Agreements__c > 0)
                            lWrap.unlockReason = 'Existing Customer';    
                        else if(lWrap.allIncomingComm>0)
                            lWrap.unlockReason = 'Missed / Incoming Comm';
                        else
                            lWrap.unlockReason='Unlocked';
                    }
                    
                    lWrap.botMedium='CLO call';
                    if(lWrap.isAutomationOn && isValidTimeToCall)
                    {
                        if(botCallDatetime!=null && botCallStatus!='SMS Followup' && nextBotCallDatetime==null && timesBotCalled==1)
                        {
                            system.debug('##BotSMS: '+ld.Name+' - ');
                            lWrap.botMedium='Bot sms';
                            if(leadContactMinutes>=1)
                                leadsToSMS.add(ld.Id);
                        }
                        else{
                            lWrap.botMedium='Bot call';
                            
                            system.debug('##BotCalled for 2nd time after sms followup: '+ld.Name+' - '+(nextBotCallDatetime!=null && currentTimeGMTVal>=nextBotCallDatetime && timesBotCalled==1) +' ##Botcalled after 30 minutes: '+(timesBotCalled==0 && nextBotCallDatetime==null && leadContactMinutes>=30) +' timesBotCalled: '+timesBotCalled);
                            if((nextBotCallDatetime!=null && currentTimeGMTVal>=nextBotCallDatetime && timesBotCalled==1) || (timesBotCalled==0 && nextBotCallDatetime==null && leadContactMinutes>=30) || (botCallDatetime!=null && botCallStatus=='SMS Followup'  && nextBotCallDatetime==null && leadContactMinutes>15))
                                leadsToCall.add(ld.Id);
                        }   
                    }
                    /*else if(!lWrap.isLocked && isValidTimeToCall)
                    {
                        //Send all automated bot SMS
                        //lWrap.lastActivityInMins
                        ///////////////////////////////////
                    }*/
                    system.debug('leadPriorityActivityDate: '+lwrap.priorityActivityDate);
                    if(lWrap.isAutomationOn == false || twilioProfile=='Helpdesk' || testUser=='Helpdesk' || twilioProfile=='NZ CLO')
                    //if(lWrap.isAutomationOn == false)
                    {
                        leadWrapLst.add(lwrap);
                        if(lWrap.isAutomationOn == false)
                        {
                            Lead ldUnlock = new Lead();
                            ldUnlock.Id = lWrap.ld.Id;
                            ldUnlock.Unlock_Datetime__c = Datetime.now();
                            ldsToUnlock.add(ldUnlock);
                        }
                        else
                        {
                            Lead ldUnlock = new Lead();
                            ldUnlock.Id = lWrap.ld.Id;
                            ldUnlock.Unlock_Datetime__c = null;
                            ldsToUnlock.add(ldUnlock);
                        }
                    }
            }
        }
        
        ////////Remove duplicate converted Leads(
        List<LeadWrapper> uniqueLeadLst = new List<LeadWrapper>();
        if(leadWrapLst.size()>0)
        {
            for(LeadWrapper lw: leadWrapLst)
            {
                if(!lw.isDuplicate)
                {
                    uniqueLeadLst.add(lw);
                }
            }
            if(uniqueLeadLst.size()>0)
            {
                leadWrapLst = new List<LeadWrapper>();
                leadWrapLst.addAll(uniqueLeadLst);
            }
                    
        }
        /*if(leadWrapLst.size()>0)
        {
            for(Integer i=0;i<leadWrapLst.size(); i++)
            {
                system.debug('index : '+i+' -- '+leadWrapLst[i].ld.Name);
                if(leadWrapLst[i].isDuplicate)
                {
                    system.debug('removeIndex : '+i+' -- '+leadWrapLst[i].ld.Name);
                    leadWrapLst.remove(i);
                }
            }
        }*/ 
        /////////////////////////////////////////////////////////////////////
        
        leadWrapLst.sort();
        if(ldsToUnlock.size()>0)
            update ldsToUnlock;
        system.debug('leadsToCall: '+leadsToCall+' leadsToSMS: '+leadsToSMS+' isValidTimeToCall: '+isValidTimeToCall);
        
        
        
        /*if(twilioProfile=='NZ CLO')
        {
        if(leadsToCall.size()>0)
            MasterBotController.followUpLead(leadsToCall,'call');
        if(leadsToSMS.size()>0)
            MasterBotController.followUpLead(leadsToSMS,'sms');
        }*/
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','getUnAssignedLeads',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public List<Object> getPhoneCalls(String twilioProfile, String currentPerson, Set<String> pendingLeadIds, Set<String> pendingAccountIds, String type)
{
    List<Object> missedConversations = new List<Object>();
    List<PhoneCall__c> recentPhoneCalls = [select id, name, Call_Type__c,SMS_Status__c, SMS_Message__c,Call_time_seconds__c,CreatedDate,CreatedDateTime__c,Call_Forwarded_To__c,Medium__c,
                                            Phone_Recording__c,Type__c,PersonName__c,Account__c,Account__r.Name,Lead__c,Lead__r.Name,Employee__c,Employee__r.Name,Mobile__c,CallStartDateTime__c,FinishDateTime__c,Lead__r.Account__c,Lead__r.Probable_Account__c,
                                            Lead__r.Account__r.OwnerId,Lead__r.Probable_Account__r.OwnerId,Lead__r.OwnerId,Account__r.OwnerId,
                                            Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Lead__r.Account__r.Enquiry_Status__c,Account__r.Enquiry_Status__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.Account__r.Rep_Responsible_For_Converting_Lead__r.Name,Account__r.Rep_Responsible_For_Converting_Lead__c,Lead__r.SMS_Mobile__c,Account__r.SMS_Mobile__c,
                                            Lead__r.Probable_Territory__r.State_Master_State__c,Account__r.Probable_Territory__r.State_Master_State__c
                                            from PhoneCall__c
                                            where type__c=:twilioProfile and ((Call_Type__c='Missed' and PersonName__c=:currentPerson) or (Call_Type__c='Missed' and PersonName__c=null)) and 
                                            Read__c=false and CreatedDate=Last_N_Days:6 AND
                                            (Lead__c in :pendingLeadIds OR Account__c in :pendingAccountIds) 
                                            order by CreatedDate desc];
    for(PhoneCall__c pc : recentPhoneCalls){
        missedConversations.add((Object) pc);
    }

    List<smagicinteract__smsMagic__c> recentSMSs = [SELECT Id,smagicinteract__Lead__c,smagicinteract__Account__c,smagicinteract__PhoneNumber__c,CreatedDate 
                                                    FROM smagicinteract__smsMagic__c 
                                                    WHERE (smagicinteract__Lead__c in :pendingLeadIds OR smagicinteract__Account__c in :pendingAccountIds) AND 
                                                    PB_SMS_Text__c = 'CALL NOW' AND Read__c = false and CreatedDate=Last_N_Days:6 order by CreatedDate desc];
    for(smagicinteract__smsMagic__c pc : recentSMSs){
        missedConversations.add((Object) pc);
    }
    return missedConversations;
}

public void getMissedCalls(){
    leadWrapLst = new List<LeadWrapper>();
    Set<String> ldIds = new Set<String>();
    Set<String> acctIds = new Set<String>();
    List<Lead> ldLst = getPendingLeads(region,null);
    String currentPerson = ApexPages.CurrentPage().getParameters().get('tp');

    Map<String,Lead> mobLeadMap = new Map<String,Lead>();
    if(ldLst.size()>0)
    {
        for(Lead ld : ldLst)
        {
            ldIds.add(ld.Id);
            acctIds.add(ld.Account__c);

            if(ld.IsConverted || !mobLeadMap.containsKey(ld.SMS_Mobile__c)){
                mobLeadMap.put(ld.SMS_Mobile__c, ld);
            }
            System.debug('##ldMobile ' + ld.SMS_Mobile__c);
        }
    }
    System.debug('mobLeadMap ' + mobLeadMap.keySet());

    //group phone calls based on mobile number
    List<PhoneCall__c> phoneCalls = new List<PhoneCall__c>();
    List<smagicinteract__smsMagic__c> incomingSMSs = new List<smagicinteract__smsMagic__c>();
    List<Object> missedCallObjs = getPhoneCalls(twilioProfile,currentPerson,ldIds,acctIds,type);
    for(Object obj : missedCallObjs){
        if(obj instanceof PhoneCall__c){
            phoneCalls.add((PhoneCall__c)obj);
        }else if(obj instanceof smagicinteract__smsMagic__c){
            incomingSMSs.add((smagicinteract__smsMagic__c)obj);
        }
    }

    Map<String,LeadWrapper> mobLeadWrapMap = new Map<String,LeadWrapper>();
    for(PhoneCall__c pc : phoneCalls){
        if(mobLeadWrapMap.containsKey(pc.Mobile__c)){
            System.debug('##pcMobile ' + pc.Mobile__c);
            mobLeadWrapMap.get(pc.Mobile__c).missedCalls.add(pc);
            mobLeadWrapMap.get(pc.Mobile__c).missedCallCount = (mobLeadWrapMap.get(pc.Mobile__c).missedCallCount + 1);
        }else{
            System.debug('##pcMobile ' + pc.Mobile__c);
            LeadWrapper wrap = new LeadWrapper();
            wrap.missedCallCount = 1;
            wrap.missedCalls = new List<PhoneCall__c>{pc};
            wrap.incomingSMSs = new List<smagicinteract__smsMagic__c>();
            wrap.latestMissedPhoneCall = pc;
            wrap.ld = (mobLeadMap.containsKey(pc.Mobile__c) ? mobLeadMap.get(pc.Mobile__c) : null);
            leadWrapLst.add(wrap);
            mobLeadWrapMap.put(pc.Mobile__c,wrap);
        }
    }

    for(smagicinteract__smsMagic__c incSMS : incomingSMSs){
        if(mobLeadWrapMap.containsKey(incSMS.smagicinteract__PhoneNumber__c)){
            System.debug('##smsMobile ' + incSMS.smagicinteract__PhoneNumber__c);
            mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).missedCallCount = (mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).missedCallCount + 1);
            mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).incomingSMSs.add(incSMS);
            if(mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).latestMissedPhoneCall != null && incSMS.CreatedDate > mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).latestMissedPhoneCall.CreatedDate){
                mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).latestMissedPhoneCall = null;
                mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).latestSMSMagicFromR4K = incSMS;
            }
            mobLeadWrapMap.get(incSMS.smagicinteract__PhoneNumber__c).isLatestCommunicationByCustHighlighted = true;
        }else{
            System.debug('##smsMobile ' + incSMS.smagicinteract__PhoneNumber__c);
            LeadWrapper wrap = new LeadWrapper();
            wrap.missedCallCount = 1;
            wrap.latestSMSMagicFromR4K = incSMS;
            wrap.incomingSMSs = new List<smagicinteract__smsMagic__c>{incSMS};
            wrap.missedCalls = new List<PhoneCall__c>();
            wrap.ld = (mobLeadMap.containsKey(incSMS.smagicinteract__PhoneNumber__c) ? mobLeadMap.get(incSMS.smagicinteract__PhoneNumber__c) : null);
            wrap.isLatestCommunicationByCustHighlighted = true;
            leadWrapLst.add(wrap);
            mobLeadWrapMap.put(incSMS.smagicinteract__PhoneNumber__c,wrap);
        }
    }
}

public void getFilteredConversations()
{   
    region = ApexPages.CurrentPage().getParameters().get('region');
    type = ApexPages.CurrentPage().getParameters().get('type');
    
    if(type=='call')
    {
        getMissedCalls();
    }
    else
    {
        conversationWrapperList = new List<PhoneCallTrackerController.ConversationsWrapper>();
        PhoneCallTrackerController pct = new PhoneCallTrackerController();
        pct.getConversationHistory();
        
        system.debug('oglist: '+pct.ogconversationWrapperList.size()+' region: '+region);
    
        if(pct.ogconversationWrapperList.size()>0)
        {
            for(PhoneCallTrackerController.ConversationsWrapper cw : pct.ogconversationWrapperList)
            {
                if(cw.region==region && (cw.callType=='Incoming SMS' && type=='sms'))
                    conversationWrapperList.add(cw);
            }
            system.debug('conversationWrapperList: '+conversationWrapperList.size());
            conversationWrapperList.sort();
        }
    }
}

public Pagereference communicatedBack(){
    List<PhoneCall__c> missedPhoneCalls = new List<PhoneCall__c>();
    List<PhoneCall__c> pcsToRead = new List<PhoneCall__c>();
    List<smagicinteract__smsMagic__c> smsToRead = new List<smagicinteract__smsMagic__c>();
    List<smagicinteract__smsMagic__c> callNowSMSs = new List<smagicinteract__smsMagic__c>();

    if(type.equalsIgnoreCase('call')){
        for(LeadWrapper wrap : leadWrapLst){
            if(wrap.isSelectedToCall != null && wrap.isSelectedToCall){
                if(wrap.missedCalls != null && wrap.missedCalls.size() > 0){
                    missedPhoneCalls.addAll(wrap.missedCalls);
                }
                if(wrap.incomingSMSs != null && wrap.incomingSMSs.size() > 0){
                    callNowSMSs.addAll(wrap.incomingSMSs);
                }
            }
        }
        for(PhoneCall__c pc : missedPhoneCalls){
            PhoneCall__c pcr = new PhoneCall__c();
            pcr.Id = pc.Id;
            pcr.Read__c = true;
            pcsToRead.add(pcr);
        }
        for(smagicinteract__smsMagic__c pc : callNowSMSs){
            smagicinteract__smsMagic__c pcr = new smagicinteract__smsMagic__c();
            pcr.Id = pc.Id;
            pcr.Read__c = true;
            smsToRead.add(pcr);
        }
    }else if(type.equalsIgnoreCase('sms')){
        for(PhoneCallTrackerController.ConversationsWrapper wrap : conversationWrapperList){
            if(wrap.isSelected != null && wrap.isSelected){
                if(wrap.phoneCall != null){
                    PhoneCall__c pcr = new PhoneCall__c();
                    pcr.Id = wrap.recordId;
                    pcr.Read__c = true;
                    pcsToRead.add(pcr);
                }else if(wrap.smsMagic != null){
                    smagicinteract__smsMagic__c pcr = new smagicinteract__smsMagic__c();
                    pcr.Id = wrap.recordId;
                    pcr.Read__c = true;
                    smsToRead.add(pcr);
                }
            }
        }
    }
    if(pcsToRead.size() > 0){
        Database.update(pcsToRead, false);
    }
    if(smsToRead.size() > 0){
        Database.update(smsToRead, false);
    }
    return new Pagereference('/apex/CLOLeadManager?tp=' + twilioPersonName + '&region=' + region + '&type=' + type + '&eid=' + currentEmpId).setRedirect(true);
}

public void getOpenMarketingEnquiries()
{
    system.debug('marketingOption: '+marketingOption);
    callStatusType = (ApexPages.CurrentPage().getParameters().get('callStatusType') == '' || ApexPages.CurrentPage().getParameters().get('callStatusType') == null) ? 'DNC' : ApexPages.CurrentPage().getParameters().get('callStatusType');
    acctWrapLst = new List<AccountWrapper>();
    
    List<Opportunity> oppList = new List<Opportunity>();
    List<String> oppAcctIds = new List<String>();
    String strOppAcctId = '';
    if(marketingOption == '2PG' || marketingOption == null)
    {
        oppList = [select id,AccountId from Opportunity where id in ('006p0000008OvbZ','006p00000062Vg0')];
    }
    else if(marketingOption == '1PG')
    {
        oppList = [select id,AccountId from Opportunity where Account.WrittenOff_s_Count__c=0 and stageName='Goods Delivered' and No_Outstanding_Payments__c=1 and Account.Marketing_Touch_Point_Date__c<>LAST_N_DAYS:7];
    }
    if(oppList.size()>0)
    {
        for(Opportunity opp : oppList)
        {
            oppAcctIds.add(opp.AccountId);
            strOppAcctId = strOppAcctId +'\''+opp.AccountId+'\',';
        }
        strOppAcctId=strOppAcctId.removeEnd(',');
    }
    system.debug('oppAcctIds: '+oppAcctIds.size()+' strOppAcctId: '+strOppAcctId);
              
       String colQuery = 'select id, name,FirstName,LastName, Bot_Call_Datetime__c,Enquiry_Date__c,State_Master_State__c,' + 
                'PersonMobilePhone,No_of_Active_Agreements__c,Total_Paid_Amount_Active_Only__c,Total_Agreement_Amount_Active_Only__c,' +
                'Actual_Arrears__c,Schedule_Amount__c,Bot_Call_status__c,SMS_Mobile__c,Referring_Applicant__r.Applicant__c,' +
                'Territory_Number__r.Short_Name__c ' +
                'from Account where (Name like \'Shri%\' or Name like \'Sid%\' or Name like \'Andy%\' or Name like \'Anudeep%\') and ' + 
                 'PersonMobilePhone <> null AND Enquiry_Status__c <> \'Deceased\' AND Enquiry_Status__c <> \'Incarcerated\' ' +
                  'AND Is_IDR__c = false ';
        
        colQuery += ((marketingOption == '2PG' || marketingOption == '1PG' || marketingOption == null) && oppAcctIds.size()>0 ? 'and (Id in ('+strOppAcctId+')  ) ' : '');
        colQuery += (marketingOption == 'Serviceability' ? 'and (Serviceability__c>0.2 and Active_Agreements__c=1 and Is_Mobile_No_Valid__c=true and Last_Active_Agreement_Date_Rollup__c<>LAST_N_MONTHS:2 and Last_Active_Agreement_Date_Rollup__c<>THIS_MONTH and Marketing_Touch_Point_Date__c<>LAST_N_DAYS:7) ' : '');
        //colQuery += (marketingOption == 'GDormants' ? 'and (Call_Ignore_Date__c=null or Call_Ignore_Date__c<>TODAY) ' : '');
                  
        colQuery += (callStatusType == 'DNC' ? 'and (Call_Ignore_Date__c=null or Call_Ignore_Date__c<>TODAY)' : '');
        colQuery += (callStatusType == 'Sent Payment SMS' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Sent Payment SMS\'' : '');
        colQuery += (callStatusType == 'Returned Call - Collection' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Returned Call - Collection\'' : '');
        colQuery += (callStatusType == 'Returned Call - Enquiry' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Returned Call - Enquiry\'' : '');
        colQuery += (callStatusType == 'Did not Pickup' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Did not Pickup\'' : ''); 
        colQuery += (callStatusType == 'Pickedup' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Pickedup\'' : ''); 
        colQuery += (callStatusType == 'Sent Enquiry Link' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Sent Enquiry Link\'' : ''); 
        colQuery += (callStatusType == 'Call on Appointment' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Call on Appointment\'' : ''); 
        colQuery += (callStatusType == 'Call Initiated' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Call Initiated\'' : '');  
        colQuery += ' ORDER BY LastModifiedDate DESC Limit 10';
        system.debug('colQuery: '+colQuery);
        List<Account> accts = Database.Query(colQuery);
                                           
        if(accts.size()>0)
        {
            for(Account at : accts)
            {
                AccountWrapper cwrap  = new AccountWrapper();
                cwrap.acct = at;
                acctWrapLst.add(cwrap);
            }
        }
        
        if(acctWrapLst.size()>0)
        {
            String s = JSON.serialize(acctWrapLst);
            system.debug('acctsWrapLst: '+s);
        }
}

public void getOpenCollections()
{
    String officer = ApexPages.CurrentPage().getParameters().get('of');
    String type = ApexPages.CurrentPage().getParameters().get('type');
    callStatusType = (ApexPages.CurrentPage().getParameters().get('callStatusType') == '' || ApexPages.CurrentPage().getParameters().get('callStatusType') == null) ? 'DNC' : ApexPages.CurrentPage().getParameters().get('callStatusType');
    colWrapLst = new List<CollectionWrapper>();

    /*List<Collection_Activity__c> colActs = [select id, name, Applicant__c, Applicant__r.Name,Applicant__r.FirstName, Short_Link__c,Collection_Outcome1__c,Bot_Call_Datetime__c,
            Applicant__r.PersonMobilePhone,Applicant__r.No_of_Active_Agreements__c,Applicant__r.Total_Paid_Amount_Active_Only__c,Applicant__r.Total_Agreement_Amount_Active_Only__c,
            Applicant__r.Actual_Arrears__c,Applicant__r.Schedule_Amount__c,Bot_Call_status__c,Applicant__r.SMS_Mobile__c,Applicant__r.Referring_Applicant__r.Applicant__c,Collection_Officer__c
            from Collection_Activity__c where Collection_Outcome1__c in ('In Progress') and (Ignore_Date__c=null or Ignore_Date__c<>TODAY) and (Remind_Me_On__c <= TODAY or Remind_Me_On__c=null) and Collection_Officer__c!=null 
            and (Applicant__r.Name like 'Shri%' or Applicant__r.Name like 'Sid%' or Applicant__r.Name like 'Andy%' or Applicant__r.Name like 'Mohit%' or Applicant__r.Name like 'Anudeep%') Limit 10]; */
              
    if(officer!=null)
    {
        String colQuery = 'select id, name, Applicant__c,Agreement__c,Agreement__r.Name, Applicant__r.Name,Applicant__r.FirstName, Short_Link__c,Collection_Outcome1__c,Bot_Call_Datetime__c, ' + 
                'Applicant__r.PersonMobilePhone,Applicant__r.No_of_Active_Agreements__c,Applicant__r.Total_Paid_Amount_Active_Only__c,Applicant__r.Total_Agreement_Amount_Active_Only__c,' +
                'Applicant__r.Actual_Arrears__c,Applicant__r.Schedule_Amount__c,Bot_Call_status__c,Applicant__r.SMS_Mobile__c,Applicant__r.Referring_Applicant__r.Applicant__c,Collection_Officer__c,' +
                'Days_Since_Collection_Activity_Created__c,Next_Step__c,Applicant__r.Territory_Number__c,Applicant__r.Territory_Number__r.Short_Name__c,Collection_Notes__c,Remind_Me_On__c, ' +
                'Agreement__r.Total_Paid_Amount__c,Agreement__r.Amount,Agreement__r.Scheduled_Amount__c,Agreement__r.Actual_Arrears__c ' +
                'from Collection_Activity__c where Collection_Outcome1__c = \'In Progress\' and (Expected_Collection_Date__c <= TODAY or Expected_Collection_Date__c=null) ' + 
                 'AND Applicant__r.PersonMobilePhone <> null AND Applicant__r.Enquiry_Status__c <> \'Deceased\' AND Applicant__r.Enquiry_Status__c <> \'Incarcerated\' ' +
                  'AND Applicant__r.Is_IDR__c = false AND Collection_Officer__c=:officer ';
        
        colQuery += (officer != 'AEE' ? 'AND Applicant__r.Active_Agreements__c > 0 ' : '');            
        colQuery += (callStatusType == 'DNC' ? 'and (Ignore_Date__c=null or Ignore_Date__c<>TODAY)' : '');
        colQuery += (callStatusType == 'Sent SMS' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Sent SMS\'' : '');
        colQuery += (callStatusType == 'Returned Call' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Returned Call\'' : '');
        colQuery += (callStatusType == 'Did not Pickup' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Did not Pickup\'' : ''); 
        colQuery += (callStatusType == 'Call Initiated' ? 'AND Bot_Call_Datetime__c = TODAY AND Bot_Call_status__c = \'Call Initiated\'' : '');
        colQuery += (type=='cc' ? ' AND Agreement__c <> null' : ' AND Agreement__c=null');
        colQuery += ' ORDER BY Days_Since_Collection_Activity_Created__c DESC Limit 10';
        List<Collection_Activity__c> colActs = Database.Query(colQuery);
                                           
        if(colActs.size()>0)
        {
            for(Collection_Activity__c col : colActs)
            {
                List<RefereeWrapper> refColLst = new List<RefereeWrapper>();
                CollectionWrapper cwrap  = new CollectionWrapper();
                cwrap.colAct = col;
                
                /*List<Referee__c> refereesRelatedList = [SELECT Id, Name, Email__c, Contacted__c,Contacted_Date_Time__c, Contacted_On_Date__c, Referee_Name__c,Referee_Name__r.Name,Referee_Name__r.FirstName,Referee_Name__r.MobilePhone, Relationship__c, Street__c, State__c, Postcode__c, Phone__c,SMS_Referee_Mobile__c, City__c,Bot_Referee_Call_Status__c,Bot_Referee_Call_Datetime__c
                      FROM Referee__c WHERE Applicant__c =: col.Applicant__c];
                
                List<Account> referredApplicants = [SELECT Id, Name,FirstName, Active_Agreements__c,Actual_Arrears__c, PersonMobilePhone,SMS_Mobile__c,PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry, Territory_Number__c, Territory_Number__r.State_Master_State__c,Bot_Referee_Call_Status__c,Bot_Referee_Call_Datetime__c
                        FROM Account WHERE PersonMobilePhone!=null and Referring_Applicant__r.Applicant__c =: col.Applicant__c]; 
                 
                List<Account> referringApplicant = [SELECT Id, Name,FirstName, Active_Agreements__c,Actual_Arrears__c, PersonMobilePhone,SMS_Mobile__c,PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry, Territory_Number__c, Territory_Number__r.State_Master_State__c,Bot_Referee_Call_Status__c,Bot_Referee_Call_Datetime__c
                        FROM Account WHERE PersonMobilePhone!=null and Id =: col.Applicant__r.Referring_Applicant__r.Applicant__c LIMIT 1];*/
                
                /*if(refereesRelatedList.size()>0)
                {
                    for(Referee__c ref : refereesRelatedList)
                    {                
                        RefereeWrapper refCol = new RefereeWrapper();
                        refCol.Id = ref.Id;
                        refCol.name = ref.Referee_Name__r.Name;
                        refCol.firstName = ref.Referee_Name__r.FirstName;
                        refCol.type = 'Referee';
                        refCol.relation = ref.Relationship__c;
                        refCol.mobile = ref.Referee_Name__r.MobilePhone;
                        refCol.smsMobile = ref.SMS_Referee_Mobile__c;
                        refCol.botStatus = ref.Bot_Referee_Call_Status__c;
                        refCol.botStatusDate = ref.Bot_Referee_Call_Datetime__c;
                        refColLst.add(refCol);
                    }
                }
                
                if(referredApplicants.size()>0)
                {
                    for(Account acct : referredApplicants)
                    {                
                        RefereeWrapper refCol = new RefereeWrapper();
                        refCol.Id = acct.Id;
                        refCol.name = acct.Name;
                        refCol.firstName = acct.FirstName;
                        refCol.type = 'Referred';
                        refCol.mobile = acct.PersonMobilePhone;
                        refCol.smsMobile = acct.SMS_Mobile__c;
                        refCol.botStatus = acct.Bot_Referee_Call_Status__c;
                        refCol.botStatusDate = acct.Bot_Referee_Call_Datetime__c;
                        refColLst.add(refCol);
                    }
                }
                
                if(referringApplicant.size()>0)
                {
                    for(Account acct : referringApplicant)
                    {                
                        RefereeWrapper refCol = new RefereeWrapper();
                        refCol.Id = acct.Id;
                        refCol.name = acct.Name;
                        refCol.firstName = acct.FirstName;
                        refCol.type = 'Referring';
                        refCol.mobile = acct.PersonMobilePhone;
                        refCol.smsMobile = acct.SMS_Mobile__c;
                        refCol.botStatus = acct.Bot_Referee_Call_Status__c;
                        refCol.botStatusDate = acct.Bot_Referee_Call_Datetime__c;
                        refColLst.add(refCol);
                    }
                }
                
                cwrap.refWrapList = refColLst;*/
                colWrapLst.add(cwrap);
            }
        }
        
        if(colWrapLst.size()>0)
        {
            String s = JSON.serialize(colWrapLst);
            system.debug('colWrapLst: '+s);
        }
    }
}

public PageReference redirectToCallPage()
{
    if(collectionType=='cc')
        return new PageReference('/apex/R4KCollectionBot?of='+collectionOfficer+'&type=cc').setRedirect(true);
    else
        return new PageReference('/apex/R4KCollectionBot?of='+collectionOfficer).setRedirect(true);
}

public PageReference callCustomers()
{
    String officer = ApexPages.CurrentPage().getParameters().get('of');
    String type = ApexPages.CurrentPage().getParameters().get('type');
    if(colWrapLst.size()>0)
    {
        TwilioIntegration ti = new TwilioIntegration();
        TwilioProfile__c myCS1;
        myCS1 = type=='cc' ? TwilioProfile__c.getValues('R4K AU Collections') :  TwilioProfile__c.getValues('Darranda AU Collections');
        String twilioFromPhone = myCS1.Phone__c;
        List<Collection_Activity__c> colActs = new List<Collection_Activity__c>();
        for(CollectionWrapper cw : colWrapLst)
        {
            if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
            {
                Collection_Activity__c col = new Collection_Activity__c();
                system.debug('name: '+cw.colAct.Name);
                String nameVal=cw.colAct.Applicant__r.FirstName;
                Integer noOfAgmtsVal= Integer.valueOF(cw.colAct.Applicant__r.No_of_Active_Agreements__c);
                Decimal paymentAmtVal= type=='cc' ? cw.colAct.Agreement__r.Scheduled_Amount__c.setScale(2) : cw.colAct.Applicant__r.Schedule_Amount__c.setScale(2);
                Decimal arrearsAmtVal= type=='cc' ? cw.colAct.Agreement__r.Actual_Arrears__c.setScale(2) : cw.colAct.Applicant__r.Actual_Arrears__c.setScale(2);
                String collectionActivityIdVal=cw.colAct.Id;
                String param = '{"collectionActivityId" :\"'+collectionActivityIdVal+'\", "name":\"'+nameVal+'\", "noOfAgmts":\"'+noOfAgmtsVal+'\", "paymentAmt" : \"'+paymentAmtVal+'\", "arrearsAmt":\"'+arrearsAmtVal+'\"}';
                system.debug('param: '+param+' twilioFromPhone: '+twilioFromPhone+' toMobile: '+cw.colAct.Applicant__r.SMS_Mobile__c);
                if(!Test.isRunningTest()) //To be removed
                {
                    if(type=='cc')
                        ti.createFlowExecution(r4kCollectionForCustomersFlowId,twilioFromPhone,'+'+cw.colAct.Applicant__r.SMS_Mobile__c,param);
                    else
                        ti.createFlowExecution(darrandaCollectionForCustomersFlowId,twilioFromPhone,'+'+cw.colAct.Applicant__r.SMS_Mobile__c,param);
                }
                col.Id = cw.colAct.Id;
                col.Bot_Call_status__c = 'Call Initiated';
                col.Bot_Call_Datetime__c = Datetime.now();
                col.Contacted_Date_Time__c = col.Bot_Call_Datetime__c;
                col.Collection_Notes__c = (Date.today().format() + '\n' + 'Bot Call Status - ' + col.Bot_Call_status__c + '\n' + 'Bot Call DateTime - ' + col.Bot_Call_Datetime__c.format() + '\n') + (cw.colAct.Collection_Notes__c == null ? '' : cw.colAct.Collection_Notes__c);
                colActs.add(col);
            }
        }
        
        if(colActs.size()>0)
            update colActs;
    }
    if(type=='cc')
        return new PageReference('/apex/R4KCollectionBot?of='+officer+'&type=cc').setRedirect(true);
    else
        return new PageReference('/apex/R4KCollectionBot?of='+officer).setRedirect(true);
}

public PageReference addBusinessHours()
{
    String twilioOtherProfile=Apexpages.currentPage().getParameters().get('top');
    try
    {
    List<Territory__c> terLstToUp = new List<Territory__c>();
    Time botStartTimeVal, botFinishTimeVal;
    if(botStartTime!=null && botFinishTime!=null && botStartTime.contains(':') && botFinishTime.contains(':') && terLstForBotUsers.size()>0)
     {
         String[] botStartTimeSplit = botStartTime.split(':');
         botStartTimeVal = Time.newInstance( Integer.valueOf(botStartTimeSplit[0]) ,Integer.valueOf(botStartTimeSplit[1]) ,0,0); 
         
         String[] botFinishTimeSplit = botFinishTime.split(':');
         botFinishTimeVal = Time.newInstance( Integer.valueOf(botFinishTimeSplit[0]) ,Integer.valueOf(botFinishTimeSplit[1]) ,0,0); 
     }
     else if(botStartTime!=null && botStartTime.contains(':'))
     {
         String[] botStartTimeSplit = botStartTime.split(':');
         botStartTimeVal = Time.newInstance( Integer.valueOf(botStartTimeSplit[0]) ,Integer.valueOf(botStartTimeSplit[1]) ,0,0); 
     }
     else if(botFinishTime!=null && botFinishTime.contains(':'))
     {
         String[] botFinishTimeSplit = botFinishTime.split(':');
         botFinishTimeVal = Time.newInstance( Integer.valueOf(botFinishTimeSplit[0]) ,Integer.valueOf(botFinishTimeSplit[1]) ,0,0); 
     }
     
     if(botStartTimeVal==null)
         botStartTimeVal = Time.newInstance( 9 ,30 ,0,0); 
     if(botFinishTimeVal==null)
         botFinishTimeVal = Time.newInstance( 5 ,0 ,0,0); 
     
     if(terLstForBotUsers.size()>0)
     {
     if(terLstForBotUsers[0].Name=='100')
     {
         terLstForBotUsers = [select id,name from Territory__c where state_Master_State__c in ('VIC','SA') and company_Territory__c=true];
     }
     for(Territory__c ter : terLstForBotUsers)
     {
         Territory__c tertoUp = new Territory__c();
         tertoUp.Id = ter.Id;
         tertoUp.Bot_Start_Time__c = botStartTimeVal;
         tertoUp.Bot_Finish_Time__c = botFinishTimeVal;
         terToUp.WIP_Park_Duration_mins__c = wipParkDuration!=null ? wipParkDuration : 30;
         terLstToUp.add(tertoUp);
     }
     if(terLstToUp.size()>0)
         update terLstToUp;
     }
    
    system.debug('leadWrapLst: '+leadWrapLst.size()); 
    if(leadWrapLst.size()>0)
    {
        List<String> leadsToCall = new List<String>();
        for(LeadWrapper lw : leadWrapLst)
        {
            if(lw.isSelectedToCall!=null && lw.isSelectedToCall)
            {
                system.debug('ldId: '+lw.ld.Id+' ldName: '+lw.ld.Name);
                leadsToCall.add(lw.ld.Id);
            }
        }
        if(leadsToCall.size()>0)
        {
            //MasterBotController.followUpLead(leadsToCall,'call');
        }
    }
    
    if(twilioOtherProfile!=null && twilioOtherProfile!='') 
        return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&top='+twilioOtherProfile).setRedirect(true);
    else
        return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName).setRedirect(true);
    }
    catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','addBusinessHours',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        if(twilioOtherProfile!=null && twilioOtherProfile!='') 
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&top='+twilioOtherProfile).setRedirect(true);
        else
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName).setRedirect(true);
    }
}


public void sendHybridLinkSMSForHA()
{
    try
    {
        if(leadWrapLst.size()>0)
        {
            List<CommunicationUtil.SMSWrapper> smsWrapperList = new List<CommunicationUtil.SMSWrapper>();
            List<Account> colActs = new List<Account>();
            String randomNumber=SecretUtil.generateRandomNumber();
            List<Lead> ldsToUpFollowUp = new List<Lead>();
    
            for(LeadWrapper cw : leadWrapLst)
            {
                if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
                {
                    String shortURL = '';
                    String custName = cw.ld.Account__c!=null ? cw.ld.Account__r.FirstName : cw.ld.FirstName;
                    String accountId = cw.ld.Account__c!=null ? cw.ld.Account__c : cw.ld.Id; 
                    String ownerId = cw.ld.Account__c!=null ? cw.ld.Account__r.OwnerId : cw.ld.OwnerId;
                    String finalUrl = cw.ld.Account__c!=null ? onlineURL+'/R4KOnlineApplicationForm?id='+accountId+'&n='+randomNumber : onlineURL+'/R4KOnlineApplicationForm?ld='+accountId+'&n='+randomNumber;  
                    if(twilioProfile=='NSW CLO' || twilioProfile=='Darranda CLO' || twilioProfile=='QLD CLO')
                        finalUrl = cw.ld.Account__c!=null ? onlineURL+'/R4KOnlineFormAcknowledgementPage?id='+accountId+'&redo=yes'+'&n='+randomNumber : onlineURL+'/R4KOnlineFormAcknowledgementPage?ld='+accountId+'&redo=yes'+'&n='+randomNumber;
                    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                    if(!Test.isRunningTest())
                        shortURL = sl.shortLinkGenerator(finalURL);
                    String smsTemplateForCust='Hi '+custName+', Please click this link to start your application process. '+shortURL;
                    
                    CommunicationUtil.SMSWrapper smsWrap = new CommunicationUtil.SMSWrapper();
                    smsWrap.objectId = accountId;
                    smsWrap.mobileNo = cw.ld.Account__c!=null ? cw.ld.Account__r.SMS_Mobile__c : cw.ld.SMS_Mobile__c; 
                    smsWrap.smsGroupType = 'HybridLink';                  
                    smsWrap.objectType = cw.ld.Account__c!=null ? 'Account' : 'Lead';                  
                    smsWrap.ownerId = ownerId;
                    smsWrap.smsTemplate = smsTemplateForCust;                  
                    smsWrapperList.add(smsWrap);
                    
                    if(cw.ld.Hybrid_link_Status__c=='3. Follow-up Required')
                    {
                        Lead ldUp = new Lead();
                        ldUp.Id = cw.ld.Id;
                        ldUp.Hybrid_Link_Allocation_Datetime__c = null;
                        ldsToUpFollowUp.add(ldUp);
                    }
                }
            }

            //Send SMS
            if(smsWrapperList.size()>0)
                CommunicationUtil.sendBulkSMS(smsWrapperList,null);
            ////////////////////////////////////////

            //Reset the follow up required leads
            if(ldsToUpFollowUp.size()>0)
                update ldsToUpFollowUp;
            ////////////////////////////////////////
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','sendHybridLinkSMSForHA',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void sendReminderSMSForHA()
{
    String smsMessage=Apexpages.currentPage().getParameters().get('smsTextHA');
    TwilioIntegration tw = new TwilioIntegration();
    List<PhoneCall__c> pcList = new List<PhoneCall__c>();
    List<CommunicationUtil.PhoneCallWrapper> pcWrapperList = new List<CommunicationUtil.PhoneCallWrapper>();
    List<smagicinteract__smsMagic__c> smsList = new List<smagicinteract__smsMagic__c>();
    System.debug('##leadWrapLst ' + leadWrapLst.size());
    System.debug('##type ' + type);
    System.debug('##twilioProfile ' + twilioProfile);

    try
    {
        TwilioProfile__c myCS1 = TwilioProfile__c.getValues(twilioProfile);
        if(twilioProfile=='NZ CLO')
            myCS1 = TwilioProfile__c.getValues('Darranda CLO');//To send sms from Darranda CLO number if using NZ CLO profile
        String twilioFromPhone = myCS1.Phone__c;
        system.debug(twilioFromPhone+' - '+myCS1.Name);
        String randomNumber=SecretUtil.generateRandomNumber();

        if(leadWrapLst.size()>0)
        {
            for(LeadWrapper cw : leadWrapLst)
            {
                if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
                {
                    String toMobile = cw.ld.Account__c!=null ? cw.ld.Account__r.SMS_Mobile__c : cw.ld.SMS_Mobile__c; 
                    //Alter the sms based on the tags
                    String shortURL = '';
                    String smsMessageAltered = smsMessage;
                    if(smsMessageAltered!=null && smsMessageAltered.containsIgnoreCase('{link}'))
                    {
                        shortURL = onlineURL+'/R4KOnlineApplicationForm?ld='+cw.ld.Id+'&n='+randomNumber;
                        if(twilioProfile=='NSW CLO' || twilioProfile=='Darranda CLO' || twilioProfile=='QLD CLO')
                            shortURL = onlineURL+'/R4KOnlineFormAcknowledgementPage?ld='+cw.ld.Id+'&redo=yes'+'&n='+randomNumber;
                        String finalUrl = shortURL;
                        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                        if(!Test.isRunningTest())
                            shortURL = sl.shortLinkGenerator(finalURL);
                        smsMessageAltered = smsMessageAltered.replace('{link}',shortURL).replace('{Link}',shortURL).replace('{LINK}',shortURL);
                    }
                    if(smsMessageAltered!=null && (smsMessageAltered.containsIgnoreCase('{name}') || smsMessageAltered.containsIgnoreCase('{product}')))
                    {
                        if(cw.ld.FirstName!=null)
                            smsMessageAltered = smsMessageAltered.replace('{name}',cw.ld.FirstName).replace('{Name}',cw.ld.FirstName).replace('{NAME}',cw.ld.FirstName);
                        else
                            smsMessageAltered = smsMessageAltered.replace('{name}','').replace('{Name}','').replace('{NAME}','');
                        if(cw.ld.Desired_Product__c!=null)
                            smsMessageAltered = smsMessageAltered.replace('{product}',cw.ld.Desired_Product__c).replace('{Product}',cw.ld.Desired_Product__c).replace('{PRODUCT}',cw.ld.Desired_Product__c);
                        else
                            smsMessageAltered = smsMessageAltered.replace('{product}','').replace('{Product}','').replace('{PRODUCT}','');
                    }
                    system.debug('##ReminderSMS: '+cw.ld.Name+' smsAltered: '+smsMessageAltered);
                    //////////////////////////////
                    TwilioSMSJSON2Apex tws;
                    if(!Test.isRunningTest())
                        tws = tw.sendSMS(twilioFromPhone,toMobile,smsMessageAltered,null, 'https://cinereous-herring-9492.twil.io/SMSCallBack');
                    
                    CommunicationUtil.PhoneCallWrapper pcWrap = new CommunicationUtil.PhoneCallWrapper();
                    pcWrap.parentType = cw.ld.Account__c!=null ? 'Account' : 'Lead';                  
                    pcWrap.recordId = cw.ld.Account__c!=null ? cw.ld.Account__c : cw.ld.Id; 
                    pcWrap.twilioSID = tws !=null && tws.sid!=null ?  tws.sid : null;
                    pcWrap.smsMessage = smsMessageAltered;
                    pcWrap.smsStatus = 'Sent';
                    pcWrap.callType = 'Outgoing SMS';
                    pcWrap.medium = 'Browser';
                    pcWrap.toMobile = toMobile;
                    pcWrap.twilioProfile = twilioProfile;
                    pcWrap.twilioPersonName = twilioPersonName;
                    pcWrapperList.add(pcWrap);
                }
            }
        }else if(type=='sms' && twilioProfile.equalsIgnoreCase('R4K LICENSING')){
            for(PhoneCallTrackerController.ConversationsWrapper cw : conversationWrapperList){
                if(cw.isSelected!=null && cw.isSelected)
                {
                    String toMobile = cw.mobileNo;
                    //Alter the sms based on the tags
                    String shortURL = '';
                    String smsMessageAltered = smsMessage;
                    if(smsMessageAltered!=null && smsMessageAltered.containsIgnoreCase('{link}'))
                    {
                        shortURL = cw.accountId != null ? onlineURL+'/R4KOnlineFormAcknowledgementPage?id='+cw.accountId+'&redo=yes'+'&n='+randomNumber : onlineURL+'/R4KOnlineFormAcknowledgementPage?ld='+cw.leadId+'&redo=yes'+'&n='+randomNumber;
                        String finalUrl = shortURL;
                        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                        if(!Test.isRunningTest())
                            shortURL = sl.shortLinkGenerator(finalURL);
                        smsMessageAltered = smsMessageAltered.replace('{link}',shortURL).replace('{Link}',shortURL).replace('{LINK}',shortURL);
                    }
                    if(smsMessageAltered!=null && (smsMessageAltered.containsIgnoreCase('{name}') || smsMessageAltered.containsIgnoreCase('{product}')))
                    {
                        if(cw.accountName!=null)
                            smsMessageAltered = smsMessageAltered.replace('{name}',cw.accountName).replace('{Name}',cw.accountName).replace('{NAME}',cw.accountName);
                        else if(cw.leadName!=null)
                            smsMessageAltered = smsMessageAltered.replace('{name}',cw.leadName).replace('{Name}',cw.leadName).replace('{NAME}',cw.leadName);
                        else
                            smsMessageAltered = smsMessageAltered.replace('{name}','').replace('{Name}','').replace('{NAME}','');

                        smsMessageAltered = smsMessageAltered.replace('{product}','').replace('{Product}','').replace('{PRODUCT}','');
                    }
                    system.debug('smsAltered: '+smsMessageAltered);

                    TwilioSMSJSON2Apex tws;
                    if(!Test.isRunningTest())
                        tws = tw.sendSMS(twilioFromPhone,toMobile,smsMessageAltered,null, 'https://cinereous-herring-9492.twil.io/SMSCallBack');
                    
                    CommunicationUtil.PhoneCallWrapper pcWrap = new CommunicationUtil.PhoneCallWrapper();
                    pcWrap.parentType = cw.accountId!=null ? 'Account' : 'Lead';                  
                    pcWrap.recordId = cw.accountId!=null ? cw.accountId : cw.leadId; 
                    pcWrap.twilioSID = tws !=null && tws.sid!=null ?  tws.sid : null;
                    pcWrap.smsMessage = smsMessageAltered;
                    pcWrap.smsStatus = 'Sent';
                    pcWrap.callType = 'Outgoing SMS';
                    pcWrap.medium = 'Browser';
                    pcWrap.toMobile = toMobile;
                    pcWrap.twilioProfile = twilioProfile;
                    pcWrap.twilioPersonName = twilioPersonName;
                    pcWrapperList.add(pcWrap);

                    if(cw.phoneCall != null){
                        PhoneCall__c sm = new PhoneCall__c();
                        sm.Id = cw.recordId;
                        sm.Read__c = true;
                        pcList.add(sm);
                    }
                    if(cw.smsMagic != null){
                        smagicinteract__smsMagic__c sm = new smagicinteract__smsMagic__c();
                        sm.Id = cw.recordId;
                        sm.Read__c = true;
                        smsList.add(sm);
                    }
                    
                }
            }
        }

        if(pcWrapperList.size()>0)
            CommunicationUtil.addBulkPhoneCall(pcWrapperList);

        if(smsList.size() > 0)
            update smsList;

        if(pcList.size() > 0)
            update pcList;

        if(type!=null && (type=='call' || type=='sms') && twilioProfile.equalsIgnoreCase('R4K LICENSING')){
            getFilteredConversations();
        }else{ 
            getUnAssignedLeads();
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','sendReminderSMSForHA',twilioProfile,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void sendResetHybridLinkSMS()
{
    String chkClearSelfie=Apexpages.currentPage().getParameters().get('chkClearSelfie');
    String chkClearPhotoId=Apexpages.currentPage().getParameters().get('chkClearPhotoId');
    String chkClearMyGov=Apexpages.currentPage().getParameters().get('chkClearMyGov');
    String chkClearBankSt=Apexpages.currentPage().getParameters().get('chkClearBankSt');
    
    List<Account> upAccts = new List<Account>();
    List<String> docsToDelete = new List<String>();
    List<String> photoIdAttsToDelete = new List<String>();
    List<String> myGovAttsToDelete = new List<String>();
    
    if(acctWrapLst.size()>0)
    {
        for(AccountWrapper cw : acctWrapLst)
        {
            if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
            {
                Account at = new Account();
                at.Id = cw.Acct.Id;
                if(chkClearSelfie=='true')
                {
                    docsToDelete.add(cw.acct.Customer_Photo_Id__c);
                    at.Customer_Photo_Id__c = null;
                }
                if(chkClearPhotoId=='true')
                {
                    at.Is_PhotoId_Attached_After_Enquiry__c = false;
                    photoIdAttsToDelete.add(cw.acct.Id);
                }
                if(chkClearMyGov=='true')
                {
                    at.MyGov_Final_Page__c = false;
                    at.MyGov_Date__c = null;
                    at.myGov_Completion_Datetime__c = null;
                    myGovAttsToDelete.add(cw.acct.Id);
                }
                if(chkClearBankSt=='true')
                {
                    at.Bank_Final_Page__c = false;
                    at.BankStatement_Date__c = null;
                    at.BankStatement_Completion_Datetime__c = null;
                }
                at.Hybrid_Link_Finish_Datetime__c = null;
                upAccts.add(at);
            }
        }
    }
    
    sendHybridLinkSMS();
    
    //Reset all
    if(upAccts.size()>0)
        update upAccts;
        
    if(docsToDelete.size()>0)
    {
        List<Document> delDocs = [select id from Document where id in: docsToDelete];
        if(delDocs.size()>0)
            delete delDocs;
    }
    
    if(photoIdAttsToDelete.size()>0 || myGovAttsToDelete.size()>0)
    {
        List<Attachment> delAtts = new List<Attachment>();
            delAtts = [select id from Attachment where CreatedDate=LAST_N_days:21 and ((Name like 'Photo Id%' and parentID in: photoIdAttsToDelete) or (Name like 'myGov%' and parentID in: myGovAttsToDelete))];
        if(delAtts.size()>0)
            delete delAtts;
    }
    ///////////////////////////
    getWIP();
}

public void sendResetHybridLinkSMSForHA()
{
    String chkClearSelfie=Apexpages.currentPage().getParameters().get('chkClearSelfieHA');
    String chkClearPhotoId=Apexpages.currentPage().getParameters().get('chkClearPhotoIdHA');
    String chkClearMyGov=Apexpages.currentPage().getParameters().get('chkClearMyGovHA');
    String chkClearBankSt=Apexpages.currentPage().getParameters().get('chkClearBankStHA');
    
    List<Account> upAccts = new List<Account>();
    List<String> docsToDelete = new List<String>();
    List<String> photoIdAttsToDelete = new List<String>();
    List<String> myGovAttsToDelete = new List<String>();
    
    if(leadWrapLst.size()>0)
    {
        for(LeadWrapper cw : leadWrapLst)
        {
            if(cw.isSelectedToCall!=null && cw.isSelectedToCall && cw.ld.Account__c!=null)
            {
                Account at = new Account();
                at.Id = cw.ld.Account__c;
                if(chkClearSelfie=='true')
                {
                    docsToDelete.add(cw.ld.Account__r.Customer_Photo_Id__c);
                    at.Customer_Photo_Id__c = null;
                }
                if(chkClearPhotoId=='true')
                {
                    at.Is_PhotoId_Attached_After_Enquiry__c = false;
                    photoIdAttsToDelete.add(cw.ld.Account__c);
                }
                if(chkClearMyGov=='true')
                {
                    at.MyGov_Final_Page__c = false;
                    at.MyGov_Date__c = null;
                    at.myGov_Completion_Datetime__c = null;
                    myGovAttsToDelete.add(cw.ld.Account__c);
                }
                if(chkClearBankSt=='true')
                {
                    at.Bank_Final_Page__c = false;
                    at.BankStatement_Date__c = null;
                    at.BankStatement_Completion_Datetime__c = null;
                }
                at.Hybrid_Link_Finish_Datetime__c = null;
                upAccts.add(at);
            }
        }
    }
    
    sendHybridLinkSMSForHA();
    
    //Reset all
    if(upAccts.size()>0)
        update upAccts;
        
    if(docsToDelete.size()>0)
    {
        List<Document> delDocs = [select id from Document where id in: docsToDelete];
        if(delDocs.size()>0)
            delete delDocs;
    }
    
    if(photoIdAttsToDelete.size()>0 || myGovAttsToDelete.size()>0)
    {
        List<Attachment> delAtts = new List<Attachment>();
            delAtts = [select id from Attachment where CreatedDate=LAST_N_days:21 and ((Name like 'Photo Id%' and parentID in: photoIdAttsToDelete) or (Name like 'myGov%' and parentID in: myGovAttsToDelete))];
        if(delAtts.size()>0)
            delete delAtts;
    }
    ///////////////////////////
    getUnAssignedLeads();
}

public void sendHybridLinkSMS()
{
    try
    {
        if(acctWrapLst.size()>0)
        {
            List<CommunicationUtil.SMSWrapper> smsWrapperList = new List<CommunicationUtil.SMSWrapper>();
            List<Account> colActs = new List<Account>();
            String randomNumber=SecretUtil.generateRandomNumber();
            for(AccountWrapper cw : acctWrapLst)
            {
                if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
                {
                    String shortURL = '';
                    String custName = cw.acct.FirstName;
                    String accountId = cw.acct.Id;
                    String ownerId = cw.acct.OwnerId;
                    String finalUrl = onlineURL+'/R4KOnlineApplicationForm?id='+accountId+'&n='+randomNumber;
                    if(twilioProfile=='NSW CLO' || twilioProfile=='Darranda CLO' || twilioProfile=='QLD CLO')
                        finalUrl = onlineURL+'/R4KOnlineFormAcknowledgementPage?id='+accountId+'&redo=yes'+'&n='+randomNumber;
                    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                    if(!Test.isRunningTest())
                        shortURL = sl.shortLinkGenerator(finalURL);
                    String smsTemplateForCust='Hi '+custName+', Please click this link to start your application process. '+shortURL;
                    
                    CommunicationUtil.SMSWrapper smsWrap = new CommunicationUtil.SMSWrapper();
                    smsWrap.objectId = cw.acct.Id;
                    smsWrap.mobileNo = cw.acct.SMS_Mobile__c;  
                    smsWrap.smsGroupType = 'HybridLink';                  
                    smsWrap.objectType = 'Account';                  
                    smsWrap.ownerId = cw.acct.OwnerId;                  
                    smsWrap.smsTemplate = smsTemplateForCust;                  
                    smsWrapperList.add(smsWrap);
                }
            }
            
            if(smsWrapperList.size()>0)
                CommunicationUtil.sendBulkSMS(smsWrapperList,null);
         }
        getWIP();
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','sendHybridLinkSMS',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void sendReminderSMS()
{
    String smsMessage=Apexpages.currentPage().getParameters().get('smsText');
    String signLink=Apexpages.currentPage().getParameters().get('signLink');
    TwilioIntegration tw = new TwilioIntegration();
    List<PhoneCall__c> pcList = new List<PhoneCall__c>();
    List<CommunicationUtil.PhoneCallWrapper> pcWrapperList = new List<CommunicationUtil.PhoneCallWrapper>();
    system.debug('twilioProfile: '+twilioProfile);
    try
    {
        TwilioProfile__c myCS1 = TwilioProfile__c.getValues(twilioProfile);
        if(twilioProfile=='NZ CLO')
            myCS1 = TwilioProfile__c.getValues('Darranda CLO');//To send sms from Darranda CLO number if using NZ CLO profile
        String twilioFromPhone = myCS1.Phone__c;
        system.debug(twilioFromPhone+' - '+myCS1.Name);
        if(acctWrapLst.size()>0)
        {
            String randomNumber=SecretUtil.generateRandomNumber();
            for(AccountWrapper cw : acctWrapLst)
            {
                if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
                {
                    String toMobile = cw.acct.SMS_Mobile__c; 
                    //Alter the sms based on the tags
                    String shortURL = '';
                    String smsMessageAltered = smsMessage;
                    if(smsMessageAltered!=null && smsMessageAltered.containsIgnoreCase('{link}'))
                    {
                        shortURL = onlineURL+'/R4KOnlineApplicationForm?id='+cw.acct.Id+'&n='+randomNumber;
                        if(twilioProfile=='NSW CLO' || twilioProfile=='Darranda CLO' || twilioProfile=='QLD CLO')
                            shortURL = onlineURL+'/R4KOnlineFormAcknowledgementPage?id='+cw.acct.Id+'&redo=yes'+'&n='+randomNumber;
                        String finalUrl = shortURL;
                        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                        if(!Test.isRunningTest())
                            shortURL = sl.shortLinkGenerator(finalURL);
                        smsMessageAltered = smsMessageAltered.replace('{link}',shortURL).replace('{Link}',shortURL).replace('{LINK}',shortURL);
                    }
                    if(smsMessageAltered!=null && (smsMessageAltered.containsIgnoreCase('{name}') || smsMessageAltered.containsIgnoreCase('{product}')))
                    {
                        if(cw.acct.FirstName!=null)
                            smsMessageAltered = smsMessageAltered.replace('{name}',cw.acct.FirstName).replace('{Name}',cw.acct.FirstName).replace('{NAME}',cw.acct.FirstName);
                        else
                            smsMessageAltered = smsMessageAltered.replace('{name}','').replace('{Name}','').replace('{NAME}','');
                        if(cw.acct.Product_Interested_In__c!=null)
                            smsMessageAltered = smsMessageAltered.replace('{product}',cw.acct.Product_Interested_In__c).replace('{Product}',cw.acct.Product_Interested_In__c).replace('{PRODUCT}',cw.acct.Product_Interested_In__c);
                        else
                            smsMessageAltered = smsMessageAltered.replace('{product}','').replace('{Product}','').replace('{PRODUCT}','');
                    }
                    system.debug('##ReminderSMS: '+cw.acct.Name+' smsAltered: '+smsMessageAltered);
                    ////////////////////////////// 
                    TwilioSMSJSON2Apex tws;
                    if(!Test.isRunningTest())
                        tws = tw.sendSMS(twilioFromPhone,toMobile,smsMessageAltered,null, 'https://cinereous-herring-9492.twil.io/SMSCallBack');
                    
                    CommunicationUtil.PhoneCallWrapper pcWrap = new CommunicationUtil.PhoneCallWrapper();
                    pcWrap.parentType = 'Account';
                    pcWrap.recordId = cw.acct.Id;
                    pcWrap.twilioSID = tws !=null && tws.sid!=null ?  tws.sid : null;
                    pcWrap.smsMessage = smsMessageAltered;
                    pcWrap.smsStatus = 'Sent';
                    pcWrap.callType = 'Outgoing SMS';
                    pcWrap.medium = 'Browser';
                    pcWrap.toMobile = toMobile;
                    pcWrap.twilioProfile = twilioProfile;
                    pcWrap.twilioPersonName = twilioPersonName;
                    pcWrapperList.add(pcWrap);
                    
                    system.debug('cw.opp: '+cw.opp+' signLink: '+signLink);
                    if(signLink=='yes' && cw.opp!=null)
                    {
                        Opportunity oppToUp = new Opportunity();
                        oppToUp.Id = cw.opp.Id;
                        oppToUp.ApplicantInitialId__c = null;
                        oppToUp.ApplicantSignatureId__c = null;
                        oppToUp.TIApplicantSignatureId__c = null;
                        oppToUp.TIApplicantInitialId__c = null;
                        oppToUp.CustomerSignatureId__c = null;
                        oppToUp.Online_AppForm_Signed_Datetime__c = null;
                        oppToUp.Online_TaxInvoice_Signed_Datetime__c = null;
                        oppToUp.Online_Consent_Signed_Datetime__c = null;
                        oppToUp.Online_Deduction_Signed_Datetime__c = null;
                        oppToUp.Is_Tax_Invoice_Signed__c = false;
                        oppToUp.Is_Consent_Signed__c = false;
                        oppToUp.Is_Signed_Deduction_Form_Attached__c = false;
                        oppToUp.TaxInvoice_Signed_DateTime__c = null;
                        
                        Account acctToUp = new Account();
                        acctToUp.Id = cw.acct.Id;
                        acctToUp.Application_Signed_Date__c = null;
                        acctToUp.ApplicantSignatureId__c = null;
                        acctToUp.ApplicantInitialId__c = null;
                        acctToUp.AFApplicantSignatureId__c = null;
                        acctToUp.AFApplicantInitialId__c = null;
                        acctToUp.Enquiry_Status__c = 'Enquiry';
                        update oppToUp;
                        update acctToUp;
                    }
                }
            }
            if(pcWrapperList.size()>0)
                CommunicationUtil.addBulkPhoneCall(pcWrapperList);
                
        }
        if(!Test.isRunningTest())
            getWIP();
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','sendReminderSMS',twilioProfile,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void getRefereesToBeContacted()
{
    String acctId=Apexpages.currentPage().getParameters().get('acctId');
    system.debug('acctId: '+acctId);
    refWrapLst = new List<RefereeWrapper>();
    try
    {
        List<Referee__c> refs = [select id, name,Referee_Name__r.Name,Referee_Name__r.FirstName,Applicant__r.FirstName,Referee_Name__r.MobilePhone,SMS_Referee_Mobile__c,Referee_Name__c,Applicant__c,Applicant__r.OwnerId,Referee_Contact_Link__c,Relationship__c,Referee_Added_Datetime__c,Contacted_On_Date__c
                                 from Referee__c where Applicant__c =: acctId order by CreatedDate desc];
        
        if(refs.size()>0)
        {
            for(Referee__c ref : refs)
            {
                RefereeWrapper rWrap = new RefereeWrapper();
                rWrap.ref = ref;
                rWrap.isSelected=false;
                refWrapLst.add(rWrap);
            }
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','getRefereesTobeContacted',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void sendRefereeContactFollowupSMS()
{
    try
    {
        if(refWrapLst.size()>0)
        {
            List<CommunicationUtil.SMSWrapper> smsWrapperList = new List<CommunicationUtil.SMSWrapper>();
            List<Account> colActs = new List<Account>();
            String randomNumber=SecretUtil.generateRandomNumber();
            List<String> acctIdsSelected = new List<String>();
            for(RefereeWrapper rw : refWrapLst)
            {
                if(rw.isSelected!=null && rw.isSelected)
                {
                    system.debug('refereeName: '+rw.ref.Referee_Name__r.Name);
                    String shortURL = '';
                    String finalUrl = onlineRefereeURL+'/RefereeContactForm?rf='+rw.ref.Id+'&n='+randomNumber;
                    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                    if(!Test.isRunningTest())
                        shortURL = sl.shortLinkGenerator(finalUrl);
                    
                    String refName = rw.ref.Referee_Name__r.FirstName;
                    String custName = rw.ref.Applicant__r.FirstName;
                    String smsTemplateForRef = 'Hi '+refName+', You have been nominated by '+custName+' as a character reference. Please click the below link to assist with R4K. '+finalURL;
                    
                    CommunicationUtil.SMSWrapper smsWrap = new CommunicationUtil.SMSWrapper();
                    smsWrap.objectId = rw.ref.Id;
                    smsWrap.mobileNo = rw.ref.SMS_Referee_Mobile__c;
                    smsWrap.smsGroupType = 'RefereeContact';                  
                    smsWrap.objectType = 'Referee__c';                  
                    smsWrap.ownerId = rw.ref.Applicant__r.OwnerId;
                    smsWrap.smsTemplate = smsTemplateForRef;                  
                    smsWrapperList.add(smsWrap);
                }
            }
            system.debug('refereeesmsWrapperList: '+smsWrapperList.size());
            if(smsWrapperList.size()>0)
                CommunicationUtil.sendBulkSMS(smsWrapperList,null);
        }
        
        /*if(acctWrapLst.size()>0)
        {
            List<CommunicationUtil.SMSWrapper> smsWrapperList = new List<CommunicationUtil.SMSWrapper>();
            List<Account> colActs = new List<Account>();
            String randomNumber=SecretUtil.generateRandomNumber();
            List<String> acctIdsSelected = new List<String>();
            for(AccountWrapper cw : acctWrapLst)
            {
                if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
                {
                    acctIdsSelected.add(cw.acct.Id);
                }
            }
            
            if(acctIdsSelected.size()>0)
            {
                 Date bufferDaysForContact=Date.today().addDays(-3);
                 List<Referee__c> refs = [select id, name,Referee_Name__r.FirstName,Applicant__r.FirstName,Referee_Name__r.MobilePhone,SMS_Referee_Mobile__c,Referee_Name__c,Applicant__c,Applicant__r.OwnerId,Referee_Contact_Link__c 
                                 from Referee__c where Applicant__c in: acctIdsSelected and Referee_Added_Datetime__c>=:bufferDaysForContact and (Contacted_On_Date__c <: bufferDaysForContact or Contacted_On_Date__c=null) order by CreatedDate desc];
            
                if(refs.size()>0)
                {
                    for(Referee__c ref : refs)
                    {
                        String shortURL = '';
                        String finalUrl = onlineRefereeURL+'/RefereeContactForm?rf='+ref.Id+'&n='+randomNumber;
                        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                        if(!Test.isRunningTest())
                            shortURL = sl.shortLinkGenerator(finalUrl);
                        
                        String refName = ref.Referee_Name__r.FirstName;
                        String custName = ref.Applicant__r.FirstName;
                        String smsTemplateForRef = 'Hi '+refName+', You have been nominated by '+custName+' as a character reference. Please click the below link to assist with R4K. '+finalURL;
                        
                        CommunicationUtil.SMSWrapper smsWrap = new CommunicationUtil.SMSWrapper();
                        smsWrap.objectId = ref.Id;
                        smsWrap.mobileNo = ref.SMS_Referee_Mobile__c;
                        smsWrap.smsGroupType = 'RefereeContact';                  
                        smsWrap.objectType = 'Referee__c';                  
                        smsWrap.ownerId = ref.Applicant__r.OwnerId;
                        smsWrap.smsTemplate = smsTemplateForRef;                  
                        smsWrapperList.add(smsWrap);
                    }
                }
            }
            
            if(smsWrapperList.size()>0)
                CommunicationUtil.sendBulkSMS(smsWrapperList);
         }*/
        getWIP();
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','sendRefereeContactFollowupSMS',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void getAndMapApplicantsTobeConverted()
{
    //String smsMessage=Apexpages.currentPage().getParameters().get('smsTextHA');
    try
    {
        leadSearchWrapLst = new List<LeadSearchWrapper>();
        if(leadWrapLst.size()>0)
        {
            for(LeadWrapper cw : leadWrapLst)
            {
                if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
                {
                    searchAndRetrieveApplicants(cw.ld);
                }
            }
        }else if(conversationWrapperList != null && conversationWrapperList.size() > 0){
            for(PhoneCallTrackerController.ConversationsWrapper cw : conversationWrapperList)
            {
                if(cw.isSelected!=null && cw.isSelected)
                {
                    List<Lead> phoneCallLeads;
                    String ldlstSOQL = 'select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Territory_Number__r.Company_Territory__c,Account__r.No_of_Agreements__c,LastModifiedDate,Account__r.No_Of_Active_Agreements__c,';
                    ldlstSOQL+=  'Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,No_of_times_Bot_Called__c,SMS_Mobile__c,Account__r.FirstName,Account__r.OwnerId,Account__r.SMS_Mobile__c,Account__r.Customer_Photo_Id__c,';
                    ldlstSOQL+= 'OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,Hybrid_link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Probable_Account__c,Probable_Account_Summary__c,';
                    ldlstSOQL+='Bot_Call_Status__c,Bot_Call_Datetime__c,Territory_Number__r.Bot_Start_Time__c,Territory_Number__r.Bot_Finish_Time__c,Territory_Number__r.Short_Name__c,CreatedDate,Bot_Followup_Status__c,Rep_Responsible_For_Converting_Lead__c,Next_Bot_Call_Datetime__c,Days_and_Hours_Since_Lead_Created__c,';
                    ldlstSOQL+='Account__r.Name,Account__r.Total_COGS_Active__c,Account__r.Total_Paid_Amount_Active_Only__c,Probable_Account__r.Total_COGS_Active__c,Probable_Account__r.Total_Paid_Amount_Active_Only__c,Territory_Number__r.Applicant_Customer_Prefix__c,Automation_OutCome__c,Unlock_Datetime__c,Last_Incoming_SMS_DateTime__c,Auto_Decline__c,Reason_For_Auto_Decline__c,';
                    ldlstSOQL+= 'Account__r.Equifax_Enquiry_DateTime__c,Account__r.Score_of_Equifax__c,Account__r.Equifax_No_of_Unpaid_Default_Rental__c,Account__r.Equifax_No_of_Unpaid_Default_NonRental__c,Account__r.Centrelink_Benefit__c,Rent4Keeps_Account__c,Account__r.PUA_Status__c,Probable_Territory__c,Probable_Territory__r.State_Master_State__c';
                    ldlstSOQL+=  ' from Lead where ';

                    if(cw.leadId != null){
                        ldlstSOQL += 'Id = \'' + cw.leadId + '\' LIMIT 1';
                        phoneCallLeads = Database.query(ldlstSOQL);
                    }else if(cw.accountId != null){
                        ldlstSOQL += 'Account__c = \'' + cw.accountId + '\' ORDER BY CreatedDate DESC LIMIT 1';
                        phoneCallLeads = Database.query(ldlstSOQL);
                    }
                    if(phoneCallLeads.size() > 0){
                        searchAndRetrieveApplicants(phoneCallLeads[0]);
                    }
                }
            }
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','getAndMapApplicantsTobeConverted',twilioProfile,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void searchAndRetrieveApplicants(Lead ld)
{
    String ldCRN=ld.CRN__c;
    String ldMobile=ld.MobilePhone;
    String ldLastName=ld.LastName;
    String ldAccountId=ld.Account__c;
    List<Account> accts = new List<Account>();
    String searchBasedOn = '';
    LeadSearchWrapper ldSWrap = new LeadSearchWrapper();
    ldSWrap.ld = ld;
    ldSWrap.applicantSearchWrapLst = new List<ApplicantSearchWrapper>();
    
    String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,No_Of_Active_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,Territory_Short_Name__c, ' + 
                'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,OwnerId,No_of_times_lead_has_been_converted__c, '+
                'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c '+
                'from Account where LastName!=null AND Territory_Number__r.Is_Credit_Contract__c = true and Territory_Number__r.Name not in (\'731\',\'733\',\'738\',\'734\') ' + 
                (twilioProfile.equalsIgnoreCase('R4K Licensing') ? 'AND Territory_Number__r.Name = \'1000\'' : ''); 
    
    String searchquery = originalquery;
    if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && ldLastName!=null && ldLastName!='')
    {
        searchquery = originalquery;
        searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') and LastName =\''+ldLastName+'\' AND PersonMobilePhone =\''+ ldMobile+'\')';
        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 3'; 
        system.debug('searchquery: '+searchquery); 
        accts = Database.query(searchquery);
        if(accts.size()>0)
            searchBasedOn = 'CRN,Mobile,LastName';
    }
    if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && accts.size()==0)
    {
        searchquery = originalquery;
        searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonMobilePhone =\''+ ldMobile+'\')';
        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 3'; 
        system.debug('searchquery: '+searchquery); 
        accts = Database.query(searchquery);
        if(accts.size()>0)
            searchBasedOn = 'CRN,Mobile';
    }
    if(ldCRN != null && ldCRN!='' && ldLastName!=null && ldLastName!='' && accts.size()==0)
    {
        searchquery = originalquery;
        searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND LastName =\''+ ldLastName+'\')';
        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 3'; 
        system.debug('searchquery: '+searchquery); 
        accts = Database.query(searchquery);
        if(accts.size()>0)
            searchBasedOn = 'CRN,LastName';
    }
    if(ldCRN != null && ldCRN!='' && accts.size()==0)
    {
        searchquery = originalquery;
        searchquery += ' and (Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\')';
        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 3'; 
        system.debug('searchquery: '+searchquery); 
        accts = Database.query(searchquery);
        if(accts.size()>0)
            searchBasedOn = 'CRN';
    }
    if(ldMobile != null && ldMobile!='' && ldLastName!=null && ldLastName!='' && accts.size()==0)
    {
        searchquery = originalquery;
        searchquery += ' and (PersonMobilePhone =\''+ldMobile+'\' AND LastName =\''+ ldLastName+'\')';
        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 3'; 
        system.debug('searchquery: '+searchquery); 
        accts = Database.query(searchquery);
        if(accts.size()>0)
            searchBasedOn = 'Mobile,LastName';
    }
    if(ldMobile != null && ldMobile!='' && accts.size()==0)
    {
        searchquery = originalquery;
        searchquery += ' and (PersonMobilePhone =\''+ldMobile+'\')';
        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 3'; 
        system.debug('searchquery: '+searchquery); 
        accts = Database.query(searchquery);
        if(accts.size()>0)
            searchBasedOn = 'Mobile';
    }
    if(ldAccountId!=null && ldAccountId!='')
    {
        accts = new List<Account>();
        searchquery = originalquery;
        searchquery += ' and (Id =\''+ldAccountId+'\')';
        searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
        system.debug('searchquery: '+searchquery); 
        accts = Database.query(searchquery);
        if(accts.size()>0)
            searchBasedOn = 'Hybrid';
    }
    if(accts.size()>0)
    {
        for(Account at : accts)
        {
            ApplicantSearchWrapper apSWrap = new ApplicantSearchWrapper();
            apSWrap.acct = at;
            apSWrap.searchBasedOn = searchBasedOn;
            ldSWrap.applicantSearchWrapLst.add(apSWrap);
        }
    }
    leadSearchWrapLst.add(ldSWrap);
    system.debug('leadSearchWrapLst: '+leadSearchWrapLst.size());
}

public PageReference convertToDN()
{
  String twilioOtherProfile=Apexpages.currentPage().getParameters().get('top');
  String dnType=Apexpages.currentPage().getParameters().get('dnType');
  try
    {
        String repResponsible = currentEmpId;
        if(twilioProfile!=null && twilioProfile.equalsIgnoreCase('R4K Licensing')){
            List<Employee__c> hybridEmps = [SELECT Id FROM Employee__c WHERE Name = 'Hybrid Application' AND Territory__r.Name = '1000' LIMIT 1];
            repResponsible = (hybridEmps.size() > 0 ? hybridEmps[0].Id : repResponsible);
        }
        
        RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Enquiry' limit 1];
        if(leadSearchWrapLst.size()>0)
        {
            for(LeadSearchWrapper lsw : leadSearchWrapLst)
            {
                if(lsw.applicantSearchWrapLst.size()>0)
                {
                    //Convert the lead only for the selected applicant
                    for(ApplicantSearchWrapper apSWrap : lsw.applicantSearchWrapLst)
                    {
                        if(apSWrap.isSelected!=null && apSWrap.isSelected)
                        {
                            Account acctToUp = new Account();
                            acctToUp.Id = apSWrap.acct.Id;
                            acctToUp.Enquiry_Date__c = Date.today();
                            acctToUp.Enquiry_Datetime__c = Datetime.now();
                            acctToUp.Enquiry_Status__c = (dnType != null && dnType.trim().equalsIgnoreCase('DNP') ? 'DNC - Did Not Proceed' : 'DNC - Did Not Contact');
                            acctToUp.Rep_Responsible_For_Converting_Lead__c = repResponsible;
                            String currentDateStr = Datetime.now().format('dd-MM-yyyy');
                            acctToUp.Reason_why_application_did_not_go_ahead__c = 'Not able to contact the applicant using PA Console by '+twilioPersonName+' on '+currentDateStr;
                            update acctToUp; 
                            
                            //system.debug('ldName: '+lsw.ld.Name+' accountName: '+apSWrap.acct.Name+' ldAccountId: '+lsw.ld.Account__c);
                            if(lsw.ld.Account__c==null)
                            {
                                system.debug('##Converting Lead to existing applicant');
                                NewEnquirySectionController nes = new NewEnquirySectionController();
                                nes.doConvert(lsw.ld.Id,apSWrap.acct);
                                nes.calculateCallTime(apSWrap.acct.Id,lsw.ld.Id);
                            }
                        }
                    }
                    //////////////////////////////////////////////////

                    //mark phone calls as read//
                    if(twilioProfile!=null && twilioProfile.equalsIgnoreCase('R4K Licensing')){
                        communicatedBack();
                    }
                    ///////////////////////////////////////////
                }
                else
                {
                    //Create a new applicant and convert the lead
                    List<Credit_Guideline__c> creditGuidelines = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: lsw.ld.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
                    String creditGuidelinesId='';
                    if(creditGuidelines.size()>0)
                        creditGuidelinesId = creditGuidelines[0].Id;
                    Account createdAcct = createApplicant(lsw.ld, repResponsible, 'DNC - Did Not Contact',personAccountRecordType.Id,creditGuidelinesId);
                    system.debug('##Converting Lead to new applicant');
                    NewEnquirySectionController nes = new NewEnquirySectionController();
                    nes.doConvert(lsw.ld.Id,createdAcct);
                    nes.calculateCallTime(createdAcct.Id,lsw.ld.Id);
                    ///////////////////////////////////////////

                    //mark phone calls as read//
                    if(twilioProfile!=null && twilioProfile.equalsIgnoreCase('R4K Licensing')){
                        communicatedBack();
                    }
                    ///////////////////////////////////////////
                }
            }
        }

        if(twilioProfile!=null && twilioProfile.equalsIgnoreCase('R4K Licensing')) 
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&type='+type+'&region='+region).setRedirect(true);
        else if(twilioOtherProfile!=null && twilioOtherProfile!='') 
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&top='+twilioOtherProfile).setRedirect(true);
        else
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName).setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','convertToDN',twilioProfile,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        if(twilioOtherProfile!=null && twilioOtherProfile.equalsIgnoreCase('R4K Licensing')) 
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&type='+type+'&region='+region).setRedirect(true);
        else if(twilioOtherProfile!=null && twilioOtherProfile!='') 
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&top='+twilioOtherProfile).setRedirect(true);
        else
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName).setRedirect(true);
    }
}

public PageReference addToWeCare()
{
String twilioOtherProfile=Apexpages.currentPage().getParameters().get('top');
try
    {
        List<Employee__c> weCareEmpLst = [select id,name,Territory__r.State_Master_State__c from Employee__c where name='We Care' and Territory__r.Is_Credit_Contract__c=true];
        Map<String,String> mapWeCareEmp = new Map<String,String>();
        if(weCareEmpLst.size()>0)
        {
            for(Employee__c e: weCareEmpLst)
                mapWeCareEmp.put(e.Territory__r.State_Master_State__c ,e.Id);
        }
        system.debug('mapWeCareEmp: '+mapWeCareEmp);
        RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Enquiry' limit 1];
        if(leadSearchWrapLst.size()>0)
        {
            for(LeadSearchWrapper lsw : leadSearchWrapLst)
            {
                system.debug('ldName: '+lsw.ld.Name);
                String weCareEmpId = lsw.ld.Territory_Number__r.State_Master_State__c!=null && mapWeCareEmp.containsKey(lsw.ld.Territory_Number__r.State_Master_State__c) ? mapWeCareEmp.get(lsw.ld.Territory_Number__r.State_Master_State__c) : null;
                if(weCareEmpId==null)
                    weCareEmpId = mapWeCareEmp.get('VIC')!=null ? mapWeCareEmp.get('VIC') : null;
                if(lsw.applicantSearchWrapLst.size()>0)
                {
                    //Convert the lead only for the selected applicant
                    for(ApplicantSearchWrapper apSWrap : lsw.applicantSearchWrapLst)
                    {
                        if(apSWrap.isSelected!=null && apSWrap.isSelected)
                        {
                            Account acctToUp = new Account();
                            acctToUp.Id = apSWrap.acct.Id;
                            acctToUp.Enquiry_Date__c = Date.today();
                            acctToUp.Enquiry_Datetime__c = Datetime.now();
                            acctToUp.Enquiry_Status__c = 'Enquiry';
                            acctToUp.Rep_Responsible_For_Converting_Lead__c = weCareEmpId;
                            update acctToUp; 
                            
                            if(lsw.ld.Account__c==null)
                            {
                                system.debug('##Converting Lead to existing applicant');
                                NewEnquirySectionController nes = new NewEnquirySectionController();
                                nes.doConvert(lsw.ld.Id,apSWrap.acct);
                            }
                        }
                    }
                    //////////////////////////////////////////////////
                }
                else
                {
                    //Create a new applicant and convert the lead
                    List<Credit_Guideline__c> creditGuidelines = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: lsw.ld.Territory_Number__c and Territory__r.Is_Credit_Contract__c=true ORDER BY CreatedDate DESC LIMIT 1];
                    String creditGuidelinesId='';
                    if(creditGuidelines.size()>0)
                        creditGuidelinesId = creditGuidelines[0].Id;
                    Account createdAcct = createApplicant(lsw.ld, weCareEmpId, 'Enquiry',personAccountRecordType.Id,creditGuidelinesId);
                    system.debug('##Converting Lead to new applicant');
                    NewEnquirySectionController nes = new NewEnquirySectionController();
                    nes.doConvert(lsw.ld.Id,createdAcct);
                    ///////////////////////////////////////////
                }
            }
        }
        if(twilioOtherProfile!=null && twilioOtherProfile!='') 
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&top='+twilioOtherProfile).setRedirect(true);
        else
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName).setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','addToWIP',twilioProfile,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        if(twilioOtherProfile!=null && twilioOtherProfile!='') 
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&top='+twilioOtherProfile).setRedirect(true);
        else
            return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName).setRedirect(true);
    }
}

public Account createApplicant(Lead ld, String empId, String enquiryStatus,String personAccountRecordTypeId,String creditGuidelinesId)
{
    Account accountToUp = new Account();
    if(ld.Email!=null && !ld.Email.containsIgnoreCase('declined') && !ld.Email.equalsIgnoreCase('na') && !ld.Email.containsIgnoreCase('not provided') && !ld.Email.containsIgnoreCase('not available'))
    {
        accountToUp.PersonEmail=ld.Email;
    }
    if(ld.MobilePhone!=null && !ld.MobilePhone.containsIgnoreCase('declined') && !ld.MobilePhone.equalsIgnoreCase('na') && !ld.MobilePhone.containsIgnoreCase('not provided') && !ld.MobilePhone.containsIgnoreCase('not available'))
    {
        accountToUp.PersonMobilePhone=ld.MobilePhone;
    }
    
    accountToUp.Reason_for_Enquiry__c=ld.Reason_for_Enquiry__c;
    accountToUp.Enquiry_Notes__c=ld.Enquiry_Notes__c;
    
    if(ld.Street!=null && !ld.Street.containsIgnoreCase('declined') && !ld.Street.equalsIgnoreCase('na') && !ld.Street.containsIgnoreCase('not provided') && !ld.Street.containsIgnoreCase('not available') && ld.City!=null && !ld.City.containsIgnoreCase('declined') && !ld.City.equalsIgnoreCase('na') && !ld.City.containsIgnoreCase('not provided') && !ld.City.containsIgnoreCase('not available') && ld.PostalCode!=null && !ld.PostalCode.containsIgnoreCase('declined') && !ld.PostalCode.equalsIgnoreCase('na') && !ld.PostalCode.containsIgnoreCase('not provided') && !ld.PostalCode.containsIgnoreCase('not available') )
    {
        accountToUp.PersonMailingStreet=ld.Street;
        accountToUp.PersonMailingCity=ld.City;
        accountToUp.PersonMailingState=ld.State;
        accountToUp.PersonMailingPostalCode=ld.PostalCode;
    }
    
    accountToUp.Product_Description__c=ld.Desired_Product__c;
    accountToUp.PersonLeadSource=ld.did_your_hear__c;
    
    if(ld.Latitude!=null && ld.Latitude!=0)
    {
        accountToUp.Sensis_Latitude__c=ld.Latitude;
        accountToUp.Sensis_Longitude__c=ld.Longitude;
    }
    
    if(ld.FirstName!=null && !ld.FirstName.containsIgnoreCase('declined') && !ld.FirstName.equalsIgnoreCase('na') && !ld.FirstName.containsIgnoreCase('not provided') && !ld.FirstName.containsIgnoreCase('not available'))
    {
        accountToUp.FirstName=ld.FirstName;
    }
    if(ld.LastName!=null && !ld.LastName.containsIgnoreCase('declined') && !ld.LastName.equalsIgnoreCase('na') && !ld.LastName.containsIgnoreCase('not provided') && !ld.LastName.containsIgnoreCase('not available'))
    {
        accountToUp.LastName=ld.LastName;
    }
    accountToUp.OwnerId = ld.OwnerId;
    accountToUp.Territory_Number__c = ld.Territory_Number__c;
    accountToUp.CurrencyIsoCode = ld.Territory_Number__r.State_Master_State__c == 'NZ' ? 'NZD' : 'AUD';
    accountToUp.Referees_Contacted_for_Current_Enquiry__c=0;
    accountToUp.Enquiry_Status__c = enquiryStatus;
    if(enquiryStatus=='DNC - Did Not Contact')
    {
        String currentDateStr = Datetime.now().format('dd-MM-yyyy');
        accountToUp.Reason_why_application_did_not_go_ahead__c = 'Not able to contact the applicant using PA Console by '+twilioPersonName+' on '+currentDateStr;
accountToUp.Enquiry_Date__c = Date.today();
        accountToUp.Enquiry_Datetime__c = Datetime.now();
    }
    else if(enquiryStatus=='DNP - Did Not Proceed')
    {
        String currentDateStr = Datetime.now().format('dd-MM-yyyy');
        accountToUp.Reason_why_application_did_not_go_ahead__c = 'Applicant Withdrew the application using Engagement Bot by Rene'+' on '+currentDateStr;
accountToUp.Enquiry_Date__c = Date.today();
        accountToUp.Enquiry_Datetime__c = Datetime.now();
    }
    else
    {
        accountToUp.Enquiry_Date__c = Date.today();
        accountToUp.Enquiry_Datetime__c = Datetime.now();
    }
    accountToUp.Rep_Responsible_For_Converting_Lead__c = empId;
    
    accountToUp.RecordTypeId = personAccountRecordTypeId;
    accountToUp.Credit_Guideline__c = creditGuidelinesId;
    
    accountToUp.No_of_times_lead_has_been_converted__c=0;
    insert accountToUp;
    
    //Create a customer No
    if(ld.Territory_Number__c!=null && ld.Territory_Number__r.Applicant_Customer_Prefix__c!=null && ld.Territory_Number__r.Applicant_Customer_Prefix__c!='')
    {
    String currentCustomerNo=AccountUtil.generateCustomerNumberforAccount(ld.Territory_Number__r.Applicant_Customer_Prefix__c,null);
    Account at = new Account();
    at.Id = accountToUp.Id;
    at.Customer_No__c = currentCustomerNo;
    update at;
    }
    //////////////////
    return accountToUp;
}

public PageReference callCustomersForLeadFollowUp()
{
    try
    {
    List<Territory__c> terLstToUp = new List<Territory__c>();
    Time botStartTimeVal, botFinishTimeVal;
    if(botStartTime!=null && botFinishTime!=null && botStartTime.contains(':') && botFinishTime.contains(':') && terLstForBotUsers.size()>0)
     {
         String[] botStartTimeSplit = botStartTime.split(':');
         botStartTimeVal = Time.newInstance( Integer.valueOf(botStartTimeSplit[0]) ,Integer.valueOf(botStartTimeSplit[1]) ,0,0); 
         
         String[] botFinishTimeSplit = botFinishTime.split(':');
         botFinishTimeVal = Time.newInstance( Integer.valueOf(botFinishTimeSplit[0]) ,Integer.valueOf(botFinishTimeSplit[1]) ,0,0); 
     }
     else if(botStartTime!=null && botStartTime.contains(':'))
     {
         String[] botStartTimeSplit = botStartTime.split(':');
         botStartTimeVal = Time.newInstance( Integer.valueOf(botStartTimeSplit[0]) ,Integer.valueOf(botStartTimeSplit[1]) ,0,0); 
     }
     else if(botFinishTime!=null && botFinishTime.contains(':'))
     {
         String[] botFinishTimeSplit = botFinishTime.split(':');
         botFinishTimeVal = Time.newInstance( Integer.valueOf(botFinishTimeSplit[0]) ,Integer.valueOf(botFinishTimeSplit[1]) ,0,0); 
     }
     
     if(botStartTimeVal==null)
         botStartTimeVal = Time.newInstance( 9 ,30 ,0,0); 
     if(botFinishTimeVal==null)
         botFinishTimeVal = Time.newInstance( 5 ,0 ,0,0); 
     
     if(terLstForBotUsers.size()>0)
     {
     for(Territory__c ter : terLstForBotUsers)
     {
         Territory__c tertoUp = new Territory__c();
         tertoUp.Id = ter.Id;
         tertoUp.Bot_Start_Time__c = botStartTimeVal;
         tertoUp.Bot_Finish_Time__c = botFinishTimeVal;
         terLstToUp.add(tertoUp);
     }
     if(terLstToUp.size()>0)
         update terLstToUp;
     }
     
    if(leadWrapLst.size()>0)
    {
        List<String> leadsToCall = new List<String>();
        List<Account> colActs = new List<Account>();
        for(LeadWrapper lw : leadWrapLst)
        {
            if(lw.isSelectedToCall!=null && lw.isSelectedToCall)
            {
                system.debug('ldId: '+lw.ld.Id+' ldName: '+lw.ld.Name);
                leadsToCall.add(lw.ld.Id);
            }
        }
        if(leadsToCall.size()>0)
        {
            //MasterBotController.followUpLead(leadsToCall,'call');
            MasterBotController.followUpLead(leadsToCall);
        }
    }
    return new PageReference('/apex/R4KCLOEnquiryBot').setRedirect(true);
    }
    catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','callCustomersForLeadFollowUp',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference('/apex/R4KCLOEnquiryBot').setRedirect(true);
    }
}

public PageReference stopBotForLeadFollowUp()
{
    String twilioOtherProfile = ApexPages.CurrentPage().getParameters().get('top');
    List<Territory__c> terLstToUp = new List<Territory__c>();
    system.debug('terLstForBotUsers: '+terLstForBotUsers.size()+' - '+terLstForBotUsers);
    if(terLstForBotUsers.size()>0)
     {
     if(terLstForBotUsers[0].Name=='100')
     {
         terLstForBotUsers = [select id,name from Territory__c where ((state_Master_State__c in ('VIC','SA') and company_Territory__c=true) or Short_Name__c='Greensborough' or Short_Name__c='Wide Bay')];
     }
     for(Territory__c ter : terLstForBotUsers)
     {
         Territory__c tertoUp = new Territory__c();
         tertoUp.Id = ter.Id;
         tertoUp.Bot_Start_Time__c = null;
         tertoUp.Bot_Finish_Time__c = null;
         terLstToUp.add(tertoUp);
     }
     if(terLstToUp.size()>0)
         update terLstToUp;
     }
     
    if(currentEmpId!=null && twilioPersonName!=null && twilioOtherProfile!=null && twilioOtherProfile!='') 
        return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName+'&top='+twilioOtherProfile).setRedirect(true);
    if(currentEmpId!=null && twilioPersonName!=null)
        return new PageReference('/apex/CLOLeadManager?eid='+currentEmpId+'&tp='+twilioPersonName).setRedirect(true);
    else
        return new PageReference('/apex/R4KCLOEnquiryBot').setRedirect(true);
}

public PageReference callCustomersForMarketingEnquiries()
{
    if(acctWrapLst.size()>0)
    {
        TwilioIntegration ti = new TwilioIntegration();
        List<Account> colActs = new List<Account>();
        for(AccountWrapper cw : acctWrapLst)
        {
            if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
            {
                Account col = new Account();
                system.debug('name: '+cw.acct.Name);
                String nameVal=cw.acct.FirstName;
                Integer noOfAgmtsVal= Integer.valueOF(cw.acct.No_of_Active_Agreements__c);
                Decimal paymentAmtVal=cw.acct.Schedule_Amount__c!=null ? cw.acct.Schedule_Amount__c.setScale(2) : 0;
                Decimal arrearsAmtVal=cw.acct.Actual_Arrears__c!=null ? cw.acct.Actual_Arrears__c.setScale(2) : 0;
                String accountId=cw.acct.Id;
                String fromNumber = cw.acct.State_Master_State__c == 'NSW' ? fromNSWCLONumber : fromDarrandaCLONumber;
                String toNumber = cw.acct.SMS_Mobile__c;
                String param = '{"accountId" :\"'+accountId+'\", "name":\"'+nameVal+'\", "noOfAgmts":\"'+noOfAgmtsVal+'\", "paymentAmt" : \"'+paymentAmtVal+'\", "arrearsAmt":\"'+arrearsAmtVal+'\"}';
                if(cw.acct.No_of_Active_Agreements__c>0)
                {
                    if(!Test.isRunningTest()) //To be removed
                        ti.createFlowExecution(darrandaCLOForExistingCustomersFlowId,fromNumber,'+'+toNumber,param);
                }
                else
                {
                    if(!Test.isRunningTest()) //To be removed
                        ti.createFlowExecution(darrandaCLOForDormantCustomersFlowId,fromNumber,'+'+toNumber,param);
                }
                
                col.Id = cw.acct.Id;
                col.Bot_Call_status__c = 'Call Initiated';
                col.Bot_Call_Datetime__c = Datetime.now();
                colActs.add(col);
            }
        }
        
        if(colActs.size()>0)
            update colActs;
    }
    return new PageReference('/apex/R4KMarketingBot').setRedirect(true);
}

/*public void callCustomersforLeadEnquiry(String customerType, String accountId, String smsMobileNo, String custName, Integer noOfAgmtsVal, Decimal paymentAmtVal, Decimal arrearsAmtVal)
{
    TwilioIntegration ti = new TwilioIntegration();
     
    String param = '{"accountId" :\"'+accountId+'\", "name":\"'+custName+'\", "noOfAgmts":\"'+noOfAgmtsVal+'\", "paymentAmt" : \"'+paymentAmtVal+'\", "arrearsAmt":\"'+arrearsAmtVal+'\"}';
    if(customerType=='existing')
    {
        if(!Test.isRunningTest()) //To be removed
            ti.createFlowExecution(darrandaCLOForExistingCustomersFlowId,fromDarrandaCLONumber,'+'+smsMobileNo,param);
    }
    else if(customerType=='dormant')
    {
        if(!Test.isRunningTest()) //To be removed
            ti.createFlowExecution(darrandaCLOForDormantCustomersFlowId,fromDarrandaCLONumber,'+'+smsMobileNo,param);
    }
    
    Account acct = new Account();
    acct.Id = accountId;
    acct.Bot_Call_status__c = 'Call Initiated';
    acct.Bot_Call_Datetime__c = Datetime.now();
    update acct;
}*/

/*public PageReference callCOI()
{
    String officer = ApexPages.CurrentPage().getParameters().get('of');
    if(colWrapLst.size()>0)
    {
        TwilioIntegration ti = new TwilioIntegration();
        List<Referee__c> upReferees = new List<Referee__c>();
        List<Account> upAccts = new List<Account>();
        for(CollectionWrapper cw : colWrapLst)
        {
            if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
            {
                String custName = cw.colAct.Applicant__r.FirstName;
                if(cw.refWrapList.size()>0)
                {
                    for(RefereeWrapper rw : cw.refWrapList)
                    {
                        Id parentId = rw.Id;
                        String refName = rw.firstName;
                        String parentType;
                        
                        if(parentId!=null && parentId.getsobjecttype()!=null )
                        {
                            parentType = String.valueOf(parentId.getsobjecttype());
                        }
                        
                        if(parentType=='Account')
                        {
                            Account acct = new Account();
                            acct.Id = rw.Id;
                            acct.Bot_Referee_Call_Status__c = 'Call Initiated';
                            acct.Bot_Referee_Call_Datetime__c = Datetime.now();
                            upAccts.add(acct);
                        }
                        else if(parentType=='Referee__c')
                        {
                            Referee__c ref = new Referee__c();
                            ref.Id = rw.Id;
                            ref.Bot_Referee_Call_Status__c = 'Call Initiated';
                            ref.Bot_Referee_Call_Datetime__c = Datetime.now();
                            upReferees.add(ref);
                        }                       
                        String param = '{"id" :\"'+parentId+'\", "name":\"'+custName+'\", "refName":\"'+refName+'\"}';
                        if(!Test.isRunningTest()) //To be removed
                            ti.createFlowExecution(darrandaCollectionForRefereesFlowId,fromDarrandaCollectionNumber,'+'+rw.smsMobile,param);
                    }
                }
            }
        }
        
        if(upReferees.size()>0)
            update upReferees;
        if(upAccts.size()>0)
            update upAccts;
    }
    return new PageReference('/apex/R4KCollectionBot?of='+officer).setRedirect(true);
}*/

public PageReference ignore()
{
    String officer = ApexPages.CurrentPage().getParameters().get('of');
    String type = ApexPages.CurrentPage().getParameters().get('type');
    if(colWrapLst.size()>0)
    {
        List<Collection_Activity__c> colActs = new List<Collection_Activity__c>();
        for(CollectionWrapper cw : colWrapLst)
        {
            if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
            {
                Collection_Activity__c col = new Collection_Activity__c();
                col.Id = cw.colAct.Id;
                col.Ignore_Date__c = Date.today();
                colActs.add(col);
            }
        }
        if(colActs.size()>0)
            update colActs;
        getOpenCollections();
    }
    if(type=='cc')
        return new PageReference('/apex/R4KCollectionBot?of='+officer+'&type=cc').setRedirect(true);
    else 
        return new PageReference('/apex/R4KCollectionBot?of='+officer).setRedirect(true);
}

public PageReference ignoreMarketing()
{
    if(acctWrapLst.size()>0)
    {
        List<Account> colActs = new List<Account>();
        for(AccountWrapper cw : acctWrapLst)
        {
            if(cw.isSelectedToCall!=null && cw.isSelectedToCall)
            {
                Account col = new Account();
                col.Id = cw.acct.Id;
                //col.Ignore_Date__c = Date.today();
                colActs.add(col);
            }
        }
        if(colActs.size()>0)
            update colActs;
        getOpenMarketingEnquiries();
    }
    return new PageReference('/apex/R4KMarketingBot').setRedirect(true);
}

public void markNotificationAsRead()
{
    String pcId=Apexpages.currentPage().getParameters().get('pcId');
    try
    {
       if(pcId!=null && pcId!='')
       {
           PhoneCall__c pc = new PhoneCall__c();
           pc.Id = pcId;
           pc.Read__c = true;
           update pc;
       } 
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CollectionBotController','markNotificationAsRead',pcId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

private String convertMinutesToDays(Integer mns)
{
    Integer days = mns / 60 / 24 ;
    Integer hours = (mns - days * 60 * 24) / 60 ;
    Integer mins = mns - days * 60 * 24 - hours * 60 ;
    String formattedDay = days+'d '+hours+'h '+mins+'m';
    return formattedDay;
}

public PageReference cancel()
{
    return new PageReference('/a2B/o');
}  

public PageReference cancelToLeads()
{
    return new PageReference('/00Q/o');
}

public PageReference cancelToAccounts()
{
    return new PageReference('/001/o');
}

public class CollectionWrapper
{
    public Collection_Activity__c colAct {get;set;}
    public Boolean isSelectedToCall {get;set;}
    public List<RefereeWrapper> refWrapList {get;set;}
}

public class AccountWrapper implements Comparable
{
    public Account acct {get;set;}
    public Opportunity opp {get;set;}
    public Attachment latestDocLinkAttachment {get;set;}
    public Referee__c latestRefereeActivity {get;set;}
    public PhoneCall__c latestMissedPhoneCall {get;set;}
    public PhoneCallTrackerController.ConversationsWrapper latestCommunicationByCust {get;set;}
    public Boolean isLatestCommunicationByCustHighlighted {get;set;}
    public PhoneCall__c latestPhoneCallFromR4K {get;set;}
    public smagicinteract__smsMagic__c latestSMSMagicFromR4K {get;set;}
    public CommunicationWrapper latestCommunicationFromR4K {get;set;}
    public List<Referee__c> refs {get;set;}
    public Integer totRefCount {get;set;}
    public Integer totRefFamCount {get;set;}
    public Integer totRefContactedCount {get;set;}
    public Integer totRefFamContactedCount {get;set;}
    public Integer toRefExpected {get;set;}
    public Datetime priorityActivityDate {get;set;}
    public Integer lastActivityInMins {get;set;}
    public String lastActivityInDayFormatted {get;set;}
    public Integer latestCommunicationFromR4KInMinutes {get;set;}
    public String latestCommunicationFromR4KInDayFormatted {get;set;}
    public String enquiryDatetimeInDayFormatted {get;set;}
    public String leadHours {get;set;}
    public String currentStage {get;set;}
    public String nextStage {get;set;}
    public Integer allOutgoingComm {get;set;}
    public Integer allIncomingComm {get;set;}
    public Boolean isSelectedToCall {get;set;}
    
    public Integer compareTo(Object instance)
    {
        AccountWrapper that = (AccountWrapper)instance;
        if (this.priorityActivityDate < that.priorityActivityDate) return 1;
        if (this.priorityActivityDate > that.priorityActivityDate) return -1;
        return 0;
    }
}

public class LeadWrapper implements Comparable
{
    public Lead ld {get;set;}
    public Boolean isHybrid {get;set;}
    public Decimal contactMinutes {get;set;}
    public Boolean isLocked {get;set;}
    public Boolean isAutomationOn {get;set;}
    public String botMedium {get;set;} //smsnormal,smsnextday,call
    public Integer minutesToGetUnlocked {get;set;}
    public Attachment latestDocLinkAttachment {get;set;}
    public PhoneCall__c latestMissedPhoneCall {get;set;}
    public PhoneCallTrackerController.ConversationsWrapper latestCommunicationByCust {get;set;}
    public Boolean isLatestCommunicationByCustHighlighted {get;set;}
    public PhoneCall__c latestPhoneCallFromR4K {get;set;}
    public smagicinteract__smsMagic__c latestSMSMagicFromR4K {get;set;}
    public CommunicationWrapper latestCommunicationFromR4K {get;set;}
    public Integer lastHybridActivityInMins {get;set;}
    public String lastHybridActivityInDayFormatted {get;set;}
    public Integer lastActivityInMins {get;set;}
    public String lastActivityInDayFormatted {get;set;}
    public Datetime priorityActivityDate {get;set;}
    public String unlockReason {get;set;}
    public String appStatus {get;set;}
    public Integer allOutgoingComm {get;set;}
    public Integer allIncomingComm {get;set;}
    public Integer allIncomingSMS {get;set;}
    public String autoDeclineReason {get;set;}
    public Boolean isDuplicate {get;set;}
    public Boolean isSelectedToCall {get;set;}
    public List<PhoneCall__c> missedCalls {get;set;}
    public List<smagicinteract__smsMagic__c> incomingSMSs {get;set;}
    public Integer missedCallCount{get;set;}
    
    public Integer compareTo(Object instance)
    {
        LeadWrapper that = (LeadWrapper)instance;
        if (this.priorityActivityDate < that.priorityActivityDate) return 1;
        if (this.priorityActivityDate > that.priorityActivityDate) return -1;
        return 0;
    }
}

public class RefereeWrapper
{
    public Referee__c ref {get;set;}
    public String id {get;set;}
    public String name {get;set;}
    public String firstName {get;set;}
    public String type {get;set;}
    public String relation {get;set;}
    public String mobile {get;set;}
    public String smsMobile {get;set;}
    public String botStatus {get;set;}
    public Datetime botStatusDate {get;set;}
    public Boolean isSelected {get;set;}
}

public class LeadSearchWrapper
{
    public Lead ld {get;set;}
    public List<ApplicantSearchWrapper> applicantSearchWrapLst {get;set;}
}

public class ApplicantSearchWrapper
{
    public Account acct {get;set;}
    public String searchBasedOn {get;set;}
    public Boolean isSelected {get;set;}
}

public class CommunicationWrapper
{
    public String id {get;set;} 
    public String type {get;set;} //outgoing, incoming , outgoing sms, incoming sms, missed
    public String smsMessage {get;set;}
    public Datetime CreatedDate {get;set;}
}

public Integer aprCount{get;set;}
public Integer incSMSCount{get;set;}
public Integer misCallCount{get;set;}
public Integer nonStartCount{get;set;}
public Integer aippiCount{get;set;}
public Integer aipbsCount{get;set;}
public Integer aippaCount{get;set;}

}