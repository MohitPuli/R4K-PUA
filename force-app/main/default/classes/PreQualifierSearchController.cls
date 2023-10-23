public class PreQualifierSearchController {

  // the soql without the order and limit
  private String soql {get;set;}
  // the collection of contacts to display
  public List<Account> contacts {get;set;}
  public String selectedAppId{get;set;}
  public String pfname {get;set;}
  public String plname {get;set;}
  public String pmobile {get;set;}
  public Boolean showTable {get;set;}
  public Boolean leadPresent {get;set;}
  public List<Lead> leadLst {get;set;}
  public String leadName {get;set;}
  public String leadAddress {get;set;}
  public String leadROE {get;set;}
  public String leadDescription {get;set;}
  public String leadState{get;set;}
  public List<String> territoryIdsWithRecordAccess{get;set;}
  public List<String> companyTerritoryIds{get;set;}
  public String leadOwnerId{get;set;}
  
    public PreQualifierSearchController() {
        leadLst = new List<Lead>();
        ShowLeadInformation();
        leadOwnerId = (leadLst.size() > 0 ? leadLst[0].Territory_Number__r.OwnerId : UserInfo.getUserId());
        territoryIdsWithRecordAccess = new List<String>();
        companyTerritoryIds = new List<String>();
        soql = 'select id,firstname, lastname, PersonMailingCity, Centrepay_Ref_No__c,WINZ_No__c,Birthdate__c,PersonMobilePhone,PersonEmail,Territory_Short_Name__c,Territory_Number__r.Owners_Name__c from Account where lastname != null AND Territory_Number__c IN: territoryIdsWithRecordAccess';
        List<String> allterritoriesIds = new List<String>();
        List<Territory__c> allterritories = new List<Territory__c>();
        if(leadLst.size() > 0 && (leadLst[0].Lead_Medium__c == 'RENT4KEEPS ENQUIRY' || !leadLst[0].Territory_Number__r.Is_Credit_Contract__c)){
            allterritories = [SELECT Id, Name, Company_Territory__c FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') AND Is_Credit_Contract__c = false LIMIT 200];
            for(Territory__c territory : allterritories){
                allterritoriesIds.add(territory.Id);
                territoryIdsWithRecordAccess.add(territory.Id);
            }
        }else{
            allterritories = [SELECT Id, Name, Company_Territory__c FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') AND Is_Credit_Contract__c = true LIMIT 200];
            for(Territory__c territory : allterritories){
                allterritoriesIds.add(territory.Id);
            }
            if(Test.isRunningTest()){
              for(String accessKey : allterritoriesIds){
                territoryIdsWithRecordAccess.add(accessKey);
              }
            }else{
              SalesforceAppIntegration sap = new SalesforceAppIntegration();
              Map<String,Object> accessMap = sap.hasRecordAccessBulk(leadOwnerId,allterritoriesIds);
              for(String accessKey : allterritoriesIds){
                  if(accessMap.containsKey(accessKey)){
                      if((Boolean)accessMap.get(accessKey)){
                          territoryIdsWithRecordAccess.add(accessKey);
                      }
                  }
              }
            }
            
        }
        System.debug(territoryIdsWithRecordAccess);
        contacts = [select id,firstname, lastname, PersonMailingCity, Centrepay_Ref_No__c,WINZ_No__c,Birthdate__c,PersonMobilePhone,
                    PersonEmail,Territory_Short_Name__c,Territory_Number__r.Owners_Name__c from Account 
                    where lastname != null and ownerId =: leadOwnerId AND Territory_Number__c IN: territoryIdsWithRecordAccess order by Lastmodifieddate desc limit 20];
        if(contacts.size()>0)
            showTable=true;
        else
            showTable=false;    
    }

  // the current sort direction. defaults to asc
  public String sortDir {
    get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;  }
    set;
  }

  // the current field to sort by. defaults to last name
  public String sortField {
    get  { if (sortField == null) {sortField = 'lastName'; } return sortField;  }
    set;
  }

  // format the soql for display on the visualforce page
  public String debugSoql {
    get { return soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20'; }
    set;
  }

  // toggles the sorting of query from asc<-->desc
  public void toggleSort() {
    // simply toggle the direction
    sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
    // run the query again
    runQuery();
  }

  // runs the actual query
  public void runQuery() {

    try {
      showTable=true;
      contacts = Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20');
      if(contacts.size()>0)
         showTable=true;
      else
         showTable=false;
    } catch (Exception e) {
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops!'));
    }

  }

  // runs the search with parameters passed via Javascript
  public PageReference runSearch() 
  {
    String firstName = Apexpages.currentPage().getParameters().get('firstname');
    String lastName = Apexpages.currentPage().getParameters().get('lastname');
    String centrepay = Apexpages.currentPage().getParameters().get('centrepay');
    String mobile = Apexpages.currentPage().getParameters().get('mobile');
    List<Account> acctsForCentrePay= new List<Account>();
    List<Account> acctsForMobile= new List<Account>();
    System.debug(territoryIdsWithRecordAccess);
    if (!centrepay.equals('') && leadState <> null && leadState == 'NZ')
        acctsForCentrePay=[select id from Account where WINZ_No__c=:centrepay AND Territory_Number__c IN: territoryIdsWithRecordAccess LIMIT 1];
    else if (!centrepay.equals(''))
        acctsForCentrePay=[select id from Account where Centrepay_Ref_No__c=:centrepay AND Territory_Number__c IN: territoryIdsWithRecordAccess LIMIT 1];
        
    if (!mobile.equals(''))
        acctsForMobile=[select id from Account where PersonMobilePhone=:mobile AND Territory_Number__c IN: territoryIdsWithRecordAccess LIMIT 1];
        
    soql = 'select id,firstname, lastname, PersonMailingCity, Centrepay_Ref_No__c,WINZ_No__c,Birthdate__c,PersonMobilePhone,PersonEmail,Territory_Short_Name__c,Territory_Number__r.Owners_Name__c from Account where lastname != null AND Territory_Number__c IN: territoryIdsWithRecordAccess';
    
    if (!centrepay.equals('') && acctsForCentrePay.size()>0 && leadState <> null && leadState == 'NZ')
    {
        soql += ' and WINZ_No__c LIKE \''+String.escapeSingleQuotes(centrepay)+'%\'';
    }
    else if (!centrepay.equals('') && acctsForCentrePay.size()>0)
    {
        soql += ' and Centrepay_Ref_No__c LIKE \''+String.escapeSingleQuotes(centrepay)+'%\'';
    }
    else if (!mobile.equals('') && acctsForMobile.size()>0)
    {
      soql += ' and PersonMobilePhone LIKE \''+String.escapeSingleQuotes(mobile)+'%\'';
    }  
    else{
    if (!firstName.equals(''))
      soql += ' and firstname LIKE \''+String.escapeSingleQuotes(firstName)+'%\'';
    if (!lastName.equals(''))
      soql += ' and lastname LIKE \''+String.escapeSingleQuotes(lastName)+'%\'';
    }
    // run the query again
    runQuery();

    return null;
  }
  
   public PageReference save() {
   String leadId = Apexpages.currentPage().getParameters().get('ldid');
   system.debug('pfname: '+pfname +'plname: '+plname+'pmobile: '+pmobile);
   PageReference nextWindow;
   //nextWindow = Page.NewEnquirySectionPage;   
   nextWindow = Page.NewApplicationProcessEnquiry; 
   if(selectedAppId!=''){
       nextWindow.getParameters().put('acctId', selectedAppId);
       nextWindow.getParameters().put('leadId', leadId);
   }
   else{
       nextWindow.getParameters().put('pfname', pfname);
       nextWindow.getParameters().put('plname', plname);
       nextWindow.getParameters().put('pmobile', pmobile);
       nextWindow.getParameters().put('leadId', leadId);
   }
   nextWindow.setRedirect(true); 
   return nextWindow;
   }
   
   public void ShowLeadInformation()
   {
       String leadId = Apexpages.currentPage().getParameters().get('ldid');
       if(leadId!=null && !leadId.equals('')){
           leadPresent=True;
           leadLst=[select id, Name,Reason_for_Enquiry__c,Desired_Product__c,Street,City,State,PostalCode,Lead_Medium__c,Territory_State__c,
                       Territory_Number__c,Territory_Number__r.OwnerId,Territory_Number__r.Company_Territory__c,Territory_Number__r.Is_Credit_Contract__c 
                       from Lead where id=:leadId];
           if(leadLst.size()>0)
           {
               leadName=leadLst[0].Name;
               leadROE=leadLst[0].Reason_for_Enquiry__c;
               leadDescription=leadLst[0].Desired_Product__c;
               leadAddress='';
               if(leadLst[0].Street!=null){
                   leadAddress=leadAddress+leadLst[0].Street+', ';
               }
               if(leadLst[0].City!=null){
                   leadAddress=leadAddress+leadLst[0].City+', ';
               }
               if(leadLst[0].State!=null){
                   leadAddress=leadAddress+leadLst[0].State+', ';
               }
               if(leadLst[0].PostalCode!=null){
                   leadAddress=leadAddress+leadLst[0].PostalCode;
               }
			   leadState = leadLst[0].Territory_State__c;
           }
       }else{
           leadPresent=false;
       }
   }

  // use apex describe to build the picklist values
  /*public List<String> technologies {
    get {
      if (technologies == null) {

        technologies = new List<String>();
        Schema.DescribeFieldResult field = Contact.interested_technologies__c.getDescribe();

        for (Schema.PicklistEntry f : field.getPicklistValues())
          technologies.add(f.getLabel());

      }
      return technologies;          
    }
    set;
  }*/

	public Pagereference createDirectLead(){
		Lead ld = new Lead();
		ld.FirstName = fname;
		ld.LastName = lname;
		ld.Not_Spam__c = 'yes';
		ld.Lead_Medium__c = 'Direct';
		ld.MobilePhone = mobile;
		ld.PostalCode = postcode;
		ld.Country = 'AU';
		insert ld;

		return new Pagereference('/apex/NewEnquiryPage?n=' + Math.random()).setRedirect(true);
	}

public String fname{get;set;}
public String lname{get;set;}
public String mobile{get;set;}
public String postcode{get;set;}

}