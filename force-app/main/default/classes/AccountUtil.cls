public without sharing class AccountUtil {
  private static final Integer NUMBER_OF_DIGITS = 5;  
  
  public static void generateCustomerNumber(List<Account> accounts) {
    Boolean isCC = true;  
    if(accounts == null || accounts.size() == 0){
        return;
    }else if(accounts.size() > 0 && accounts[0].Territory_Number__c != null){
        System.debug('****accounts[0].Territory_Number__c ' + accounts[0].Territory_Number__c);
        List<Territory__c> acctTerrList = [SELECT Id,Is_Credit_Contract__c FROM Territory__c WHERE Id = :accounts[0].Territory_Number__c LIMIT 1];
        if(acctTerrList.size() > 0){
            isCC = acctTerrList[0].Is_Credit_Contract__c;
        } 
    }

    //Get all Applicant record types
    Map<Id, RecordType> recordTypesForApplicant = getRecordTypesForApplicant();
    
    //Helper map with territory prefix as key.
    Map<String, Territory__c> territoryAutoNumberMap = getTerritoryAutoNumberMap(isCC);
    
    
    //A map to hold any territory custome setting record that has the new auto customer number for update.
    Map<String, Territory__c> territoryAutoNumberMapToUpdate = new Map<String, Territory__c>();
    for (Account account : accounts) {
    system.debug('account.Customer_No__c: '+ account.Customer_No__c);
        //Skip if not an applicant account or there is no territory prefix for the account.
        if (account == null || !recordTypesForApplicant.containsKey(account.RecordTypeId) || (account.Customer_No__c != null && account.Customer_No__c !=''))
            continue;
        if (account.Territory_Applicant_Customer_Prefix__c == null) {
            account.addError('Please make sure Territory and Customer No fields are not empty.');
            continue;
        }
        
        Territory__c currentTerritoryAutoNumber = territoryAutoNumberMap.get(account.Territory_Applicant_Customer_Prefix__c);
        
        Decimal currentAutoNumber = currentTerritoryAutoNumber.Current_Customer_Number__c;

        currentAutoNumber++;
        
        String newCustomerNumber = currentAutoNumber.format();
        newCustomerNumber=newCustomerNumber.replaceAll(',','');
        system.debug('#newCustomerNumber: '+newCustomerNumber);
        if (newCustomerNumber.length() < NUMBER_OF_DIGITS) {
            String leadingZeros = '';
            for (Integer i = 0; i < (NUMBER_OF_DIGITS - newCustomerNumber.length()); i++) {
                leadingZeros += '0';
            }
            newCustomerNumber = leadingZeros + newCustomerNumber;
        } 
        
        account.Customer_No__c = currentTerritoryAutoNumber.Applicant_Customer_Prefix__c + newCustomerNumber;
        
        //update the territory with new customer number.
        currentTerritoryAutoNumber.Current_Customer_Number__c = currentAutoNumber;
        territoryAutoNumberMapToUpdate.put(currentTerritoryAutoNumber.Applicant_Customer_Prefix__c, currentTerritoryAutoNumber);
    }
    
    if (territoryAutoNumberMapToUpdate.size() > 0)
        update territoryAutoNumberMapToUpdate.values();
    
  }
  
public static String generateCustomerNumberforAccount(String custPrefix, Boolean isCC) {
    String customerNumber;
    
    //Get all Applicant record types
    Map<Id, RecordType> recordTypesForApplicant = getRecordTypesForApplicant();
    
    //Helper map with territory prefix as key.
    Map<String, Territory__c> territoryAutoNumberMap = getTerritoryAutoNumberMap(isCC);
    
    //A map to hold any territory custome setting record that has the new auto customer number for update.
    Map<String, Territory__c> territoryAutoNumberMapToUpdate = new Map<String, Territory__c>();
        
    Territory__c currentTerritoryAutoNumber = territoryAutoNumberMap.get(custPrefix);
    
    Decimal currentAutoNumber = currentTerritoryAutoNumber.Current_Customer_Number__c;

    currentAutoNumber++;
    
    String newCustomerNumber = currentAutoNumber.format();
    newCustomerNumber=newCustomerNumber.replaceAll(',','');
    system.debug('#newCustomerNumber: '+newCustomerNumber);
    if (newCustomerNumber.length() < NUMBER_OF_DIGITS) {
        String leadingZeros = '';
        for (Integer i = 0; i < (NUMBER_OF_DIGITS - newCustomerNumber.length()); i++) {
            leadingZeros += '0';
        }
        newCustomerNumber = leadingZeros + newCustomerNumber;
    } 
    
    customerNumber = currentTerritoryAutoNumber.Applicant_Customer_Prefix__c + newCustomerNumber;
    
    //update the territory with new customer number.
    currentTerritoryAutoNumber.Current_Customer_Number__c = currentAutoNumber;
    territoryAutoNumberMapToUpdate.put(currentTerritoryAutoNumber.Applicant_Customer_Prefix__c, currentTerritoryAutoNumber);
    
    if (territoryAutoNumberMapToUpdate.size() > 0)
    {
        update territoryAutoNumberMapToUpdate.values();
        return customerNumber;
    }
       return null; 
}
    
    
    
  
  public static Map<String, Territory__c> getTerritoryAutoNumberMap(Boolean isCC) {
    if(isCC == null){
        isCC = true;
    }  
    Map<String, Territory__c> territoryAutoNumberMap = new Map<String, Territory__c>();
    //Get all auto numbers for each Territory from the custom settings.
    List<Territory__c> territoryAutoNumbers = [SELECT Id, 
                                                      Name,
                                                      Applicant_Customer_Prefix__c, 
                                                      Current_Customer_Number__c,
                                                      Current_Contract_Number__c
                                               FROM   Territory__c WHERE Is_Credit_Contract__c = :isCC];
    for (Territory__c territoryAutoNumber : territoryAutoNumbers) {
        if (!territoryAutoNumberMap.containsKey(territoryAutoNumber.Applicant_Customer_Prefix__c))
            territoryAutoNumberMap.put(territoryAutoNumber.Applicant_Customer_Prefix__c, territoryAutoNumber);
    }
    
    return territoryAutoNumberMap;
  }
  public static void deleteGlobalSearchIndex(List<Account> oldAccRecords){
    delete [Select id from Global_Search__c where Applicant__c in: oldAccRecords];
  }
  public static void upsertGlobalSearchIndex(List<Account> newAccRecords){
    List<Global_Search__c> globalSearches = [Select id, Applicant__c from Global_Search__c where Applicant__c in: newAccRecords];
    Map<Id, List<Global_Search__c>> accIdToGlobalSearch = new Map<Id, List<Global_Search__c>>();
    for(Global_Search__c gsRec: globalSearches){
      if(!accIdToGlobalSearch.containsKey(gsRec.Applicant__c)){
        accIdToGlobalSearch.put(gsRec.Applicant__c, new List<Global_Search__c>());
      }
      accIdToGlobalSearch.get(gsRec.Applicant__c).add(gsRec);
    }
    for(Account accRec: newAccRecords){
      if(!accIdToGlobalSearch.containsKey(accRec.id)){
        // no GSRec - needs creation
        Global_Search__c newGSRec = new Global_Search__c(Applicant__c = accRec.id);
        accIdToGlobalSearch.put(newGSRec.Applicant__c, new List<Global_Search__c>());
        accIdToGlobalSearch.get(newGSRec.Applicant__c).add(newGSRec);
      } 
      List<Global_Search__c> accGSRecords = accIdToGlobalSearch.get(accRec.id);
      for(Global_Search__c accGSRec: accGSRecords){
          accGSRec.Suburb__c = accRec.PersonMailingCity;
          accGSRec.Postcode__c = accRec.PersonMailingPostalCode;
          accGSRec.Name = ((accRec.Salutation==null)?(''):(accRec.Salutation+' '))+
                    ((accRec.FirstName==null)?(''):(accRec.FirstName+' '))+
                    ((accRec.LastName==null)?(''):(accRec.LastName));
          accGSRec.Name = accGSRec.Name.trim();
          accGSRec.Birthdate__c = accRec.Birthdate__c;
          accGSRec.Territory__c = accRec.Territory_Number__c;
      }
    }
    List<Global_Search__c> gsRecsToUpsert = new List<Global_Search__c>();
    for(List<Global_Search__c> val: accIdToGlobalSearch.values()){
        gsRecsToUpsert.addAll(val);
    }
    upsert gsRecsToUpsert;
  }
  
  private static Map<Id, RecordType> getRecordTypesForApplicant() {
     //Get all Applicant record types
     return new Map<Id, RecordType>([SELECT Id FROM RecordType WHERE SobjectType = 'Account']);
  }
  
  public static Decimal getAverageDaysToDepleteTheIncome(String accountId, Decimal scheduledAmt)
  {
    Decimal avgDays=0;
    try{
    //String accountId = '0012t00000VLlUa';
    //Decimal scheduledAmt = 30;
    accountId = accountId!=null ? accountId.substring(0,15) : null;
    //Bank bifurcation
    Set<String> bankSet = new Set<String>();
    Map<Integer,BankStatement_Transaction__c> mapWages = new Map<Integer,BankStatement_Transaction__c>();
    Map<Integer,BankStatement_Transaction__c> mapCentrelink = new Map<Integer,BankStatement_Transaction__c>();
    Map<Integer,BankStatement_Transaction__c> mapWinz = new Map<Integer,BankStatement_Transaction__c>();
    
    List<Decimal> lstDepletionDays = new List<Decimal>();
    system.debug('##accountId: '+accountId);
    List<AggregateResult> groupedResults = [SELECT Institution__c, COUNT(Id)  FROM BankStatement_Transaction__c where ApplicantId__c=:accountId GROUP BY Institution__c];
    
    for(AggregateResult ar : groupedResults) {
        bankSet.add((String) ar.get('Institution__c'));
    }
    system.debug('bankSet: '+bankSet);
    if(bankSet.size()>0)
    {
     for(String bank : bankSet)  
     {
         
    List<BankStatement_Transaction__c> bts = [select id,name,Provider_Category__c,Transaction_Date__c,Credit_Amount__c,Debit_Amount__c from BankStatement_Transaction__c where ApplicantId__c=:accountId and Institution__c=:bank and Debit_Amount__c>0 and Provider_Category__c<>'Internal Transfer' order by Transaction_Date__c asc];
    
    //Wages Date Map
    List<BankStatement_Transaction__c> btsWages = [select id,name,Provider_Category__c,Transaction_Date__c,Credit_Amount__c,Debit_Amount__c from BankStatement_Transaction__c where ApplicantId__c=:accountId and Institution__c=:bank and Provider_Category__c='Wages' and Credit_Amount__c>0 order by Transaction_Date__c asc];
    if(btsWages.size()>0)
    {
        Integer i =0;
        for(BankStatement_Transaction__c bt : btsWages)
        {
            mapWages.put(i,bt);
            i++;
        }
    }
    system.debug('mapWages: '+mapWages.size());
    
    //Centrelink Income Date Map
    List<BankStatement_Transaction__c> btsCentrelink = [select id,name,Provider_Category__c,Transaction_Date__c,Credit_Amount__c,Debit_Amount__c from BankStatement_Transaction__c where ApplicantId__c=:accountId and Institution__c=:bank and Provider_Category__c='Centrelink' and Credit_Amount__c>0 order by Transaction_Date__c asc];
    if(btsCentrelink.size()>0)
    {
        Integer i =0;
        for(BankStatement_Transaction__c bt : btsCentrelink)
        {
            mapCentrelink.put(i,bt);
            i++;
        }
    }
    system.debug('mapCentrelink: '+mapCentrelink.size());
    
    //Winz Income Date Map
    
    
    //Depletion Days for Wages
    if(bts.size()>0 && !mapWages.IsEmpty())
    {
        
        Decimal avgCount=0;
        Date finalTransactionDate;
        Decimal depIncomeAmt=0;
        for(Integer i=0; i<=mapWages.size(); i++)
        {   
            //Calculate no of days to deplete 
            if(finalTransactionDate!=null)
            {
                Date startDate = mapWages.get(i-1).Transaction_Date__c;
                Integer noOfDays = startDate.daysBetween(finalTransactionDate)>0 ? startDate.daysBetween(finalTransactionDate) :0;
                system.debug( '#emp noOfDays: ' + noOfDays +' startTransDate: '+startDate+' finalTransactionDate: '+finalTransactionDate+' depreciatedIncome: '+depIncomeAmt);
                lstDepletionDays.add(noOfDays);
            }
            /////////////////////////////////////
            if(i<mapWages.size())
            {
                
                Decimal incomeAmt = mapWages.get(i).Credit_Amount__c; 
                for(BankStatement_Transaction__c bt : bts)
                {
                    if((mapWages.get(i+1)!=null && mapWages.get(i)!=null && bt.Transaction_Date__c>=mapWages.get(i).Transaction_Date__c && bt.Transaction_Date__c<mapWages.get(i+1).Transaction_Date__c) || (mapWages.get(i+1)==null && mapWages.get(i)!=null && bt.Transaction_Date__c>=mapWages.get(i).Transaction_Date__c))
                    {
                        if(scheduledAmt<=(incomeAmt - bt.Debit_Amount__c))
                        {
                            incomeAmt = incomeAmt - bt.Debit_Amount__c;
                            finalTransactionDate = bt.Transaction_Date__c;
                            depIncomeAmt = incomeAmt;
                            //if(i==1)
                            //    system.debug('depIncome: '+depIncomeAmt +' debitAmt: '+bt.Debit_Amount__c+' transDate: '+bt.Transaction_Date__c);
                        }
                        else
                            break;
                    }
                }
            }
        }
        
    }
    
    //Depletion Days for Centrelink Income / Winz
    if(bts.size()>0 && !mapCentrelink.IsEmpty())
    {
        
        Decimal avgCount=0;
        Date finalTransactionDate;
        Decimal depIncomeAmt=0;
        for(Integer i=0; i<=mapCentrelink.size(); i++)
        {   
            //Calculate no of days to deplete 
            if(finalTransactionDate!=null)
            {
                Date startDate = mapCentrelink.get(i-1).Transaction_Date__c;
                Integer noOfDays = startDate.daysBetween(finalTransactionDate)>0 ? startDate.daysBetween(finalTransactionDate) :0;
                system.debug( '#cp noOfDays: ' + noOfDays +' startTransDate: '+startDate+' finalTransactionDate: '+finalTransactionDate+' depreciatedIncome: '+depIncomeAmt);
                lstDepletionDays.add(noOfDays);
            }
            /////////////////////////////////////
            if(i<mapCentrelink.size())
            {
                
                Decimal incomeAmt = mapCentrelink.get(i).Credit_Amount__c; 
                for(BankStatement_Transaction__c bt : bts)
                {
                    if((mapCentrelink.get(i+1)!=null && mapCentrelink.get(i)!=null && bt.Transaction_Date__c>=mapCentrelink.get(i).Transaction_Date__c && bt.Transaction_Date__c<mapCentrelink.get(i+1).Transaction_Date__c) || (mapCentrelink.get(i+1)==null && mapCentrelink.get(i)!=null && bt.Transaction_Date__c>=mapCentrelink.get(i).Transaction_Date__c))
                    {
                        if(scheduledAmt<=(incomeAmt - bt.Debit_Amount__c))
                        {
                            incomeAmt = incomeAmt - bt.Debit_Amount__c;
                            finalTransactionDate = bt.Transaction_Date__c;
                            depIncomeAmt = incomeAmt;
                            //if(i==1)
                            //    system.debug('depIncome: '+depIncomeAmt +' debitAmt: '+bt.Debit_Amount__c+' transDate: '+bt.Transaction_Date__c);
                        }
                        else
                            break;
                    }
                }
            }
        }
        
    }
     }
    }
    
    
    if(lstDepletionDays.size()>0)
    {
        
        for(Decimal day : lstDepletionDays)
        {
            avgDays+=day;
        }
        avgDays= (avgDays/lstDepletionDays.size()).setScale(2);
        system.debug('lstDepletionDays: '+lstDepletionDays+' avgDays: '+avgDays);
    }
    return avgDays;
  }
  catch(Exception ex)
  {
       ErrorLog.addErrorLog('AccountUtil','getAverageDaysToDepleteTheIncome',accountId+' - '+scheduledAmt,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
       return avgDays;
  }
  }
  
  public static String getLatestCreditGuidelineId(String territoryId)
  {
    List<Credit_Guideline__c> creditGuidelines = [SELECT Id,Name FROM Credit_Guideline__c WHERE Territory__c =: territoryId ORDER BY CreatedDate DESC LIMIT 1];
    if(creditGuidelines.size()>0)
    {
        return creditGuidelines[0].Id;
    }
    return null;
  }
  
  public static Id transferToCreditProvider(Id accountId)
  {
    try {
    Account mergeAcct = [SELECT Id, FirstName,LastName, Probable_Account__c, Probable_Territory__c,Probable_Territory__r.OwnerId,Probable_Territory__r.Applicant_Customer_Prefix__c,PersonMobilePhone,PersonEmail,PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,Sensis_Latitude__c,Sensis_Longitude__c,Marital_Status__pc,Gender__pc,Birthdate__c,Number_of_Dependants__c,
        Previous_Address__c,Identification_No__c,Identification_Type__c,Length_of_Stay_in_Current_Address__c,Length_of_Stay_in_Previous_Address__c,Customer_Photo_Id__c,Rep_Responsible_For_Converting_Lead__c,Enquiry_Date__c,Enquiry_Datetime__c,Centrepay_Ref_No__c,Driver_Licence_State__c,Passport_Country__c,Photo_Id_Front__c,Photo_Id_Back__c,Enquiry_Status__c,
        Consent_URL__c,Consent_URL_Address__c,Consent_URL_Device_Info__c,Consent_URL_Latitude__c,Consent_URL_Longitude__c,Consent_URL_Opened_DateTime__c,Consent_URLSent_DateTime__c,Last_Online_Activity_Datetime__c,
        Hybrid_Link_Allocation_Datetime__c,RO_Online__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Basic_Info_Online__c,Equifax_Online__c,Expense_Online__c,Income_Online__c,BankStatement_Date__c,MyGov_Date__c,myGov_Completion_Datetime__c,BankStatement_Completion_Datetime__c,
        Product_Name_for_Agreement__c,Product_Interested_In__c,Product_Description__c,Why_consumer_lease__c,Requirements_and_Objectives__c,Why_not_phone_plan__c,Loan_Purpose__c,Benefit_of_Consumer_Lease_with_R4K__c,Specify_Other_Benefits_of_Consumer_Lease__c,
        PUA_Status__c,PUA_Status_DateTime__c,PUA_Term_1__c,PUA_Term_2__c,PUA_Term_3__c,PUA_Declined_Reason__c,Probable_Territory__r.Company_Territory__c,Probable_Territory__r.State_Master_State__c,
        Rent_Mortgage_Board__c,Loan_Payments__c,Credit_Card__c,Insurance__c,Food__c,Utilities__c,Car_Lease_Loan_Payment__c,Mobile_Expenses__c,Clothing__c,Tobacco_Alcohol__c,OtherOutgoings__c,Other_Rental_Companies__c,Rent4Keeps_Payment_C__c,Entertaiment__c,
        Rent_Mortgage_Board_Details__c,Entertaiment_Details__c,Loan_Payment_Details__c,Credit_Card_Details__c,Insurance_Details__c,Food_Details__c,Utilities_Details__c,Car_Lease_Loan_Payment_Details__c,Mobile_Expenses_Details__c,Clothing_Details__c,Tobacco_Alcohol_Details__c,Other_Details__c,Other_Rental_Company_Details__c,External_Transfer_Relationship__c,
        Employment_Income__c,Centrelink_Benefit_Amount__c,Centrelink_Benefit2_Amount__c,Centrelink_Benefit3_Amount__c,Other_Centrelink_Benefit_Amount__c,Other_Income_Amount__c,Centrelink_Benefit__c,Centrelink_Benefit2__c,Centrelink_Benefit3__c,Other_Centrelink_Benefit__c,Employment_Commencement_Date__c,Employer_Name__c,Other_Income_Details__c,Other_Income_Source__c,
        Equifax_Age_of_File__c,Equifax_Captured_Address__c,Equifax_Consent_Received_DateTime__c,Equifax_Enquiry_DateTime__c,Equifax_Enquiry_Id__c,Veda_File_Number__c,Equifax_No_of_Unpaid_Default_NonRental__c,Equifax_No_of_Unpaid_Default_Rental__c,Equifax_SMS_Consent_Sent__c,Equifax_SMS_Consent_Received__c,No_of_Equifax_Enquiries_Last_6_Month__c,Score_of_Equifax__c,Bankruptcy_Part_9_Agreements__c,Bankruptcy_Status__c,
        Avg_No_of_Days_for_Income_Depletion__c,Number_of_Dishonours__c,Customer_No__c,Probable_Account__r.Territory_Number__c,Probable_Account__r.Territory_Number__r.Is_Credit_Contract__c,Probable_Account__r.Territory_Number__r.Company_Territory__c,Probable_Account__r.Territory_Number__r.State_Master_State__c,
        MOGO_Captured_Address__c,myGov_Captured_Address__c,myGov_Captured_CRN__c,MOGO_Rent__c,MOGO_Loan__c,MOGO_Credit_Card__c,MOGO_Insurance__c,MOGO_Household__c,MOGO_Utilities__c,MOGO_Car_Petrol_Travel__c,MOGO_Mobile__c,MOGO_Clothing__c,MOGO_Tobacco_Alcohol__c,MOGO_Other_Total__c,MOGO_Other__c,MOGO_Rent_Transactions__c,MOGO_Loan_Transactions__c,MOGO_Credit_Card_Transactions__c,MOGO_Insurance_Transactions__c,MOGO_Household_Transactions__c,MOGO_Utilities_Transactions__c,MOGO_Travel_Transactions__c,MOGO_Mobile_Transactions__c,MOGO_Clothing_Transactions__c,MOGO_Tobacco_Alcohol_Transactions__c,MOGO_Other_Transactions__c,
        MOGO_Centrelink_Income__c,MyGov_DOB__c,BankStatement_TransactionDays__c,Highlevel_Income__c,Comfortable_Spending__c,Residential_Status__c,Landlord_Name__c,Landlord_Telephone__c,Employment_Type__c,Opt_out_marketing_material__c
    FROM Account WHERE Id =: accountId LIMIT 1];
    
    if(mergeAcct.Probable_Account__c != null && mergeAcct.Probable_Account__r.Territory_Number__r.Is_Credit_Contract__c)
    {
        //Merge Account to master Record
        system.debug('##Merge');
        Account masterAcct = [SELECT Id,Customer_No__c FROM Account WHERE Id =: mergeAcct.Probable_Account__c LIMIT 1];
        
        //Assign all the fields to be merged to the master
        masterAcct.FirstName = mergeAcct.FirstName;
        masterAcct.LastName = mergeAcct.LastName;
        masterAcct.PersonMobilePhone = mergeAcct.PersonMobilePhone;
        masterAcct.PersonEmail = mergeAcct.PersonEmail;
        masterAcct.PersonMailingStreet = mergeAcct.PersonMailingStreet;
        masterAcct.PersonMailingCity = mergeAcct.PersonMailingCity;
        masterAcct.PersonMailingState = mergeAcct.PersonMailingState;
        masterAcct.PersonMailingPostalCode = mergeAcct.PersonMailingPostalCode;
        masterAcct.PersonMailingCountry = mergeAcct.PersonMailingCountry;
        masterAcct.Sensis_Latitude__c = mergeAcct.Sensis_Latitude__c;
        masterAcct.Sensis_Longitude__c = mergeAcct.Sensis_Longitude__c;
        masterAcct.Centrepay_Ref_No__c = mergeAcct.Centrepay_Ref_No__c;
        masterAcct.Driver_Licence_State__c = mergeAcct.Driver_Licence_State__c;
        masterAcct.Passport_Country__c = mergeAcct.Passport_Country__c;
        masterAcct.Marital_Status__pc = mergeAcct.Marital_Status__pc;
        masterAcct.Gender__pc = mergeAcct.Gender__pc;
        masterAcct.Birthdate__c = mergeAcct.Birthdate__c;
        masterAcct.Number_of_Dependants__c = mergeAcct.Number_of_Dependants__c;
        masterAcct.Credit_Guideline__c = getLatestCreditGuidelineId(mergeAcct.Probable_Account__r.Territory_Number__c);
        masterAcct.Enquiry_Date__c = mergeAcct.Enquiry_Date__c;
        masterAcct.Enquiry_Datetime__c = mergeAcct.Enquiry_Datetime__c;
        masterAcct.Enquiry_Status__c = mergeAcct.Enquiry_Status__c;
        masterAcct.Residential_Status__c = masterAcct.Residential_Status__c;
        masterAcct.Landlord_Name__c = masterAcct.Landlord_Name__c;
        masterAcct.Landlord_Telephone__c = masterAcct.Landlord_Telephone__c;
        
        masterAcct.Consent_URL__c = mergeAcct.Consent_URL__c;
        masterAcct.Consent_URL_Address__c = mergeAcct.Consent_URL_Address__c;
        masterAcct.Consent_URL_Device_Info__c = mergeAcct.Consent_URL_Device_Info__c;
        masterAcct.Consent_URL_Latitude__c = mergeAcct.Consent_URL_Latitude__c;
        masterAcct.Consent_URL_Longitude__c = mergeAcct.Consent_URL_Longitude__c;
        masterAcct.Consent_URL_Opened_DateTime__c = mergeAcct.Consent_URL_Opened_DateTime__c;
        masterAcct.Consent_URLSent_DateTime__c = mergeAcct.Consent_URLSent_DateTime__c;
        masterAcct.Last_Online_Activity_Datetime__c = mergeAcct.Last_Online_Activity_Datetime__c;
        masterAcct.Hybrid_Link_Allocation_Datetime__c = mergeAcct.Hybrid_Link_Allocation_Datetime__c;
        masterAcct.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+masterAcct.Customer_No__c;
        masterAcct.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+masterAcct.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
        
        masterAcct.Customer_Photo_Id__c = mergeAcct.Customer_Photo_Id__c;
        masterAcct.Photo_Id_Front__c = mergeAcct.Photo_Id_Front__c;
        masterAcct.Photo_Id_Back__c = mergeAcct.Photo_Id_Back__c;
        masterAcct.Previous_Address__c = mergeAcct.Previous_Address__c;
        masterAcct.Identification_No__c = mergeAcct.Identification_No__c;
        masterAcct.Identification_Type__c = mergeAcct.Identification_Type__c;
        masterAcct.Length_of_Stay_in_Current_Address__c = mergeAcct.Length_of_Stay_in_Current_Address__c;
        masterAcct.Length_of_Stay_in_Previous_Address__c = mergeAcct.Length_of_Stay_in_Previous_Address__c;
        masterAcct.Product_Name_for_Agreement__c = mergeAcct.Product_Name_for_Agreement__c;
        masterAcct.Product_Interested_In__c = mergeAcct.Product_Interested_In__c;
        masterAcct.Product_Description__c = mergeAcct.Product_Description__c;
        masterAcct.Why_consumer_lease__c = mergeAcct.Why_consumer_lease__c;
        masterAcct.Requirements_and_Objectives__c = mergeAcct.Requirements_and_Objectives__c;
        masterAcct.Why_not_phone_plan__c = mergeAcct.Why_not_phone_plan__c;
        masterAcct.Loan_Purpose__c = mergeAcct.Loan_Purpose__c;
        masterAcct.Benefit_of_Consumer_Lease_with_R4K__c = mergeAcct.Benefit_of_Consumer_Lease_with_R4K__c;
        masterAcct.Specify_Other_Benefits_of_Consumer_Lease__c = mergeAcct.Specify_Other_Benefits_of_Consumer_Lease__c;
        masterAcct.PUA_Status__c = mergeAcct.PUA_Status__c;
        masterAcct.PUA_Status_DateTime__c = mergeAcct.PUA_Status_DateTime__c;
        masterAcct.PUA_Term_1__c = mergeAcct.PUA_Term_1__c;
        masterAcct.PUA_Term_2__c = mergeAcct.PUA_Term_2__c;
        masterAcct.PUA_Term_3__c = mergeAcct.PUA_Term_3__c;
        masterAcct.PUA_Declined_Reason__c = mergeAcct.PUA_Declined_Reason__c;
        
        masterAcct.RO_Online__c = mergeAcct.RO_Online__c;
        masterAcct.Basic_Info_Online__c = mergeAcct.Basic_Info_Online__c;
        masterAcct.Equifax_Online__c = mergeAcct.Equifax_Online__c;
        masterAcct.Expense_Online__c = mergeAcct.Expense_Online__c;
        masterAcct.Income_Online__c = mergeAcct.Income_Online__c;
        masterAcct.Is_PhotoId_Attached_After_Enquiry__c = mergeAcct.Is_PhotoId_Attached_After_Enquiry__c;
        masterAcct.Bank_Final_Page__c = mergeAcct.Bank_Final_Page__c;
        masterAcct.MyGov_Final_Page__c = mergeAcct.MyGov_Final_Page__c;

        masterAcct.BankStatement_Date__c = mergeAcct.BankStatement_Date__c;
        masterAcct.MyGov_Date__c = mergeAcct.MyGov_Date__c;
        masterAcct.myGov_Completion_Datetime__c = mergeAcct.myGov_Completion_Datetime__c;
        masterAcct.BankStatement_Completion_Datetime__c = mergeAcct.BankStatement_Completion_Datetime__c;
        
        masterAcct.Rent_Mortgage_Board__c = mergeAcct.Rent_Mortgage_Board__c;
        masterAcct.Entertaiment__c = mergeAcct.Entertaiment__c;
        masterAcct.Loan_Payments__c = mergeAcct.Loan_Payments__c;
        masterAcct.Credit_Card__c = mergeAcct.Credit_Card__c;
        masterAcct.Insurance__c = mergeAcct.Insurance__c;
        masterAcct.Food__c = mergeAcct.Food__c;
        masterAcct.Utilities__c = mergeAcct.Utilities__c;
        masterAcct.Car_Lease_Loan_Payment__c = mergeAcct.Car_Lease_Loan_Payment__c;
        masterAcct.Mobile_Expenses__c = mergeAcct.Mobile_Expenses__c;
        masterAcct.Clothing__c = mergeAcct.Clothing__c;
        masterAcct.Tobacco_Alcohol__c = mergeAcct.Tobacco_Alcohol__c;
        masterAcct.OtherOutgoings__c = mergeAcct.OtherOutgoings__c;
        masterAcct.Other_Rental_Companies__c = mergeAcct.Other_Rental_Companies__c;
        masterAcct.Rent4Keeps_Payment_C__c = mergeAcct.Rent4Keeps_Payment_C__c;
        
        masterAcct.Rent_Mortgage_Board_Details__c = mergeAcct.Rent_Mortgage_Board_Details__c;
        masterAcct.Entertaiment_Details__c = mergeAcct.Entertaiment_Details__c;
        masterAcct.Loan_Payment_Details__c = mergeAcct.Loan_Payment_Details__c;
        masterAcct.Credit_Card_Details__c = mergeAcct.Credit_Card_Details__c;
        masterAcct.Insurance_Details__c = mergeAcct.Insurance_Details__c;
        masterAcct.Food_Details__c = mergeAcct.Food_Details__c;
        masterAcct.Utilities_Details__c = mergeAcct.Utilities_Details__c;
        masterAcct.Car_Lease_Loan_Payment_Details__c = mergeAcct.Car_Lease_Loan_Payment_Details__c;
        masterAcct.Mobile_Expenses_Details__c = mergeAcct.Mobile_Expenses_Details__c;
        masterAcct.Clothing_Details__c = mergeAcct.Clothing_Details__c;
        masterAcct.Tobacco_Alcohol_Details__c = mergeAcct.Tobacco_Alcohol_Details__c;
        masterAcct.Other_Details__c = mergeAcct.Other_Details__c;
        masterAcct.Other_Rental_Company_Details__c = mergeAcct.Other_Rental_Company_Details__c;
        masteracct.External_Transfer_Relationship__c = mergeAcct.External_Transfer_Relationship__c;
        
        masterAcct.Employment_Income__c = mergeAcct.Employment_Income__c;
        masterAcct.Employment_Type__c = mergeAcct.Employment_Type__c;
        masterAcct.Centrelink_Benefit_Amount__c = mergeAcct.Centrelink_Benefit_Amount__c;
        masterAcct.Centrelink_Benefit2_Amount__c = mergeAcct.Centrelink_Benefit2_Amount__c;
        masterAcct.Centrelink_Benefit3_Amount__c = mergeAcct.Centrelink_Benefit3_Amount__c;
        masterAcct.Other_Centrelink_Benefit_Amount__c = mergeAcct.Other_Centrelink_Benefit_Amount__c;
        masterAcct.Other_Income_Amount__c = mergeAcct.Other_Income_Amount__c;
        masterAcct.Centrelink_Benefit__c = mergeAcct.Centrelink_Benefit__c;
        masterAcct.Centrelink_Benefit2__c = mergeAcct.Centrelink_Benefit2__c;
        masterAcct.Centrelink_Benefit3__c = mergeAcct.Centrelink_Benefit3__c;
        masterAcct.Other_Centrelink_Benefit__c = mergeAcct.Other_Centrelink_Benefit__c;
        masterAcct.Employment_Commencement_Date__c = mergeAcct.Employment_Commencement_Date__c;
        masterAcct.Employer_Name__c = mergeAcct.Employer_Name__c;
        masterAcct.Other_Income_Details__c = mergeAcct.Other_Income_Details__c;
        masterAcct.Other_Income_Source__c = mergeAcct.Other_Income_Source__c;

        masterAcct.Highlevel_Income__c = mergeAcct.Highlevel_Income__c;
        masterAcct.Comfortable_Spending__c = mergeAcct.Comfortable_Spending__c;
        
        masterAcct.Equifax_Age_of_File__c = mergeAcct.Equifax_Age_of_File__c;
        masterAcct.Equifax_Captured_Address__c = mergeAcct.Equifax_Captured_Address__c;
        masterAcct.Equifax_Consent_Received_DateTime__c = mergeAcct.Equifax_Consent_Received_DateTime__c;
        masterAcct.Equifax_Enquiry_DateTime__c = mergeAcct.Equifax_Enquiry_DateTime__c;
        masterAcct.Equifax_Enquiry_Id__c = mergeAcct.Equifax_Enquiry_Id__c;
        masterAcct.Veda_File_Number__c = mergeAcct.Veda_File_Number__c;
        masterAcct.Equifax_No_of_Unpaid_Default_NonRental__c = mergeAcct.Equifax_No_of_Unpaid_Default_NonRental__c;
        masterAcct.Equifax_No_of_Unpaid_Default_Rental__c = mergeAcct.Equifax_No_of_Unpaid_Default_Rental__c;
        masterAcct.Equifax_SMS_Consent_Sent__c = mergeAcct.Equifax_SMS_Consent_Sent__c;
        masterAcct.Equifax_SMS_Consent_Received__c = mergeAcct.Equifax_SMS_Consent_Received__c;
        masterAcct.No_of_Equifax_Enquiries_Last_6_Month__c = mergeAcct.No_of_Equifax_Enquiries_Last_6_Month__c;
        masterAcct.Score_of_Equifax__c = mergeAcct.Employment_Income__c;
        masterAcct.Bankruptcy_Part_9_Agreements__c = mergeAcct.Bankruptcy_Part_9_Agreements__c;
        masterAcct.Bankruptcy_Status__c = mergeAcct.Bankruptcy_Status__c;
        
        masterAcct.MOGO_Rent__c = mergeAcct.MOGO_Rent__c;
        masterAcct.MOGO_Loan__c = mergeAcct.MOGO_Loan__c;
        masterAcct.MOGO_Credit_Card__c = mergeAcct.MOGO_Credit_Card__c;
        masterAcct.MOGO_Insurance__c = mergeAcct.MOGO_Insurance__c;
        masterAcct.MOGO_Household__c = mergeAcct.MOGO_Household__c;
        masterAcct.MOGO_Utilities__c = mergeAcct.MOGO_Utilities__c;
        masterAcct.MOGO_Car_Petrol_Travel__c = mergeAcct.MOGO_Car_Petrol_Travel__c;
        masterAcct.MOGO_Mobile__c = mergeAcct.MOGO_Mobile__c;
        masterAcct.MOGO_Clothing__c = mergeAcct.MOGO_Clothing__c;
        masterAcct.MOGO_Other_Total__c = mergeAcct.MOGO_Other_Total__c;
        masterAcct.MOGO_Other__c = mergeAcct.MOGO_Other__c;
        masterAcct.MOGO_Rent_Transactions__c = mergeAcct.MOGO_Rent_Transactions__c;
        masterAcct.MOGO_Loan_Transactions__c = mergeAcct.MOGO_Loan_Transactions__c;
        masterAcct.MOGO_Credit_Card_Transactions__c = mergeAcct.MOGO_Credit_Card_Transactions__c;
        masterAcct.MOGO_Insurance_Transactions__c = mergeAcct.MOGO_Insurance_Transactions__c;
        masterAcct.MOGO_Household_Transactions__c = mergeAcct.MOGO_Household_Transactions__c;
        masterAcct.MOGO_Utilities_Transactions__c = mergeAcct.MOGO_Utilities_Transactions__c;
        masterAcct.MOGO_Travel_Transactions__c = mergeAcct.MOGO_Travel_Transactions__c;
        masterAcct.MOGO_Mobile_Transactions__c = mergeAcct.MOGO_Mobile_Transactions__c;
        masterAcct.MOGO_Clothing_Transactions__c = mergeAcct.MOGO_Clothing_Transactions__c;
        masterAcct.MOGO_Tobacco_Alcohol_Transactions__c = mergeAcct.MOGO_Tobacco_Alcohol_Transactions__c;
        masterAcct.MOGO_Other_Transactions__c = mergeAcct.MOGO_Other_Transactions__c;
        masterAcct.MOGO_Captured_Address__c = mergeAcct.MOGO_Captured_Address__c;
        masterAcct.myGov_Captured_Address__c = mergeAcct.myGov_Captured_Address__c;
        masterAcct.myGov_Captured_CRN__c = mergeAcct.myGov_Captured_CRN__c;
        masterAcct.MOGO_Centrelink_Income__c = mergeAcct.MOGO_Centrelink_Income__c;
        masterAcct.MyGov_DOB__c = mergeAcct.MyGov_DOB__c;
        masterAcct.BankStatement_TransactionDays__c = mergeAcct.BankStatement_TransactionDays__c;
        
        masterAcct.Avg_No_of_Days_for_Income_Depletion__c = mergeAcct.Avg_No_of_Days_for_Income_Depletion__c;
        masterAcct.Number_of_Dishonours__c = mergeAcct.Number_of_Dishonours__c;
        masterAcct.Opt_out_marketing_material__c = mergeAcct.Opt_out_marketing_material__c;
        masterAcct.R4K_Licensing_Customer_No__c = mergeAcct.Customer_No__c;
        //////////////////////////////////////////////////////////////

        if(mergeAcct.Probable_Account__r.Territory_Number__r.Company_Territory__c){
            String empTerritory = (mergeAcct.Probable_Account__r.Territory_Number__r.State_Master_State__c == 'NZ' ? 'NZ' : (mergeAcct.Probable_Account__r.Territory_Number__r.State_Master_State__c == 'NSW' ? 'NSW' : 'VIC'));
            List<Employee__c> empList = [SELECT Id FROM Employee__c WHERE Territory__r.Is_Credit_Contract__c = true AND Territory__r.State_Master_State__c =: empTerritory AND Name = 'Hybrid Application' AND Territory__r.Name != '1000' ORDER BY Territory__r.Name DESC LIMIT 1];
            String hybridEmployeeId = (empList.size() > 0 ? empList[0].Id : null);
            masterAcct.Rep_Responsible_For_Converting_Lead__c = hybridEmployeeId;
            masterAcct.Rep_Name__c = 'Hybrid Application';
        }else{
            masterAcct.Rep_Responsible_For_Converting_Lead__c = null;
            masterAcct.Rep_Name__c = 'Hybrid Application';
        }
        
        merge masterAcct mergeAcct;
        return masterAcct.Id;
    }
    else if(mergeAcct.Probable_Territory__c!=null)
    {
        //Directly transfer the ownership to the credit provider as there is no probable account
        system.debug('##Direct Transfer');
        mergeAcct.OwnerId = mergeAcct.Probable_Territory__r.OwnerId;
        mergeAcct.Territory_Number__c = mergeAcct.Probable_Territory__c;
        mergeAcct.Credit_Guideline__c = getLatestCreditGuidelineId(mergeAcct.Probable_Territory__c);
        
        //Generate new customer number in the New Credit Provider Territory
        mergeAcct.R4K_Licensing_Customer_No__c = mergeAcct.Customer_No__c;
        mergeAcct.Customer_No__c = AccountUtil.generateCustomerNumberforAccount(mergeAcct.Probable_Territory__r.Applicant_Customer_Prefix__c,true);
        mergeAcct.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+mergeAcct.Customer_No__c;
        mergeAcct.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+mergeAcct.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';

        if(mergeAcct.Probable_Territory__r.Company_Territory__c){
            String empTerritory = (mergeAcct.Probable_Territory__r.State_Master_State__c == 'NZ' ? 'NZ' : (mergeAcct.Probable_Territory__r.State_Master_State__c == 'NSW' ? 'NSW' : 'VIC'));
            List<Employee__c> empList = [SELECT Id FROM Employee__c WHERE Territory__r.Is_Credit_Contract__c = true AND Territory__r.State_Master_State__c =: empTerritory AND Name = 'Hybrid Application' AND Territory__r.Name != '1000' ORDER BY Territory__r.Name DESC LIMIT 1];
            String hybridEmployeeId = (empList.size() > 0 ? empList[0].Id : null);
            mergeAcct.Rep_Responsible_For_Converting_Lead__c = hybridEmployeeId;
            mergeAcct.Rep_Name__c = 'Hybrid Application';
        }else{
            mergeAcct.Rep_Responsible_For_Converting_Lead__c = null;
            mergeAcct.Rep_Name__c = 'Hybrid Application';
        }
        
        update mergeAcct;
        return mergeAcct.Id;
    }
    return null;
    
    } catch (DMLException ex) {
        System.debug('Exception: ' + ex.getMessage()); 
        ErrorLog.addErrorLog('AccountUtil','transferToCreditProvider',accountId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
    
    
  }
}