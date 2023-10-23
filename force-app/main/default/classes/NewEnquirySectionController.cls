public class NewEnquirySectionController{
public String gSearchId {get;set;}
public String terName{get;set;}
public String leadId{get;set;}
public String acctId{get;set;}
public String ownerternamefordisplayonbuyout{get;set;}
public String ownertermobilefordisplayonbuyout{get;set;}
public String ownerteremailfordisplayonbuyout{get;set;}
public String acctStateMasterState{get;set;}
public Decimal noofactiveagreements{get;set;}
public Decimal existingR4KPayment{get;set;}
public Boolean showBuyoutSection{get;set;}
public Boolean showLeadOwner{get;set;}
public Boolean recordaccess{get;set;}
public List<Account> accounts=new List<Account>();
public List<Lead> lds=new List<Lead>();
public String requestForBuyout {get;set;}
public Boolean showTable {get;set;}
public Boolean showTableSelected {get;set;}
public Boolean showLatestAgreement{get;set;}

public String showLatestAgreementId{get;set;}
public String showLatestAgreementName{get;set;}
public String showLatestAgreementCreatedDate{get;set;}
public String ownerName{get;set;}
private String soql {get;set;}
public List<User> users {get;set;}
public String currentId{get;set;}

public Boolean goToEdit{get;set;}
public Boolean newAppButton{get;set;}
public Boolean differentOwner{get;set;}

public String acctEmail{get;set;}
public String acctMobile{get;set;}
public String acctStreet{get;set;}
public String acctCity{get;set;}
public String acctState{get;set;}
public String acctPostalCode{get;set;}
public String acctDesProd{get;set;}

public List<Territory__c> terList{get;set;}

//below fields for smart recommendation
public Decimal totalLatePaymentFeesApplied{get;set;}
public Integer totalAgreementsVaried{get;set;}
public Date lastAgreementVariedDate{get;set;}
public Decimal totalArrears{get;set;}
public Decimal totalAgreements{get;set;}
public Decimal totalActiveAgreements{get;set;}
public Integer recentITICount{get;set;}
public Integer recentITBCount{get;set;}
public Integer recentIVICount{get;set;}
public Integer totalRecentAppStats{get;set;}
public Decimal maxFortnightlyPayment{get;set;}
public Decimal maxCOGS{get;set;}
public Decimal serviceability{get;set;}
public Date lastActiveAgreementCreatedDate{get;set;}
public String lastActiveAgreementName{get;set;}
public Decimal applicantScheduledAmount{get;set;}
public Date lastAgreementCompletedDate{get;set;}
public Date lastITICreatedDate{get;set;}
public Date lastITIEffectiveDate{get;set;}
public Integer missedPaymentsInLast6Payments{get;set;}
public String applicantName{get;set;}
public Boolean showSmartRecommendation{get;set;}
public Boolean isIDR{get;set;}
public String nextCAMStep{get;set;}
public Boolean showQuickConvert{get;set;}
public Boolean isSCI{get;set;}
public Boolean isDefault{get;set;}
public Boolean isSecondApplicant{get;set;}
public Integer writtenOffCount{get;set;} 
//above fields for smart recommendation

public List<Territory__c> availableTerritories{get;set;}
public List<String> territoryIdsWithRecordAccess{get;set;}
public List<String> territoryNamesWithRecordAccess{get;set;}
public String allTerritoryNamesWithRecordAccess{get;set;}
public Boolean showTerritories{get;set;}
public String currentLeadPostalCode{get;set;}
public String territorySearchQuery{get;set;}
public Integer selectedTerritoryIndex{get;set;}
public String userTheme{get;set;}
public String redirectURL{get;set;}
public Boolean isClLead{get;set;}
public Boolean isAULead{get;set;}
public Boolean convertedLead{get;set;}
public Boolean forwardedLead{get;set;}
public Boolean dormantCanConvert{get;set;}
public String repResponsibleToConvertPreviousLead{get;set;}
public String waMasterId{get;set;}
public String accessUserId{get;set;}
public SensisValidator sv{get;set;}

public SelectOption[] requestForBuyouts { //this is where we're going to pull the list
        public get;
        private set;
    }
public String enquiryStatus {get;set;}
public SelectOption[] enquiryStatuses { //this is where we're going to pull the list
        public get;
        private set;
    }
    
Account account;
public ApexPages.StandardController stdCtrl {get; set;}

public NewEnquirySectionController(ApexPages.StandardController controller) {
account = (Account)controller.getRecord();
this.stdCtrl =controller;
acctId = Apexpages.currentPage().getParameters().get('acctId');
leadId = Apexpages.currentPage().getParameters().get('leadId');
convertedLead = false;
forwardedLead = false;
dormantCanConvert = false;
isClLead = false;
isAULead = false;
recordaccess = true;
showBuyoutSection=false;
showSmartRecommendation = true;
isDefault = false;
isSCI = false;
isSecondApplicant = false;
writtenOffCount = 0;
goToEdit = false;
differentOwner = false;
userTheme = UserInfo.getUiThemeDisplayed();
showTerritories = false;
selectedTerritoryIndex = null;
availableTerritories = new List<Territory__c>();
territoryIdsWithRecordAccess = new List<String>();
territoryNamesWithRecordAccess = new List<String>();
Map<String,String> terrIdNameMap = new Map<String,String>();
List<String> allterritoriesIds = new List<String>();
accessUserId = UserInfo.getUserId();

if(leadId!=null && leadId!='')
{
  lds=[select id,Name,Email,MobilePhone,Reason_for_Enquiry__c,Enquiry_Notes__c,PostalCode,crn__c,did_your_hear__c,
      Street,City,State,OwnerId,Territory_Number__c,Territory_Number__r.Name,Desired_Product__c,Latitude,Longitude,
      Lead_Medium__c,Territory_Number__r.Is_Credit_Contract__c,Territory_Number__r.State_Master_State__c 
      from Lead where id=:leadId];
  if(lds.size()>0)
  {
    if(lds[0].Email!=null && !lds[0].Email.containsIgnoreCase('declined') && !lds[0].Email.equalsIgnoreCase('na') && !lds[0].Email.containsIgnoreCase('not provided') && !lds[0].Email.containsIgnoreCase('not available'))
    {
        account.PersonEmail=lds[0].Email;
    }
    if(lds[0].MobilePhone!=null && !lds[0].MobilePhone.containsIgnoreCase('declined') && !lds[0].MobilePhone.equalsIgnoreCase('na') && !lds[0].MobilePhone.containsIgnoreCase('not provided') && !lds[0].MobilePhone.containsIgnoreCase('not available'))
    {
        account.PersonMobilePhone=lds[0].MobilePhone;
    }
    
    account.Reason_for_Enquiry__c=lds[0].Reason_for_Enquiry__c;
    account.Enquiry_Notes__c=lds[0].Enquiry_Notes__c;
    
    if(lds[0].Street!=null && !lds[0].Street.containsIgnoreCase('declined') && !lds[0].Street.equalsIgnoreCase('na') && !lds[0].Street.containsIgnoreCase('not provided') && !lds[0].Street.containsIgnoreCase('not available') && lds[0].City!=null && !lds[0].City.containsIgnoreCase('declined') && !lds[0].City.equalsIgnoreCase('na') && !lds[0].City.containsIgnoreCase('not provided') && !lds[0].City.containsIgnoreCase('not available') && lds[0].PostalCode!=null && !lds[0].PostalCode.containsIgnoreCase('declined') && !lds[0].PostalCode.equalsIgnoreCase('na') && !lds[0].PostalCode.containsIgnoreCase('not provided') && !lds[0].PostalCode.containsIgnoreCase('not available') )
    {
        account.PersonMailingStreet=lds[0].Street;
        account.PersonMailingCity=lds[0].City;
        account.PersonMailingState=lds[0].State;
        account.PersonMailingPostalCode=lds[0].PostalCode;
    }
    
    account.Product_Description__c=lds[0].Desired_Product__c;
    account.PersonLeadSource=lds[0].did_your_hear__c;
    
    if(lds[0].Latitude!=null && lds[0].Latitude!=0)
    {
        account.Sensis_Latitude__c=lds[0].Latitude;
        account.Sensis_Longitude__c=lds[0].Longitude;
    }
      
    if(lds[0].Territory_Number__c != null){
        territorySearchQuery = lds[0].Territory_Number__r.Name;
        isClLead = !lds[0].Territory_Number__r.Is_Credit_Contract__c;
        isAULead = (lds[0].Territory_Number__r.State_Master_State__c == 'NZ' ? false : true);
    }
    
    if(lds[0].Lead_Medium__c != 'Fonebox' && lds[0].Lead_Medium__c != 'Web'){
        currentLeadPostalCode = lds[0].PostalCode;
        List<String> resultTerritories = new List<String>();
        
        if(currentLeadPostalCode != null && currentLeadPostalCode != ''){
            List<Postcode__c> postcodes = [SELECT Id, Name, Territory__c, Territory__r.Short_Name__c FROM Postcode__c WHERE Name =: currentLeadPostalCode];
            for(Postcode__c post : postcodes){
                resultTerritories.add(post.Territory__r.Short_Name__c);
            }
            availableTerritories = [SELECT Id, Name, Short_Name__c, Territory_post_codes__c,OwnerId, Owner.Name FROM Territory__c WHERE Short_Name__c in: resultTerritories AND Id in: territoryIdsWithRecordAccess];
            if(availableTerritories.size() > 0){
                territorySearchQuery = availableTerritories[0].Name;
            }
        }
    }
    accessUserId = lds[0].OwnerId;
  }
}

List<Territory__c> allterritories = new List<Territory__c>();
if(isClLead){
    allterritories = [SELECT Id, Name FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') AND Is_Credit_Contract__c = false LIMIT 200];
}else{
    allterritories = [SELECT Id, Name FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') AND Is_Credit_Contract__c = true LIMIT 200];
}

for(Territory__c territory : allterritories){
    allterritoriesIds.add(territory.Id);
    terrIdNameMap.put(territory.Id,territory.Name);
    if(territory.Name == '800')
    {
        waMasterId = territory.Id;
    }
}

List<UserRecordAccess> territoriesWithRecordAccess = [SELECT RecordId FROM UserRecordAccess WHERE UserId=:accessUserId AND HasReadAccess = true ANd RecordId in: allterritoriesIds LIMIT 200];
for(UserRecordAccess territory : territoriesWithRecordAccess){
    territoryIdsWithRecordAccess.add(territory.RecordId);
}

System.debug('******territoryIdsWithRecordAccess ' + territoryIdsWithRecordAccess.size());
System.debug('******territoryIdsWithRecordAccess ' + territoryIdsWithRecordAccess);

List<Territory__c> allterritoriesWithAccess = [SELECT Id, Short_Name__c, OwnerId, Name FROM Territory__c WHERE Id in: territoryIdsWithRecordAccess];
for(Territory__c territory : allterritoriesWithAccess){
    territoryNamesWithRecordAccess.add(territory.Name);
}
System.debug('******territoryIdsWithRecordAccess ' + territoryIdsWithRecordAccess);
System.debug('******territoryNamesWithRecordAccess ' + territoryNamesWithRecordAccess);

allTerritoryNamesWithRecordAccess = '';
for(Integer i=0; i<territoryNamesWithRecordAccess.size(); i++){
    allTerritoryNamesWithRecordAccess += territoryNamesWithRecordAccess[i];
    if(i < (territoryNamesWithRecordAccess.size() - 1)){
        allTerritoryNamesWithRecordAccess += '-';    
    }
}


//Set value for Request for Buyout
String[] requestForBuyoutvalues = new String[]{'No','Yes'};
    this.requestForBuyouts = new SelectOption[]{};
    
    for (String c: requestForBuyoutvalues) {
        this.requestForBuyouts.add(new SelectOption(c,c));
    }
    
//Set value for Enquiry Status
String[] enquiryStatusvalues = new String[]{'Enquiry','Existing Account Enquiry','DNQ - Did Not Qualify','DNS - Did Not Service','DNC - Did Not Contact','DNP - Did Not Proceed','DND - Do Not Deal'};
    this.enquiryStatuses = new SelectOption[]{};
    
    for (String c: enquiryStatusvalues) {
        this.enquiryStatuses.add(new SelectOption(c,c));
    }
       
//Set records from acctId this is implemented so that user can view other owners applicant
if(acctId!=null){
    SetApplicantValues(acctId,leadId);
    createSmartRecommendation(acctId);
}
system.debug('account: '+account.id+'  account.PersonLeadSource: '+ account.PersonLeadSource);

if(account.id==null)
{
    showSmartRecommendation = false;
    String pfname = Apexpages.currentPage().getParameters().get('pfname');
    String plname = Apexpages.currentPage().getParameters().get('plname');
    String psuburb = Apexpages.currentPage().getParameters().get('psuburb');
    String pmobile = Apexpages.currentPage().getParameters().get('pmobile');
    account.FirstName=pfname;
    account.LastName=plname;
    account.PersonMailingCity=psuburb;
    account.PersonMobilePhone=pmobile;
    showLeadOwner=true;
    account.OwnerId=UserInfo.getUserId();
    ownerName=UserInfo.getName();
    showTerritories = true;
}
else
{   
    //check recordaccess
    List<UserRecordAccess> userAccess = [SELECT RecordId,HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: UserInfo.getUserId() AND RecordId =: account.Id];

    if(userAccess.size() > 0)
    {
        recordaccess = userAccess[0].HasReadAccess;
    }
    
    System.debug('********recordaccess ' + recordaccess);
    
    //check if dormant
    List<Account> acctList = [SELECT Id, WrittenOff_s_Count__c, RecordTypeId, RecordType.Name, Last_Agreement_Close_Date__c, No_of_Agreements__c, Active_Agreements__c, Is_IDR__c,Territory_Number__c,Territory_Number__r.Name
                                 FROM Account WHERE Id =: account.Id Limit 1];
    if(acctList.size() > 0)
    {
        writtenOffCount = Integer.valueOf(acctList[0].WrittenOff_s_Count__c);
        List<Opportunity> oppList = [SELECT Id, Name, Default_Letter_Sent_Date__c, SCI_sent_date__c FROM Opportunity WHERE AccountId =: acctList[0].Id];
        
        for(Opportunity opp : oppList)
        {
            if(opp.Default_Letter_Sent_Date__c <> null)
            {
                isDefault = true;
            }

            if(opp.SCI_sent_date__c <> null)
            {
                isSCI = true;
            }
        }
        
        List<Opportunity> secondApplicantOppList = [SELECT Id FROM Opportunity WHERE Applicant2__c =: acctList[0].Id AND StageName = 'Goods Delivered'];
        isSecondApplicant = (secondApplicantOppList.size() > 0 ? true : false);

        if(!isDefault && !isSCI && !isSecondApplicant && (acctList[0].Last_Agreement_Close_Date__c == null || acctList[0].Last_Agreement_Close_Date__c <= Date.today().addDays(-270)) && writtenOffCount == 0 && acctList[0].RecordType.Name.containsIgnoreCase('Dormant'))
        {
            dormantCanConvert = true;
        }
        
        if(recordaccess && territoryNamesWithRecordAccess.size() > 1)
        {
            showTerritories = true;
            territorySearchQuery = acctList[0].Territory_Number__r.Name;
        }
    }
    
    if(recordaccess)
    {
        showSmartRecommendation = true;    
    }else
    {
        showSmartRecommendation = false;
        showTerritories = false;
    }  
    
    showLeadOwner=false;
    
    //To check for agreements created within 21 days
    if(account.AgreementId_for_Current_Enquiry__c!=null)
    {
        List<Opportunity> oppsActive=[select id,Name,CreatedDate from Opportunity where AccountId=:account.Id and StageName='Goods Delivered' order by CreatedDate desc LIMIT 1];
        system.debug('oppsActive: '+oppsActive.size());
        if(oppsActive.size()>0)
        {
            Date todayDate=Date.today();
            Date latestAgmtCreatedDate=date.newinstance(oppsActive[0].CreatedDate.year(), oppsActive[0].CreatedDate.month(), oppsActive[0].CreatedDate.day());
            Integer noOfDaysBetwnLastAgmtAndToday=latestAgmtCreatedDate.daysBetween(todayDate);
            system.debug('latestAgmtCreatedDate: '+latestAgmtCreatedDate+' noOfDaysBetwnLastAgmtAndToday: '+noOfDaysBetwnLastAgmtAndToday);
            if(noOfDaysBetwnLastAgmtAndToday<21)
            {
                showLatestAgreement=true;
                showLatestAgreementId=oppsActive[0].Id;
                showLatestAgreementName=oppsActive[0].Name;
                showLatestAgreementCreatedDate=oppsActive[0].CreatedDate.format('dd-MMM-yyyy');
            }
        }
    }
    //////////////////////////////////////////////////    
}

if(isClLead || isAULead){
    enquiryStatuses = new List<SelectOption>();
    enquiryStatuses.add(new SelectOption('Existing Account Enquiry','Existing Account Enquiry'));
}

User [] uList = [select Id,Territory__c from User where id=:UserInfo.getUserId()];
if(uList.size()>0)
{
    terList=[select id, name,Short_Name__c from Territory__c where name=:uList[0].Territory__c];
    if(terList.size()>0)
    {
        terName=terList[0].Short_Name__c;
        //ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.ERROR,terList[0].Name+ '<-current existing->'+ account.Territory_Number__c);
        //ApexPages.addMessage(errorMsg);   
    }
}

}

public void searchTerritories()
{
    try
    {
        List<String> resultTerritories = new List<String>();
        
        String searchQuery = '%' + territorySearchQuery + '%';
        Set<Territory__c> finalSet = new Set<Territory__c>();
        
        List<Territory__c> nameNumberResults = [SELECT Id, Name, Short_Name__c, Territory_post_codes__c,OwnerId,Owner.Name FROM Territory__c WHERE (Short_Name__c LIKE: searchQuery OR Name LIKE: searchQuery) AND Id in: territoryIdsWithRecordAccess];
    
        List<Postcode__c> suburbpostcodes = [SELECT Id, Name, Territory__c, Territory__r.Id, Territory__r.Short_Name__c, Suburb__c FROM Postcode__c WHERE Territory__r.Id in: territoryIdsWithRecordAccess];
        for(Postcode__c post : suburbpostcodes){
            if( (post.Suburb__c != null && String.valueOf(post.Suburb__c).contains(territorySearchQuery)) || (post.Name != null && String.valueOf(post.Name).contains(territorySearchQuery)) ){
                resultTerritories.add(post.Territory__r.Short_Name__c);
            }
        }
        
        List<Territory__c> suburbResults = [SELECT Id, Name, Short_Name__c,Territory_post_codes__c,OwnerId,Owner.Name  FROM Territory__c WHERE Short_Name__c in: resultTerritories AND Id in: territoryIdsWithRecordAccess];
        
        availableTerritories = new List<Territory__c>();
        finalSet.addAll(nameNumberResults);
        finalSet.addAll(suburbResults);
        availableTerritories.addAll(finalSet);
        selectedTerritoryIndex = null;       
    }catch(Exception ex){
        ErrorLog.addErrorLog('NewEnquirySectionController','searchTerritories','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateSelectedTerritory(){
    try
    {
        String indexParam = ApexPages.currentPage().getParameters().get('selectedTerritoryIndex');
        if(indexParam != null && indexParam != ''){
            selectedTerritoryIndex = Integer.valueOf(indexParam);
        }
        System.debug('***********selectedTerritoryIndex ' + selectedTerritoryIndex);
    }catch(Exception ex){
        ErrorLog.addErrorLog('NewEnquirySectionController','updateSelectedTerritory','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public NewEnquirySectionController() 
{
    availableTerritories = new List<Territory__c>();
    territoryIdsWithRecordAccess = new List<String>();
    territoryNamesWithRecordAccess = new List<String>();
    Map<String,String> terrIdNameMap = new Map<String,String>();
    List<String> allterritoriesIds = new List<String>();
    List<Territory__c> allterritories = [SELECT Id, Name FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') AND Is_Credit_Contract__c = true LIMIT 200];
    if(Test.isRunningTest()){
        allterritories = [SELECT Id, Name FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') LIMIT 200];
    }
    for(Territory__c territory : allterritories){
        allterritoriesIds.add(territory.Id);
        terrIdNameMap.put(territory.Id,territory.Name);
        if(territory.Name == '800')
        {
            waMasterId = territory.Id;
        }
    }
    List<UserRecordAccess> territoriesWithRecordAccess = [SELECT RecordId FROM UserRecordAccess WHERE UserId=:UserInfo.getUserId() AND HasReadAccess = true ANd RecordId in: allterritoriesIds LIMIT 200];
    for(UserRecordAccess territory : territoriesWithRecordAccess){
        territoryIdsWithRecordAccess.add(territory.RecordId);
    }
    
    System.debug('******territoryIdsWithRecordAccess ' + territoryIdsWithRecordAccess.size());
    System.debug('******territoryIdsWithRecordAccess ' + territoryIdsWithRecordAccess);
    
    List<Territory__c> allterritoriesWithAccess = [SELECT Id, Short_Name__c, OwnerId, Name FROM Territory__c WHERE Id in: territoryIdsWithRecordAccess];
    for(Territory__c territory : allterritoriesWithAccess){
        territoryNamesWithRecordAccess.add(territory.Name);
    }
    System.debug('******territoryIdsWithRecordAccess ' + territoryIdsWithRecordAccess);
    System.debug('******territoryNamesWithRecordAccess ' + territoryNamesWithRecordAccess);
}

public PageReference redirectToEditApplication()
{
    goToEdit = true;
    newAppButton = false;
    if(account.Id!=null)
    {
        PageReference back = new PageReference('/apex/EnquiryPromotionPage?id='+account.id);
        back.setRedirect(true);
        return back;
    }
    else
        return new PageReference('/apex/EnquiryPromotionPage');
}


public PageReference save()
{
try
{
Territory__c territory = new Territory__c();
 RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
 RecordType buyoutRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Buyout' limit 1];
 User user = [select Id,Name,Territory__c from User where id=:UserInfo.getUserId()];
 system.debug('user.Territory__c: '+user.Territory__c);
 Territory__c[] territories = [select id,Name,Short_Name__c,Mobile__c from Territory__c where Id in: territoryIdsWithRecordAccess];
 
system.debug('account.LastName: '+account.LastName+'account.FirstName: '+account.FirstName);
if(account.FirstName==null || account.FirstName=='')
{
    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.ERROR, 'Enter First Name');
    //system.debug('errorMsg: '+errorMsg);
    ApexPages.addMessage(errorMsg);
    return null;
}
else if(account.LastName==null || account.LastName=='')
{
    ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.ERROR, 'Enter Last Name');
    //system.debug('errorMsg: '+errorMsg);
    ApexPages.addMessage(errorMsg);
    return null;
}
system.debug('personAccountRecordType.Id: '+personAccountRecordType.Id);
//account.RecordTypeId=personAccountRecordType.Id;

//Make all Credit Matrix values blank as an Enquiry is created
account.CM_Scheduled_Amount__c=null;
account.CM_COGS__c=null;
account.CM_Product_Category__c=null;
account.CM_Serviceable__c=null;
account.CM_No_of_Missed_Payments_Last_6_FN__c=null;
account.CM_Combined_Dollar_Exposure__c=null;
account.CM_No_of_Days_Missed_Since_Last_Payments__c=null;
account.CM_Equifax_Rental_Default__c=null;
account.CM_Equifax_Non_Rental_Default__c=null;
account.Product_Category_Selected__c=null;
account.Product_COGS_for_Agreement__c=null;
account.Product_RRP_for_Agreement__c=null;
//account.Product_Term_for_Agreement__c=null;
account.AgreementId_for_Current_Enquiry__c=null;
account.CM_Product_Category_Comments__c=null;
account.CM_COGS_Comments__c=null;
account.CM_Scheduled_Amount_Comments__c=null;
account.CM_OutstandingDefRental_Comp_Comments__c=null;
account.CM_OutstandingDefNonRental_Comp_Comments__c =null;
account.CM_Equifax_Score_Comments__c=null;
account.CM_days_since_last_Payment_Comments__c=null;
account.CM_Missed_from_last_6_FN_pymts_Comments__c=null;
account.CM_Serviceablilty_Comments__c=null;
account.CM_Bankruptcy_Part_9_Agreements_Comments__c=null;
account.CM_Reason_to_go_forward__c=null;
account.Address_Verified__c=false;
account.Income_Verified__c=false;
account.Expense_Verified__c=false;
account.Address_Verification_Type__c=null;
account.Income_Verification_Type__c=null;
account.Expense_Verification_Type__c=null;
account.Other_Rental_Company_Details__c = null;
account.myGov_Payment_Details__c = null;

account.CAM_Basic__c = false;
account.CAM_Contact__c = false;
account.CAM_Income__c = false;
account.CAM_Expense__c = false;
account.CAM_Equifax__c = false;
account.CAM_Credit_Matrix__c = false;
account.CAM_Referees__c = false;
account.CAM_Support_Docs__c = false;
account.CAM_Submit__c = false;

account.Rep_Name__c = null;
account.TR4K_Link_Status__c = null;

if(account.Enquiry_Date__c == null || account.Enquiry_Date__c.daysBetween(Date.today()) > 21)
{
    account.Bank_Institution__c=null;
    account.SMS_for_MyGov_Sent__c=false;
    account.SMS_for_BankStatement_Sent__c=false;
    account.AccessID_BankStatement__c=null;
    account.AccessID_MyGov__c=null;
    account.AccessID_MyGov__c=null;
    account.Hybrid_URL_BankStatement__c=null;
    account.Hybrid_URL_MyGov__c=null;
    account.BankStatement_Status__c=null;
    account.MyGov_Status__c=null;
    account.BankStatement_Date__c=null;
    account.MyGov_Date__c=null;
    account.MyGov_Final_Page__c = false;
    account.Bank_Final_Page__c = false;
    account.BankStatement_Amend__c = false;
    
    account.Basic_Info_Online__c = false;
    account.RO_Online__c =false;
    account.Income_Online__c = false;
    account.Expense_Online__c = false;
    account.Referees_Online__c = false;
    account.Equifax_Online__c = false;
    account.Next_Online_Step_Param__c = null;
    
    account.Shared_Expenses_Sent__c = null;
    account.Shared_Expenses_Confirmed__c = null;
    account.Shared_Expenses_Online__c = false;
    account.Expense_Details__c = null;
    account.Rent_Online__c = false;
    account.Tobacco_Alcohol_Online__c = false;
    account.Transport_Travel_Online__c = false;
    account.Utilities_Online__c = false;
    account.Clothing_Online__c = false;
    account.Credit_Card_Online__c = false;
    account.Household_Online__c = false;
    account.Insurance_Online__c = false;
    account.Loan_Online__c = false;
    account.Mobile_Online__c = false;
    account.Other_Regular_Online__c = false;
    account.Other_Rental_Online__c = false;

    account.Equifax_SMS_Consent_Sent__c=false;
    account.Equifax_SMS_Consent_Received__c=false;

    account.Hybrid_Link_Allocation_Datetime__c = null;
    account.Hybrid_Link_Finish_Datetime__c = null;
    account.BankStatement_Completion_Datetime__c = null;
    account.myGov_Completion_Datetime__c = null;
    account.Equifax_Consent_Received_DateTime__c = null;
    account.PhotoId_Attached_DateTime__c = null;

    account.Consent_URL__c = null;
    account.Consent_URLSent_DateTime__c = null;
    account.Consent_URL_Opened_DateTime__c = null;
    account.Consent_URL_Device_Info__c = null;
    account.Consent_URL_Latitude__c = null;
    account.Consent_URL_Longitude__c = null;
    account.Consent_URL_Address__c = null;
    
    account.Why_not_phone_plan__c = null;
    account.Product_Interested_In__c = null;
    account.Product_Name_for_Agreement__c = null;
    account.Product_Description__c = null;
    account.Why_consumer_lease__c = null;
    account.Benefit_of_Consumer_Lease_with_R4K__c = null;
    account.Specify_Other_Benefits_of_Consumer_Lease__c = null;
    
    account.Referees_Contacted_for_Current_Enquiry__c=0;
    account.Referees_Added_For_Current_Enquiry__c=0;
}
///////////////////////////////////////////////////////////////


String currentLeadId = '';
String leadOwnerId = '';
String leadOwnerTerritoryId = '';
String leadMedium = '';

if(leadId!=null && leadId!='')
{   
    System.debug('********Lead Id is present');
    currentLeadId = leadId;
    
    List<Lead> lds = [Select Id,Territory_Number__c,Lead_Medium__c,Opt_In_Info_From_Rent4keeps__c,Rent4Keeps_Account__c from Lead where id=:leadId AND IsConverted = FALSE AND Territory_Number__c != null LIMIT 1];
    if(lds.size() > 0)
    {
        System.debug('********Lead has been assigned to a territory');
        List<Territory__c> tempTerritories = [SELECT Id,Name,OwnerId,Owner.Name FROM Territory__c WHERE Id =: lds[0].Territory_Number__c AND Status__c = 'Active' LIMIT 1];
        if(tempTerritories.size() > 0){
            leadOwnerId = getOwnerId(tempTerritories[0].OwnerId, '', tempTerritories[0].Owner.Name);
            leadOwnerTerritoryId = tempTerritories[0].Id;
        }else{
            System.debug('********Lead has been assigned to an inactive territory');
        }
        leadMedium = lds[0].Lead_Medium__c;
        
        System.debug('********account.Enquiry_Date__c ' + account.Enquiry_Date__c);
        System.debug('********lds[0].Rent4Keeps_Account__c ' + lds[0].Rent4Keeps_Account__c);
        System.debug('********account.Rent4Keeps_Account__c ' + account.Rent4Keeps_Account__c);
        if(!lds[0].Opt_In_Info_From_Rent4keeps__c && (account.Enquiry_Date__c == null || account.Enquiry_Date__c.daysBetween(Date.today()) > 30)){
            account.Rent4Keeps_Account__c = null;
        }else if(lds[0].Opt_In_Info_From_Rent4keeps__c){
            account.Rent4Keeps_Account__c = lds[0].Rent4Keeps_Account__c;
        }
        System.debug('********account.Rent4Keeps_Account__c ' + account.Rent4Keeps_Account__c);
    }  
    
    System.debug('*******currentLeadId ' + currentLeadId);
    System.debug('***********leadOwnerId ' + leadOwnerId);
    System.debug('***********leadOwnerTerritoryId ' + leadOwnerTerritoryId);
}else{
    System.debug('********Lead Id is not present.');
    System.debug('********Creating New Lead.');

    Lead lead = new Lead();
    lead.FirstName = account.FirstName;
    lead.LastName = account.LastName;
    lead.Reason_for_Enquiry__c=account.Reason_for_Enquiry__c;
    lead.Enquiry_Notes__c=account.Enquiry_Notes__c;
    lead.PostalCode=null;
    //lead.PostalCode=account.PersonMailingPostalCode;
    lead.Street=account.PersonMailingStreet;
    lead.City=account.PersonMailingCity;
    lead.State=account.PersonMailingState;
    lead.MobilePhone = account.PersonMobilePhone;
    lead.Not_Spam__c='yes';
    lead.Lead_Medium__c='Direct';
    leadMedium = 'Direct';
    
    if(account.Id != null)
    {
        List<Account> acctList = [SELECT Id,Territory_Number__c, Territory_Number__r.Short_Name__c,OwnerId FROM Account WHERE Id =: account.Id LIMIT 1];
        
        if(acctList.size() > 0)
        {
            lead.OwnerId=acctList[0].OwnerId;
            lead.Territory_Number__c=acctList[0].Territory_Number__c;
        }
        
        if(!recordaccess && dormantCanConvert)
        {
            lead.OwnerId = user.Id;
            if(territories.size() > 0)
            {
                lead.Territory_Number__c = territories[0].Id;
            }
        }   
    }else
    {
        lead.OwnerId = user.Id;
        if(territories.size() > 0)
        {
            lead.Territory_Number__c = territories[0].Id;
        }
    }
    
    insert lead;
    
    List<Lead> lds =[select id from Lead where id=:lead.Id AND IsConverted = FALSE];
    if(lds.size() > 0)
    {
        System.debug('*******update new leadId');
        currentLeadId = lds[0].Id;
        System.debug('*******currentLeadId ' + currentLeadId);
    } 
}

List<Lead> leadList = [SELECT Id,Name,Email,MobilePhone,Reason_for_Enquiry__c,Enquiry_Notes__c,PostalCode,crn__c,did_your_hear__c,
                          Street,City,State,OwnerId,Owner.Name,Territory_Number__c,Territory_Number__r.Short_Name__c,Desired_Product__c,Territory_Number__r.Company_Territory__c,
                          Territory_Number__r.State_Master_State__c,Territory_Number__r.Id,Territory_Number__r.Name,Latitude,Longitude,Lead_Medium__c,Referring_Customer__c
                           FROM Lead WHERE Id =: currentLeadId AND IsConverted = false LIMIT 1];

if(leadList.size() > 0)
{  
    //Automation Outcome
    if(leadList[0].Territory_Number__c <> null && enquiryStatus <> null && (enquiryStatus.startsWith('DNP') || enquiryStatus.startsWith('DNC')) && (((leadList[0].Territory_Number__r.State_Master_State__c == 'VIC' || leadList[0].Territory_Number__r.State_Master_State__c == 'SA' || leadList[0].Territory_Number__r.State_Master_State__c == 'NSW' || leadList[0].Territory_Number__r.State_Master_State__c == 'WA' || leadList[0].Territory_Number__r.State_Master_State__c == 'QLD') && leadList[0].Territory_Number__r.Company_Territory__c) || leadList[0].Territory_Number__r.Short_Name__c == 'Greensborough' || leadList[0].Territory_Number__r.Short_Name__c == 'Wide Bay'))
    {
        Lead ald = new Lead();
        ald.Id = leadList[0].Id;
        ald.Automation_Outcome__c = enquiryStatus.split(' - ')[0].trim();
        update ald;
    }
    
    System.debug('********Checking for queues');
    
    leadMedium = leadList[0].Lead_Medium__c;
    
    if(leadOwnerId == '')
    {
        leadOwnerId = getOwnerId(leadList[0].OwnerId, '', leadList[0].Owner.Name);
        leadOwnerTerritoryId = getTerritoryId(leadList[0].OwnerId, leadList[0].Owner.Name);
    }
    
    System.debug('***********leadOwnerId ' + leadOwnerId);
    System.debug('***********leadOwnerTerritoryId ' + leadOwnerTerritoryId);
    
    if(account.id!=null)
    {
        Integer diffBetweenCurrentDayAndEnquiryDate=0;
        if(account.Enquiry_Date__c!=null)
            diffBetweenCurrentDayAndEnquiryDate=account.Enquiry_Date__c.daysBetween(Date.today());
            
        account.Enquiry_Status__c=enquiryStatus;
        system.debug('enquiryStatus: '+enquiryStatus+'diffBetweenCurrentDayAndEnquiryDate: '+diffBetweenCurrentDayAndEnquiryDate);
        if(enquiryStatus=='Enquiry')
        {
            account.Enquiry_Date__c=Date.today();
            account.Enquiry_DateTime__c=datetime.now();
            account.Application_Signed_Date__c=null;
        }
        else if(enquiryStatus=='Existing Account Enquiry' && isClLead)
        {   
            account.Enquiry_Date__c=account.Enquiry_Date__c;
            account.Enquiry_DateTime__c=account.Enquiry_DateTime__c;
            account.Enquiry_Status__c='Existing Account Enquiry';
        }
        else
        {
            account.Enquiry_Date__c=null;
            account.Enquiry_DateTime__c=null;
        }
        account.Is_last_referee_contacted__c=false;
        account.Last_Active_Agreement_Date__c=null;
        
        account.RequestOwnerforBuyout__c=requestForBuyout;
        account.Buyer_Territory__c=null;
        account.Sent_Buyout_Invoice_To_Buyer__c = false;
        account.Buyer_Territory_Card__c = null;
    
        //Add old Account information in account when Request to buyout is NO
        if(leadId!=null && leadId!='' && showBuyoutSection && account.RequestOwnerforBuyout__c=='No')
        {
            account.PersonEmail=acctEmail;
            account.PersonMobilePhone=acctMobile;
            account.PersonMailingStreet=acctStreet;
            account.PersonMailingCity=acctCity;
            account.PersonMailingState=acctState;
            account.PersonMailingPostalCode=acctPostalCode;
            account.Product_Description__c=acctDesProd;
        }
        /////////////////////////////////

        Credit_Guideline__c creditGuideline = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: account.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
        account.Credit_Guideline__c = creditGuideline.Id;
        
        if(recordaccess)
        {
            System.debug('********User has access to the account');
            System.debug('********Convert Lead');
            
            List<Lead> lds = [select Id,Territory_Number__c,Territory_Short_Name__c from Lead where id=:leadList[0].Id AND IsConverted = FALSE];
            if(lds.size() > 0)
            {
                List<Account> acctList = [SELECT Id,Territory_Number__c,Territory_Number__r.Name,Territory_Number__r.Short_Name__c,OwnerId FROM Account WHERE Id =: account.Id LIMIT 1];
                
                if(!dormantCanConvert && acctList.size() > 0 && acctList[0].Territory_Number__r.Short_Name__c != null && (lds[0].Territory_Number__c == null || (acctList[0].Territory_Number__r.Short_Name__c.trim() != lds[0].Territory_Short_Name__c.trim())) )
                {
                    System.debug('********lead territory not same as applicant territory');
                    System.debug('********change lead territory, owner');
                    
                    Lead ld = new Lead();
                    ld.Id = lds[0].Id;
                    ld.Territory_Number__c = acctList[0].Territory_Number__c;
                    ld.OwnerId = acctList[0].OwnerId;
                    update ld;    
                }
                
                if(territorySearchQuery <> null && territorySearchQuery.trim() <> acctList[0].Territory_Number__r.Name && selectedTerritoryIndex != null && availableTerritories != null && selectedTerritoryIndex < availableTerritories.size() && territorySearchQuery.trim() == availableTerritories[selectedTerritoryIndex].Name)
                {
                    account.Territory_Number__c = availableTerritories[selectedTerritoryIndex].Id;
                    account.OwnerId = getOwnerId(availableTerritories[selectedTerritoryIndex].OwnerId, availableTerritories[selectedTerritoryIndex].Name, availableTerritories[selectedTerritoryIndex].Owner.Name);
                }
                
                doConvert(lds[0].Id,account);
            }     
        }else if(!recordAccess && isClLead){
            List<Account> acctList = [SELECT Id,Territory_Number__c,Territory_Number__r.Name,Territory_Number__r.Short_Name__c,OwnerId FROM Account WHERE Id =: account.Id LIMIT 1];
            if(acctList.size() > 0){
                Lead ld = new Lead();
                ld.Id = lds[0].Id;
                ld.Territory_Number__c = acctList[0].Territory_Number__c;
                ld.OwnerId = acctList[0].OwnerId;
                update ld;
            }
        }
        update account;  
    }
    else
    {
        System.debug('***********account id is not present. creating a new account.');
        
        if((leadList[0].Lead_Medium__c == 'Referee EDM' || leadList[0].Lead_Medium__c == 'Marketing to Customer') && leadList[0].Referring_Customer__c <> null)
        {
            List<Global_Search__c> gSearch = [Select id,Applicant__r.Id,Applicant__r.Name,Suburb__c,Territory_Name__c from Global_Search__c where Applicant__c =: leadList[0].Referring_Customer__c LIMIT 1];
            account.Referring_Applicant__c = gSearch.size() > 0 ? gSearch[0].Id : null;
        }
        
        account.Enquiry_Status__c=enquiryStatus;
        if(enquiryStatus=='Enquiry')
        {
          account.Enquiry_Date__c=Date.today();
          account.Enquiry_DateTime__c=datetime.now();
          account.Application_Signed_Date__c=null;
        }
        else if(enquiryStatus=='Existing Account Enquiry' && isClLead)
        {   
            account.Enquiry_Date__c=account.Enquiry_Date__c;
            account.Enquiry_DateTime__c=account.Enquiry_DateTime__c;
            account.Enquiry_Status__c='Existing Account Enquiry';
        }
        else
        {
          account.Enquiry_Date__c=null;
          account.Enquiry_DateTime__c=null;
        }
        account.Is_last_referee_contacted__c=false;
        
        if(ownerName != null && ownerName != '' && ownerName.trim() != UserInfo.getName().trim())
        {    
            System.debug('********user chose to transfer');
                
            String ownerSearchQuery = '%' + String.escapeSingleQuotes(ownerName.trim()) + '%';
            
            System.debug('********ownerSearchQuery ' + ownerSearchQuery);
            
            List<User> transferUserList = [SELECT Id, Name, Territory__c FROM User WHERE Name LIKE: ownerSearchQuery LIMIT 1];
            
            if(transferUserList.size() > 0){
            
                System.debug('********transferUserList[0].Territory__c ' + transferUserList[0].Territory__c);
                
                List<Territory__c> transferUserTerritories = [SELECT Id, Name, Short_Name__c, OwnerId FROM Territory__c WHERE Name =: transferUserList[0].Territory__c LIMIT 1];
                
                if(territoryNamesWithRecordAccess.contains(transferUserTerritories[0].Name)){
                    System.debug('********has access to the transfer territory');
                    System.debug('********insert account');
                    
                    account.Territory_Number__c = transferUserTerritories[0].Id;
                    account.OwnerId = transferUserList[0].Id;
                    Credit_Guideline__c creditGuideline = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: account.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
                    account.Credit_Guideline__c = creditGuideline.Id;
                    insert account;
                    
                    System.debug('********convert lead');
                    List<Lead> lds =[select id from Lead where id=:leadList[0].Id AND IsConverted = false];
                    if(lds.size()>0)
                    {
                        doConvert(lds[0].Id,account);
                    } 
                }else
                {
                    System.debug('********does not have access to the chosen transfer territory. so create a lead and forward.');
                    
                    Lead lead = new Lead();
                    lead.FirstName = account.FirstName;
                    lead.LastName = account.LastName;
                    lead.MobilePhone = account.PersonMobilePhone;
                    lead.Email = account.PersonEmail;
                    lead.OwnerId = transferUserList[0].Id;
                    lead.Reason_for_Enquiry__c=account.Reason_for_Enquiry__c;
                    lead.Enquiry_Notes__c=account.Enquiry_Notes__c;
                    lead.PostalCode=null;
                    lead.Street=account.PersonMailingStreet;
                    lead.City=account.PersonMailingCity;
                    lead.State=account.PersonMailingState;
                    lead.Desired_Product__c = account.Product_Description__c;
                    lead.Territory_Number__c = transferUserTerritories[0].Id;
                    lead.did_your_hear__c = leadList[0].did_your_hear__c;
                    lead.crn__c = leadList[0].crn__c;
                    lead.Forwarded_From__c =  territories[0].Short_Name__c;
                    lead.Forwarders_Mobile_No__c = territories[0].Mobile__c;
                    lead.Forwarded_Date__c=date.today();
                    lead.Not_Spam__c='yes';
                    lead.Lead_Medium__c='Direct';

                    delete leadList;
                    
                    insert lead;
                    
                    forwardedLead = true;
                }
            }else
            {
                System.debug('***********user did not do transfer user search properly');
            }
        }else if(territorySearchQuery <> null && selectedTerritoryIndex != null && availableTerritories != null && selectedTerritoryIndex < availableTerritories.size() && territorySearchQuery.trim() == availableTerritories[selectedTerritoryIndex].Name)
        {
            System.debug('********user selected from the territory search and assign owner and territory');
            System.debug('********insert account');    
            
            account.Territory_Number__c = availableTerritories[selectedTerritoryIndex].Id;
            account.OwnerId = getOwnerId(availableTerritories[selectedTerritoryIndex].OwnerId, availableTerritories[selectedTerritoryIndex].Name, availableTerritories[selectedTerritoryIndex].Owner.Name);
            Credit_Guideline__c creditGuideline = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: account.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
            account.Credit_Guideline__c = creditGuideline.Id;
            insert account;
            
            System.debug('********convert lead');
            List<Lead> lds =[select id from Lead where id=:leadList[0].Id AND IsConverted = false];
            if(lds.size()>0)
            {
                doConvert(lds[0].Id,account);
            }
        }else{
            System.debug('********did not chose to transfer or did a territory search.');
            System.debug('********insert account');
            
            account.OwnerId = leadOwnerId;
            account.Territory_Number__c = leadOwnerTerritoryId;
            Credit_Guideline__c creditGuideline = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: account.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
            account.Credit_Guideline__c = creditGuideline.Id;
            insert account;
            
            System.debug('********convert lead');
            List<Lead> lds =[select id from Lead where id=:leadList[0].Id AND IsConverted = false];
            if(lds.size()>0)
            {
                doConvert(lds[0].Id,account);
            }
        }
    }
}

    System.debug('***********convertedLead ' + convertedLead);
    System.debug('***********forwardedLead ' + forwardedLead);
    
    if(!(convertedLead || forwardedLead))
    {
        System.debug('***********account.Id ' + account.Id);
        
        if(account.Id != null)
        {
            handleUnconvertedLeads(account.Id);
        }
    }else if(convertedLead)
    {
        calculateCallTime(account.Id,leadList[0].Id); 
    }


        goToEdit = false;
        newAppButton = false;
        System.debug('id ' + account.id);
        System.debug('recordaccess ' + recordaccess );
        if(isClLead && !recordaccess){
            return new PageReference('/apex/WIPPage').setRedirect(true);
        }else if(isClLead && account.Id!=null && recordaccess){
            return new PageReference('/' + account.id).setRedirect(true);
        }else if(account.Id!=null && recordaccess)
        {
            PageReference back;
            back = new PageReference('/apex/EnquiryPromotionPage?id='+account.id);
            back.setRedirect(true);
            return back;
        }else{
            if(account.Id!=null && account.RequestOwnerforBuyout__c != null && account.RequestOwnerforBuyout__c == 'Yes')
            {
                return new PageReference('/apex/BuyoutRequestFinishPage');
            }else
            {
                return new PageReference('/apex/WIPPage');
            }
        }
}
catch (Exception e) {
//Display error messages
//ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.ERROR, e.getMessage());
//ApexPages.addMessage(errorMsg);
    
    ErrorLog.addErrorLog('NewEnquirySectionController','save','',String.valueOf(e),String.valueOf(e.getLineNumber()));
    
    if(isClLead){
        return new PageReference('/apex/WIPPage');
    }else if(recordaccess && account.id!=null){    
        Lead lead = new Lead();
        lead.FirstName = account.FirstName;
        lead.LastName = account.LastName;
        lead.MobilePhone = account.PersonMobilePhone;
        lead.Email = account.PersonEmail;
        lead.OwnerId= account.ownerId;
        lead.Reason_for_Enquiry__c=account.Reason_for_Enquiry__c;
        lead.Enquiry_Notes__c=account.Enquiry_Notes__c;
        lead.PostalCode=null;
        lead.Street=account.PersonMailingStreet;
        lead.City=account.PersonMailingCity;
        lead.State=account.PersonMailingState;
        lead.Desired_Product__c = account.Product_Description__c;
        lead.Territory_Number__c = account.Territory_Number__c;
        lead.Not_Spam__c='yes';
        lead.Lead_Medium__c='Direct';
        insert lead;
        
        List<Lead> lds =[select id from Lead where id=:lead.Id AND IsConverted = false];
        if(lds.size()>0)
        {
            doConvert(lds[0].Id,account);
            return new PageReference('/apex/CAMProcess?id='+account.id);
        }
        
        return new PageReference('/' + account.id);
    }

return null;
}
}

public String getTerritoryId(String leadOwnerId,String leadOwnerName)
{
    try
    {
        System.debug('leadOwnerId: ' + leadOwnerId);
        String territoryName;

        List<Group> possibleQueue = [Select Id, Name from Group where type='Queue' AND (Id =: leadOwnerId OR Name =: leadOwnerName) LIMIT 1];
        
        if(possibleQueue.size() == 0)
        {
            List<User> users = [SELECT Id,Territory__c FROM User WHERE Id =: leadOwnerId LIMIT 1];
            territoryName = users.size() > 0 ? users[0].Territory__c : null;
        }else if(leadOwnerName != null)
        {
            territoryName = leadOwnerName.split(' ')[0];
        }

        if(territoryName <> null)
        {
            List<Territory__c> userTerritory = [SELECT Id,Name FROM Territory__c WHERE Name =: territoryName LIMIT 1];
            if(userTerritory.size() > 0)
            {
                return userTerritory[0].Id;
            }
        }

        User currentUser = [SELECT Id,Territory__c FROM User WHERE Id =: UserInfo.getUserId() LIMIT 1];
        Territory__c userTerritory = [SELECT Id,Name FROM Territory__c WHERE Name =: currentUser.Territory__c LIMIT 1];
        
        return userTerritory.Id;
    }catch(Exception ex){
        ErrorLog.addErrorLog('NewEnquirySectionController','getTerritoryId','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return UserInfo.getUserId();
    }
}


public String getOwnerId(String terrOwnerId, String terrName, String terrOwnerName)
{
    try
    {
        System.debug('terrOwnerId: ' + terrOwnerId);
        System.debug('terrName: ' + terrName);
        System.debug('terrOwnerName: ' + terrOwnerName);
        
        List<Group> possibleQueue = [Select Id, Name from Group where type='Queue' AND (Id =: terrOwnerId OR Name =: terrOwnerName) LIMIT 1];
        
        if(possibleQueue.size() == 0)
        {
            return terrOwnerId;
        }else
        {
            String territoryName = (terrName != null && terrName != '') ? terrName : ((terrOwnerName != null && terrOwnerName != '') ? terrOwnerName : '');
            
            if(territoryName != null && territoryName != '')
            {
                List<User> territoryUsers = [SELECT Id, Name, Territory__c, IsActive FROM USER WHERE Territory__c =: territoryName AND IsActive = true];
                
                for(User us : territoryUsers)
                {
                    if(us.Name == UserInfo.getName())
                    {
                        return UserInfo.getUserId();
                    }
                }
                
                if(territoryUsers.size() > 0)
                {
                    return territoryUsers[0].Id;
                }
            }
            return UserInfo.getUserId();    
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('NewEnquirySectionController','getOwnerId','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return UserInfo.getUserId();
    }

}


public void doConvert(Id leadId,Account account){
try
{
if(account!=null)
{
    Lead ld = new Lead();
    ld.Id=leadId;
    ld.Account__c=account.Id;
    update ld;
}
convertedLead = true;
Database.LeadConvert lc = new database.LeadConvert();
lc.setLeadId(leadId);
lc.setDoNotCreateOpportunity(True); //**IMPORTANT METHOD HERE**
lc.setAccountId(account.Id);
lc.setOwnerId(account.OwnerId);

LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
lc.setConvertedStatus(convertStatus.MasterLabel);
Database.LeadConvertResult lcr = Database.convertLead(lc);

//Incrementing the lead conversion count once the lead is converted
system.debug('account.No_of_times_lead_has_been_converted__c: '+account.No_of_times_lead_has_been_converted__c);
Decimal count=0;
if(account.No_of_times_lead_has_been_converted__c!=null)
    account.No_of_times_lead_has_been_converted__c++;
else
    account.No_of_times_lead_has_been_converted__c=1;
update account;
}
catch (Exception e) {
//Display error messages
system.debug('Exception: '+e);
ErrorLog.addErrorLog('NewEnquirySectionController','doConvert',String.valueOf(leadId),String.valueOf(e),String.valueOf(e.getLineNumber()));
//ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.ERROR, e.getMessage());
//ApexPages.addMessage(errorMsg);
}
}

public void doConvertFunc(Id leadId,Account account){
if(account!=null)
{
    Lead ld = new Lead();
    ld.Id=leadId;
    ld.Account__c=account.Id;
    update ld;
}
Database.LeadConvert lc = new database.LeadConvert();
lc.setLeadId(leadId);
lc.setDoNotCreateOpportunity(True); //**IMPORTANT METHOD HERE**
lc.setAccountId(account.Id);
lc.setOwnerId(account.OwnerId);

LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
lc.setConvertedStatus(convertStatus.MasterLabel);
Database.LeadConvertResult lcr = Database.convertLead(lc);

//Incrementing the lead conversion count once the lead is converted
system.debug('account.No_of_times_lead_has_been_converted__c: '+account.No_of_times_lead_has_been_converted__c);
Decimal count=0;
if(account.No_of_times_lead_has_been_converted__c!=null)
    account.No_of_times_lead_has_been_converted__c++;
else
    account.No_of_times_lead_has_been_converted__c=1;
update account;
}

// the current sort direction. defaults to asc
public String sortDir {
get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;  }
set;
}

// the current field to sort by. defaults to last name
public String sortField {
get  { if (sortField == null) {sortField = 'Name'; } return sortField;  }
set;
}


// runs the actual query
public void runQuery() {
try {
system.debug('showTable: '+showTable);
  showTable=true;
  showTableSelected=false;
  users = Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 10');
  if(users.size()>0)
     showTable=true;
  else
     showTable=false;
} catch (Exception e) {
  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops!'));
}

}

// runs the search with parameters passed via Javascript
public PageReference runSearch() {
system.debug('firstName:111');
String ownerName = '%'+Apexpages.currentPage().getParameters().get('ownerName');
    
soql = 'select id,Name from User where IsActive=true';

system.debug('ownerName: '+ownerName+' soql: '+soql);

if (!ownerName.equals(''))
  soql += ' and Name LIKE \''+String.escapeSingleQuotes(ownerName)+'%\'';
//if (!lastName.equals(''))
//  soql += ' and Suburb__c LIKE \''+String.escapeSingleQuotes(lastName)+'%\'';
// run the query again
runQuery();

return null;
}

public void hideSearchList()
{
    showTable=false;
    showTableSelected=true;
    //system.debug('showTable: '+showTable);
}

public void SetApplicantValues(String acctId, String leadId)
{
    accounts=[select id,Firstname,LastName,PersonLeadSource,PersonMobilePhone,Birthdate__c,Product_Interested_In__c,
    Product_Description__c,Middle_Name__pc,Previous_Name__c,Identification_No__c,PersonEmail,PersonHomePhone,PersonMailingStreet,
    PersonMailingCity,PersonMailingState,PersonMailingPostalCode,Sensis_Latitude__c,Sensis_Longitude__c,Previous_Address__c,
    Number_of_Dependants__c,General_Notes__c,Employment_Income__c,Existing_R4K_Payment__c,Is_Disability_Support_Pension__c,
    Rent_Mortgage_Board__c,Centrelink_Benefit__c,Loan_Payments__c,Centrelink_Benefit_Amount__c,Car_Lease_Loan_Payment__c,
    Centrelink_Benefit2__c,Credit_Card__c,Centrelink_Benefit2_Amount__c,Other_Rental_Companies__c,Centrelink_Benefit3__c,Insurance__c,
    Centrelink_Benefit3_Amount__c,Utilities__c,Other_Centrelink_Benefit__c,Food__c,Other_Centrelink_Benefit_Amount__c,Clothing__c,
    Highlevel_Income__c,Tobacco_Alcohol__c,Serviceability__c,OtherOutgoings__c,Credit_Check_Consent__c,Comfortable_Spending__c,Notes__c,
    RequestOwnerforBuyout__c,Buyer_Territory__c,Territory_Number__r.id,OwnerId,Owner.Name,No_of_times_lead_has_been_converted__c,
    Lead_Employment_Income__c,Lead_Rent__c,Lead_Total_Centrelink_Benefit_Amount__c,Lead_Utilities__c,Lead_Highlevel_Income__c,
    Lead_Food__c,Lead_Serviceability__c,Lead_Other_Outgoings__c,Lead_Comfortable_Spending__c,Reason_for_Enquiry__c,Enquiry_Notes__c,
    Territory_Number__r.Name,Territory_Number__r.Short_Name__c,Territory_Number__r.Mobile__c,Territory_Number__r.Email__c,No_Of_Active_Agreements__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Finish_Datetime__c,
    Referring_Applicant__c,Enquiry_Status__c,Buyer_Territory_Card__c,Enquiry_Date__c,Enquiry_DateTime__c,Product_Name_for_Agreement__c,Product_Term_for_Agreement__c,Why_consumer_lease__c,Why_not_phone_plan__c,
    Benefit_of_Consumer_Lease_with_R4K__c,AgreementId_for_Current_Enquiry__c,Specify_Other_Benefits_of_Consumer_Lease__c,Promotion_Enquiry__c,Territory_Number__r.State_Master_State__c,Rent4Keeps_Account__c
    from Account where id=:acctId];
    
    
    if(accounts.size()>0)
    {
        account.id=accounts[0].id;
        account.Firstname=accounts[0].Firstname;
        account.LastName=accounts[0].LastName;
        account.PersonLeadSource=accounts[0].PersonLeadSource;
        account.PersonMobilePhone=accounts[0].PersonMobilePhone;
        account.Birthdate__c=accounts[0].Birthdate__c;
        account.Product_Interested_In__c=accounts[0].Product_Interested_In__c;
        account.Product_Description__c=accounts[0].Product_Description__c;
        account.Middle_Name__pc=accounts[0].Middle_Name__pc;
        account.Previous_Name__c=accounts[0].Previous_Name__c;
        account.Identification_No__c=accounts[0].Identification_No__c;
        account.PersonEmail=accounts[0].PersonEmail;
        account.PersonHomePhone=accounts[0].PersonHomePhone;
        account.PersonMailingStreet=accounts[0].PersonMailingStreet;
        account.PersonMailingCity=accounts[0].PersonMailingCity;
        account.PersonMailingState=accounts[0].PersonMailingState;
        account.PersonMailingPostalCode=accounts[0].PersonMailingPostalCode;
        account.Sensis_Latitude__c=accounts[0].Sensis_Latitude__c;
        account.Sensis_Longitude__c=accounts[0].Sensis_Longitude__c;
        account.Previous_Address__c=accounts[0].Previous_Address__c;
        account.Number_of_Dependants__c=accounts[0].Number_of_Dependants__c;
        account.General_Notes__c=accounts[0].General_Notes__c;
        account.Employment_Income__c=accounts[0].Employment_Income__c;
        existingR4KPayment=accounts[0].Existing_R4K_Payment__c;
        account.Is_Disability_Support_Pension__c=accounts[0].Is_Disability_Support_Pension__c;
        account.Rent_Mortgage_Board__c=accounts[0].Rent_Mortgage_Board__c;
        account.Centrelink_Benefit__c=accounts[0].Centrelink_Benefit__c;
        account.Loan_Payments__c=accounts[0].Loan_Payments__c;
        account.Centrelink_Benefit_Amount__c=accounts[0].Centrelink_Benefit_Amount__c;
        account.Car_Lease_Loan_Payment__c=accounts[0].Car_Lease_Loan_Payment__c;
        account.Centrelink_Benefit2__c=accounts[0].Centrelink_Benefit2__c;
        account.Credit_Card__c=accounts[0].Credit_Card__c;
        account.Centrelink_Benefit2_Amount__c=accounts[0].Centrelink_Benefit2_Amount__c;
        account.Other_Rental_Companies__c=accounts[0].Other_Rental_Companies__c;
        account.Centrelink_Benefit3__c=accounts[0].Centrelink_Benefit3__c;
        account.Insurance__c=accounts[0].Insurance__c;
        account.Centrelink_Benefit3_Amount__c=accounts[0].Centrelink_Benefit3_Amount__c;
        account.Utilities__c=accounts[0].Utilities__c;
        account.Other_Centrelink_Benefit__c=accounts[0].Other_Centrelink_Benefit__c;
        account.Food__c=accounts[0].Food__c;
        account.Other_Centrelink_Benefit_Amount__c=accounts[0].Other_Centrelink_Benefit_Amount__c;
        account.Clothing__c=accounts[0].Clothing__c;
        account.Highlevel_Income__c=accounts[0].Highlevel_Income__c;
        account.Tobacco_Alcohol__c=accounts[0].Tobacco_Alcohol__c;
        account.Serviceability__c=accounts[0].Serviceability__c;
        account.OtherOutgoings__c=accounts[0].OtherOutgoings__c;
        account.Credit_Check_Consent__c=accounts[0].Credit_Check_Consent__c;
        account.Comfortable_Spending__c=accounts[0].Comfortable_Spending__c;
        account.Notes__c=accounts[0].Notes__c;
        account.RequestOwnerforBuyout__c=accounts[0].RequestOwnerforBuyout__c;
        account.Buyer_Territory__c=accounts[0].Buyer_Territory__c;
        account.Territory_Number__c=accounts[0].Territory_Number__r.id;
        account.OwnerId=accounts[0].OwnerId;
        ownerName=accounts[0].Owner.Name;
        account.Lead_Employment_Income__c=accounts[0].Lead_Employment_Income__c;
        account.Lead_Rent__c=accounts[0].Lead_Rent__c;
        account.Lead_Total_Centrelink_Benefit_Amount__c=accounts[0].Lead_Total_Centrelink_Benefit_Amount__c;
        account.Lead_Utilities__c=accounts[0].Lead_Utilities__c;
        account.Lead_Highlevel_Income__c=accounts[0].Lead_Highlevel_Income__c;
        account.Lead_Food__c=accounts[0].Lead_Food__c;
        account.Lead_Serviceability__c=accounts[0].Lead_Serviceability__c;
        account.Lead_Other_Outgoings__c=accounts[0].Lead_Other_Outgoings__c;
        account.Lead_Comfortable_Spending__c=accounts[0].Lead_Comfortable_Spending__c;
        account.No_of_times_lead_has_been_converted__c=accounts[0].No_of_times_lead_has_been_converted__c;
        account.Reason_for_Enquiry__c=accounts[0].Reason_for_Enquiry__c;
        account.Enquiry_Notes__c=accounts[0].Enquiry_Notes__c;
        account.Referring_Applicant__c=accounts[0].Referring_Applicant__c;
        noofactiveagreements=accounts[0].No_Of_Active_Agreements__c;
        ownerternamefordisplayonbuyout=accounts[0].Territory_Number__r.Short_Name__c;
        ownertermobilefordisplayonbuyout=accounts[0].Territory_Number__r.Mobile__c;
        ownerteremailfordisplayonbuyout=accounts[0].Territory_Number__r.Email__c;
        account.Enquiry_Status__c=accounts[0].Enquiry_Status__c;
        account.Buyer_Territory_Card__c=accounts[0].Buyer_Territory_Card__c;
        account.Enquiry_Date__c=accounts[0].Enquiry_Date__c;
        account.Enquiry_DateTime__c=accounts[0].Enquiry_DateTime__c;
        account.Product_Name_for_Agreement__c=accounts[0].Product_Name_for_Agreement__c;
        account.Product_Term_for_Agreement__c=accounts[0].Product_Term_for_Agreement__c;
        account.Why_not_phone_plan__c=accounts[0].Why_not_phone_plan__c;
        account.Why_consumer_lease__c=accounts[0].Why_consumer_lease__c;
        account.Benefit_of_Consumer_Lease_with_R4K__c=accounts[0].Benefit_of_Consumer_Lease_with_R4K__c;
        account.AgreementId_for_Current_Enquiry__c=accounts[0].AgreementId_for_Current_Enquiry__c;
        account.Specify_Other_Benefits_of_Consumer_Lease__c = accounts[0].Specify_Other_Benefits_of_Consumer_Lease__c;
        account.Promotion_Enquiry__c=accounts[0].Promotion_Enquiry__c;
        
        acctEmail=account.PersonEmail;
        acctMobile=account.PersonMobilePhone;
        acctStreet=account.PersonMailingStreet;
        acctCity=account.PersonMailingCity;
        acctState=account.PersonMailingState;
        acctPostalCode=account.PersonMailingPostalCode;
        acctDesProd=account.Product_Description__c;
        
        acctStateMasterState = accounts[0].Territory_Number__r.State_Master_State__c;
        
        if(leadId!=null)
        {
            List<Lead> leadlst=[select id,Name,did_your_hear__c,Reason_for_Enquiry__c,Enquiry_Notes__c from Lead where id=:leadId];
            
            if(leadlst.size()>0)
            {
                account.PersonLeadSource=leadlst[0].did_your_hear__c;
                account.Reason_for_Enquiry__c=leadlst[0].Reason_for_Enquiry__c;
                account.Enquiry_Notes__c=leadlst[0].Enquiry_Notes__c;
            }
        }
    }
}   

public PageReference next(){
System.debug('newAppButton: '+newAppButton);
System.debug('recordaccess ' + recordaccess );
System.debug('id ' + account.id);
String redirectTo = apexpages.currentpage().getparameters().get('redirectToParam');
redirectURL = '';
recordaccess = true;
account.Rep_Responsible_For_Converting_Lead__c = repSelected;

List<UserRecordAccess> userAccess = [SELECT RecordId, HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: UserInfo.getUserId() AND RecordId =:account.Id];
    
if(userAccess.size()>0){
    recordaccess = userAccess[0].HasReadAccess;        
}

if(newAppButton == null && account.id!=null){
    update account;
    redirectURL = '/apex/CAMProcess?id='+account.id;
}

if(goToEdit){
    if(account.Id!=null){
        update account;
        redirectURL = '/apex/CAMProcess?id='+account.id;
    }else{
        if(userTheme == 'Theme3'){
            redirectTo = 'ClassicLeads';
            redirectURL = '/00Q';    
        }else{
            redirectTo = 'LightningLeads';
            redirectURL = '/lightning/o/Lead/list?filterName=Recent'; 
        }
    }
}else{
    if(recordaccess && account.id!=null)
    {    
        update account;
        //return new PageReference('/'+account.id);
        System.debug('***********account.Enquiry_Status__c ' + account.Enquiry_Status__c);
        if(account.Enquiry_Status__c=='Enquiry'){
            redirectURL = '/apex/CAMProcess?id='+account.id;
        }else{
            if(userTheme == 'Theme3'){
                redirectTo = 'ClassicAccount';
                redirectURL = '/'+account.Id;   
            }else{
                redirectTo = 'LightningAccount';
                redirectURL = '/lightning/r/Account/' + account.Id + '/view';
            }
        }
    }else{
        if(userTheme == 'Theme3'){
            redirectTo = 'ClassicLeads';
            redirectURL = '/00Q';    
        }else{
            redirectTo = 'LightningLeads';
            redirectURL = '/lightning/o/Lead/list?filterName=Recent';
        }
    }
}

System.debug('*********userTheme ' + userTheme);

/*
if(userTheme == 'Theme4d'){
    return new PageReference('/apex/EnquiryRedirectPage?redirectTo=' + redirectTo + '&accountId=' + Account.Id + '&tab=top');
}else{
    return new PageReference('/apex/EnquiryRedirectPage?redirectTo=' + redirectTo + '&accountId=' + Account.Id);   
}
*/

return new PageReference(redirectURL).setRedirect(true);

}

public PageReference saveAndClose(){
    if(account.Id != null){
        account.Rep_Responsible_For_Converting_Lead__c = repSelected;
        update account;
        if(userTheme == 'Theme3'){
            return new PageReference('/' + account.Id);    
        }else{
            return new PageReference('/lightning/r/Account/' + account.Id + '/view');
        }
    }else{
        if(userTheme == 'Theme3'){
            return new PageReference('/00Q');    
        }else{
            return new PageReference('/lightning/o/Lead/list?filterName=Recent');
        }
    }
}

public void createSmartRecommendation(String acctId){
    try{
        totalLatePaymentFeesApplied = 0;
        totalAgreementsVaried = 0;
        totalAgreements = 0;
        totalActiveAgreements = 0;
        maxFortnightlyPayment = 0;
        totalRecentAppStats = 0;
        maxCOGS = 0;
        totalArrears = 0;
        applicantScheduledAmount = 0;
        missedPaymentsInLast6Payments = 0;
        showQuickConvert = false;
        
        List<Account> acctList = [SELECT Id, Is_Idr__c, FirstName, LastName, Name, Last_Active_Agreement_Date__c, Existing_R4K_Payment__c, Serviceability__c, No_of_Agreements__c, Active_Agreements__c, Agreement_Completed_Date__c, 
                                    CM_No_of_Missed_Payments_Last_6_FN__c, CM_Scheduled_Amount__c, CM_COGS__c, Highlevel_Income__c, Comfortable_Spending__c, Next_CAM_Step__c,Rep_Responsible_For_Converting_Lead__c,
                                    Rep_Responsible_For_Converting_Lead__r.Name,Enquiry_Status__c,Enquiry_Date__c  
                                    FROM Account WHERE Id =: acctId LIMIT 1];
        
        if(acctList.size() > 0)
        {    
            List<UserRecordAccess> userAccess = [SELECT RecordId, HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: UserInfo.getUserId() AND RecordId =: acctList[0].Id];
        
            if(userAccess.size()>0){
              showSmartRecommendation = userAccess[0].HasReadAccess;
            }
            
            repResponsibleToConvertPreviousLead = (acctList[0].Rep_Responsible_For_Converting_Lead__c == null ? null : acctList[0].Rep_Responsible_For_Converting_Lead__r.Name);
            showQuickConvert = (acctList[0].Enquiry_Status__c == 'Enquiry' && acctList[0].Enquiry_Date__c != null && acctList[0].Enquiry_Date__c.daysBetween(Date.today()) < 21) ? true : false;
            serviceability = acctList[0].Serviceability__c;
            applicantName = acctList[0].FirstName + ' ' + acctList[0].LastName;
            applicantScheduledAmount = acctList[0].Existing_R4K_Payment__c;
            missedPaymentsInLast6Payments = Integer.valueOf(acctList[0].CM_No_of_Missed_Payments_Last_6_FN__c == null ? 0 : acctList[0].CM_No_of_Missed_Payments_Last_6_FN__c);
            isIDR = acctList[0].Is_IDR__c;
            if(acctList[0].Agreement_Completed_Date__c > Date.today().addMonths(-2)){
                lastAgreementCompletedDate = acctList[0].Agreement_Completed_Date__c;
            }
            
            List<Opportunity> oppList = [SELECT Id, Name, StageName, Scheduled_Amount__c, Payment_Frequency_Number__c, Actual_Arrears__c, No_of_Missed_Payment_Fees_applied__c, Varied_Date__c, CreatedDate FROM Opportunity WHERE Account.Id =: acctList[0].Id ORDER BY CreatedDate DESC];
            totalAgreements = oppList.size();
            
            for(Opportunity opp : oppList){
    
                if(opp.StageName == 'Goods Delivered'){
                    totalLatePaymentFeesApplied += (opp.No_of_Missed_Payment_Fees_applied__c == null ? 0 : opp.No_of_Missed_Payment_Fees_applied__c);
                    totalArrears += opp.Actual_Arrears__c; 
                    
                    if(opp.Varied_Date__c != null){
                        totalAgreementsVaried++;
                        if(lastAgreementVariedDate == null || opp.Varied_Date__c > lastAgreementVariedDate){
                            lastAgreementVariedDate = opp.Varied_Date__c;
                        }    
                    }
                    totalActiveAgreements++;
                    
                    if(lastActiveAgreementCreatedDate == null){
                        lastActiveAgreementCreatedDate = opp.CreatedDate.date();
                        lastActiveAgreementName = opp.Name;
                    }    
                }
                   
            }
            
            maxFortnightlyPayment = ((acctList[0].Highlevel_Income__c == null ? 0 : acctList[0].Highlevel_Income__c) * 0.2) - (applicantScheduledAmount == null ? 0 : applicantScheduledAmount);
            maxFortnightlyPayment = maxFortnightlyPayment.setScale(2);
            
            if(maxFortnightlyPayment > 0){
                maxCOGS = ((maxFortnightlyPayment / 0.1038) - 99);
            }
            maxCOGS = maxCOGS.setScale(2);
    
            List<Applicant_Status__c> appStatList = [SELECT Id,Name,Status__c,CreatedDate,Activation_Code__c,Scheduled_Amount__c,Actual_Amount__c,Effective_Date__c FROM Applicant_Status__c WHERE Account__r.Id =: acctList[0].Id AND CreatedDate = LAST_N_DAYS:30 ORDER BY CreatedDate Desc];
            lastITICreatedDate = null;
            lastITIEffectiveDate = null;
            if(appStatList.size() > 0){
                recentITICount = 0;
                recentITBCount = 0;
                recentIVICount = 0;
                for(Integer i=0; i<appStatList.size(); i++ ){
                    if(appStatList[i].Activation_Code__c == 'IVI'){
                        recentIVICount++;
                    }
                    if(appStatList[i].Activation_Code__c == 'ITI'){
                        recentITICount++;
                        if(lastITICreatedDate == null){
                            lastITICreatedDate = appStatList[i].CreatedDate.date();
                        }
                        if(lastITIEffectiveDate == null || lastITIEffectiveDate < appStatList[i].Effective_Date__c){
                            lastITIEffectiveDate = appStatList[i].Effective_Date__c;
                        }
                    }
                    if(appStatList[i].Activation_Code__c == 'ITB'){
                        recentITBCount++;
                    }
                }
                totalRecentAppStats = recentIVICount + recentITICount + recentITBCount;
            }
            
            if(showQuickConvert)
            {            
                ApexPages.currentPage().getParameters().put('id',acctId);
                sv = new SensisValidator();
                sv.initCAMProgressBar();
                
                System.debug('****sv.account ' + sv.account);
                System.debug('****sv.docsPending ' + sv.docsPending);
                System.debug('****sv.nextDocsStep ' + sv.nextDocsStep);
                System.debug('****sv.assessmentPending ' + sv.assessmentPending);
                System.debug('****sv.nextAssessStep ' + sv.nextAssessStep);
                System.debug('****sv.sourcingPending ' + sv.sourcingPending);
                System.debug('****sv.nextSourcingStep ' + sv.nextSourcingStep); 
                
                if(sv.docsPending)
                {
                    nextCAMStep = 'Documents / ' + sv.nextDocsStep;
                }
                else if(sv.assessmentPending)
                {
                    nextCAMStep = 'Assessment / ' + sv.nextAssessStep;
                }
                else if(sv.sourcingPending)
                {
                    nextCAMStep = 'Sourcing & Signing / ' + sv.nextSourcingStep;
                }
            }   
        }

    }catch(Exception ex){
        system.debug('Exception: '+ex+' : '+ex.getLineNumber());
        ErrorLog.addErrorLog('NewEnquirySectionController','createSmartRecommendation',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
 
}

public PageReference quickConvert()
{
    try
    {
        String leadId = ApexPages.currentPage().getParameters().get('leadId');
        String acctId = ApexPages.currentPage().getParameters().get('acctId');
        Integer nextPointer = 0;
        
        System.debug('******quick convert called');
        System.debug('******leadId ' + leadId);
        System.debug('******acctId ' + acctId);
        
        List<Account> acctList = [SELECT Id,FirstName,LastName,PersonMobilePhone,PersonEmail,Reason_for_Enquiry__c,Enquiry_Notes__c,PersonMailingStreet,PersonMailingCity,PersonMailingState,Product_Description__c,Territory_Number__c, OwnerId, Next_CAM_Step__c, No_of_times_lead_has_been_converted__c FROM Account WHERE Id = : acctId LIMIT 1];
        
        if(acctList.size() > 0)
        {
            if(leadId == null || leadId == '' || leadId.trim() == '')
            {
                System.debug('*****leadId is not present so creating a new lead');
                
                Lead lead = new Lead();
                lead.FirstName = acctList[0].FirstName;
                lead.LastName = acctList[0].LastName;
                lead.MobilePhone = acctList[0].PersonMobilePhone;
                lead.Email = acctList[0].PersonEmail;
                lead.Reason_for_Enquiry__c = acctList[0].Reason_for_Enquiry__c;
                lead.Enquiry_Notes__c=acctList[0].Enquiry_Notes__c;
                lead.PostalCode=null;
                lead.Street=acctList[0].PersonMailingStreet;
                lead.City=acctList[0].PersonMailingCity;
                lead.State=acctList[0].PersonMailingState;
                lead.Desired_Product__c = acctList[0].Product_Description__c;
                lead.Not_Spam__c='yes';
                lead.Lead_Medium__c='Direct';
                lead.OwnerId = acctList[0].OwnerId;
                lead.Territory_Number__c = acctList[0].Territory_Number__c;               
                insert lead;
                
                List<Lead> lds =[select id from Lead where id=:lead.Id];
                if(lds.size()>0){
                    leadId = lds[0].Id;
                }
                 
            }
            
            System.debug('*****converting lead');
            System.debug('******leadId ' + leadId);
            
            doConvert(leadId,acctList[0]);
            
            if(sv.docsPending)
            {
                if(sv.nextDocsStep == 'Add Photo Id')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=docs&sectionType=id').setRedirect(true);
                }
                else if(sv.nextDocsStep == 'Add Bank Statement')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=docs&sectionType=bank').setRedirect(true);
                }
                else if(sv.nextDocsStep == 'Add MyGov Statement')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=docs&sectionType=mygov').setRedirect(true);
                }
                else if(sv.nextDocsStep == 'Add Equifax Statement')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=docs&sectionType=equifax').setRedirect(true);
                }
                else if(sv.nextDocsStep == 'Add Referees')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=docs&sectionType=referees').setRedirect(true);
                }
                else
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=docs').setRedirect(true);
                }
            }
            else if(sv.assessmentPending)
            {
                if(sv.nextAssessStep == 'R&O')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=assessment&sectionType=ro').setRedirect(true);
                }
                else if(sv.nextAssessStep == 'Id')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=assessment&sectionType=id').setRedirect(true);
                }
                else if(sv.nextAssessStep == 'Serviceability')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=assessment&sectionType=bank').setRedirect(true);
                }
                else if(sv.nextAssessStep == 'Equifax')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=assessment&sectionType=equifax').setRedirect(true);
                }
                else
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=assessment&sectionType=credit').setRedirect(true);
                }
            }
            else if(sv.sourcingPending)
            {
                if(sv.nextSourcingStep == 'Add Products')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=signing&sectionType=sourcing').setRedirect(true);
                }
                else if(sv.nextSourcingStep == 'Outstanding To Sign')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=signing&sectionType=sign').setRedirect(true);
                }
                else if(sv.nextSourcingStep == 'Outstanding Purchase Receipt')
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=signing&sectionType=sourcing').setRedirect(true);
                }
                else
                {
                    return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id + '&formType=signing').setRedirect(true);
                }
            }
            else
            {    
                return new PageReference('/apex/CAMProcess?id=' + acctList[0].Id).setRedirect(true);
            }
        }else{
            return null;
        }
        
    }catch(Exception ex){
        system.debug('Exception: '+ex+' : '+ex.getLineNumber());
        return null;
    }
}

public void handleUnconvertedLeads(String accountId){
    try
    {
        ErrorLog.addErrorLog('NewEnquirySectionController','handleUnconvertedLeads',accountId,'','');
        /*
        Boolean hasAccountAccess = false;
        String existingLeadId = ApexPages.currentPage().getParameters().get('leadId');
        List<Lead> existingLeads = new List<Lead>(); 
            
        if(accountId != null && accountId != '')
        {
            List<Account> acctList = [SELECT Id,FirstName,LastName,PersonMobilePhone,PersonEmail,Reason_for_Enquiry__c,Enquiry_Notes__c,PersonMailingStreet,PersonMailingCity,PersonMailingState,Product_Description__c,Territory_Number__c, OwnerId, Next_CAM_Step__c, No_of_times_lead_has_been_converted__c FROM Account WHERE Id =: accountId LIMIT 1];
            
            if(acctList.size() > 0)
            {   
                List<UserRecordAccess> userAccess = [SELECT RecordId, HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: UserInfo.getUserId() AND RecordId =: accountId];
            
                if(userAccess.size()>0)
                {
                    hasAccountAccess = userAccess[0].HasReadAccess;        
                }
                System.debug('**********hasAccountAccess ' + hasAccountAccess);
                
                if(existingLeadId != null && existingLeadId != '')
                {
                    existingLeads = [SELECT Id FROM Lead WHERE Id =: existingLeadId AND IsConverted = false LIMIT 1];
                }else{
                    String personEmail = acctList[0].PersonEmail;
                    String personMobilePhone = acctList[0].PersonMobilePhone;
                    String personTerritoryId = acctList[0].Territory_Number__c;
                    
                    existingLeads = [select id from Lead where IsConverted = false AND ((Email != null AND Email =: personEmail) OR (MobilePhone !=null AND MobilePhone =: personMobilePhone)) AND Territory_Number__c =: personTerritoryId ORDER BY CreatedDate DESC LIMIT 1];
                }
                
                if(existingLeads.size() > 0)
                {
                    if(hasAccountAccess)
                    {
                        doConvert(existingLeads[0].Id,account);
                    }
                }else{ 
                    Lead lead = new Lead();
                    lead.FirstName = acctList[0].FirstName;
                    lead.LastName = acctList[0].LastName;
                    lead.MobilePhone = acctList[0].PersonMobilePhone;
                    lead.Email = acctList[0].PersonEmail;
                    lead.OwnerId= acctList[0].ownerId;
                    lead.Reason_for_Enquiry__c=acctList[0].Reason_for_Enquiry__c;
                    lead.Enquiry_Notes__c=acctList[0].Enquiry_Notes__c;
                    lead.PostalCode=null;
                    lead.Street=acctList[0].PersonMailingStreet;
                    lead.City=acctList[0].PersonMailingCity;
                    lead.State=acctList[0].PersonMailingState;
                    lead.Desired_Product__c = acctList[0].Product_Description__c;
                    lead.Territory_Number__c = acctList[0].Territory_Number__c;
                    lead.Not_Spam__c='yes';
                    lead.Lead_Medium__c='Direct';
                    insert lead;
                    
                    if(hasAccountAccess)
                    {
                        List<Lead> lds = [select id from Lead where id=:lead.Id AND IsConverted = false LIMIT 1];
                        if(lds.size()>0)
                        {
                            doConvert(lds[0].Id,account);
                        }
                    }
                } 
            }
        }
        */
    }catch(Exception ex){
        ErrorLog.addErrorLog('NewEnquirySectionController','handleUnconvertedLeads',accountId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public PageReference cancel(){
    try{
        if(userTheme == 'Theme3'){
            return new PageReference('/00Q');    
        }else{
            return new PageReference('/lightning/o/Lead/list?filterName=Recent');
        }
    }catch(Exception ex){
        system.debug('Exception: '+ex+' : '+ex.getLineNumber());
        return null;
    }
}

public void getEmployees()
{
    repSelected = null;
    List<Employee__c> employeeList = [SELECT Id,Name FROM Employee__c WHERE Status__c = 'Active' AND Territory__c in: territoryIdsWithRecordAccess ORDER BY Name ASC];
    repList = new List<SelectOption>();
    repList.add(new SelectOption('', '--None--'));
    
    for(Integer i=0; i<employeeList.size(); i++)
    {
        repList.add(new SelectOption(employeeList[i].Id, employeeList[i].Name));
    }
}

public void calculateCallTime(String accountId, String leadId)
{
    try
    {
        Boolean isDarrandaLead = false;
        Boolean phoneCallQueried = false;
        List<PhoneCall__c> phoneCallList = new List<PhoneCall__c>();
        List<smagicinteract__smsMagic__c> smsHistoryList = [SELECT Id,smagicinteract__Lead__r.Territory_Number__c,smagicinteract__Lead__r.Territory_Number__r.State_Master_State__c,smagicinteract__Lead__r.Territory_Number__r.Company_Territory__c,smagicinteract__Lead__r.Territory_Number__r.Short_Name__c FROM smagicinteract__smsMagic__c WHERE smagicinteract__Lead__c =: leadId AND smagicinteract__Lead__c <> null];
        //isDarrandaLead = (smsHistoryList.size() > 0 && ((smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.Company_Territory__c && (smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.State_Master_State__c=='VIC' || smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.State_Master_State__c=='SA' || smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.State_Master_State__c=='NSW' || smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.State_Master_State__c=='NZ' || smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.State_Master_State__c=='WA' || smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.State_Master_State__c=='QLD')) || smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.Short_Name__c=='Greensborough' || smsHistoryList[0].smagicinteract__Lead__r.Territory_Number__r.Short_Name__c=='Wide Bay')) ? true : false; 
        
        if(smsHistoryList.size() == 0)
        {
            phoneCallList = [SELECT Id,Account__c,Account__r.LastName,Account__r.Active_Agreements__c,Opportunity__c,Call_Time_seconds__c,Lead__c,CallStartDateTime__c,CreatedDateTime__c,Call_Type__c,FinishDateTime__c,
                                Lead__r.Territory_Number__c,Lead__r.Territory_Number__r.State_Master_State__c,Lead__r.Territory_Number__r.Company_Territory__c,Lead__r.Territory_Number__r.Short_Name__c FROM PhoneCall__c WHERE Lead__c =: leadId];
            isDarrandaLead = (phoneCallList.size() > 0 && ((phoneCallList[0].Lead__r.Territory_Number__r.Company_Territory__c && (phoneCallList[0].Lead__r.Territory_Number__r.State_Master_State__c=='VIC' || phoneCallList[0].Lead__r.Territory_Number__r.State_Master_State__c=='SA' || phoneCallList[0].Lead__r.Territory_Number__r.State_Master_State__c=='NSW' || phoneCallList[0].Lead__r.Territory_Number__r.State_Master_State__c=='NZ' || phoneCallList[0].Lead__r.Territory_Number__r.State_Master_State__c=='WA' || phoneCallList[0].Lead__r.Territory_Number__r.State_Master_State__c=='QLD')) || phoneCallList[0].Lead__r.Territory_Number__r.Short_Name__c=='Greensborough' || phoneCallList[0].Lead__r.Territory_Number__r.Short_Name__c=='Wide Bay')) ? true : false; 
            phoneCallQueried = true;
        }
        
        List<PhoneCall__c> phoneCallsToUpdate = new List<PhoneCall__c>();
        List<smagicinteract__smsMagic__c> smsToUpdate = new List<smagicinteract__smsMagic__c>();            
        
        if(!phoneCallQueried)
        {
            phoneCallList = [SELECT Id,Account__c,Account__r.LastName,Account__r.Active_Agreements__c,Opportunity__c,Call_Time_seconds__c,Lead__c,CallStartDateTime__c,CreatedDateTime__c,Call_Type__c,FinishDateTime__c FROM PhoneCall__c WHERE Lead__c =: leadId];
        }
        
        for(Integer j=0; j<phoneCallList.size(); j++)
        {
            PhoneCall__c pc = new PhoneCall__c();
            pc.Id = phoneCallList[j].Id;    
            pc.Account__c = accountId;     
            phoneCallsToUpdate.add(pc);  
        }
        
        for(Integer k=0; k<smsHistoryList.size(); k++)
        {
            smagicinteract__smsMagic__c sm = new smagicinteract__smsMagic__c();
            sm.Id = smsHistoryList[k].Id;    
            sm.smagicinteract__Account__c = accountId;     
            smsToUpdate.add(sm);  
        }

        if(phoneCallsToUpdate.size() > 0)
        {
            update phoneCallsToUpdate;
        }
        
        if(smsToUpdate.size() > 0 && !Test.isRunningTest())
        {
            update smsToUpdate;
        }
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('NewEnquirySectionController','calculateCallTime',accountId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void bulkCalculateCallTime(List<Lead> leadList)
{
    List<String> convertedLeadIds = new List<String>();
    Map<String,String> leadAccountMap = new Map<String,String>();
    List<PhoneCall__c> phoneCallsToUpdate = new List<PhoneCall__c>();
    List<smagicinteract__smsMagic__c> smsToUpdate = new List<smagicinteract__smsMagic__c>();
    
    for(Integer i=0; i<leadList.size(); i++)
    {
        convertedLeadIds.add(leadList[i].Id);
        leadAccountMap.put(String.valueOf(leadList[i].Id).substring(0,15),String.valueOf(leadList[i].Account__c).substring(0,15));
    }
    
    List<smagicinteract__smsMagic__c> smsHistoryList = [SELECT Id,smagicinteract__Account__c,smagicinteract__Lead__c FROM smagicinteract__smsMagic__c WHERE smagicinteract__Lead__c in: convertedLeadIds AND smagicinteract__Account__c = null];
    List<PhoneCall__c> phoneCallList = [SELECT Id,Account__c,Account__r.LastName,Account__r.Active_Agreements__c,Opportunity__c,Call_Time_seconds__c,Lead__c,CallStartDateTime__c,CreatedDateTime__c,Call_Type__c,FinishDateTime__c FROM PhoneCall__c WHERE Lead__c in: convertedLeadIds AND Account__c = null];
    
    for(Integer j=0; j<phoneCallList.size(); j++)
    {
        PhoneCall__c pc = new PhoneCall__c();
        pc.Id = phoneCallList[j].Id;    
        pc.Account__c = leadAccountMap.get(String.valueOf(phoneCallList[j].Lead__c).substring(0,15));     
        phoneCallsToUpdate.add(pc);  
    }
    
    for(Integer k=0; k<smsHistoryList.size(); k++)
    {
        smagicinteract__smsMagic__c sm = new smagicinteract__smsMagic__c();
        sm.Id = smsHistoryList[k].Id;    
        sm.smagicinteract__Account__c = leadAccountMap.get(String.valueOf(smsHistoryList[k].smagicinteract__Lead__c).substring(0,15));    
        smsToUpdate.add(sm);  
    }
    
    if(phoneCallsToUpdate.size() > 0)
    {
        update phoneCallsToUpdate;
    }
    
    if(smsToUpdate.size() > 0 && !Test.isRunningTest())
    {
        update smsToUpdate;
    }
}

public void getUnconvertedLeads()
{
    leadWrapperList = new List<LeadWrapper>();
    
    unconvertedLeads = [SELECT Id,FirstName,LastName,Name,MobilePhone,OwnerId,Owner.Name,Territory_Number__c,Territory_Short_Name__c,Reason_for_Enquiry__c,
                        Desired_Product__c,Street,City,State,PostalCode,Lead_Medium__c,Email,CreatedDate,did_your_hear__c,
                        contact_desc__c,Call_Time_Charged_minutes__c,Phone_Recording__c,Territory_State__c,CRN__c,TwilioCallSid__c,TwilioRecordingSid__c 
                        FROM Lead WHERE IsConverted = false AND (Name in: territoryNamesWithRecordAccess OR Owner.Alias in: territoryNamesWithRecordAccess) ORDER BY CreatedDate DESC LIMIT 500];

    for(Integer i=0; i<unconvertedLeads.size(); i++)
    {
        LeadWrapper lw = new LeadWrapper();
        lw.ld = unconvertedLeads[i];
        lw.isSelected = false;
        lw.isMasterRecord = false;
        leadWrapperList.add(lw);
    }
}


public void getLeadsMatchingMobile()
{
    String searchString = Apexpages.currentPage().getParameters().get('searchString');
    searchString = '%'+searchString+'%';
    
    leadWrapperList = new List<LeadWrapper>();

    unconvertedLeads = [SELECT Id,FirstName,LastName,Name,MobilePhone,OwnerId,Owner.Name,Territory_Number__c,Territory_Short_Name__c,Reason_for_Enquiry__c,
                        Desired_Product__c,Street,City,State,PostalCode,Lead_Medium__c,Email,CreatedDate,did_your_hear__c,
                        contact_desc__c,Call_Time_Charged_minutes__c,Phone_Recording__c,Territory_State__c,CRN__c,TwilioCallSid__c,TwilioRecordingSid__c 
                        FROM Lead WHERE MobilePhone LIKE: searchString AND IsConverted = false AND (Name in: territoryNamesWithRecordAccess OR Owner.Alias in: territoryNamesWithRecordAccess) ORDER BY CreatedDate DESC LIMIT 500];
    
    for(Integer i=0; i<unconvertedLeads.size(); i++)
    {
        LeadWrapper lw = new LeadWrapper();
        lw.ld = unconvertedLeads[i];
        lw.isSelected = false;
        lw.isMasterRecord = false;
        leadWrapperList.add(lw);
    }
}

public void getSelectedLeads()
{
    selectedLeadWrapperList = new List<LeadWrapper>();
    
    for(Integer i=0; i<leadWrapperList.size(); i++)
    {
        if(leadWrapperList[i].isSelected)
        {
            LeadWrapper lw = new LeadWrapper();
            lw.ld = leadWrapperList[i].ld;
            lw.isSelected = true;
            lw.isMasterRecord = false;
            selectedLeadWrapperList.add(lw);
        }
    }
}

public PageReference mergeLeads()
{
    System.debug('leadCount : ' + Apexpages.currentPage().getParameters().get('leadCount'));
    
    Lead masterLead;
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
    String acctId;
    
    System.debug('leadCount : ' + leadCount);
    
    for(Integer i=0; i<actionLeadWrapperList.size(); i++)
    {
        if(actionLeadWrapperList[i].isSelected && (actionLeadWrapperList[i].isMasterRecord || leadCount == 1))
        {
            //masterLead = actionLeadWrapperList[i].ld;
            //ucLeadIds.add(actionLeadWrapperList[i].ld.Id);
            masterLeadId = actionLeadWrapperList[i].ld.Id;
            totalCallTime += (actionLeadWrapperList[i].ld.Call_Time_Charged_minutes__c == null ? 0 : actionLeadWrapperList[i].ld.Call_Time_Charged_minutes__c); 
            masterLeadCreatedTime = actionLeadWrapperList[i].ld.CreatedDate;
            
            masterFirstName = actionLeadWrapperList[i].ld.FirstName;
            masterLastName = actionLeadWrapperList[i].ld.LastName;
            masterEmail = actionLeadWrapperList[i].ld.Email;
            masterPostalCode = actionLeadWrapperList[i].ld.PostalCode;
            masterStreet = actionLeadWrapperList[i].ld.Street;
            masterCity = actionLeadWrapperList[i].ld.City;
            masterState = actionLeadWrapperList[i].ld.State;
            masterDesiredProduct = actionLeadWrapperList[i].ld.Desired_Product__c;
            masterNatureOfEnquiry = actionLeadWrapperList[i].ld.contact_desc__c;
            masterhowDidYouHear = actionLeadWrapperList[i].ld.did_your_hear__c;
            masterReasonForEnquiry = actionLeadWrapperList[i].ld.Reason_for_Enquiry__c;
            masterMobile = actionLeadWrapperList[i].ld.MobilePhone;
            masterMedium = actionLeadWrapperList[i].ld.Lead_Medium__c;
            masterCRN = actionLeadWrapperList[i].ld.crn__c;
            masterTerrState = actionLeadWrapperList[i].ld.Territory_State__c;
            masterCallSID = actionLeadWrapperList[i].ld.TwilioCallSid__c;
            masterRecordingSID = actionLeadWrapperList[i].ld.TwilioRecordingSid__c;
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
                //duplicateLeads.add(actionLeadWrapperList[k].ld);
                //ucLeadIds.add(actionLeadWrapperList[k].ld.Id);
                totalCallTime += (actionLeadWrapperList[k].ld.Call_Time_Charged_minutes__c == null ? 0 : actionLeadWrapperList[k].ld.Call_Time_Charged_minutes__c); 
                
                masterFirstName = masterFirstName == null ? actionLeadWrapperList[k].ld.FirstName : masterFirstName;
                masterLastName = masterLastName == null ? actionLeadWrapperList[k].ld.LastName : masterLastName;
                masterEmail = masterEmail == null ? actionLeadWrapperList[k].ld.Email : masterEmail;
                masterPostalCode = masterPostalCode == null ? actionLeadWrapperList[k].ld.PostalCode : masterPostalCode;
                masterStreet = masterStreet == null ? actionLeadWrapperList[k].ld.Street : masterStreet;
                masterCity = masterCity == null ? actionLeadWrapperList[k].ld.City : masterCity;
                masterState = masterState == null ? actionLeadWrapperList[k].ld.State : masterState;
                masterDesiredProduct = masterDesiredProduct == null ? actionLeadWrapperList[k].ld.Desired_Product__c : masterDesiredProduct;
                masterNatureOfEnquiry = masterNatureOfEnquiry == null ? actionLeadWrapperList[k].ld.contact_desc__c : masterNatureOfEnquiry;
                masterhowDidYouHear = masterhowDidYouHear == null ? actionLeadWrapperList[k].ld.did_your_hear__c : masterhowDidYouHear;
                masterReasonForEnquiry = masterReasonForEnquiry == null ? actionLeadWrapperList[k].ld.Reason_for_Enquiry__c : masterReasonForEnquiry;
                
                if((actionLeadWrapperList[k].ld.TwilioCallSid__c <> null && masterCallSID == null) || (actionLeadWrapperList[k].ld.TwilioCallSid__c <> null && actionLeadWrapperList[k].ld.TwilioRecordingSid__c <> null && masterRecordingSID == null))
                {
                    masterCallSID = actionLeadWrapperList[k].ld.TwilioCallSid__c;
                    masterRecordingSID = actionLeadWrapperList[k].ld.TwilioRecordingSid__c;
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
        
        List<Lead> ucLeads = [SELECT Id,FirstName,LastName,MobilePhone,Territory_Number__c,Reason_for_Enquiry__c,Desired_Product__c,Street,City,State,PostalCode,Lead_Medium__c,Email,did_your_hear__c,contact_desc__c FROM Lead WHERE Id in: ucLeadIds];
        
        for(Integer j=0; j<actionLeadWrapperList.size(); j++)
        {
            if(actionLeadWrapperList[j].isSelected && actionLeadWrapperList[j].isMasterRecord)
            {
                //masterLead = new Lead(Id=actionLeadWrapperList[j].ld.Id,FirstName=actionLeadWrapperList[j].ld.FirstName,LastName=actionLeadWrapperList[j].ld.LastName,MobilePhone=actionLeadWrapperList[j].ld.MobilePhone,Territory_Number__c=actionLeadWrapperList[j].ld.Territory_Number__c,Reason_for_Enquiry__c=actionLeadWrapperList[j].ld.Reason_for_Enquiry__c,Desired_Product__c=actionLeadWrapperList[j].ld.Desired_Product__c,Street=actionLeadWrapperList[j].ld.Street,City=actionLeadWrapperList[j].ld.City,State=actionLeadWrapperList[j].ld.State,PostalCode=actionLeadWrapperList[j].ld.PostalCode,Lead_Medium__c=actionLeadWrapperList[j].ld.Lead_Medium__c,Email=actionLeadWrapperList[j].ld.Email,did_your_hear__c=actionLeadWrapperList[j].ld.did_your_hear__c,contact_desc__c=actionLeadWrapperList[j].ld.contact_desc__c,Twilio_Call_Finish_Datetime__c=masterLeadFinishTime);
                System.debug('masterLeadId : ' + actionLeadWrapperList[j].ld.Id);
                masterLead = new Lead(Id=actionLeadWrapperList[j].ld.Id,FirstName=masterFirstName,LastName=masterLastName,Reason_for_Enquiry__c=masterReasonForEnquiry,Desired_Product__c=masterDesiredProduct,Street=masterStreet,City=masterCity,State=masterState,PostalCode=masterPostalCode,Email=masterEmail,did_your_hear__c=masterhowDidYouHear,contact_desc__c=masterNatureOfEnquiry,Twilio_Call_Finish_Datetime__c=masterLeadFinishTime,TwilioCallSid__c=masterCallSId,TwilioRecordingSid__c=masterRecordingSID);
            }else if(actionLeadWrapperList[j].isSelected && !actionLeadWrapperList[j].isMasterRecord)
            {
                duplicateLeads.add(new Lead(Id=actionLeadWrapperList[j].ld.Id));
            }
        }
        
        if(masterLead <> null && duplicateLeads.size() > 0)
        {
            Database.MergeResult[] results = Database.merge(masterLead, duplicateLeads, true);
        }
    }
    
    //getUnconvertedLeads();
    //return null;
    return new PageReference('/apex/NewEnquiryPage?ldfname=' + masterFirstName + '&ldlname=' + masterLastName + '&ldmobile=' + (masterMobile==null?'':masterMobile) + '&ldcrn=' + (masterCRN==null?'':masterCRN) + '&ldemail=' + (masterEmail==null?'':masterEmail) + '&ldid=' + masterLeadId + '&ldMedium=' + (masterMedium==null?'':masterMedium) + '&acctId=&leadState=' + (masterTerrState==null?'':masterTerrState)).setRedirect(true);
}

public class LeadWrapper
{
    public Lead ld{get;set;}
    public Boolean isSelected{get;set;}
    public Boolean isMasterRecord{get;set;}
}

public String masterLeadId{get;set;}
public List<Lead> unconvertedLeads{get;set;}
public List<LeadWrapper> leadWrapperList{get;set;} 
public List<LeadWrapper> selectedLeadWrapperList{get;set;} 
public List<SelectOption> repList{get;set;} 
public String repSelected{get;set;}    
}