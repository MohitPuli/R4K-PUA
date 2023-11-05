public class R4KOnlineApplicationController
{
public String acctId {get;set;}
public String ldId {get;set;}
public String rfId {get;set;}
public String rfContactId {get;set;}
public String prevRefIds {get;set;}
public String currentprevRefId {get;set;}
public String redo {get;set;}
public Account acct {get;set;}
public Lead lead {get;set;}
public Referee__c referee {get;set;}

public String ldFirstName {get;set;}
public String ldLastName {get;set;}
public String ldDob {get;set;}
public String ldMobile {get;set;}
public String ldEmail {get;set;}
public String ldCRN {get;set;}
public String ldAppType {get;set;}
public String ldPostCode {get;set;}
public String ldStreet {get;set;}
public String ldSuburb {get;set;}
public String ldState {get;set;}
public String ldReasonForEnquiry {get;set;}
public String ldDesiredProduct {get;set;}
public String ldUnformattedAddressVal{get;set;}
public boolean isldFormAllocationDatePresent {get;set;}
public boolean isFollowUpRequired {get;set;}
public String followUpRepMobile {get;set;}

public Datetime hybridLinkOpenedDate {get;set;}
public String linkOpenedLatitude {get;set;}
public String linkOpenedLongitude {get;set;}
public String linkOpenedAddress {get;set;}
public String linkOpenedDeviceBrand {get;set;}
public String linkOpenedDeviceType {get;set;}
public String linkOpenedDeviceName {get;set;}
public String linkOpenedDeviceBrowser {get;set;}

public String cloNumber {get;set;}
public String weCareNumber {get;set;}

public String firstNameVal {get;set;}
public String lastNameVal {get;set;}
public String genderVal {get;set;}
public String phoneVal {get;set;}
public String crnVal {get;set;}
public String emailVal {get;set;}
public String streetNameVal {get;set;}
public String suburbVal {get;set;}
public String stateVal {get;set;}
public String countryVal {get;set;}
public Decimal latVal {get;set;}
public Decimal lngVal {get;set;}
public String postalCodeVal {get;set;}
public String customerNo {get;set;}

public String rffirstNameVal {get;set;}
public String rflastNameVal {get;set;}
public String rfphoneVal {get;set;}
public String rfemailVal {get;set;}
public String rfcountryVal {get;set;}
public String rflatVal {get;set;}
public String rflngVal {get;set;}
public String rfaddressVal {get;set;}
public String rfstreetNameVal {get;set;}
public String rfsuburbVal {get;set;}
public String rfstateVal {get;set;}
public String rfpostalCodeVal {get;set;}
public String rfRelationVal {get;set;}
public String rfYearsVal {get;set;}
public String rfMonthsVal {get;set;}
public String rfContactFrequencyVal {get;set;}
public Boolean rfIsCreditWorthyVal {get;set;}
public String rfCommentsVal {get;set;}
public Datetime rfContactedDateVal {get;set;}
public Integer totalRefereesRequired {get;set;}
public Integer totalRefereesBeingFamMemberRequired {get;set;}
public Integer noOfRefereesAdded {get;set;}
public Integer noOfRefereesFamAdded {get;set;}
public List<Referee__c> prevRefContactList {get;set;}
public Boolean allRefereesAdded {get;set;}
public List<Referee__c> addedRefereesList {get;set;}
public List<String> allRefMobileNos {get;set;}
public String allRefMobileNosStr {get;set;}

public String cprfNameVal {get;set;}
public String cprfRelationVal {get;set;}
public String addRfMobNo {get;set;}

public Boolean equifaxValid {get;set;}
public Integer noofequifaxEnquiries {get;set;}
public Integer noofequifaxRentalDefaults {get;set;}
public Integer noofequifaxNonRentalDefaults {get;set;}
public String equifaxEnquiriesExplanation {get;set;}
public String equifaxRentalDefaultsExplanation {get;set;}
public String equifaxNonRentalDefaultsExplanation {get;set;}
public List<Equifax_Defaults__c> equifaxRentalDefaults {get;set;}
public List<Equifax_Defaults__c> equifaxNonRentalDefaults {get;set;}
public List<EnquiryWrap> enquiryLst {get;set;}

public String dobVal {get;set;}
public String idTypeVal {get;set;}
public String idTypeValOther {get;set;}
public String driverLicenceStateVal {get;set;}
public String passportCountryVal {get;set;}
public String driverLicenceVal {get;set;}
public String stateMasterState {get;set;}
public String territoryState {get;set;}
public String territoryId {get;set;}
//public Boolean hasMyGovVal {get;set;}
public Boolean hasProvidedConsentVal {get;set;}
public Boolean leadConsentVal {get;set;}

public Boolean hasAddedPhotoId {get;set;}
public String custPhotoAtt {get;set;}
public String photoAttBackId {get;set;}
public String photoAttId {get;set;}
public String urlBankSt {get;set;}
public String urlMyGov {get;set;}
public Boolean hasCompletedMyGov {get;set;}
public Boolean hasCompletedBankSt {get;set;}
public String additionalComments {get;set;}
public Boolean ishybridLinkCompleted {get;set;}
public String nextOnlineStepParam{get;set;}
public String furtherNextOnlineStepParam{get;set;}
public String nextExpenseStepParam{get;set;}
public String furtherNextExpenseStepParam{get;set;}

public String otherAttId{get;set;}
public Decimal countOtherAtts{get;set;}
public List<Attachment> attsOther{get;set;}

public String winzAttId{get;set;}
public Decimal countWinzAtts{get;set;}
public List<Attachment> attsWinz{get;set;}

public List<String> wideBayTerritories{get;set;}
public String rType{get;set;}
public String rWord{get;set;}
public Boolean finishedSigning{get;set;}
public String nextHybridStepParam{get;set;}

public Date NextPaymentDueDate{get;set;}
public Account acctToShowForCustomerEnquiry{get;set;}
public String otpCode{get;set;}
public String eid{get;set;}
public final String CUSTOMER_KEY = 'CustomerSecret';
public Boolean istimeout{get;set;}

public List<Opportunity> activeOppList{get;set;}
public List<SelectOption> activeOppSelectOptions{get;set;}
public Boolean isCompanyTerritory{get;set;}

public String leadEnquiryDynamicStatus{get;set;}
public Integer noOfActiveAgreements{get;set;}

public String nextOnlineLandingStep{get;set;}
public String currentOnlineLandingStep{get;set;}
public Boolean breakEvenReached{get;set;}
public Boolean agmtFinishingIn90Days{get;set;}
public Decimal actualArrears{get;set;}

public String webURL{get;set;}
public String onlineURL{get;set;}
public String onlineRefereeURL{get;set;}
public List<Expense> sharedExpensesList{get;set;}
public String sharedExpensesConfirmed{get;set;}

public List<String> clinkBenefitOptions{get;set;}

public Decimal rentExp {get;set;}
public Decimal loanExp {get;set;}
public Decimal creditcardExp {get;set;}
public Decimal insuranceExp {get;set;}
public Decimal foodExp {get;set;}
public Decimal utilitiesExp {get;set;}
public Decimal transportExp {get;set;}
public Decimal mobileExp {get;set;}
public Decimal clothingExp {get;set;}
public Decimal entertainmentExp {get;set;}
public Decimal otherRentalExp {get;set;}
public Decimal r4KPayment {get;set;}
public Decimal otherExp {get;set;}
public Decimal totalExp {get;set;}

public Boolean isSharedRentExpConfirmed {get;set;}
public Boolean isSharedLoanExpConfirmed {get;set;}
public Boolean isSharedCreditcardExpConfirmed {get;set;}
public Boolean isSharedInsuranceExpConfirmed {get;set;}
public Boolean isSharedFoodExpConfirmed {get;set;}
public Boolean isSharedUtilitiesExpConfirmed {get;set;}
public Boolean isSharedTransportExpConfirmed {get;set;}
public Boolean isSharedMobileExpConfirmed {get;set;}
public Boolean isSharedClothingExpConfirmed {get;set;}
public Boolean isSharedEntertainmentExpConfirmed {get;set;}
public Boolean isSharedOtherRentalExpConfirmed {get;set;}
public Boolean isSharedOtherExpConfirmed {get;set;}
public Map<String,Boolean> mapSharedExpenseLst {get;set;}
public Set<String> expenseGroups {get;set;}

public String centrelink1IncBenefit {get;set;}
public String centrelink2IncBenefit {get;set;}
public String centrelink3IncBenefit {get;set;}
public String centrelink4IncBenefit {get;set;}

public Decimal centrelink1Inc {get;set;}
public Decimal centrelink2Inc {get;set;}
public Decimal centrelink3Inc {get;set;}
public Decimal centrelink4Inc {get;set;}
public Decimal employmentInc {get;set;}
public Decimal otherInc {get;set;}
public Decimal totalInc {get;set;}
public Decimal surplusValue {get;set;}
public Decimal serviceability {get;set;}

public List<ExpenseDropdown__c> expDropdownLst {get;set;}
public String expDropdownDictLst {get;set;}
public Boolean isCreditContract{get;set;}
public Boolean isConverted{get;set;}
public Boolean tavExceedsLimit{get;set;}

public Account probableAccount{get;set;}
public Territory__c possibleTerritory{get;set;}

public Cart_Item__c cart{get;set;}
public List<Cart_Item__c> cartItems{get;set;}
public String proposedTerm{get;set;}
public String proposedFrequency{get;set;}
public boolean showSelectedProduct{get;set;}

public Integer externalTransferTransactionCount{get;set;}
public Decimal externalTransferDebitCount{get;set;}
public String puaStatus{get;set;}

public Map<String, String> stateToTimezone{get;set;}

public R4KOnlineApplicationController()
{
    wideBayTerritories = new List<String>{'Hervey Bay','Bundaberg','Gympie','South Burnett'};
    rType = (Apexpages.currentPage() != null ? Apexpages.currentPage().getParameters().get('rType') : null);
    rWord = (Apexpages.currentPage() != null ? Apexpages.currentPage().getParameters().get('rWord') : null); 
    onlineURL = SiteEndpoint__c.getValues('Online').URL__c;
    onlineRefereeURL = SiteEndpoint__c.getValues('RefereeEDM').URL__c;
    webURL = SiteEndpoint__c.getValues('R4KWeb').URL__c;
    googleOCRKey = 'AIzaSyDx21c0a3rHOMEPpmi9g5DK6URh-CqtqrM';
    System.debug('onlineURL: '+onlineURL);

    stateToTimezone = new Map<String, String> {
        'NSW' => 'Australia/Sydney',
        'VIC' => 'Australia/Melbourne',
        'QLD' => 'Australia/Brisbane',
        'SA'  => 'Australia/Adelaide',
        'WA'  => 'Australia/Perth',
        'TAS' => 'Australia/Hobart',
        'ACT' => 'Australia/Canberra',
        'NT'  => 'Australia/Darwin'
    };
}

public void initEnquiry()
{
    try{
        showSelectedProduct=false;
        ldId=Apexpages.currentPage().getParameters().get('ld');
        
        if(ldId!=null && ldId!='')
        {
            List<Lead> ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Credit_Check_Consent__c,Probable_Account__c,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Customer_No__c,Account__r.Name,Account__r.SMS_Mobile__c,Photo_Id_Front__c,Photo_Id_Back__c,Application_Logs__c,Opt_In_Info_From_Rent4keeps__c,
                                Hybrid_Link_Device_Info__c,Photo_Id_Details__c,OCR_Text__c,OCR_Back_Text__c,OCR_Address__c,Territory_Number__r.Applicant_Customer_Prefix__c,Territory_State__c,Automation_Outcome__c,Territory_Number__r.Is_Credit_Contract__c,Rent4Keeps_Account__c,
                                Product_Interested_In__c,Product_Name_for_Agreement__c,Product_Requirements__c,Requirements_and_Objectives__c,Loan_Purpose__c,Why_use_a_Sale_of_Goods_by_Instalment__c,Benefit_of_Sale_of_Goods_by_Instalment__c,RO_Online__c
                                from Lead where id=:ldId Limit 1];
            if(ldLst.size()>0)
            {
                lead = ldLst[0];
                
                cartItems = [SELECT Id,Product_Inventory__c,Lead__c,Total_Price__c,Delivery_Fee__c,Quantity__c,UnitPrice__c,Cash_Price__c,
                        Product_Inventory__r.ProductName__c,Product_Warehouse__c,Product_Inventory__r.ProductCode__c ,
                        Account__c,APR__c,Consent_Received__c,Frequency__c,Term__c,Instalment_Value__c,TAV__c,Selected_Product__c
                        FROM Cart_Item__c WHERE Lead__c =: ldId AND Product_Inventory__c != null and Product_Warehouse__c!=null order by Cash_Price__c desc];
            
                if(cartItems.size()==1 || cartItems.size()>0){
                    for(Cart_Item__c ct : cartItems)
                    {
                        if(ct.Selected_Product__c || cartItems.size()==1)
                        {
                            cart = ct;
                            proposedTerm = cart.Term__c!=null && cart.Term__c!='' ? cart.Term__c: '24';
                            ldDesiredProduct = cart.Product_Inventory__r.ProductName__c;
                            showSelectedProduct=true;
                        }
                    }
                }
            }
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','initEnquiry',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
    
}

public PageReference updateProductSummary()
{
    String cartId =Apexpages.currentPage().getParameters().get('cartId');
    try{
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KProductRequirements?ld='+ldId+'&n='+randomNumber;
        if(showSelectedProduct)
        {
            Cart_Item__c cup = new Cart_Item__c();
            cup.Id = cart.Id;
            cup.Term__c = proposedTerm;
            cup.Frequency__c = proposedFrequency;
            Decimal totalCashPrice = cart.Cash_Price__c+cart.Delivery_Fee__c;
            
            if(proposedTerm!=null && proposedTerm!='' && proposedFrequency!=null && proposedFrequency!='')
            {
                String jsonFees = Util.getFees(totalCashPrice,Decimal.valueOf(proposedTerm));
                Map<String, Object> dataFees = (Map<String, Object>) JSON.deserializeUntyped(jsonFees);
                Decimal totalFees = (Decimal) dataFees.get('totalFees');
                
                String jsonAPR=Util.calculateAPR(totalCashPrice,totalFees,Decimal.valueOf(proposedTerm),proposedFrequency);
                Map<String, Object> dataAPR = (Map<String, Object>) JSON.deserializeUntyped(jsonAPR);
                Decimal apr = (Decimal) dataAPR.get('apr') * 100;
                Decimal intalmentValue = (Decimal) dataAPR.get('rent');
                Decimal tav = (Decimal) dataAPR.get('tav');
                
                cup.APR__c = apr;
                cup.Instalment_Value__c = intalmentValue;
                cup.TAV__c =tav;
                cup.Consent_Received__c =true;
                update cup;
            }
        }
        else
        { 
            List<Cart_Item__c> ctItemsToUp = new List<Cart_Item__c>();
            if(cartItems.size()>0)
            {
                for(Cart_Item__c ct : cartItems)
                {
                    Cart_Item__c cup = new Cart_Item__c();
                    if(ct.Id==cartId)
                    {
                        cup.Id = cartId;
                        cup.Selected_Product__c =true;
                    }
                    else
                    {
                        cup.Id = ct.Id;
                        cup.Selected_Product__c =false;
                    }
                    ctItemsToUp.add(cup);
                }
                
                if(ctItemsToUp.size()>0)
                    update ctItemsToUp;
            }
            finalUrl = onlineURL+'/R4KProductSummary?ld='+ldId+'&n='+randomNumber;
        }
        
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateProductSummary',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void initAcknowledgementAndConsent(){
    acctId=Apexpages.currentPage().getParameters().get('id');
    try{
        acct = [select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,OwnerId,CAM_Income__c,CAM_Expense__c,
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
                    Centrelink_Benefit__c,Centrelink_Benefit2__c,Centrelink_Benefit3__c,Other_Centrelink_Benefit__c,Entertaiment__c,Territory_Number__r.Is_Credit_Contract__c,Rent4Keeps_Account__c,PUA_Status__c,PUA_Status_DateTime__c,PUA_Declined_Reason__c,Probable_Territory__c,Probable_Territory__r.OwnerId
                    from Account where id=:acctId Limit 1];
        puaStatus = acct.PUA_Status__c;
        ishybridLinkCompleted = acct.Hybrid_Link_Finish_Datetime__c!=null ? true : false;
        List<Cart_Item__c> cartItems = [SELECT Id,Product_Inventory__c,Lead__c,Total_Price__c,Delivery_Fee__c,Quantity__c,UnitPrice__c,Cash_Price__c,
                                Product_Inventory__r.ProductName__c,Product_Warehouse__c,Product_Inventory__r.ProductCode__c ,
                                Account__c,APR__c,Consent_Received__c,Frequency__c,Term__c,Instalment_Value__c,TAV__c
                                FROM Cart_Item__c WHERE Account__c =: acctId AND Product_Inventory__c != null AND Consent_Received__c = true order by Cash_Price__c desc];
        if(cartItems.size()>0)
        {
            cart = cartItems[0];
            ldDesiredProduct = cart.Product_Inventory__r.ProductName__c;
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','initAcknowledgementAndConsent',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void getFormDetails()
{
    try{
        acctId=Apexpages.currentPage().getParameters().get('id');
        ldId=Apexpages.currentPage().getParameters().get('ld');
        rfId=Apexpages.currentPage().getParameters().get('rf');
        prevRefIds=Apexpages.currentPage().getParameters().get('prevRefs');
        currentprevRefId=Apexpages.currentPage().getParameters().get('cpRefId');
        redo=Apexpages.currentPage().getParameters().get('redo');
        noOfRefereesAdded = 0;
        noOfRefereesFamAdded = 0;
        totalRefereesRequired = 2;
        totalRefereesBeingFamMemberRequired = 1;
        allRefereesAdded = false;
        leadConsentVal = false;
        
        noofequifaxEnquiries = 0;
        noofequifaxRentalDefaults = 0;
        noofequifaxNonRentalDefaults = 0;
        equifaxValid = false;
        clinkBenefitOptions = new List<String>();
        sharedExpensesList = new List<Expense>();
        refExpensesLeft = 0;
        sharedExpensesConfirmed = '';
        expDropdownDictLst = '[]';
        allRefMobileNosStr='[]';
        externalTransferTransactionCount = 0;
        externalTransferDebitCount = 0;
        
        if(ldId!=null && ldId!='')
        {
            List<Lead> ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Credit_Check_Consent__c,Probable_Account__c,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Customer_No__c,Account__r.Name,Account__r.SMS_Mobile__c,Photo_Id_Front__c,Photo_Id_Back__c,Application_Logs__c,Opt_In_Info_From_Rent4keeps__c,
                                Hybrid_Link_Device_Info__c,Photo_Id_Details__c,OCR_Text__c,OCR_Back_Text__c,OCR_Address__c,Territory_Number__r.Applicant_Customer_Prefix__c,Territory_State__c,Automation_Outcome__c,Territory_Number__r.Is_Credit_Contract__c,Rent4Keeps_Account__c,
                                Product_Interested_In__c,Product_Name_for_Agreement__c,Product_Requirements__c,Requirements_and_Objectives__c,Loan_Purpose__c,Why_use_a_Sale_of_Goods_by_Instalment__c,Benefit_of_Sale_of_Goods_by_Instalment__c,RO_Online__c,Probable_Territory__c,
                                HasOptedOutOfEmail,Probable_Territory__r.State_Master_State__c,Probable_Territory__r.OwnerId
                                from Lead where id=:ldId Limit 1];
            if(ldLst.size()>0)
            {
                System.debug('****');
                lead = ldLst[0];
                isCreditContract = lead.Territory_Number__r.Is_Credit_Contract__c;
                ldFirstName = lead.FirstName <> null && (lead.FirstName.containsIgnoreCase('Provided') || lead.FirstName.equalsIgnoreCase('New IVR Lead') || lead.FirstName.equalsIgnoreCase('Credit') || lead.FirstName.equalsIgnoreCase('Buy')) ? null : lead.FirstName;
                ldLastName = lead.LastName <> null && (lead.LastName.containsIgnoreCase('Provided') || lead.LastName.equalsIgnoreCase('New IVR Lead') || lead.LastName.equalsIgnoreCase('Credit Contract') || lead.LastName.equalsIgnoreCase('Buy Now')) ? null : lead.LastName;
                ldMobile = lead.MobilePhone;
                ldStreet = lead.Street;
                ldSuburb = lead.City;
                ldState = lead.State;
                ldPostCode = lead.PostalCode;
                countryVal = lead.Country;
                ldEmail = lead.Email;
                ldCRN = lead.crn__c;
                ldReasonForEnquiry = lead.Reason_for_Enquiry__c;
                ldDesiredProduct = lead.Desired_Product__c;
                ldUnformattedAddressVal = (lead.Street == null ? '' : lead.Street + ' ') + (lead.City == null ? '' : lead.City + ' ') + (lead.State == null ? '' : lead.State + ' ') + (lead.PostalCode == null ? '' : lead.PostalCode);
                stateMasterState = lead.Territory_Number__r.State_Master_State__c;
                territoryState = lead.Territory_State__c;
                territoryId = lead.Territory_Number__c;
                isldFormAllocationDatePresent = lead.Hybrid_Link_Allocation_Datetime__c!=null ? true : false;
                isFollowUpRequired = (lead.Hybrid_Link_Allocation_Datetime__c!=null && (lead.Reason_for_Enquiry__c=='Existing Account Enquiry' || lead.Reason_for_Enquiry__c=='Service Enquiry / Issue')) || (lead.Hybrid_Link_Allocation_Datetime__c!=null && lead.Description!=null && lead.Description.contains('Stop the search.')) || (lead.Automation_Outcome__c == 'Unlock') ? true : false;
                cloNumber = lead.Territory_Number__r.Lead_Phone__c;
                linkOpenedAddress = lead.Hybrid_Link_Address__c;
                hybridLinkOpenedDate = lead.Hybrid_Link_Opened_Datetime__c;
                followUpRepMobile = lead.Territory_Number__r.Account_Enquiry_Mobile__c == null ? lead.Territory_Number__r.Lead_Phone__c : lead.Territory_Number__r.Account_Enquiry_Mobile__c;
                if(lead.Hybrid_Link_Opened_Datetime__c==null)
                {
                    Lead ldToUp = new Lead();
                    ldToUp.Id = lead.Id;
                    ldToUp.Hybrid_Link_Opened_Datetime__c = Datetime.now();
                    update ldToUp;
                    hybridLinkOpenedDate = ldToUp.Hybrid_Link_Opened_Datetime__c;
                }
                acctId = lead.Account__c;
                parentId = ((acctId != null && acctId != '') ? acctId : ((ldId != null && ldId != '') ? ldId : ''));
                leadEnquiryDynamicStatus = lead.Applicant_Status__c;
                onlineLocationCaptured = lead.Hybrid_Link_Address__c != null && lead.Hybrid_Link_Address__c != '' ? true : false;
                onlineDeviceCaptured = lead.Hybrid_Link_Device_Info__c != null && lead.Hybrid_Link_Device_Info__c != '' ? true : false;
                nextOnlineStepParam = (lead.IsConverted ? 'sdidd' : (isFollowUpRequired ? 'followUp' : (!lead.Credit_Check_Consent__c ? 'cguide' : (!lead.RO_Online__c ? 'rando' : (lead.Photo_Id_Front__c == null ? 'reqdoc' : (lead.Photo_Id_Back__c == null ? 'sdidb' : 'sdidd'))))));
                System.debug('****nextOnlineStepParam ' + nextOnlineStepParam);
                hasAddedPhotoId = (lead.Photo_Id_Front__c != null && lead.Photo_Id_Front__c != '' ? true : false);
                hasAddedPhotoIdBack = (lead.Photo_Id_Back__c != null && lead.Photo_Id_Back__c != '' ? true : false);
                photoIdFrontId = lead.Photo_Id_Front__c;
                photoIdBackId = lead.Photo_Id_Back__c;
                leadConsentVal = lead.Credit_Check_Consent__c;
                getPhotoIdDetails(lead);
                if(lead.Photo_Id_Front__c != null && Apexpages.currentPage().getParameters().get('param') != 'sdidb' && (Apexpages.currentPage().getParameters().get('param') == 'sdid' || nextOnlineStepParam == 'sdid'))
                {
                    sendOCRRequest(lead.Photo_Id_Front__c,lead.Id,'front');
                }
                if(lead.Photo_Id_Back__c != null && Apexpages.currentPage().getParameters().get('param') == 'sdidb')
                {
                    sendOCRRequest(lead.Photo_Id_Back__c,lead.Id,'back');
                }
                if(idFirstName == null || idFirstName.trim() == ''){
                    idFirstName = ldFirstName;
                }
                if(idLastName == null || idLastName.trim() == ''){
                    idLastName = ldLastName;
                }
            }
        }
        if(rfId!=null && rfId!='')
        {
            List<Referee__c> refLst = [select id, name,Referee_Name__r.FirstName,Referee_Name__r.LastName,Applicant__r.FirstName,Referee_Name__r.MobilePhone,SMS_Referee_Mobile__c,
                    Referee_Name__r.MailingStreet,Referee_Name__r.MailingState,Referee_Name__r.MailingCity,Referee_Name__r.MailingPostalCode,Referee_Name__r.Name,
                    Relationship__c,Years__c,Months__c,Life__c,Contact_Frequency_With_Applicant__c,Credit_Worthiness__c,Notes__c,Contacted_Date_Time__c,
                    Referee_Name__c,Applicant__c,Applicant__r.OwnerId,Referee_Contact_Link__c,Sharing_Expenses__c,Applicant__r.Rent_Mortgage_Board__c,
                    Applicant__r.Food__c,Applicant__r.Clothing__c,Applicant__r.Utilities__c,Applicant__r.Car_Lease_Loan_Payment__c,Applicant__r.Mobile_Expenses__c,
                    Applicant__r.Credit_Card__c,Applicant__r.Loan_Payments__c,Applicant__r.Insurance__c,Applicant__r.Other_Rental_Companies__c,Applicant__r.OtherOutgoings__c,
                    Applicant__r.Rent_Mortgage_Board_Details__c,Applicant__r.Food_Details__c,Applicant__r.Clothing_Details__c,Applicant__r.Utilities_Details__c,
                    Applicant__r.Car_Lease_Loan_Payment_Details__c,Applicant__r.Mobile_Expenses_Details__c,Applicant__r.Credit_Card_Details__c,Applicant__r.Loan_Payment_Details__c,
                    Applicant__r.Insurance_Details__c,Applicant__r.Other_Rental_Company_Details__c,Applicant__r.Other_Details__c,Applicant__r.State_Master_State__c,Applicant__r.Company_Territory__c,
                    Applicant__r.Shared_Expenses_Sent__c,Applicant__r.Shared_Expenses_Confirmed__c,Rent_Contribution__c,Clothing_Contribution__c,Credit_Card_Contribution__c,
                    Household_Contribution__c,Insurance_Contribution__c,Loan_Contribution__c,Sharing_Expenses_With_Applicant__c,
                    Mobile_Contribution__c,Other_Regular_Contribution__c,Other_Rental_Contribution__c,Transport_Contribution__c,Utilities_Contribution__c,
                    Applicant__r.Expense_Details__c,Automotive_Contribution__c,Travel_Contribution__c,Children_Retail_Contribution__c,
                    Department_Stores_Contribution__c,Groceries_Contribution__c,Education_Contribution__c,Gyms_and_other_memberships_Contribution__c,Health_Contribution__c,
                    Personal_Care_Contribution__c,Retail_Contribution__c,Online_Retail_Subscriptions_Contribution__c,Subscription_TV_Contribution__c,Telecommunications_Contribution__c                      
                    from Referee__c where id=:rfId LIMIT 1];
            if(refLst.size()>0)
            {
                referee = refLst[0];
                rfContactId = referee.Referee_Name__c;
                rffirstNameVal = referee.Referee_Name__r.FirstName;
                rflastNameVal = referee.Referee_Name__r.LastName;
                rfphoneVal = referee.Referee_Name__r.MobilePhone;
                rfstreetNameVal = referee.Referee_Name__r.MailingStreet;
                rfsuburbVal = referee.Referee_Name__r.MailingCity;
                rfstateVal = referee.Referee_Name__r.MailingState;
                rfpostalCodeVal = referee.Referee_Name__r.MailingPostalCode;
                if(rfstreetNameVal!=null && rfstreetNameVal!='')
                    rfaddressVal = rfstreetNameVal+' '+rfsuburbVal+' '+rfstateVal+' '+rfpostalCodeVal;
                    
                rfRelationVal = referee.Relationship__c;
                rfYearsVal = referee.Life__c ? 'Life' : String.valueOf(referee.Years__c);
                rfMonthsVal = referee.Life__c ? '' : String.valueOf(referee.Months__c);
                rfContactFrequencyVal = referee.Contact_Frequency_With_Applicant__c;
                rfIsCreditWorthyVal = referee.Credit_Worthiness__c;
                rfCommentsVal = referee.Notes__c;
                rfContactedDateVal = referee.Contacted_Date_Time__c;
                acctId = referee.Applicant__c;
                sharedExpensesConfirmed = (referee.Applicant__r.Shared_Expenses_Confirmed__c == null ? '' : referee.Applicant__r.Shared_Expenses_Confirmed__c);
                sharedExpenseMaxAmt = 0;
                List<String> sharedExpensesConfirmedList = sharedExpensesConfirmed.split(';');
                List<String> sharedExpensesSentList = (referee.Sharing_Expenses__c == null ? '' : referee.Sharing_Expenses__c).split(';');
                System.debug('sharedExpensesConfirmedList ' + sharedExpensesConfirmedList);
                System.debug('sharedExpensesSentList ' + sharedExpensesSentList);
            }
        }
        system.debug('acctId: '+acctId);
        if((acctId!=null && acctId!='' && lead==null) || (acctId!=null && acctId!='' && lead!=null && lead.IsConverted))
        {
            List<Account> accts = [select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,OwnerId,CAM_Income__c,CAM_Expense__c,
                PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Active_Agreements__c,Gender__pc,myGov_Completion_Datetime__c,BankStatement_Completion_Datetime__c,
                Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c,Customer_Photo_Id__c,Mygov_DOB__c,myGov_Captured_CRN__c,
                MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,Hybrid_Link_Status__c,Consent_URL_Address__c,Explanation_for_Other_ID_type__c,
                Explanation_for_Recent_Enquiries__c,Veda_Notes__c,Explanation_for_All_Other_Defaults__c,No_of_Equifax_Enquiries_Last_6_Month__c,Equifax_No_of_Unpaid_Default_NonRental__c,Equifax_No_of_Unpaid_Default_Rental__c,Equifax_Age_of_File__c,Equifax_Enquiry_DateTime__c,Equifax_Enquiry_Id__c,Veda_File_Number__c,Enquiries_in_the_last_6_months__c,
                WrittenOff_s_Count__c,Last_Agreement_Close_Date__c,RecordType.Name,UnformattedAddress_VedaAlert_Report__c,Length_of_Stay_in_Current_Address__c,Residential_Status__c,Landlord_Name__c,Landlord_Telephone__c,Previous_Address__c,Length_of_Stay_in_Previous_Address__c,Number_of_Dependants__c,
                Marital_Status__pc,Next_Online_Step_Param__c,Shared_Details__c,Rent_Mortgage_Board_Details__c,Entertaiment_Details__c,Loan_Payment_Details__c,Credit_Card_Details__c,Insurance_Details__c,Food_Details__c,Utilities_Details__c,Car_Lease_Loan_Payment_Details__c,Mygov_Captured_Address__c,
                Mobile_Expenses_Details__c,Clothing_Details__c,Tobacco_Alcohol_Details__c,Other_Details__c,MOGO_Rent__c,MOGO_Loan__c,MOGO_Credit_Card__c,MOGO_Insurance__c,MOGO_Household__c,MOGO_Utilities__c,MOGO_Car_Petrol_Travel__c,MOGO_Mobile__c,MOGO_Clothing__c,
                MOGO_Tobacco_Alcohol__c,MOGO_Other_Total__c,MOGO_Other__c,MOGO_Rent_Transactions__c,MOGO_Loan_Transactions__c,MOGO_Credit_Card_Transactions__c,MOGO_Insurance_Transactions__c,MOGO_Household_Transactions__c,MOGO_Utilities_Transactions__c,MOGO_Travel_Transactions__c,
                MOGO_Mobile_Transactions__c,MOGO_Clothing_Transactions__c,MOGO_Tobacco_Alcohol_Transactions__c,MOGO_Other_Transactions__c,Photo_Id_Front__c,Photo_Id_Back__c,Other_Rental_Company_Details__c,Centrepay_Ref_No__c,Driver_Licence_State__c,Passport_Country__c,Employment_Income__c,
                Basic_Info_Online__c,RO_Online__c,Income_Online__c,Expense_Online__c,Referees_Online__c,Equifax_Online__c,Consent_URL_Device_Info__c,MOGO_Captured_Address__c,MOGO_Centrelink_Income__c,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,
                Credit_Guideline__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c,Credit_Guideline__r.EasyExisting_no_of_Referees_being_family__c,Credit_Guideline__r.Easy_no_of_Referees_being_family_Member__c,
                Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Total_Remaining_Amount__c,LastPaymentRecieved__c,Fortnightly_Scheduled_Payment__c,Last_Payment_Upload_Date__c,Territory_Number__r.Company_Territory__c,Territory_Number__r.Name,
                Rent_Mortgage_Board__c,Loan_Payments__c,Credit_Card__c,Insurance__c,Food__c,Utilities__c,Car_Lease_Loan_Payment__c,Mobile_Expenses__c,Clothing__c,Tobacco_Alcohol__c,OtherOutgoings__c,Other_Rental_Companies__c,Territory_State__c,
                Rent_Online__c,Tobacco_Alcohol_Online__c,Transport_Travel_Online__c,Utilities_Online__c,Clothing_Online__c,Credit_Card_Online__c,Household_Online__c,Insurance_Online__c,Loan_Online__c,Mobile_Online__c,Other_Regular_Online__c,Other_Rental_Online__c,
                Shared_Expenses_Confirmed__c,Shared_Expenses_Sent__c,Shared_Expenses_Online__c,Centrelink_Benefit_Amount__c,Centrelink_Benefit2_Amount__c,Centrelink_Benefit3_Amount__c,Other_Centrelink_Benefit_Amount__c,Other_Income_Amount__c,Rent4Keeps_Payment_C__c,Expense_Details__c,
                Centrelink_Benefit__c,Centrelink_Benefit2__c,Centrelink_Benefit3__c,Other_Centrelink_Benefit__c,Entertaiment__c,Territory_Number__r.Is_Credit_Contract__c,Rent4Keeps_Account__c,PUA_Status__c,PUA_Status_DateTime__c,PUA_Declined_Reason__c,Opt_out_marketing_material__c,Probable_Territory__c,Probable_Territory__r.OwnerId
                from Account where id=:acctId Limit 1];
        
            if(accts.size()>0)
            {
                acct = accts[0];
                isCreditContract = acct.Territory_Number__r.Is_Credit_Contract__c;
                parentId = acctId;
                isCompanyTerritory = accts[0].Territory_Number__r.Company_Territory__c;
                //nextOnlineStepParam = acct.Next_Online_Step_Param__c == null ? '' : acct.Next_Online_Step_Param__c;    
                firstNameVal = acct.FirstName;
                lastNameVal = acct.LastName;
                genderVal = acct.Gender__pc;
                phoneVal = acct.PersonMobilePhone;
                emailVal = acct.PersonEmail;
                crnVal = acct.myGov_Captured_CRN__c != null ? acct.myGov_Captured_CRN__c : acct.Centrepay_Ref_No__c;
                streetNameVal = acct.PersonMailingStreet;
                suburbVal = acct.PersonMailingCity;
                stateVal = acct.PersonMailingState;
                countryVal = acct.PersonMailingCountry;
                latVal = acct.Sensis_Latitude__c;
                lngVal = acct.Sensis_Longitude__c;
                postalCodeVal = acct.PersonMailingPostalCode;
                idTypeVal = acct.Identification_Type__c;
                idTypeValOther = (acct.Explanation_for_Other_ID_type__c == null ? '' : acct.Explanation_for_Other_ID_type__c.replaceAll('\'',' ').replaceAll('\"',' '));
                driverLicenceStateVal = acct.Driver_Licence_State__c;
                passportCountryVal = acct.Passport_Country__c;
                customerNo = acct.Customer_No__c;
                currentAddress = acct.Mygov_Captured_Address__c != null ? acct.Mygov_Captured_Address__c : acct.UnformattedAddress_VedaAlert_Report__c;
                lengthOfStayCurrent = acct.Length_of_Stay_in_Current_Address__c == null ? 0 : acct.Length_of_Stay_in_Current_Address__c;
                residentialStatus = acct.Residential_Status__c;
                landlordName = acct.Landlord_Name__c;
                landlordNumber = acct.Landlord_Telephone__c;
                previousAddress = acct.Previous_Address__c;
                lengthOfStayPrevious = acct.Length_of_Stay_in_Previous_Address__c;
                noOfDependents = acct.Number_of_Dependants__c;
                maritalStatus = acct.Marital_Status__pc == null ? '' : acct.Marital_Status__pc;
                sharedDetails = acct.Shared_Details__c == null ? '' : acct.Shared_Details__c;
                mogoRent = (acct.MOGO_Rent__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Rent__c;
                mogoHousehold = (acct.MOGO_Household__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Household__c;
                mogoClothing = (acct.MOGO_Clothing__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Clothing__c;
                mogoUtilities = (acct.MOGO_Utilities__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Utilities__c;
                mogoTransport = (acct.MOGO_Car_Petrol_Travel__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Car_Petrol_Travel__c;
                mogoMobile = (acct.MOGO_Mobile__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Mobile__c;
                mogoCredit = (acct.MOGO_Credit_Card__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Credit_Card__c;
                mogoLoan = (acct.MOGO_Loan__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Loan__c;
                mogoInsurance = (acct.MOGO_Insurance__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Insurance__c;
                mogoAlcohol = (acct.MOGO_Tobacco_Alcohol__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Tobacco_Alcohol__c;
                mogoOtherRental = 0;
                mogoOther = (acct.MOGO_Other_Total__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Other_Total__c;
                mogoEmployment = (acct.Employment_Income__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.Employment_Income__c;
                mogoCentrelinkIncome = (acct.MOGO_Centrelink_Income__c == null || acct.BankStatement_Completion_Datetime__c == null || acct.BankStatement_Completion_Datetime__c.date().daysBetween(Date.today()) > 21) ? 0 : acct.MOGO_Centrelink_Income__c;
                onlineLocationCaptured = acct.Consent_URL_Address__c != null && acct.Consent_URL_Address__c != '' ? true : false;
                onlineDeviceCaptured = acct.Consent_URL_Device_Info__c != null && acct.Consent_URL_Device_Info__c != '' ? true : false;
                mogoAddress = acct.MOGO_Captured_Address__c == null ? '' : acct.MOGO_Captured_Address__c;
                mygovAddress = acct.myGov_Captured_Address__c == null ? '' : acct.myGov_Captured_Address__c;
                followUpRepMobile = acct.Territory_Number__r.Account_Enquiry_Mobile__c == null ? acct.Territory_Number__r.Lead_Phone__c : acct.Territory_Number__r.Account_Enquiry_Mobile__c;
                stateMasterState = acct.State_Master_State__c;
                Integer ageVal = null;
                if(acct.BirthDate__c!=null)
                {
                    dobVal = Datetime.newinstance( acct.BirthDate__c.year(), acct.BirthDate__c.month(),acct.BirthDate__c.day()).format('dd/MM/yyyy');
                    Integer ageDays = acct.BirthDate__c.daysBetween(Date.Today());
                    ageVal = Integer.valueOf(ageDays/365);
                }
                if(acct.Mygov_DOB__c!=null)
                {
                    dobVal = Datetime.newinstance( acct.Mygov_DOB__c.year(), acct.Mygov_DOB__c.month(),acct.Mygov_DOB__c.day()).format('dd/MM/yyyy');
                    Integer ageDays = acct.Mygov_DOB__c.daysBetween(Date.Today());
                    ageVal = Integer.valueOf(ageDays/365);
                }
                resetLinkId = acct.Is_PhotoId_Attached_After_Enquiry__c;
                resetLinkBank = acct.Bank_Final_Page__c;
                resetLinkMygov = acct.MyGov_Final_Page__c;
                resetLinkBasic = acct.Basic_Info_Online__c;
                resetLinkIncome = acct.Income_Online__c;
                resetLinkExpense = acct.Expense_Online__c;
                resetLinkReferees = acct.Referees_Online__c;
                resetLinkRO = acct.RO_Online__c;
                resetLinkEquifax = acct.Equifax_Online__c;
                resetLinkProduct = false;
                
                /////////////////////For IncomeExpenseSummaryPage Only
                if(Test.isRunningTest() || Apexpages.currentPage().getURL().containsIgnoreCase('R4KIncomeExpenseSummaryOnline') || Apexpages.currentPage().getURL().containsIgnoreCase('R4KOnlineForm'))
                {
                    rentExp = acct.Rent_Mortgage_Board__c!=null ? acct.Rent_Mortgage_Board__c : 0;
                    loanExp = acct.Loan_Payments__c!=null ? acct.Loan_Payments__c : 0;
                    creditcardExp = acct.Credit_Card__c!=null ? acct.Credit_Card__c : 0;
                    insuranceExp = acct.Insurance__c!=null ? acct.Insurance__c : 0;
                    foodExp = acct.Food__c!=null ? acct.Food__c : 0;
                    utilitiesExp = acct.Utilities__c!=null ? acct.Utilities__c : 0;
                    transportExp = acct.Car_Lease_Loan_Payment__c!=null ? acct.Car_Lease_Loan_Payment__c : 0;
                    mobileExp = acct.Mobile_Expenses__c!=null ? acct.Mobile_Expenses__c : 0;
                    clothingExp = acct.Clothing__c!=null ? acct.Clothing__c : 0;
                    entertainmentExp = acct.Tobacco_Alcohol__c!=null ? acct.Tobacco_Alcohol__c : 0;
                    otherRentalExp = acct.Other_Rental_Companies__c!=null ? acct.Other_Rental_Companies__c : 0;
                    r4KPayment = acct.Rent4Keeps_Payment_C__c!=null ? acct.Rent4Keeps_Payment_C__c : 0;
                    otherExp = acct.OtherOutgoings__c!=null ? acct.OtherOutgoings__c : 0;
                    totalExp = rentExp + loanExp + creditcardExp + creditcardExp + insuranceExp + foodExp + utilitiesExp + transportExp + mobileExp + clothingExp + entertainmentExp + otherRentalExp + otherExp + (resetLinkProduct ? r4KPayment : 0);
                    
                    centrelink1Inc = acct.Centrelink_Benefit_Amount__c!=null ? acct.Centrelink_Benefit_Amount__c : 0;
                    centrelink2Inc = acct.Centrelink_Benefit2_Amount__c!=null ? acct.Centrelink_Benefit2_Amount__c : 0;
                    centrelink3Inc = acct.Centrelink_Benefit3_Amount__c!=null ? acct.Centrelink_Benefit3_Amount__c : 0;
                    centrelink4Inc = acct.Other_Centrelink_Benefit_Amount__c!=null ? acct.Other_Centrelink_Benefit_Amount__c : 0;
                    employmentInc = acct.Employment_Income__c!=null ? acct.Employment_Income__c : 0;
                    otherInc = acct.Other_Income_Amount__c!=null ? acct.Other_Income_Amount__c : 0;
                    totalInc = centrelink1Inc + centrelink2Inc + centrelink3Inc + centrelink4Inc + employmentInc + otherInc;
                    
                    surplusValue = totalInc - totalExp;
                    serviceability = (totalInc == null || totalInc <= 0 ? 0 : (surplusValue/totalInc).setScale(2));
                    
                    centrelink1IncBenefit = acct.Centrelink_Benefit__c;
                    centrelink2IncBenefit = acct.Centrelink_Benefit2__c;
                    centrelink3IncBenefit = acct.Centrelink_Benefit3__c;
                    centrelink4IncBenefit = acct.Other_Centrelink_Benefit__c;
                    
                    getExpenseDropDown(null,(stateMasterState == 'NZ' ? 'NZ' : 'AU'));
                    
                    isSharedRentExpConfirmed=true;
                    isSharedLoanExpConfirmed=true;
                    isSharedCreditcardExpConfirmed=true;
                    isSharedInsuranceExpConfirmed=true;
                    isSharedFoodExpConfirmed=true;
                    isSharedUtilitiesExpConfirmed=true;
                    isSharedTransportExpConfirmed=true;
                    isSharedMobileExpConfirmed=true;
                    isSharedClothingExpConfirmed=true;
                    isSharedEntertainmentExpConfirmed=true;
                    isSharedOtherRentalExpConfirmed=true;
                    isSharedOtherExpConfirmed=true;
                    
                    List<String> sharedExpensesSentLst = acct.Shared_Expenses_Sent__c!=null? acct.Shared_Expenses_Sent__c.split(';') : new List<String>();
                    List<String> sharedExpensesConfirmedLst = acct.Shared_Expenses_Confirmed__c!=null? acct.Shared_Expenses_Confirmed__c.split(';') : new List<String>();
                    system.debug('sharedExpensesSentLst: '+sharedExpensesSentLst+' --expenseSent: '+acct.Shared_Expenses_Sent__c);
                    mapSharedExpenseLst = new Map<String,Boolean>();
                    
                    if(sharedExpensesSentLst.size()>0)
                    {
                        for(String sl : sharedExpensesSentLst)
                        {
                            if(mapSharedExpenseLst.get(sl)==null)
                                mapSharedExpenseLst.put(sl,false);
                        }
                        
                        if(sharedExpensesConfirmedLst.size()>0)
                        {
                            for(String cl : sharedExpensesConfirmedLst)
                            {
                                if(mapSharedExpenseLst.containskey(cl))
                                    mapSharedExpenseLst.put(cl,true);

                            }
                        }
                        
                        system.debug('mapSharedExpenseLst: '+mapSharedExpenseLst);
                        
                        List<String> expensewhichIsNotConfirmed = new List<String>();
                        if(!mapSharedExpenseLst.isEmpty())
                        {
                            for(String expense : mapSharedExpenseLst.keyset())
                            {
                                if(!mapSharedExpenseLst.get(expense))
                                    expensewhichIsNotConfirmed.add(expense);
                            }
                        }
                        
                        expenseGroups = getExpenseGroupings(expensewhichIsNotConfirmed);
                        system.debug('expenseGroups: '+expenseGroups);
                        if(expenseGroups.size()>0)
                        {
                            for(String expGrp : expenseGroups)
                            {
                                if(expGrp=='Rent')
                                    isSharedRentExpConfirmed=false;
                                if(expGrp=='Loan')
                                    isSharedLoanExpConfirmed=false;
                                if(expGrp=='Credit Card')
                                    isSharedCreditcardExpConfirmed=false;
                                if(expGrp=='Insurance')
                                    isSharedInsuranceExpConfirmed=false;
                                if(expGrp=='Household')
                                    isSharedFoodExpConfirmed=false;
                                if(expGrp=='Utilities')
                                    isSharedUtilitiesExpConfirmed=false;
                                if(expGrp=='Transport')
                                    isSharedTransportExpConfirmed=false;
                                if(expGrp=='Mobile')
                                    isSharedMobileExpConfirmed=false;
                                if(expGrp=='Clothing')
                                    isSharedClothingExpConfirmed=false;
                                if(expGrp=='Entertainment')
                                    isSharedEntertainmentExpConfirmed=false;
                                if(expGrp=='Other Rental')
                                    isSharedOtherRentalExpConfirmed=false;
                                if(expGrp=='Other Expense')
                                    isSharedOtherExpConfirmed=false;
                            }
                        }
                    }
                    
                    if(expDropdownLst.size()>0)
                    {
                        expDropdownDictLst = '[';
                        for(ExpenseDropdown__c p : expDropdownLst)
                        {
                            expDropdownDictLst= expDropdownDictLst +'{'+' \"Type\" : '+  '\"'+p.Type__c+'\",'+ ' \"IsExpenseZero\" : '+p.IsExpenseZero__c+ ', \"Value\" : ' + '\"'+p.Value__c+  '\"},';
                        }
                        expDropdownDictLst = expDropdownDictLst.removeEnd(',');
                        expDropdownDictLst = expDropdownDictLst.remove('\'');
                        expDropdownDictLst = expDropdownDictLst+ ']';
                        expDropdownDictLst= expDropdownDictLst.replace('\\', '\\\\');
                    }
                    system.debug('expDropdownDictLst: '+expDropdownDictLst);
                }
                /////////////////////////////////////////////////////////////////////////////
                
                clinkBenefitsJSON = '';
                List<Centrepay__c> cpayList = [SELECT Id,Amount__c,Benefit_Type__c,Company_Name__c,Deduction_Type__c,Account__c,Account__r.Territory_Company_Name__c,Category__c,Applicant_Name__c,
                                                Income__c,Next_Payment_Date__c,Expense_Type__c FROM Centrepay__c WHERE Account__c =: acctId AND CreatedDate = LAST_N_DAYS:21 ORDER BY Income__c DESC];
                List<String> uniqueCpayStrings = new List<String>();
                List<CentrepayWrapper> cWrapList = new List<CentrepayWrapper>();
                clinkBenefitMap = new Map<String,Decimal>();
                mygovLoan = 0;
                mygovRent = 0;
                mygovUtilities = 0;
                mogoR4KRental = 0;
                mygovOtherCentrepayDeductions = 0;
                if(cpayList.size() > 0)
                {
                    for(Integer c=0; c<cpayList.size(); c++)
                    {
                        if(cpayList[c].Expense_Type__c <> null && cpayList[c].Expense_Type__c == 'Rental Companies' && cpayList[c].Benefit_Type__c <> null && cpayList[c].Benefit_Type__c <> '' && (cpayList[c].Company_Name__c == null || cpayList[c].Company_Name__c == '' || cpayList[c].Company_Name__c.length() < 10 || !cpayList[c].Company_Name__c.substring(0,10).equalsIgnoreCase(cpayList[c].Account__r.Territory_Company_Name__c.substring(0,10))))
                        {
                            mogoOtherRental = mogoOtherRental + (cpayList[c].Amount__c == null ? 0 : cpayList[c].Amount__c); 
                        }
                        else if(cpayList[c].Expense_Type__c <> null && cpayList[c].Expense_Type__c == 'Rental Companies' && cpayList[c].Benefit_Type__c <> null && cpayList[c].Benefit_Type__c <> '' && !(cpayList[c].Company_Name__c == null || cpayList[c].Company_Name__c == '' || cpayList[c].Company_Name__c.length() < 10 || !cpayList[c].Company_Name__c.substring(0,10).equalsIgnoreCase(cpayList[c].Account__r.Territory_Company_Name__c.substring(0,10))))
                        {
                            mogoR4KRental = mogoR4KRental + (cpayList[c].Amount__c == null ? 0 : cpayList[c].Amount__c); 
                        }
                        else if(cpayList[c].Expense_Type__c <> null && cpayList[c].Expense_Type__c == 'Loans' && cpayList[c].Benefit_Type__c <> null && cpayList[c].Benefit_Type__c <> '')
                        {
                            mygovLoan = mygovLoan + (cpayList[c].Amount__c == null ? 0 : cpayList[c].Amount__c); 
                        }
                        else if(cpayList[c].Expense_Type__c <> null && cpayList[c].Expense_Type__c == 'Rent/Housing' && cpayList[c].Benefit_Type__c <> null && cpayList[c].Benefit_Type__c <> '')
                        {
                            mygovRent = mygovRent + (cpayList[c].Amount__c == null ? 0 : cpayList[c].Amount__c); 
                        }
                        else if(cpayList[c].Expense_Type__c <> null && cpayList[c].Expense_Type__c == 'Utilities' && cpayList[c].Benefit_Type__c <> null && cpayList[c].Benefit_Type__c <> '')
                        {
                            mygovUtilities = mygovUtilities + (cpayList[c].Amount__c == null ? 0 : cpayList[c].Amount__c); 
                        }
                        else
                        {
                            mygovOtherCentrepayDeductions = mygovOtherCentrepayDeductions + (cpayList[c].Amount__c == null ? 0 : cpayList[c].Amount__c);
                        }
                        
                        if(cpayList[c].Benefit_Type__c <> null && cpayList[c].Benefit_Type__c != '' && cWrapList.size() < 4 && !uniqueCpayStrings.contains(cpayList[c].Benefit_Type__c))
                        {
                            CentrepayWrapper cw = new CentrepayWrapper();
                            cw.name = cpayList[c].Benefit_Type__c;
                            cw.income = cpayList[c].Income__c == null ? 0 : cpayList[c].Income__c;
                            cWrapList.add(cw);
                            clinkBenefitMap.put(cw.name,cw.income);
                            uniqueCpayStrings.add(cpayList[c].Benefit_Type__c);
                        }
                    }
                    clinkBenefitsJSON = JSON.serialize(cWrapList);
                    
                    system.debug('mogoOtherRental: '+mogoOtherRental+' mogoR4KRental: '+mogoR4KRental+' mygovOtherCentrepayDeductions: '+mygovOtherCentrepayDeductions);
                    
                    //Get the First name and last name from myGov
                    if(cpayList[0].Applicant_Name__c!=null && cpayList[0].Applicant_Name__c!='')
                    {
                        String myGovName = cpayList[0].Applicant_Name__c;
                        String fgname = myGovName.substringBeforeLast(' ');
                        String namePrefix = '';
                        if(fgname!=null && fgname.startsWithIgnoreCase('MRS'))
                            namePrefix='MRS';
                        else if(fgname!=null && fgname.startsWithIgnoreCase('MISS'))
                            namePrefix='MISS';
                        else if(fgname!=null && fgname.startsWithIgnoreCase('MR'))
                            namePrefix='MR';
                        fgname = fgname!=null ? fgname.removeStartIgnoreCase(namePrefix).trim() : '';
                        String lgname = myGovName.substringAfterLast(' ');
                        system.debug(fgname+'-----------'+lgname);
                        if(acct.Basic_Info_Online__c==null || !acct.Basic_Info_Online__c)
                        {
                            firstNameVal = fgname;
                            lastNameVal = lgname;
                        }    
                    }
                    
                }
                
                mogoRent = mogoRent + mygovRent;
                mogoUtilities = mogoUtilities + mygovUtilities;
                mogoLoan = mogoLoan + mygovLoan;
                
                mogoRent = (mogoRent == null || mogoRent < 10 ? 0 : mogoRent);
                mogoHousehold = (mogoHousehold == null || mogoHousehold < 10 ? 0 : mogoHousehold);
                mogoClothing = (mogoClothing == null || mogoClothing < 10 ? 0 : mogoClothing);
                mogoUtilities = (mogoUtilities == null || mogoUtilities < 10 ? 0 : mogoUtilities);
                mogoTransport = (mogoTransport == null || mogoTransport < 10 ? 0 : mogoTransport);
                mogoMobile = (mogoMobile == null || mogoMobile < 10 ? 0 : mogoMobile);
                mogoCredit = (mogoCredit == null || mogoCredit < 10 ? 0 : mogoCredit);
                mogoLoan = (mogoLoan == null || mogoLoan < 10 ? 0 : mogoLoan);
                mogoInsurance = (mogoInsurance == null || mogoInsurance < 10 ? 0 : mogoInsurance);
                mogoAlcohol = (mogoAlcohol == null || mogoAlcohol < 10 ? 0 : mogoAlcohol);
                mogoOtherRental = (mogoOtherRental == null || mogoOtherRental < 10 ? 0 : mogoOtherRental);
                mogoOther = (mogoOther == null || mogoOther < 10 ? 0 : mogoOther);
                
                if(idTypeValOther!=null && idTypeValOther!='')
                {
                    idTypeValOther = idTypeValOther.replace('\r\n', ' ');
                    idTypeValOther = idTypeValOther.replace('\n', ' ');
                    idTypeValOther = idTypeValOther.replace('\r', ' ');
                }
                driverLicenceVal = acct.Identification_No__c;
                territoryState = acct.Territory_State__c;
                territoryId = acct.Territory_Number__c;
                //bankNameVal = acct.MOGO_Bank_Institution_Selected__c;
                hasProvidedConsentVal = acct.Equifax_SMS_Consent_Received__c;
                hasAddedPhotoId = acct.Is_PhotoId_Attached_After_Enquiry__c;
                urlBankSt = acct.Hybrid_URL_BankStatement__c;
                urlMyGov = acct.Hybrid_URL_MyGov__c;
                hasCompletedMyGov = acct.MyGov_Final_Page__c;
                hasCompletedBankSt = acct.Bank_Final_Page__c;
                linkOpenedAddress = acct.Consent_URL_Address__c;
                ishybridLinkCompleted = acct.Hybrid_Link_Finish_Datetime__c!=null ? true : false;
                if(acct.Active_Agreements__c > 0)
                {
                    totalRefereesRequired = (acct.Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c == null ? 1 : acct.Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c.intValue());
                    totalRefereesBeingFamMemberRequired = (acct.Credit_Guideline__r.EasyExisting_no_of_Referees_being_family__c == null ? 1 : acct.Credit_Guideline__r.EasyExisting_no_of_Referees_being_family__c.intValue());
                }else
                {
                    totalRefereesRequired = (acct.Credit_Guideline__r.Easy_Total_No_of_Referees__c == null ? 2 : acct.Credit_Guideline__r.Easy_Total_No_of_Referees__c.intValue());
                    totalRefereesBeingFamMemberRequired = (acct.Credit_Guideline__r.Easy_no_of_Referees_being_family_Member__c == null ? 1 : acct.Credit_Guideline__r.Easy_no_of_Referees_being_family_Member__c.intValue());
                }
                System.debug('****totalRefereesRequired ' + totalRefereesRequired);
                System.debug('****totalRefereesBeingFamMemberRequired ' + totalRefereesBeingFamMemberRequired);
                additionalComments = acct.Enquiry_Notes__c;
                
                String incomeFirstParam = mogoEmployment!=null && mogoEmployment>0 ? 'employmentag' :'empincag';
                String expenseFirstParam = externalTransferTransactionCount > 0 ? 'extTrans' : 'expsum';
                Datetime equifaxEnquiryDatetime = acct.Equifax_Enquiry_Datetime__c;
                Boolean isAValidEquifax = (equifaxEnquiryDatetime!=null && equifaxEnquiryDatetime >= Datetime.now().addDays(-21) && acct.Equifax_Age_of_File__c!=null && acct.Equifax_Age_of_File__c!='0 months') ? true : false;
                System.debug('****nextOnlineStepParam ' + nextOnlineStepParam);
                nextOnlineStepParam = !acct.Equifax_SMS_Consent_Received__c ? 'cguide' : !acct.RO_Online__c ? 'rando' : !hasAddedPhotoId ? 'reqdoc' : !hasCompletedBankSt ? 'sdbsa' : !hasCompletedMyGov ? (stateMasterState == 'NZ' ? 'sdwz' : 'sdmg') : acct.Customer_Photo_Id__c == null ? 'sdcpa' : !acct.Basic_Info_Online__c ? 'bi' : !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                System.debug('****nextOnlineStepParam ' + nextOnlineStepParam);

                if(redo=='yes')
                {
                    furtherNextOnlineStepParam = nextOnlineStepParam;
                    if(nextOnlineStepParam=='cguide')
                        furtherNextOnlineStepParam = !acct.RO_Online__c ? 'rando' : !hasAddedPhotoId ? 'reqdoc' : !hasCompletedBankSt ? 'sdbsa' : !hasCompletedMyGov ? (stateMasterState == 'NZ' ? 'sdwz' : 'sdmg') : acct.Customer_Photo_Id__c == null ? 'sdcpa' : !acct.Basic_Info_Online__c ? 'bi' : !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam=='rando')
                        furtherNextOnlineStepParam = !hasAddedPhotoId ? 'reqdoc' : !hasCompletedBankSt ? 'sdbsa' : !hasCompletedMyGov ? (stateMasterState == 'NZ' ? 'sdwz' : 'sdmg') : acct.Customer_Photo_Id__c == null ? 'sdcpa' : !acct.Basic_Info_Online__c ? 'bi' : !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam=='reqdoc')
                        furtherNextOnlineStepParam = !hasCompletedBankSt ? 'sdbsa' : !hasCompletedMyGov ? (stateMasterState == 'NZ' ? 'sdwz' : 'sdmg') : acct.Customer_Photo_Id__c == null ? 'sdcpa' : !acct.Basic_Info_Online__c ? 'bi' : !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam=='sdbsa')
                        furtherNextOnlineStepParam = !hasCompletedMyGov ? (stateMasterState == 'NZ' ? 'sdwz' : 'sdmg') : acct.Customer_Photo_Id__c == null ? 'sdcpa' : !acct.Basic_Info_Online__c ? 'bi' : !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam=='sdmg' || nextOnlineStepParam=='sdwz')
                        furtherNextOnlineStepParam = acct.Customer_Photo_Id__c == null ? 'sdcpa' : !acct.Basic_Info_Online__c ? 'bi' : !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam=='sdcpa')
                        furtherNextOnlineStepParam = !acct.Basic_Info_Online__c ? 'bi' : !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam=='bi')
                        furtherNextOnlineStepParam = !acct.Income_Online__c ? incomeFirstParam : !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam==incomeFirstParam)
                        furtherNextOnlineStepParam = !acct.Expense_Online__c ? expenseFirstParam : (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else if(nextOnlineStepParam==expenseFirstParam)
                        furtherNextOnlineStepParam = (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                    else 
                        furtherNextOnlineStepParam = (acct.PUA_Status__c == 'In Progress' || acct.PUA_Status__c == 'Attention Required' ? 'sursum' : (acct.PUA_Status__c == 'Approved' ? (isHybridLinkCompleted ? 'completed' : 'approved') : 'declined'));
                }
                system.debug('##nextOnlineStepParam: '+nextOnlineStepParam+' furtherNextOnlineStepParam: '+furtherNextOnlineStepParam);
                
                //Equifax related
                Date startDate=Date.today().addDays(-365);
                if(equifaxEnquiryDatetime!=null && equifaxEnquiryDatetime >= Datetime.now().addDays(-21) && acct.Equifax_Age_of_File__c!=null && acct.Equifax_Age_of_File__c!='0 months')
                {
                    equifaxValid = true;
                    noofequifaxEnquiries = acct.No_of_Equifax_Enquiries_Last_6_Month__c!=null ? Integer.valueOf(acct.No_of_Equifax_Enquiries_Last_6_Month__c) : 0;
                    //noofequifaxRentalDefaults = acct.Equifax_No_of_Unpaid_Default_Rental__c!=null ? Integer.valueOf(acct.Equifax_No_of_Unpaid_Default_Rental__c) : 0;
                    //noofequifaxNonRentalDefaults = acct.Equifax_No_of_Unpaid_Default_NonRental__c!=null ? Integer.valueOf(acct.Equifax_No_of_Unpaid_Default_NonRental__c) : 0;
                    
                    equifaxRentalDefaults=[select id,name,Company_Type__c,Company_Name__c,Unpaid_Default_Date__c,Amount__c,Status__c,Default_Notes__c,Match__c from Equifax_Defaults__c where Applicant__c=:acctId and Company_Type__c = 'Rental' order by Unpaid_Default_Date__c desc];
                    noofequifaxRentalDefaults = equifaxRentalDefaults.size();
                    equifaxNonRentalDefaults=[select id,name,Company_Type__c,Company_Name__c,Unpaid_Default_Date__c,Amount__c,Status__c,Default_Notes__c,Match__c from Equifax_Defaults__c where Applicant__c=:acctId and Company_Type__c = 'Non-Rental' and Unpaid_Default_Date__c>=:startDate order by Unpaid_Default_Date__c desc];
                    noofequifaxNonRentalDefaults = equifaxNonRentalDefaults.size();
                    
                    //equifaxEnquiriesExplanation = acct.Explanation_for_Recent_Enquiries__c;
                    
                    if(acct.Explanation_for_All_Other_Defaults__c!=null && acct.Explanation_for_All_Other_Defaults__c!='')
                    {
                        equifaxRentalDefaultsExplanation = acct.Explanation_for_All_Other_Defaults__c.substringBetween('##Rental - ','##NonRental - ');
                        if(equifaxRentalDefaultsExplanation==null || equifaxRentalDefaultsExplanation=='')
                            equifaxRentalDefaultsExplanation = acct.Explanation_for_All_Other_Defaults__c.substringAfter('##Rental - ');
                        equifaxNonRentalDefaultsExplanation = acct.Explanation_for_All_Other_Defaults__c.substringAfter('##NonRental - ');
                    }
                    
                    enquiryLst = new List<EnquiryWrap>();
                    String enquiriesStr=acct.Enquiries_in_the_last_6_months__c == null ? '' : acct.Enquiries_in_the_last_6_months__c; 
                    if(enquiriesStr.trim() != ''){
                        for(Integer i=0;i<enquiriesStr.split('\n').size();i++){
                            EnquiryWrap enq = new EnquiryWrap();
                            enq.dateVal = enquiriesStr.split('\n')[i].split(' -- ').size() > 0 ? enquiriesStr.split('\n')[i].split(' -- ')[0] : 'NA';
                            enq.name = enquiriesStr.split('\n')[i].split(' -- ').size() > 1 ? enquiriesStr.split('\n')[i].split(' -- ')[1] : 'NA';
                            String enqAmount = enquiriesStr.split('\n')[i].split(' -- ').size() > 2 ? enquiriesStr.split('\n')[i].split(' -- ')[2] : '0';
                            if(enqAmount!=null && enqAmount!='')
                            {
                                try{
                                enq.Amount = Decimal.valueOf(enqAmount.trim());
                                }catch(Exception ex){
                                    enq.Amount = 0;
                                    system.debug('##TypeException: '+ex);
                                }
                            }
                            enquiryLst.add(enq);
                        }
                    }
                    system.debug('enquiryLst: '+enquiryLst.size());
                }
                //////////////////////////
                
                AggregateResult[] totalRefereesCount = [select count(id) total from Referee__c where Applicant__c =:acctId and (CreatedDate=TODAY or Referee_Added_Datetime__c=LAST_N_days:2)];
                noOfRefereesAdded = (Integer)totalRefereesCount[0].get('total');
                
                AggregateResult[] totalRefereesFamCount = [select count(id) total from Referee__c where Applicant__c =:acctId and Relationship__c in ('Family Member') and (CreatedDate=TODAY or Referee_Added_Datetime__c=LAST_N_days:2)];
                noOfRefereesFamAdded = (Integer)totalRefereesFamCount[0].get('total');
                
                prevRefContactList = [select id,Name,Referee_Name__c,Referee_Name__r.Name,Referee_Name__r.MobilePhone,Relationship__c from Referee__c where Applicant__c =:acctId and Contacted__c='Yes' and Contacted_On_Date__c<>null and (Referee_Added_Datetime__c<>LAST_N_days:2)];
                
                addedRefereesList = [select id,Name,Referee_Name__c,Referee_Name__r.Name,Referee_Name__r.MobilePhone,Relationship__c,Contacted__c,Contacted_Date_Time__c,Contacted_On_Date__c,Confirmed_Willing_Referee__c from Referee__c where Applicant__c =:acctId and (CreatedDate=TODAY or Referee_Added_Datetime__c=LAST_N_days:2)];
                allRefMobileNos = new List<String>();
                if(addedRefereesList.size()>0)
                {
                    for(Referee__c ref: addedRefereesList)
                    {
                        if(ref.Referee_Name__r.MobilePhone!=null && ref.Referee_Name__r.MobilePhone!='')
                            allRefMobileNos.add(ref.Referee_Name__r.MobilePhone);
                    }
                    allRefMobileNosStr = JSON.serialize(allRefMobileNos);
                    system.debug('##allRefMobileNos: '+allRefMobileNos+' allRefMobileNosStr: '+allRefMobileNosStr);
                }
                else
                    allRefMobileNosStr='[]';
                if(noOfRefereesFamAdded >= totalRefereesBeingFamMemberRequired && noOfRefereesAdded >= totalRefereesRequired)
                {
                    allRefereesAdded = true;
                }
                
                if(currentprevRefId!=null && currentprevRefId!='')
                 {
                        List<Referee__c> prevRefList = [select id,Name,Referee_Name__c,Referee_Name__r.Name,Referee_Name__r.MobilePhone,Relationship__c from Referee__c where Applicant__c =:acctId and id=: currentprevRefId];
                        if(prevRefList.size()>0)
                        {
                            cprfNameVal = prevRefList[0].Referee_Name__r.Name;
                            cprfRelationVal = prevRefList[0].Relationship__c;
                            addRfMobNo = prevRefList[0].Referee_Name__r.MobilePhone;
                        }
                 }
                
                List<Attachment> attsPhoto = [select id,Name from Attachment where parentId=:acct.id and Name like 'Photo Id%' and CreatedDate = LAST_N_days:21 order by CreatedDate desc Limit 4];
                if(attsPhoto.size()>0)
                {
                    for(Attachment at : attsPhoto)
                    {
                        if(at.Name.contains('Photo Id Back'))
                            photoAttBackId = at.Id;
                        else if(at.Name.contains('Photo Id') && !at.Name.contains('Back'))
                            photoAttId = at.Id;
                    }
                }
                
                if(acct.Customer_Photo_Id__c != null){
                    List<Document> attsCustomerPhoto = [select id,Name from Document where id=:acct.Customer_Photo_Id__c and CreatedDate = LAST_N_days:21 Limit 1];
                    if(attsCustomerPhoto.size()>0)
                    {
                        custPhotoAtt = attsCustomerPhoto[0].Id;
                    }
                }
                
                countOtherAtts=0;
                attsOther = [select id,Name from Attachment where parentId=:acct.id and Name like 'Other File-%' and CreatedDate = LAST_N_days:21 Limit 10];
                if(attsOther.size()>0)
                {
                    countOtherAtts = attsOther.size();
                    otherAttId = attsOther[0].Id;
                }
                
                countWinzAtts=0;
                attsWinz = [select id,Name from Attachment where parentId=:acct.id and Name like 'Proof of Income-%' and CreatedDate = LAST_N_days:21 Limit 10];
                if(attsWinz.size()>0)
                {
                    countWinzAtts = attsWinz.size();
                    winzAttId = attsWinz[0].Id;
                }
                initNavBar(acct);
                
                hasAddedPhotoId = acct.Is_PhotoId_Attached_After_Enquiry__c;
                if(acct.Is_PhotoId_Attached_After_Enquiry__c){
                    photoIdFrontId = acct.Photo_Id_Front__c;
                    photoIdBackId = acct.Photo_Id_Back__c;
                    hasAddedPhotoIdBack = (acct.Photo_Id_Back__c == null ? false : true);
                }else{
                    photoIdFrontId = null;
                    photoIdBackId = null;
                    hasAddedPhotoIdBack = false;
                }
                
                if(ldId == null || ldId == ''){
                    List<Lead> tempLeadLst = [SELECT Id,Territory_Number__c,Territory_Number__r.State_Master_State__c,Application_Logs__c,Territory_State__c,
                                            Photo_Id_Details__c,OCR_Text__c,OCR_Back_Text__c,OCR_Address__c 
                                            FROM Lead WHERE Account__c =: acctId ORDER BY CreatedDate DESC LIMIT 1];
                    if(tempLeadLst.size() > 0){
                        latestLdId = tempLeadLst[0].Id;
                        getPhotoIdDetails(tempLeadLst[0]);
                    }
                }

                if(acct.Photo_Id_Front__c != null && Apexpages.currentPage().getParameters().get('param') != 'sdidb' && (Apexpages.currentPage().getParameters().get('param') == 'sdid' || nextOnlineStepParam == 'sdid'))
                {
                    sendOCRRequest(acct.Photo_Id_Front__c,latestLdId,'front');
                    idFirstName = acct.FirstName;
                    idLastName = acct.LastName;
                    ldMobile = acct.PersonMobilePhone;
                    ldEmail = acct.PersonEmail;
                    ldCRN = acct.Centrepay_Ref_No__c;
                }
                
                if(acct.Photo_Id_Back__c != null && Apexpages.currentPage().getParameters().get('param') == 'sdidb')
                {
                    sendOCRRequest(acct.Photo_Id_Back__c,latestLdId,'back');
                }
            }
            
            Schema.DescribeFieldResult fieldResult;
            if(stateMasterState == 'NZ')
            {
                fieldResult = Account.Centrelink_Benefit__c.getDescribe();
            }else
            {
                fieldResult = Account.Signed_Benefit_1__c.getDescribe();
            }
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            for( Schema.PicklistEntry pickListVal : ple){
                clinkBenefitOptions.add(pickListVal.getLabel());
            }
            getExternalTransferStats();
        }
        else
            acctId = null;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','getFormDetails',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public List<String> getTerritoriesWithAccess(String leadOwnerId)
{
    List<String> allterritoriesIds = new List<String>();
    List<String> territoryIdsWithRecordAccess = new List<String>();
    List<Territory__c> allterritories = [SELECT Id, Name, Company_Territory__c,OwnerId FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') AND Is_Credit_Contract__c = true LIMIT 200];
    for(Territory__c territory : allterritories){
        allterritoriesIds.add(territory.Id);
        if(String.valueOf(territory.OwnerId).substring(0,15).equals(String.valueOf(leadOwnerId).substring(0,15))){
            territoryIdsWithRecordAccess.add(territory.Id);
        }
    }
    
    System.debug(territoryIdsWithRecordAccess);
    return territoryIdsWithRecordAccess;
}

public void skipMygovStatement()
{
    Account accountToUp = new Account();
    accountToUp.Id = acctId;
    accountToUp.Mygov_Final_Page__c = true;
    accountToUp.Mygov_Payment_Details__c = 'Customer agreed that they do not receive any centrelink benefits.';
    accountToUp.Last_Online_Activity_DateTime__c = Datetime.now();
    update accountToUp;
}

public List<ExpenseDropdown__c> getExpenseDropdown(String type, String dropCountry)
{
    if(type!=null)
        expDropdownLst = [SELECT Id,Type__c,Value__c,IsExpenseZero__c FROM ExpenseDropdown__c where Type__c=: type AND Country__c = :dropCountry];
    else
        expDropdownLst = [SELECT Id,Type__c,Value__c,IsExpenseZero__c FROM ExpenseDropdown__c WHERE Country__c = :dropCountry];
    return expDropdownLst;
}

public Set<String> getExpenseGroupings(List<String> expenses)
{
    Set<String> expenseGroups = new Set<String>();
    if(expenses!=null && expenses.size()>0)
    {
        List<ExpenseGrouping__c> expenseGroupLst = [SELECT Id,Name,Expense__c,Group__c FROM ExpenseGrouping__c where Expense__c in: expenses];
        if(expenseGroupLst.size()>0)
        {
            for(ExpenseGrouping__c gp: expenseGroupLst)
                expenseGroups.add(gp.Group__c);
        }
        
        for(String ex: expenses)
            expenseGroups.add(ex);
    }
    
    return expenseGroups;
}

public void getPhotoIdDetails(Lead photoIdLead)
{
    photoIdDetails = (photoIdLead.Photo_Id_Details__c == null ? '' : (photoIdLead.Photo_Id_Details__c.containsIgnoreCase('Customer Entered :') ? photoIdLead.Photo_Id_Details__c.substringBefore('Customer Entered :') : photoIdLead.Photo_Id_Details__c));
    ocrText = (photoIdLead.OCR_Text__c == null ? '' : photoIdLead.OCR_Text__c);
    ocrBackText = (photoIdLead.OCR_Back_Text__c == null ? '' : photoIdLead.OCR_Back_Text__c);
    ocrAddress = (photoIdLead.OCR_Address__c == null ? '' : photoIdLead.OCR_Address__c);
    System.debug('##photoIdDetails ' + photoIdDetails);

    if(photoIdDetails != null && photoIdDetails != ''){
        List<String> ocrStrings = photoIdDetails.split('\n');
        for(String ocrStr : ocrStrings){
            if(ocrStr.containsIgnoreCase('FirstName -')){
                idFirstName = ocrStr.substringAfter('FirstName -').trim();
                idFirstName = (idFirstName == null || idFirstName.trim() == '' || idFirstName.trim() == 'null' ? null : idFirstName);    
            }else if(ocrStr.containsIgnoreCase('LastName -')){
                idLastName = ocrStr.substringAfter('LastName -').trim();   
                idLastName = (idLastName == null || idLastName.trim() == '' || idLastName.trim() == 'null' ? null : idLastName); 
            }else if(ocrStr.containsIgnoreCase('DOB -')){
                idDOB = ocrStr.substringAfter('DOB -').trim();    
                idDOB = (idDOB == null || idDOB.trim() == '' || idDOB.trim() == 'null' ? null : idDOB);
            }else if(ocrStr.containsIgnoreCase('Id Type -')){
                idType = ocrStr.substringAfter('Id Type -').trim();    
                idType = (idType == null || idType.trim() == '' || idType.trim() == 'null' ? null : idType);
            }else if(ocrStr.containsIgnoreCase('Id Number -')){
                idNumber = ocrStr.substringAfter('Id Number -').trim();  
                idNumber = (idNumber == null || idNumber.trim() == '' || idNumber.trim() == 'null' ? null : idNumber);  
            }
        }
    }
}

public void saveShortLinkOpenedDeviceDataForHybridLink()
{
    String id = acctId!=null && acctId!='' ? acctId : ldId;
    String objectVal = acctId!=null && acctId!='' ? 'Account' : 'Lead';
    
    String address=Apexpages.currentPage().getParameters().get('address');
    String lat=Apexpages.currentPage().getParameters().get('lat');
    String lng=Apexpages.currentPage().getParameters().get('lng');
    
    system.debug('id: '+id+ ' objectVal: '+objectVal);
    system.debug('##linkOpenedAddress: '+linkOpenedAddress+' ##linkOpenedLatitude: '+linkOpenedLatitude+' ##linkOpenedLongitude: '+linkOpenedLongitude+' ##device: '+linkOpenedDeviceBrand + ' | '+ linkOpenedDeviceName+ ' | '+ linkOpenedDeviceType+' | '+linkOpenedDeviceBrowser);
    try
    {
        if(id!=null && id!='' && objectVal=='Account')
        {
            Account acct = new Account();
            acct.Id = id;
            acct.Consent_URL_Opened_DateTime__c = Datetime.now();
            acct.Consent_URL_Address__c = linkOpenedAddress;
            acct.Consent_URL_Latitude__c = linkOpenedLatitude;
            acct.Consent_URL_Longitude__c = linkOpenedLongitude;
            acct.Consent_URL_Device_Info__c = linkOpenedDeviceBrand + ' | '+ linkOpenedDeviceName+ ' | '+ linkOpenedDeviceType+' | '+linkOpenedDeviceBrowser;
            update acct;
        }else if(id!=null && id!='' && objectVal=='Lead')
        {
            Lead ld = new Lead();
            ld.Id = id;
            ld.Hybrid_Link_Opened_Datetime__c = Datetime.now();
            ld.Hybrid_Link_Address__c = address;
            ld.Hybrid_Link_Latitude__c = lat;
            ld.Hybrid_Link_Longitude__c = lng;
            ld.Hybrid_Link_Device_Info__c = linkOpenedDeviceBrand + ' | '+ linkOpenedDeviceName+ ' | '+ linkOpenedDeviceType+' | '+linkOpenedDeviceBrowser;
            update ld;
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','saveShortLinkOpenedDeviceDataForHybridLink',id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void saveLocationInfo()
{
    String id = acctId!=null && acctId!='' ? acctId : ldId;
    String objectVal = acctId!=null && acctId!='' ? 'Account' : 'Lead';
    
    String address=Apexpages.currentPage().getParameters().get('addressVal');
    String lat=Apexpages.currentPage().getParameters().get('latVal');
    String lng=Apexpages.currentPage().getParameters().get('lngVal');
    
    try
    {
        if(id!=null && id!='' && objectVal=='Account')
        {
            Account acct = new Account();
            acct.Id = id;
            acct.Consent_URL_Opened_DateTime__c = Datetime.now();
            acct.Consent_URL_Address__c = address;
            acct.Consent_URL_Latitude__c = lat;
            acct.Consent_URL_Longitude__c = lng;
            update acct;
        }else if(id!=null && id!='' && objectVal=='Lead')
        {
            Lead ld = new Lead();
            ld.Id = id;
            ld.Hybrid_Link_Opened_Datetime__c = Datetime.now();
            ld.Hybrid_Link_Address__c = address;
            ld.Hybrid_Link_Latitude__c = lat;
            ld.Hybrid_Link_Longitude__c = lng;
            update ld;
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','saveLocationInfo',id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void saveDeviceInfo()
{
    String id = acctId!=null && acctId!='' ? acctId : ldId;
    String objectVal = acctId!=null && acctId!='' ? 'Account' : 'Lead';
    
    String linkOpenedDeviceBrand = Apexpages.currentPage().getParameters().get('linkOpenedDeviceBrand');
    String linkOpenedDeviceName = Apexpages.currentPage().getParameters().get('linkOpenedDeviceName');
    String linkOpenedDeviceType = Apexpages.currentPage().getParameters().get('linkOpenedDeviceType');
    String linkOpenedDeviceBrowser = Apexpages.currentPage().getParameters().get('linkOpenedDeviceBrowser');
    
    try
    {
        if(id!=null && id!='' && objectVal=='Account')
        {
            Account acct = new Account();
            acct.Id = id;
            acct.Consent_URL_Device_Info__c = linkOpenedDeviceBrand + ' | '+ linkOpenedDeviceName+ ' | '+ linkOpenedDeviceType+' | '+linkOpenedDeviceBrowser;
            update acct;
        }else if(id!=null && id!='' && objectVal=='Lead')
        {
            Lead ld = new Lead();
            ld.Id = id;
            ld.Hybrid_Link_Device_Info__c = linkOpenedDeviceBrand + ' | '+ linkOpenedDeviceName+ ' | '+ linkOpenedDeviceType+' | '+linkOpenedDeviceBrowser;
            update ld;
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','saveDeviceInfo',id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void sendOTP()
{
    try
    {
        String otpCode = SecretUtil.generateRandomNumber();
        String smsTemplate = 'Please enter the R4K code ' + otpCode + ' so that you can view your account. Do not share it with others.';
        
        if(isTimeout)
        {
            Lead ldUp = new Lead();
            ldUp.Id = lead.Id;
            ldUp.OTP_Code__c = otpCode;
            update ldUp;
            
            List <smagicinteract__smsmagic__c> smsObjectList = new List <smagicinteract__smsmagic__c>();
            String senderId = (lead.Territory_Number__r.Is_Credit_Contract__c ? 'r4k' : 'rent4keeps');
            if(acct.SMS_Mobile__c != null && acct.SMS_Mobile__c != ''){
                smagicinteract__smsMagic__c smsObject = new smagicinteract__smsMagic__c();
                smsObject.smagicinteract__SenderId__c = senderId;
                smsObject.smagicinteract__Name__c = 'AccEnquiryCustomerAuth'; // records name
                smsObject.smagicinteract__Lead__c = lead.Id;
                smsObject.OwnerId = lead.OwnerId;
                smsObject.smagicinteract__ObjectType__c = 'Lead'; // record type
                smsObject.smagicinteract__disableSMSOnTrigger__c = 0; // this field either be 0 or 1, if you specify the value as 1 then sms will not get send but entry of sms will get create under SMS History object
                smsObject.smagicinteract__external_field__c = smagicinteract.ApexAPI.generateUniqueKey();
                smsObject.smagicinteract__PhoneNumber__c = acct.SMS_Mobile__c;
                smsObject.smagicinteract__SMSText__c = smsTemplate;
                smsObjectList.add(smsObject);
                String response = smagicinteract.ApexAPI.pushSMSCallout(smsObjectList);
                Database.insert(smsObjectList,false);
            }
            system.debug('smsObjectList: '+smsObjectList.size());
            if(smsObjectList.size()>0 && smsObjectList[0].Id != null){
                smagicinteract__smsmagic__c obj = new smagicinteract__smsmagic__c();
                obj.Id= smsObjectList[0].Id;
                obj.smagicinteract__SMSText__c = smsObjectList[0].smagicinteract__SMSText__c!=null ? smsObjectList[0].smagicinteract__SMSText__c.replace(otpCode,'*****') : null;
                update obj;
            }
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','sendOTP',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public PageReference authenticateOTPCode()
{
    try
    {
        String otpCode=Apexpages.currentPage().getParameters().get('otpCode');
        //String nextParam=Apexpages.currentPage().getParameters().get('nextParam');
        system.debug('otpCode: '+otpCode);

        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KAccountEnquiry?ld='+ldId+'&param=otp&err=yes'+'&n='+randomNumber;
        if(lead!=null && otpCode!=null && lead.OTP_Code__c==otpCode && lead.MobilePhone!=null)
        {
            Lead ldUp = new Lead();
            ldUp.Id = lead.Id;
            ldUp.OTP_Code_Auth_Datetime__c = Datetime.now();
            update ldUp; 
            
            finalUrl = onlineURL+'/R4KAccountEnquiry?ld='+ldId+'&param=smp'+'&n='+randomNumber;
            closeWeCareCasesOnSummary();
        }
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','authenticateOTPCode',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void closeWeCareCasesOnSummary()
{
    try
    {
        String accountEnquiryRecordTypeId = Util.getRecordTypeInfosByDeveloperName('Case').get('We_Care').Id;
        List<Case> upcsList = new List<Case>();
        List<Case> csList = [SELECT Id,Description,Status FROM Case WHERE AccountId =: lead.Account__c AND Status <> 'Closed' AND RecordTypeId =: accountEnquiryRecordTypeId];    
        for(Integer c=0;c<csList.size();c++)
        {
            Case cs = new Case();
            cs.Id = csList[c].Id;
            cs.Status = 'Closed';
            cs.Reason_For_Closing__c = 'Account Enquiry';
            upcsList.add(cs);
        }
        update upcsList;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','closeWeCareCasesOnSummary',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

/*
public List<String> checkAutoDecline(Account probableAccount){
    List<String> autoDeclineReasons = new List<String>{'false','',''};
    try{
        String reasonForAutoDecline = '';
        String autoDecline = 'false';
        String centrelinkBenefit = probableAccount.Centrelink_Benefit__c!=null ? probableAccount.Centrelink_Benefit__c: 'None';
        String centrelinkBenefitAmt = probableAccount.Centrelink_Benefit__c!=null ? '$'+String.valueOf(probableAccount.Centrelink_Benefit_Amount__c) : '$0';
        String probableAccountSummary = probableAccount.Name + ' -- ' + probableAccount.Territory_Short_Name__c + '\n'
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
                                            + 'Serviceability -- ' + (probableAccount.Serviceability__c == null ? 0 : probableAccount.Serviceability__c) + '%\n'
                                            ;
        
        if(probableAccount.No_of_Active_Agreements__c > 0){
            List<Opportunity> pastOppList = [SELECT Id,TaxInvoice_Signed_DateTime__c,Remaining_Amount__c,
                                                Total_COGS_Less_AAF__c,Total_Paid_Amount__c,
                                                (Select Id,Name,Product_Type__c From OpportunityLineItems) FROM Opportunity WHERE AccountId =: probableAccount.Id AND StageName = 'Goods Delivered' AND RecordType.Name <> 'Trak SIM' AND TaxInvoice_Signed_DateTime__c <> null ORDER BY TaxInvoice_Signed_DateTime__c DESC];
            Decimal totalCOGSForActive = 0;
            Decimal totalPaidForActive = 0;
            Decimal totalRAForActive = 0;
            Integer noOfMobileAgmts = 0;
            for(Opportunity opp : pastOppList) 
            {
                if(opp.Total_COGS_Less_AAF__c!=null && opp.Total_COGS_Less_AAF__c>0)
                    totalCOGSForActive=totalCOGSForActive+opp.Total_COGS_Less_AAF__c;
                if(opp.Total_Paid_Amount__c!=null && opp.Total_Paid_Amount__c>0)
                    totalPaidForActive=totalPaidForActive+opp.Total_Paid_Amount__c;
                if(opp.Remaining_Amount__c!=null && opp.Remaining_Amount__c>0)
                    totalRAForActive=totalRAForActive+opp.Remaining_Amount__c;
                for(OpportunityLineItem objOli: opp.OpportunityLineItems) 
                {
                    if(objOli.Product_Type__c == 'Phones')
                    {
                        noOfMobileAgmts++;
                        break;
                    }
                }
            }
            totalCOGSForActive = totalCOGSForActive.setScale(2);
            totalPaidForActive = totalPaidForActive.setScale(2);
            totalRAForActive = totalRAForActive.setScale(2);
            System.debug('totalCOGSForActive ' + totalCOGSForActive + ' totalPaidForActive ' + totalPaidForActive + ' totalRAForActive ' + totalRAForActive + ' noOfMobileAgmts ' + noOfMobileAgmts);
                                                
            if(centrelinkBenefit != null && (centrelinkBenefit.containsIgnoreCase('Newstart Allowance') || centrelinkBenefit.containsIgnoreCase('Youth Allowance') || centrelinkBenefit.containsIgnoreCase('JobSeeker')))
            {
                System.debug('****');
                if((pastOppList.size() >= 1 && pastOppList[0].TaxInvoice_Signed_DateTime__c.date().daysBetween(Date.today()) < 90))
                {
                    reasonForAutoDecline += 'Time b/w two agreements - ' + pastOppList[0].TaxInvoice_Signed_DateTime__c.date().daysBetween(Date.today()) + '/90 days' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(pastOppList.size() > 2)
                {
                    reasonForAutoDecline += 'Max. no. of Active agreements - ' + pastOppList.size() + '/2' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(noOfMobileAgmts > 2)
                {
                    reasonForAutoDecline += 'Max. no. of mobile agreements - ' + noOfMobileAgmts + '/2' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(totalRAForActive > 5000)
                {
                    reasonForAutoDecline += 'Max. RA per Applicant - $' + totalRAForActive + '/$5000' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if((totalCOGSForActive * 1.25) - totalPaidForActive > 0)
                {
                    reasonForAutoDecline += 'Break-even Shortfall - $' + totalPaidForActive + '/$' + (totalCOGSForActive * 1.25).setScale(2) + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(probableAccount.Last_Collection_Activity__c != null && probableAccount.Last_Collection_Activity__r.Collection_Outcome1__c != 'Success')
                {
                    reasonForAutoDecline += 'Collection Activity - ' + probableAccount.Last_Collection_Activity__r.Name + ' ' + probableAccount.Last_Collection_Activity__r.Collection_Outcome1__c;
                    autoDecline = 'true';
                    System.debug('****');
                }          
            }else
            {
                if((pastOppList.size() >= 1 && pastOppList[0].TaxInvoice_Signed_DateTime__c.date().daysBetween(Date.today()) < 60))
                {
                    reasonForAutoDecline += 'Time b/w two agreements - ' + pastOppList[0].TaxInvoice_Signed_DateTime__c.date().daysBetween(Date.today()) + '/60 days' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(pastOppList.size() > 3)
                {
                    reasonForAutoDecline += 'Max. no. of Active agreements - ' + pastOppList.size() + '/3' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(noOfMobileAgmts > 2)
                {
                    reasonForAutoDecline += 'Max. no. of mobile agreements - ' + noOfMobileAgmts + '/2' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(totalRAForActive > 15000)
                {
                    reasonForAutoDecline += 'Max. RA per Applicant - $' + totalRAForActive + '/$15000' + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(totalCOGSForActive - totalPaidForActive > 0)
                {
                    reasonForAutoDecline += 'Break-even Shortfall - $' + totalPaidForActive + '/$' + totalCOGSForActive + '\n';
                    autoDecline = 'true';
                    System.debug('****');
                }
                if(probableAccount.Last_Collection_Activity__c != null && probableAccount.Last_Collection_Activity__r.Collection_Outcome1__c != 'Success')
                {
                    reasonForAutoDecline += 'Collection Activity - ' + probableAccount.Last_Collection_Activity__r.Name + ' ' + probableAccount.Last_Collection_Activity__r.Collection_Outcome1__c;
                    autoDecline = 'true';
                    System.debug('****');
                } 
            }
        }
        autoDeclineReasons = new List<String>{autoDecline,reasonForAutoDecline,probableAccountSummary};
        return autoDeclineReasons;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','checkAutoDecline',probableAccount.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return autoDeclineReasons;    
    }
}
*/

public PageReference convertToApplicantStageTwo()
{
    try
    {
        String ldCRN=Apexpages.currentPage().getParameters().get('ldCRN2');
        String ldMobile=Apexpages.currentPage().getParameters().get('ldMobile2');
        String ldEmail=Apexpages.currentPage().getParameters().get('ldEmail2');
        String ldDob=Apexpages.currentPage().getParameters().get('ldDob2');
        String isOnline=Apexpages.currentPage().getParameters().get('isOnline2');
        
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KOnlineApplicationForm?ld='+ldId+'&n='+randomNumber;
        if(isOnline=='yes')
            finalUrl = onlineURL+'/R4KOnlineForm?ld='+ldId+'&n='+randomNumber;
        
        List<Account> accts = new List<Account>();
        system.debug('ldDob2: '+ldDob+' ldMobile2: '+ldMobile+' ldCRN2: '+ldCRN+' ldEmail2: '+ldEmail +' ldId2: '+ldId);
        
        List<String> territoryIdsWithRecordAccess = getTerritoriesWithAccess(lead.OwnerId);
        
        String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,Is_IDR__c, ' + 
                    'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Territory_Number__r.Short_Name__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Name,Last_Collection_Activity__r.Collection_Outcome1__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c, '+
                    'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                    'Territory_Short_Name__c,No_of_Active_Agreements__c,Serviceability__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,Agreement_Completed_Date__c,Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Remaining_Amount_Active_Agreements__c,Latest_Agreement_Created_Date__c,' +
                    'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name,Rent4Keeps_Account__c '+
                    'from Account where LastName!=null AND Territory_Number__c IN: territoryIdsWithRecordAccess AND Territory_Number__r.Is_Credit_Contract__c = true ';
        
        String searchquery = originalquery;
        if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && ldEmail!=null && ldEmail!='')
        {
            searchquery = originalquery;
            searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonMobilePhone =\''+ ldMobile +'\' AND PersonEmail =\''+ ldEmail+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && ldDob!=null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonMobilePhone =\''+ ldMobile+'\' AND BirthDate__c ='+ ldDob+')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldCRN != null && ldCRN!='' && ldEmail!=null && ldEmail!='' && ldDob!=null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonEmail =\''+ ldEmail+'\' AND BirthDate__c ='+ ldDob+')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldMobile != null && ldMobile!='' && ldEmail!=null && ldEmail!='' && ldDob!=null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (PersonMobilePhone =\''+ldMobile+'\' AND PersonEmail =\''+ ldEmail+'\' AND BirthDate__c ='+ ldDob+')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        
        //if(appType=='new')
        //{   
            //If present convert the lead to existing applicant in stage 2
            if(accts.size()>0)
            {
                Lead ldToUp = new Lead();
                ldToUp.Id  = ldId;
                ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
                ldToUp.Probable_Account__c = accts[0].Id;
                
                if(accts[0].Enquiry_Status__c == 'Deceased' || accts[0].Enquiry_Status__c == 'Incarcerated' || accts[0].Enquiry_Status__c == 'DND - Do Not Deal' || accts[0].Is_IDR__c){
                    ldToUp.Description = (('\n Applicant Status : ') + (accts[0].Is_IDR__c ? 'IDR' : (accts[0].Enquiry_Status__c == 'Incarcerated' ? 'Incarcerated' : (accts[0].Enquiry_Status__c == 'DND - Do Not Deal' ? 'DND - Do Not Deal' : (accts[0].Enquiry_Status__c == 'Deceased' ? 'Deceased' : '')))));
                    ldToUp.Automation_Outcome__c = 'Unlock';
                    update ldToUp;
                    
                    return new PageReference(finalUrl).setRedirect(true);
                }else{
                    /*List<String> reasonsForAutoDecline = checkAutoDecline(accts[0]);
                    if(reasonsForAutoDecline != null && reasonsForAutoDecline.size() > 2){
                        ldToUp.Auto_Decline__c = (reasonsForAutoDecline[0] == 'true' ? true : false);
                        ldToUp.Reason_For_Auto_Decline__c = reasonsForAutoDecline[1]; 
                        ldToUp.Probable_Account_Summary__c = reasonsForAutoDecline[2];    
                    }*/
                    
                    if(lead!=null && lead.Description!=null && lead.Description!='')
                        ldToUp.Description = '\n System Info - Stage 2 search Customer selected new applicant and based on the details provided found a corresponding applicant in stage 2 search '+accts[0].name+' in the system.';
                    else
                        ldToUp.Description = 'System Info - Stage 2 search Customer selected new applicant and based on the details provided found a corresponding applicant in stage 2 search '+accts[0].name+' in the system.';
                    update ldToUp;    
                    system.debug('leadS2: '+lead + ' accts[0].IdS2: '+accts[0].Id);
                    convertLead(lead, accts[0]);
                }
            }else
            {
                //If not Present convert the lead into new applicant and continue the process
                Lead ldToUp = new Lead();
                ldToUp.Id  = ldId;
                ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
                if(lead!=null && lead.Description!=null && lead.Description!='')
                    ldToUp.Description = '\n System Info - Stage 2 search Customer selected new applicant and based on the details of stage 2 search has not found an existing applicant. Stop the search. Please followup. #ldCRN: '+ldCRN+' #ldMobile: '+ldMobile+' #ldEmail: '+ldEmail+' #ldDob: '+ldDob;
                else
                    ldToUp.Description = 'System Info - Stage 2 search Customer selected new applicant and based on the details of stage 2 search has not found an existing applicant. Stop the search. Please followup. #ldCRN: '+ldCRN+' #ldMobile: '+ldMobile+' #ldEmail: '+ldEmail+' #ldDob: '+ldDob;
                update ldToUp;
                //convertLead(lead, null);
            }
        //}
        
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','convertToApplicantStageTwo',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference updateIdentityDetails()
{
    try
    {
        String appMobile=Apexpages.currentPage().getParameters().get('appMobile');
        String appDob=Apexpages.currentPage().getParameters().get('appDob');
        String appIdTypVal = Apexpages.currentPage().getParameters().get('appIdTypVal');
        String appIdNumberVal = Apexpages.currentPage().getParameters().get('appIdNumberVal');
        String appEmail = Apexpages.currentPage().getParameters().get('appEmail');
        
        Account acctToUp = new Account();
        acctToUp.Id = acctId;
        acctToUp.Last_Online_Activity_DateTime__c = Datetime.now();
        acctToUp.PersonMobilePhone = appMobile;
        if(appDob != null && appDob != ''){
            acctToUp.Birthdate__c = Date.valueOf(appDob);
        }
        acctToUp.Identification_Type__c = appIdTypVal;
        acctToUp.Identification_No__c = appIdNumberVal;
        if(appEmail != null && appEmail != ''){
            acctToUp.PersonEmail = appEmail;
        }
        update acctToUp;
        
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber;
        if(redo=='yes')
            finalUrl = onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&redo='+redo;
        
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateIdentityDetails',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
} 

public PageReference convertToApplicant()
{
    try
    {
        String ldCRN=Apexpages.currentPage().getParameters().get('ldCRN');
        String ldMobile=Apexpages.currentPage().getParameters().get('ldMobile');
        String ldEmail=Apexpages.currentPage().getParameters().get('ldEmail');
        String ldDob=Apexpages.currentPage().getParameters().get('ldDob');
        String isOnline=Apexpages.currentPage().getParameters().get('isOnline');
        String idFirstNameParam = Apexpages.currentPage().getParameters().get('idFirstName');
        String idLastNameParam = Apexpages.currentPage().getParameters().get('idLastName');
        String idTypVal = Apexpages.currentPage().getParameters().get('idTypVal');
        String idNumberVal = Apexpages.currentPage().getParameters().get('idNumberVal');
        
        Boolean isFollowUpRequiredVal = false;
        Boolean canbeDirectlyConverted = false;
        List<Account> accts = new List<Account>();
        List<Account> acctMobLst = new List<Account>();
        String searchDescription = '\nSearch Parameters \n' + 'CRN - ' + (ldCRN == null ? '' : ldCRN) + ', ' + 'Mobile - ' + (ldMobile == null ? '' : ldMobile) + ', ' + 'Email - ' + (ldEmail == null ? '' : ldEmail) + ', ' + 'DOB - ' + (ldDob == null ? '' : ldDob) + ', ' + 'LastName - ' + (idLastNameParam == null ? '' : idLastNameParam) + '\n';
        system.debug(' ldDob: '+ldDob+' ldMobile: '+ldMobile+' ldCRN: '+ldCRN+' ldEmail: '+ldEmail +' ldId: '+ldId +' isOnline: '+isOnline +' idLastNameParam: '+idLastNameParam);
        
        String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,Is_IDR__c, ' + 
                    'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Territory_Number__r.Short_Name__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Name,Last_Collection_Activity__r.Collection_Outcome1__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c, '+
                    'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                    'Territory_Short_Name__c,No_of_Active_Agreements__c,Serviceability__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,Agreement_Completed_Date__c,Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Remaining_Amount_Active_Agreements__c,Latest_Agreement_Created_Date__c,'+
                    'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name,Rent4Keeps_Account__c '+
                    'from Account where LastName!=null AND Territory_Number__r.Name = \'1000\' AND Territory_Number__r.Is_Credit_Contract__c = true ';
        
        String searchquery = originalquery;
        
        if(ldMobile!=null && ldMobile!='' && ldDob != null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (BirthDate__c ='+ldDob+' AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldMobile!=null && ldMobile!='' && ldDob != null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and No_of_Agreements__c = 0 AND (BirthDate__c = null AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldCRN != null && ldCRN!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(idLastNameParam!=null && idLastNameParam!='' && ldDob != null && ldDob!='' && ldCRN != null && ldCRN!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' AND Centrepay_Ref_No__c = null AND WINZ_No__c = null AND (BirthDate__c ='+ldDob+' AND LastName =\''+ idLastNameParam+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(idLastNameParam!=null && idLastNameParam!='' && ldEmail!=null && ldEmail!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and No_of_Agreements__c = 0 AND (BirthDate__c = null AND PersonEmail =\''+ldEmail+'\' AND LastName =\''+ idLastNameParam+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(idLastNameParam!=null && idLastNameParam!='' && ldDob != null && ldDob!='' && (ldCRN == null || ldCRN == '') && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' AND (BirthDate__c ='+ldDob+' AND LastName =\''+ idLastNameParam+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
                
        Lead ldToUp = new Lead();
        ldToUp.Id  = ldId;
        ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
        ldToUp.OCR_Text__c = ocrText;
        ldToUp.Photo_Id_Details__c = photoIdDetails;
        String ocr_firstName = '';
        String ocr_lastName = '';
        String ocr_dob = '';
        String ocr_idType = '';
        String ocr_idNumber = '';
        String id_cust_entered = '';
        String ldDOBFormatted = '';
        if(ldDOB != null && ldDOB != '' && ldDOB.split('-').size() == 3){
            ldDOBFormatted = (ldDOB.split('-')[2] + '/' + ldDOB.split('-')[1] + '/' + ldDOB.split('-')[0]);    
        }
        
        if(photoIdDetails != null && photoIdDetails != ''){
            List<String> ocrStrings = photoIdDetails.split('\n');
            for(String ocrStr : ocrStrings){
                if(ocrStr.containsIgnoreCase('FirstName -')){
                    ocr_firstName = ocrStr.substringAfter('FirstName -').trim();    
                }else if(ocrStr.containsIgnoreCase('LastName -')){
                    ocr_lastName = ocrStr.substringAfter('LastName -').trim();    
                }else if(ocrStr.containsIgnoreCase('DOB -')){
                    ocr_dob = ocrStr.substringAfter('DOB -').trim();    
                }else if(ocrStr.containsIgnoreCase('Id Type -')){
                    ocr_idType = ocrStr.substringAfter('Id Type -').trim();    
                }else if(ocrStr.containsIgnoreCase('Id Number -')){
                    ocr_idNumber = ocrStr.substringAfter('Id Number -').trim();    
                }
            }
        }
        if(ocr_lastName != idLastNameParam){
            id_cust_entered += ('LastName - ' + idLastNameParam + '\n');
        }
        if(ocr_dob == null || ocr_dob != ldDOBFormatted){
            id_cust_entered += ('DOB - ' + ldDob + '\n');
        }
        if(ocr_idType != idTypVal){
            id_cust_entered += ('Id Type - ' + idTypVal + '\n');
        }
        if(ocr_idNumber != idNumberVal){
            id_cust_entered += ('Id Number - ' + idNumberVal + '\n');
        }
        if(id_cust_entered != null && id_cust_entered != ''){
            ldToUp.Photo_Id_Details__c = ((photoIdDetails == null ? '' : photoIdDetails) + ('\n\nCustomer Entered : ' + '\n\n') + id_cust_entered);
        }
        
        String idVerMsg = 'Verification failed as ';
        if(ocrText != null && !ocrText.containsIgnoreCase(idLastNameParam)){
            idVerMsg += 'LastName, ';
        }
        /*
        if(!ocrText.containsIgnoreCase(ldDOBFormatted)){
            idVerMsg += 'DOB, ';
        }
        */
        if(ocrText != null && !ocrText.containsIgnoreCase(idNumberVal)){
            idVerMsg += 'Id Number, ';
        }
        if(idVerMsg != 'Verification failed as '){
            idVerMsg += ' were not present in the OCR Text.';
        }else{
            idVerMsg = 'Verification successful.';
        }
        ldToUp.Photo_Id_Details__c = (ldToUp.Photo_Id_Details__c + '\n' + idVerMsg);
        Boolean activeCustomer = false;
        if(accts.size() > 0)
        {
            searchDescription += ('Found matching applicant - ' + accts[0].Customer_No__c + '.');
            ldToUp.Description = searchDescription;
            
            if(accts[0].Enquiry_Status__c == 'Deceased' || accts[0].Enquiry_Status__c == 'Incarcerated' || accts[0].Enquiry_Status__c == 'DND - Do Not Deal' || accts[0].Is_IDR__c){
                ldToUp.Description += (('\n Applicant Status : ') + (accts[0].Is_IDR__c ? 'IDR' : (accts[0].Enquiry_Status__c == 'Incarcerated' ? 'Incarcerated' : (accts[0].Enquiry_Status__c == 'DND - Do Not Deal' ? 'DND - Do Not Deal' : (accts[0].Enquiry_Status__c == 'Deceased' ? 'Deceased' : '')))));
                ldToUp.Automation_Outcome__c = 'Unlock';
                update ldToUp;
            }else{
                Boolean recordaccess = true;
                
                System.debug('********recordaccess ' + recordaccess);
                System.debug('********leadOwnerId ' + lead.OwnerId);
                System.debug('********acctId ' + accts[0].Id);
                System.debug('********shortname ' + accts[0].Territory_Number__r.Short_Name__c);
                
                if(recordaccess || accts[0].No_of_Agreements__c == 0)
                {
                    ldToUp.Probable_Account__c = accts[0].Id;
                
                    /*List<String> reasonsForAutoDecline = checkAutoDecline(accts[0]);
                    if(reasonsForAutoDecline != null && reasonsForAutoDecline.size() > 2){
                        ldToUp.Auto_Decline__c = (reasonsForAutoDecline[0] == 'true' ? true : false);
                        ldToUp.Reason_For_Auto_Decline__c = reasonsForAutoDecline[1]; 
                        ldToUp.Probable_Account_Summary__c = reasonsForAutoDecline[2];    
                    }*/
                    update ldToUp;
                    convertLeadOnline(lead, accts[0], idFirstNameParam, idLastNameParam, ldDob, idTypVal, idNumberVal, ldEmail, ldMobile, ldCRN);
                    
                    if(accts[0].No_of_Active_Agreements__c > 0)
                    {
                        activeCustomer = true;
                    }
                }else
                {
                    Boolean isDefault = false;
                    Boolean isSCI = false;
                    Boolean isSecondApplicant = false;
                    Boolean dormantCanConvert = false;
                    Integer activeOppCount = 0;
                    Integer writtenOffCount = Integer.valueOf(accts[0].WrittenOff_s_Count__c);
                    List<Opportunity> oppList = [SELECT Id, Name, Default_Letter_Sent_Date__c, SCI_sent_date__c, StageName FROM Opportunity WHERE AccountId =: accts[0].Id];
                    
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
                        if(opp.StageName == 'Goods Delivered')
                        {
                            activeOppCount++;
                        }
                    }
                    
                    List<Opportunity> secondApplicantOppList = [SELECT Id FROM Opportunity WHERE Applicant2__c =: accts[0].Id AND StageName = 'Goods Delivered'];
                    isSecondApplicant = (secondApplicantOppList.size() > 0 ? true : false);
            
                    if(activeOppCount == 0 && !isDefault && !isSCI && !isSecondApplicant && (accts[0].Last_Agreement_Close_Date__c == null || accts[0].Last_Agreement_Close_Date__c <= Date.today().addDays(-270)) && writtenOffCount == 0 && accts[0].RecordType.Name.containsIgnoreCase('Dormant'))
                    {
                        dormantCanConvert = true;
                    }
                    
                    if(dormantCanConvert)
                    {
                        ldToUp.Probable_Account__c = accts[0].Id;
                
                        /*List<String> reasonsForAutoDecline = checkAutoDecline(accts[0]);
                        if(reasonsForAutoDecline != null && reasonsForAutoDecline.size() > 2){
                            ldToUp.Auto_Decline__c = (reasonsForAutoDecline[0] == 'true' ? true : false);
                            ldToUp.Reason_For_Auto_Decline__c = reasonsForAutoDecline[1]; 
                            ldToUp.Probable_Account_Summary__c = reasonsForAutoDecline[2];    
                        }*/
                    }else
                    {
                        ldToUp.Description = 'System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system but it belongs to a different territory. Stop the search. Please followup.' + searchDescription;
                        ldToUp.Applicant_Status__c = 'Buyout';
                        ldToUp.Applicant_Status_Logs__c = 'convertToApplicant';
                    }
                    
                    update ldToUp;
                    
                    if(dormantCanConvert)
                    {
                        convertLeadOnline(lead, accts[0], idFirstNameParam, idLastNameParam, ldDob, idTypVal, idNumberVal, ldEmail, ldMobile, ldCRN);
                    }
                }
            }
        }else
        {
            searchDescription += 'No Matching Applicant.';
            ldToUp.Description = searchDescription;
            update ldToUp;
            convertLeadOnline(lead, null, idFirstNameParam, idLastNameParam, ldDob, idTypVal, idNumberVal, ldEmail, ldMobile, ldCRN);
        }
        
        String shortURL = '';
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KOnlineForm?ld='+ldId+'&redo=yes&n='+randomNumber;
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','convertToApplicant',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference convertToApplicantHybrid()
{
    try
    {
        String appType=Apexpages.currentPage().getParameters().get('clientSideAppType');
        String ldCRN=Apexpages.currentPage().getParameters().get('ldCRN');
        String ldMobile=Apexpages.currentPage().getParameters().get('ldMobile');
        String ldEmail=Apexpages.currentPage().getParameters().get('ldEmail');
        String ldDob=Apexpages.currentPage().getParameters().get('ldDob');
        String isOnline=Apexpages.currentPage().getParameters().get('isOnline');
        String ldName = Apexpages.currentPage().getParameters().get('ldName');
        
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KOnlineApplicationForm?ld='+ldId+'&n='+randomNumber;
        
        Boolean isFollowUpRequiredVal = false;
        Boolean canbeDirectlyConverted = false;
        List<Account> accts = new List<Account>();
        List<Account> acctMobLst = new List<Account>();
        String searchDescription = '\nSearch Parameters \n' + 'CRN - ' + (ldCRN == null ? '' : ldCRN) + ', ' + 'Mobile - ' + (ldMobile == null ? '' : ldMobile) + ', ' + 'Email - ' + (ldEmail == null ? '' : ldEmail) + ', ' + 'DOB - ' + (ldDob == null ? '' : ldDob) + ', ' + 'LastName - ' + (ldName == null ? '' : ldName) + '\n';
        system.debug('appType: '+appType+' ldDob: '+ldDob+' ldMobile: '+ldMobile+' ldCRN: '+ldCRN+' ldEmail: '+ldEmail +' ldId: '+ldId +' isOnline: '+isOnline +' ldName: '+ldName);
        
        List<String> territoryIdsWithRecordAccess = getTerritoriesWithAccess(lead.OwnerId);
        
        String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,Is_IDR__c, ' + 
                    'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Territory_Number__r.Short_Name__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Name,Last_Collection_Activity__r.Collection_Outcome1__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c, '+
                    'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                    'Territory_Short_Name__c,No_of_Active_Agreements__c,Serviceability__c,Reason_why_application_did_not_go_ahead__c,Total_Paid_Amount__c,Agreement_Completed_Date__c,Actual_Arrears__c,Total_Agreement_Amount_Active_Only__c,Remaining_Amount_Active_Agreements__c,Latest_Agreement_Created_Date__c,'+
                    'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name,Rent4Keeps_Account__c '+
                    'from Account where LastName!=null AND Territory_Number__c IN: territoryIdsWithRecordAccess AND Territory_Number__r.Is_Credit_Contract__c = true ';
        
        String searchquery = originalquery;
        
        if(ldMobile!=null && ldMobile!='' && ldDob != null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (BirthDate__c ='+ldDob+' AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldMobile!=null && ldMobile!='' && ldDob != null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and No_of_Agreements__c = 0 AND (BirthDate__c = null AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldCRN != null && ldCRN!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldName!=null && ldName!='' && ldDob != null && ldDob!='' && ldCRN != null && ldCRN!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' AND Centrepay_Ref_No__c = null AND WINZ_No__c = null AND (BirthDate__c ='+ldDob+' AND LastName =\''+ ldName+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldName!=null && ldName!='' && ldEmail!=null && ldEmail!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and No_of_Agreements__c = 0 AND (BirthDate__c = null AND PersonEmail =\''+ldEmail+'\' AND LastName =\''+ ldName+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldName!=null && ldName!='' && ldDob != null && ldDob!='' && (ldCRN == null || ldCRN == '') && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' AND (BirthDate__c ='+ldDob+' AND LastName =\''+ ldName+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
    
        if(accts.size() > 0)
        {
            searchDescription += 'Found matching applicant - ' + accts[0].Customer_No__c + '.';
            if(accts[0].Enquiry_Status__c == 'Deceased' || accts[0].Enquiry_Status__c == 'Incarcerated' || accts[0].Enquiry_Status__c == 'DND - Do Not Deal' || accts[0].Is_IDR__c){
                searchDescription += (('\n Applicant Status : ') + (accts[0].Is_IDR__c ? 'IDR' : (accts[0].Enquiry_Status__c == 'Incarcerated' ? 'Incarcerated' : (accts[0].Enquiry_Status__c == 'DND - Do Not Deal' ? 'DND - Do Not Deal' : (accts[0].Enquiry_Status__c == 'Deceased' ? 'Deceased' : '')))));
                
                Lead ldToUp = new Lead();
                ldToUp.Id  = ldId;
                ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
                ldToUp.Description = searchDescription;
                ldToUp.Automation_Outcome__c = 'Unlock';
                update ldToUp;
                
                return new PageReference(finalUrl).setRedirect(true);
            }
        }else
        {
            searchDescription += 'No Matching Applicant.';
        }
        
        if(appType=='existing')
        {
            //If not present donot convert the lead and park in the lead list and contact manually
            if(accts.size()==0)
            {
                Lead ldToUp = new Lead();
                ldToUp.Id  = ldId;
                ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
                if(lead!=null && lead.Description!=null && lead.Description!='')
                    ldToUp.Description = lead.Description + '\n System Info - Customer selected existing applicant and based on the details provided did not map to the existing applicant. Creating new applicant. Please followup.';
                else
                    ldToUp.Description = 'System Info - Customer selected existing applicant and based on the details provided did not map to the existing applicant. Creating new applicant. Please followup.';
                ldToUp.Description = ldToUp.Description + searchDescription;
                update ldToUp;
                convertLead(lead, null);
            }
            else
            {
                //If Present convert the lead into existing applicant and continue the process
                system.debug('lead: '+lead + ' accts[0].Id: '+accts[0].Id);
                //convertLead(lead, accts[0]);
                
                //check recordaccess
                //Lead ld = [SELECT Id,OwnerId FROM Lead WHERE Id =: ldId LIMIT 1];
                //List<UserRecordAccess> leadOwnerAccess = [SELECT RecordId,HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: ld.OwnerId AND RecordId =: accts[0].Id];
                //Boolean recordaccess = leadOwnerAccess.size() > 0 ? leadOwnerAccess[0].HasReadAccess : false;
                
                Lead ldToUp = new Lead();
                ldToUp.Id  = ldId;
                ldToUp.Probable_Account__c = accts[0].Id;
                
                /*List<String> reasonsForAutoDecline = checkAutoDecline(accts[0]);
                if(reasonsForAutoDecline != null && reasonsForAutoDecline.size() > 2){
                    ldToUp.Auto_Decline__c = (reasonsForAutoDecline[0] == 'true' ? true : false);
                    ldToUp.Reason_For_Auto_Decline__c = reasonsForAutoDecline[1]; 
                    ldToUp.Probable_Account_Summary__c = reasonsForAutoDecline[2];    
                }*/
                
                Boolean recordaccess = true;
                
                System.debug('********recordaccess ' + recordaccess);
                System.debug('********leadOwnerId ' + lead.OwnerId);
                System.debug('********acctId ' + accts[0].Id);
                System.debug('********shortname ' + accts[0].Territory_Number__r.Short_Name__c);
                
                if(!recordaccess && accts[0].No_of_Agreements__c>0)
                {
                    ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
                    if(lead!=null && lead.Description!=null && lead.Description!='')
                        ldToUp.Description = '\n System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system but it belongs to a different territory with existing agreement. Stop the search. Please followup.';
                    else
                        ldToUp.Description = 'System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system but it belongs to a different territory with existing agreement. Stop the search. Please followup.';
                    ldToUp.Description = ldToUp.Description + searchDescription;
                    update ldToUp;
                                    
                    Boolean isDefault = false;
                    Boolean isSCI = false;
                    Boolean isSecondApplicant = false;
                    Boolean dormantCanConvert = false;
                    Integer activeOppCount = 0;
                    Integer writtenOffCount = Integer.valueOf(accts[0].WrittenOff_s_Count__c);
                    List<Opportunity> oppList = [SELECT Id, Name, Default_Letter_Sent_Date__c, SCI_sent_date__c, StageName FROM Opportunity WHERE AccountId =: accts[0].Id];
                    
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
                        if(opp.StageName == 'Goods Delivered')
                        {
                            activeOppCount++;
                        }
                    }
                    
                    List<Opportunity> secondApplicantOppList = [SELECT Id FROM Opportunity WHERE Applicant2__c =: accts[0].Id AND StageName = 'Goods Delivered'];
                    isSecondApplicant = (secondApplicantOppList.size() > 0 ? true : false);
            
                    if(activeOppCount == 0 && !isDefault && !isSCI && !isSecondApplicant && (accts[0].Last_Agreement_Close_Date__c == null || accts[0].Last_Agreement_Close_Date__c <= Date.today().addDays(-270)) && writtenOffCount == 0 && accts[0].RecordType.Name.containsIgnoreCase('Dormant'))
                    {
                        dormantCanConvert = true;
                    }
                    
                    if(dormantCanConvert)
                    {
                        convertLead(lead, accts[0]);
                    }
                }
                else if(isFollowUpRequiredVal && accts[0].No_of_Agreements__c>0 && !canbeDirectlyConverted)
                {
                    system.debug('lead: '+lead + ' accts[0].Id: '+accts[0].Id);
                    if(lead!=null && lead.Description!=null && lead.Description!='')
                        ldToUp.Description = '\n System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number with existing agreement. Stop the search. Please followup.';
                    else
                        ldToUp.Description = 'System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number with existing agreement. Stop the search. Please followup.';
                    ldToUp.Description = ldToUp.Description + searchDescription;
                    update ldToUp;
                }
                else if(isFollowUpRequiredVal && accts[0].No_of_Agreements__c==0 && !canbeDirectlyConverted)
                {
                    system.debug('lead: '+lead + ' accts[0].Id: '+accts[0].Id);
                    if(recordaccess)
                    {
                        if(lead!=null && lead.Description!=null && lead.Description!='')
                            ldToUp.Description = '\n System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number with no agreements from the same territory. Convert.';
                        else
                            ldToUp.Description = 'System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number with no agreements from the same territory. Convert.';
                        ldToUp.Description = ldToUp.Description + searchDescription;
                        update ldToUp;
                        convertLead(lead, accts[0]);
                    }
                    else
                    {
                        if(lead!=null && lead.Description!=null && lead.Description!='')
                            ldToUp.Description = '\n System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number with no agreements from the different buyout territory. Convert to new applicant.';
                        else
                            ldToUp.Description = 'System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number with no agreements from the different buyout territory. Convert to new applicant.';
                        ldToUp.Description = ldToUp.Description + searchDescription;
                        update ldToUp;
                        convertLead(lead, null);
                    }
                }
                else
                {
                    system.debug('lead: '+lead + ' accts[0].Id: '+accts[0].Id);
                    ldToUp.Description = searchDescription;
                    update ldToUp;
                    convertLead(lead, accts[0]);
                }
            }
        }
        else if(appType=='new')
        {   
            //If present donot convert the lead and park in the lead list and contact manually
            Lead ldToUp = new Lead();
            ldToUp.Id  = ldId;
            if(accts.size()>0)
            {
                ldToUp.Probable_Account__c = accts[0].Id;
                ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
                
                /*List<String> reasonsForAutoDecline = checkAutoDecline(accts[0]);
                if(reasonsForAutoDecline != null && reasonsForAutoDecline.size() > 2){
                    ldToUp.Auto_Decline__c = (reasonsForAutoDecline[0] == 'true' ? true : false);
                    ldToUp.Reason_For_Auto_Decline__c = reasonsForAutoDecline[1];  
                    ldToUp.Probable_Account_Summary__c = reasonsForAutoDecline[2];  
                }*/
                
                //check recordaccess
                //Lead ld = [SELECT Id,OwnerId FROM Lead WHERE Id =: ldId LIMIT 1];
                //List<UserRecordAccess> leadOwnerAccess = [SELECT RecordId,HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: ld.OwnerId AND RecordId =: accts[0].Id];
                //Boolean recordaccess = leadOwnerAccess.size() > 0 ? leadOwnerAccess[0].HasReadAccess : false;
                
                Boolean recordaccess = false;
                List<String> territoryShortNamesWithRecordAccess = new List<String>();
                List<Territory__c> allterritoriesWithAccess = [SELECT Id, Short_Name__c, OwnerId, Name FROM Territory__c WHERE OwnerId =: lead.OwnerId];
                for(Territory__c territory : allterritoriesWithAccess){
                    territoryShortNamesWithRecordAccess.add(territory.Short_Name__c);
                }
                System.debug('******territoryShortNamesWithRecordAccess ' + territoryShortNamesWithRecordAccess);
                if(territoryShortNamesWithRecordAccess.contains(accts[0].Territory_Number__r.Short_Name__c)){
                    recordaccess = true;
                }
                
                System.debug('********recordaccess ' + recordaccess);
                System.debug('********leadOwnerId ' + lead.OwnerId);
                System.debug('********acctId ' + accts[0].Id);
                System.debug('********shortname ' + accts[0].Territory_Number__r.Short_Name__c);
                
                if(canbeDirectlyConverted)
                {
                    ldToUp.Description = searchDescription;
                    update ldToUp;
                    convertLead(lead, accts[0]);
                }
                else if(!recordaccess)
                {
                    if(lead!=null && lead.Description!=null && lead.Description!='')
                        ldToUp.Description = '\n System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system but it belongs to a different territory. Stop the search. Please followup.';
                    else
                        ldToUp.Description = 'System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system but it belongs to a different territory. Stop the search. Please followup.';
                    ldToUp.Description = ldToUp.Description + searchDescription;
                    update ldToUp;
                }
                else if(isFollowUpRequiredVal)
                {
                    if(lead!=null && lead.Description!=null && lead.Description!='')
                        ldToUp.Description = '\n System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number. Stop the search. Please followup.';
                    else
                        ldToUp.Description = 'System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number. Stop the search. Please followup.';
                    ldToUp.Description = ldToUp.Description + searchDescription;
                    update ldToUp;
                }
                else
                {
                    if(lead!=null && lead.Description!=null && lead.Description!='')
                        ldToUp.Description = '\n System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system. Please followup.';
                    else
                        ldToUp.Description = 'System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system. Please followup.';
                    ldToUp.Description = ldToUp.Description + searchDescription;
                    update ldToUp;
                    convertLead(lead, accts[0]);
                }
            }else
            {
                //If not Present convert the lead into new applicant and continue the process
                ldToUp.Description = searchDescription;
                update ldToUp;
                convertLead(lead, null);
            }
        }
        
        if(stateMasterState != 'NZ'){
            finalUrl = onlineURL+'/R4KCreditGuide?ld='+ldId+'&n='+randomNumber;
        }
        
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','convertToApplicantHybrid',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference searchApplicantForRefereeEDM()
{
    try
    {
        String appType=Apexpages.currentPage().getParameters().get('clientSideAppType');
        String ldCRN=Apexpages.currentPage().getParameters().get('ldCRN');
        String ldMobile=Apexpages.currentPage().getParameters().get('ldMobile');
        String ldEmail=Apexpages.currentPage().getParameters().get('ldEmail');
        String ldDob=Apexpages.currentPage().getParameters().get('ldDob');
        String fname=Apexpages.currentPage().getParameters().get('fname');
        String lname=Apexpages.currentPage().getParameters().get('lname');
        String postcode=Apexpages.currentPage().getParameters().get('postcode');
        String country=Apexpages.currentPage().getParameters().get('country');
        
        Boolean isFollowUpRequiredVal = false;
        Boolean canbeDirectlyConverted = false;
        List<Account> accts = new List<Account>();
        List<Account> acctMobLst = new List<Account>();
        system.debug('appType: '+appType+' ldDob: '+ldDob+' ldMobile: '+ldMobile+' ldCRN: '+ldCRN+' ldEmail: '+ldEmail +' ldId: '+ldId);
        
        String originalquery = 'select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c, ' + 
                    'PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c, '+
                    'Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c, '+
                    'MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name '+
                    'from Account where LastName!=null AND Territory_Number__r.Is_Credit_Contract__c = true ';
        
        if(country=='NZ')
        {
            originalquery += ' and State_Master_State__c=\'NZ\' ';
            country = 'NZ';
        }
        else
        {
            originalquery += ' and State_Master_State__c!=\'NZ\' ';
            country = 'AU';
        }
        
        String searchquery = originalquery;
        
        if(lname!=null && lname!='' && ldMobile!=null && ldMobile!='' && ldEmail!=null && ldEmail!='')
        {
            searchquery = originalquery;
            searchquery += ' and ( LastName =\''+ lname+'\' AND PersonEmail =\''+ldEmail+'\' AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(lname!=null && lname!='' && ldMobile!=null && ldMobile!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (LastName =\''+ lname+'\' AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(lname!=null && lname!='' && ldDob != null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (BirthDate__c ='+ldDob+' AND LastName =\''+ lname+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(lname!=null && lname!='' && ldEmail!=null && ldEmail!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (PersonEmail =\''+ldEmail+'\' AND LastName =\''+ lname+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        ///////////////////////////////////////////
        if(ldCRN != null && ldCRN!='' && ldMobile!=null && ldMobile!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldCRN != null && ldCRN!='' && ldEmail!=null && ldEmail!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND PersonEmail =\''+ ldEmail+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldCRN != null && ldCRN!='' && ldDob!=null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and ((Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\') AND BirthDate__c ='+ ldDob+')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldMobile!=null && ldMobile!='' && ldEmail!=null && ldEmail!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (PersonEmail =\''+ldEmail+'\' AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldMobile!=null && ldMobile!='' && ldDob != null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (BirthDate__c ='+ldDob+' AND PersonMobilePhone =\''+ ldMobile+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldEmail!=null && ldEmail!='' && ldDob != null && ldDob!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (BirthDate__c ='+ldDob+' AND PersonEmail =\''+ ldEmail+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldCRN != null && ldCRN!='' && accts.size()==0)
        {
            searchquery = originalquery;
            searchquery += ' and (Centrepay_Ref_No__c =\''+ldCRN+'\' OR WINZ_No__c =\''+ldCRN+'\')';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
        }
        if(ldMobile!=null && ldMobile!='' && accts.size()==0)
        {
            isFollowUpRequiredVal = true;
            searchquery = originalquery;
            searchquery += ' AND PersonMobilePhone =\''+ ldMobile+'\'';
            searchquery += ' ORDER BY No_of_Agreements__c DESC Limit 1'; 
            system.debug('searchquery: '+searchquery); 
            accts = Database.query(searchquery);
            
            system.debug('ldLastNameWhileSearching: '+ldLastName);
            
            if(ldLastName!=null && ldLastName!='')
            {
                acctMobLst = [select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,
                PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,
                Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Is_PhotoId_Attached_After_Enquiry__c,
                MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Active_Agreements__c,Last_Agreement_Close_Date__c,RecordType.Name
                 from Account where PersonMobilePhone =: ldMobile and LastName=:ldLastName AND Territory_Number__r.Is_Credit_Contract__c = true];
                 
                if(acctMobLst.size()>0 && acctMobLst.size()==1)
                {
                    canbeDirectlyConverted = true;
                    accts = acctMobLst;
                }
            }
            else
                acctMobLst = [select id, name, FirstName, LastName,No_of_Agreements__c,State_Master_State__c,Company_Territory__c,Territory_Number__c from Account where PersonMobilePhone =: ldMobile AND Territory_Number__r.Is_Credit_Contract__c = true];
        }
        
        system.debug('appType: '+appType);
        if(appType=='existing')
        {
            //If not present donot convert the lead and park in the lead list and contact manually
            if(accts.size()==0)
            {
                system.debug('System Info - Customer selected existing applicant and based on the details provided did not map to the existing applicant. Creating new applicant. Please followup.');
                //Didn't find any one in the system
            }
            else
            {
                //If Present convert the lead into existing applicant and continue the process
                system.debug('lead: '+lead + ' accts[0].Id: '+accts[0].Id);
                //convertLead(lead, accts[0]);
                
                if(isFollowUpRequiredVal && accts[0].No_of_Agreements__c>0 && !canbeDirectlyConverted)
                {
                    system.debug('System Info - Stage 1 search Customer selected existing applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number with existing agreement. Stop the search. Please followup.');
                }
                else
                {
                    system.debug('##Found the account');
                }
                acctId = accts[0].Id;
               
            }
        }
        else if(appType=='new')
        {   
            //If present donot convert the lead and park in the lead list and contact manually
            if(accts.size()>0)
            {
                
                if(canbeDirectlyConverted)
                {
                    system.debug('##Just have one unique account');
                }
                else if(isFollowUpRequiredVal)
                {
                    system.debug('System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system based only on the mobile number. Stop the search. Please followup.');
                }
                else
                {
                    system.debug('System Info - Stage 1 search Customer selected new applicant and based on the details provided found a corresponding applicant '+accts[0].name+' in the system. Please followup.');
                }
                acctId=accts[0].Id;
            }else
            {
                //If not Present create a new applicant 
                Date birthdate = lddob!=null && lddob!='' ? Date.valueOf(lddob) : null;
                acctId=addApplicant(fname,lname, birthdate, ldCRN, ldMobile, ldEmail, '', '', '', postcode, country);
            }
        }
     
        system.debug('acctId: '+acctId);
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl = '';
        
        if(acctId!=null && acctId!='')
            finalUrl = onlineRefereeURL+'/RefereeOnlineEDM?id='+acctId+'&c='+country+'&n='+randomNumber;
        else
            finalUrl = onlineRefereeURL+'/RefereeOnlineEDM?ld=null'+'&c='+country+'&n='+randomNumber;
        
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','searchApplicantForRefereeEDM',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void convertToAccountEnquiry()
{
    String appType=Apexpages.currentPage().getParameters().get('csAppType');
    system.debug('appType: '+appType);
    
    Lead ldToUp = new Lead();
    ldToUp.Id  = ldId;
    if(appType=='acctEnquiry')
    {
        ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
        if(lead!=null && lead.Description!=null && lead.Description!='')
            ldToUp.Description = lead.Description + '\n System Info - Customer selected Account Enquiry. Please followup.';
        else 
            ldToUp.Description = 'System Info - Customer selected Account Enquiry. Please followup.';
            
        ldToUp.Reason_for_Enquiry__c='Existing Account Enquiry';
    }
    else if (appType=='serviceEnquiry')
    {
        ldToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
        if(lead!=null && lead.Description!=null && lead.Description!='')
            ldToUp.Description = lead.Description + '\n System Info - Customer selected Service Enquiry. Please followup.';
        else
            ldToUp.Description = 'System Info - Customer selected Service Enquiry. Please followup.';
        ldToUp.Reason_for_Enquiry__c='Service Enquiry / Issue';
    }
    update ldToUp;
}

public void finishOnlineProcess()
{
    String addComments=Apexpages.currentPage().getParameters().get('addComments');
    if(acctId!=null)
    {
        Account acct = new Account();
        acct.Id = acctId;
        acct.Hybrid_Link_Finish_Datetime__c = Datetime.now();
        if(addComments!=null)
            acct.Enquiry_Notes__c = addComments;
        update acct;
    }
}

private void convertLead(Lead ld, Account account)
{
    List<Opportunity> updateOppList = new List<Opportunity>();
    Account accountToUp = new Account();
    accountToUp.Consent_URLSent_DateTime__c = Datetime.now();
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
    
    if(account!=null && account.Id!=null)
    {
        String hybridEmployeeId;
        if(account.Territory_Number__c <> null)
        {
            Territory__c empTerrList = [SELECT Id,Name,State_Master_State__c FROM Territory__c WHERE Id =: account.Territory_Number__c LIMIT 1];
            String empTerritory = (empTerrList.State_Master_State__c == 'NZ' ? 'NZ' : (empTerrList.State_Master_State__c == 'NSW' ? 'NSW' : 'VIC'));
            List<Employee__c> empList = [SELECT Id FROM Employee__c WHERE Territory__r.Street_State__c =: empTerritory AND Name = 'Hybrid Application' ORDER BY Territory__r.Name DESC LIMIT 1];
            hybridEmployeeId = (empList.size() > 0 ? empList[0].Id : null);
        }
        accountToUp.Id = account.Id;
        //Make all Credit Matrix values blank as an Enquiry is created
        if(account.Enquiry_Date__c == null || (account.Enquiry_Date__c!=null && account.Enquiry_Date__c.daysBetween(Date.today()) > 21) || (lead.Lead_Medium__c == 'Marketing to Customer' && (account.Enquiry_Status__c == null || account.Enquiry_Status__c <> 'Enquiry')))
        {
            accountToUp.CM_Scheduled_Amount__c=null;
            accountToUp.CM_COGS__c=null;
            accountToUp.CM_Product_Category__c=null;
            accountToUp.CM_Serviceable__c=null;
            accountToUp.CM_No_of_Missed_Payments_Last_6_FN__c=null;
            accountToUp.CM_Combined_Dollar_Exposure__c=null;
            accountToUp.CM_No_of_Days_Missed_Since_Last_Payments__c=null;
            accountToUp.CM_Equifax_Rental_Default__c=null;
            accountToUp.CM_Equifax_Non_Rental_Default__c=null;
            accountToUp.Product_Category_Selected__c=null;
            accountToUp.Product_COGS_for_Agreement__c=null;
            //accountToUp.Product_Term_for_Agreement__c=null;
            accountToUp.AgreementId_for_Current_Enquiry__c=null;
            accountToUp.CM_Product_Category_Comments__c=null;
            accountToUp.CM_COGS_Comments__c=null;
            accountToUp.CM_Scheduled_Amount_Comments__c=null;
            accountToUp.CM_OutstandingDefRental_Comp_Comments__c=null;
            accountToUp.CM_OutstandingDefNonRental_Comp_Comments__c =null;
            accountToUp.CM_Equifax_Score_Comments__c=null;
            accountToUp.CM_days_since_last_Payment_Comments__c=null;
            accountToUp.CM_Missed_from_last_6_FN_pymts_Comments__c=null;
            accountToUp.CM_Serviceablilty_Comments__c=null;
            accountToUp.CM_Bankruptcy_Part_9_Agreements_Comments__c=null;
            accountToUp.CM_Reason_to_go_forward__c=null;
            accountToUp.Address_Verified__c=false;
            accountToUp.Income_Verified__c=false;
            accountToUp.Expense_Verified__c=false;
            accountToUp.Address_Verification_Type__c=null;
            accountToUp.Income_Verification_Type__c=null;
            accountToUp.Expense_Verification_Type__c=null;
            accountToUp.Other_Rental_Company_Details__c=null;
        
            accountToUp.Bank_Institution__c=null;
            accountToUp.SMS_for_MyGov_Sent__c=true;
            accountToUp.SMS_for_BankStatement_Sent__c=true;
            accountToUp.AccessID_BankStatement__c=null;
            accountToUp.AccessID_MyGov__c=null;
            accountToUp.AccessID_MyGov__c=null;
            if(stateMasterState=='NZ')
            {
                accountToUp.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFNZ-'+account.Customer_No__c;
            }
            else
            {
                //accountToUp.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFCO-'+account.Customer_No__c+'?withCentrelink=false';
                //accountToUp.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/r/b/RFCO-'+account.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                accountToUp.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+account.Customer_No__c;
                accountToUp.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+account.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
            }
            accountToUp.BankStatement_Status__c=null;
            accountToUp.MyGov_Status__c=null;
            accountToUp.BankStatement_Date__c=null;
            accountToUp.MyGov_Date__c=null;
            accountToUp.MyGov_Final_Page__c = false;
            accountToUp.Bank_Final_Page__c = false;
            accountToUp.BankStatement_Amend__c = false;
            accountToUp.Is_PhotoId_Attached_After_Enquiry__c = false;
            
            accountToUp.Basic_Info_Online__c = false;
            accountToUp.RO_Online__c =false;
            accountToUp.Income_Online__c = false;
            accountToUp.Expense_Online__c = false;
            accountToUp.Referees_Online__c = false;
            accountToUp.Equifax_Online__c = false;
            accountToUp.Next_Online_Step_Param__c = null;
            
            accountToUp.Expense_Details__c = null;
            accountToUp.Shared_Expenses_Sent__c = null;
            accountToUp.Shared_Expenses_Confirmed__c = null;
            accountToUp.Shared_Expenses_Online__c = false;
            accountToUp.Rent_Online__c = false;
            accountToUp.Tobacco_Alcohol_Online__c = false;
            accountToUp.Transport_Travel_Online__c = false;
            accountToUp.Utilities_Online__c = false;
            accountToUp.Clothing_Online__c = false;
            accountToUp.Credit_Card_Online__c = false;
            accountToUp.Household_Online__c = false;
            accountToUp.Insurance_Online__c = false;
            accountToUp.Loan_Online__c = false;
            accountToUp.Mobile_Online__c = false;
            accountToUp.Other_Regular_Online__c = false;
            accountToUp.Other_Rental_Online__c = false;
        
            accountToUp.Equifax_SMS_Consent_Sent__c=false;
            accountToUp.Equifax_SMS_Consent_Received__c=false;
            accountToUp.Equifax_Consent_Received_DateTime__c=null;
        
            accountToUp.Referees_Contacted_for_Current_Enquiry__c=0;
            accountToUp.Referees_Added_For_Current_Enquiry__c=0;
            accountToUp.Enquiry_Status__c = 'Enquiry';
            accountToUp.Enquiry_Date__c = Date.today();
            accountToUp.Enquiry_Datetime__c = Datetime.now();
            
            accountToUp.Hybrid_Link_Finish_Datetime__c =null;
        
            accountToUp.CAM_Basic__c = false;
            accountToUp.CAM_Contact__c = false;
            accountToUp.CAM_Income__c = false;
            accountToUp.CAM_Expense__c = false;
            accountToUp.CAM_Equifax__c = false;
            accountToUp.CAM_Credit_Matrix__c = false;
            accountToUp.CAM_Referees__c = false;
            accountToUp.CAM_Support_Docs__c = false;
            accountToUp.CAM_Submit__c = false;
            
            accountToUp.Rep_Name__c = null;
            accountToUp.Rep_Responsible_For_Converting_Lead__c = null;
            
            accountToUp.Consent_URL__c = null;
            accountToUp.Consent_URLSent_DateTime__c = Datetime.now();
            //accountToUp.Consent_URL_Opened_DateTime__c = null;
            //accountToUp.Consent_URL_Device_Info__c = null;
            accountToUp.Consent_URL_Latitude__c = ld.Hybrid_Link_Latitude__c;
            accountToUp.Consent_URL_Longitude__c = ld.Hybrid_Link_Longitude__c;
            accountToUp.Consent_URL_Address__c = ld.Hybrid_Link_Address__c;
            accountToUp.Rep_Name__c = 'Hybrid Application';
            accountToUp.Rep_Responsible_For_Converting_Lead__c = hybridEmployeeId;
            accountToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
            ///////////////////////////////////////////////////////////////
            
            Boolean dormantCanConvert = false;
            Boolean recordaccess = true;
            
            System.debug('********recordaccess ' + recordaccess);
            System.debug('********leadOwnerId ' + ld.OwnerId);
            System.debug('********acctId ' + account.Id);
            System.debug('********shortname ' + account.Territory_Number__r.Short_Name__c);      
             
            String creditGuideLineTerritory = dormantCanConvert ? ld.Territory_Number__c : account.Territory_Number__c;
                
            List<Credit_Guideline__c> creditGuidelines = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: creditGuideLineTerritory ORDER BY CreatedDate DESC LIMIT 1];
            if(creditGuidelines.size()>0)
            {
                accountToUp.Credit_Guideline__c = creditGuidelines[0].Id;
            }
        }
        System.debug('********account.Enquiry_Date__c ' + account.Enquiry_Date__c);
        System.debug('********lead.Rent4Keeps_Account__c ' + lead.Rent4Keeps_Account__c);
        System.debug('********account.Rent4Keeps_Account__c ' + account.Rent4Keeps_Account__c);
        if(!lead.Opt_In_Info_From_Rent4keeps__c && (account.Enquiry_Date__c == null || account.Enquiry_Date__c.daysBetween(Date.today()) > 30)){
            accountToUp.Rent4Keeps_Account__c = null;
        }else if(lead.Opt_In_Info_From_Rent4keeps__c){
            accountToUp.Rent4Keeps_Account__c = lead.Rent4Keeps_Account__c;
        }
        System.debug('********accountToUp.Rent4Keeps_Account__c ' + accountToUp.Rent4Keeps_Account__c);
        if((ld.Lead_Medium__c == 'Marketing to Customer' || ld.Lead_Medium__c == 'Retention' || ld.Lead_Medium__c == 'Retention SMS') && rWord <> null && rWord.trim() <> '')
        {
            accountToUp.Last_Retention_Reply__c = rWord;
            accountToUp.Last_Retention_Reply_Date__c = Date.today();
        }
        
        update accountToUp;
        
        if(updateOppList.size() > 0){
            update updateOppList;
        }
    }
    else
    {
        String hybridEmployeeId;
        if(ld.Territory_Number__c <> null)
        {
            Territory__c empTerrList = [SELECT Id,Name,State_Master_State__c FROM Territory__c WHERE Id =: ld.Territory_Number__c LIMIT 1];
            String empTerritory = (empTerrList.State_Master_State__c == 'NZ' ? 'NZ' : (empTerrList.State_Master_State__c == 'NSW' ? 'NSW' : 'VIC'));
            List<Employee__c> empList = [SELECT Id FROM Employee__c WHERE Territory__r.Street_State__c =: empTerritory AND Name = 'Hybrid Application' ORDER BY Territory__r.Name DESC LIMIT 1];
            hybridEmployeeId = (empList.size() > 0 ? empList[0].Id : null);
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
        accountToUp.Referees_Added_For_Current_Enquiry__c=0;
        accountToUp.Enquiry_Status__c = 'Enquiry';
        accountToUp.Enquiry_Date__c = Date.today();
        accountToUp.Enquiry_Datetime__c = Datetime.now();
        accountToUp.Consent_URLSent_DateTime__c = Datetime.now();
        accountToUp.Consent_URL_Latitude__c = ld.Hybrid_Link_Latitude__c;
        accountToUp.Consent_URL_Longitude__c = ld.Hybrid_Link_Longitude__c;
        accountToUp.Consent_URL_Address__c = ld.Hybrid_Link_Address__c;
        accountToUp.Rep_Name__c = 'Hybrid Application';
        accountToUp.Rep_Responsible_For_Converting_Lead__c = hybridEmployeeId;
        accountToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
        if(lead.Opt_In_Info_From_Rent4keeps__c){
            accountToUp.Rent4Keeps_Account__c = lead.Rent4Keeps_Account__c;
        }
        
        RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Enquiry' limit 1];
        accountToUp.RecordTypeId = personAccountRecordType.Id;
        
        List<Credit_Guideline__c> creditGuidelines = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: ld.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
        if(creditGuidelines.size()>0)
            accountToUp.Credit_Guideline__c = creditGuidelines[0].Id;
            
        if((ld.Lead_Medium__c == 'Referee EDM' || ld.Lead_Medium__c == 'Marketing to Customer') && ld.Referring_Customer__c <> null)
        {
            List<Global_Search__c> gSearch = [Select id,Applicant__r.Id,Applicant__r.Name,Suburb__c,Territory_Name__c from Global_Search__c where Applicant__c =: ld.Referring_Customer__c LIMIT 1];
            accountToUp.Referring_Applicant__c = gSearch.size() > 0 ? gSearch[0].Id : null;
        }
        
        insert accountToUp;
    }
        
    //Convert
    system.debug('convertedAccountId: '+accountToUp.Id);
    if(accountToUp!=null)
    {
        Lead ldToUp = new Lead();
        ldToUp.Id=ld.Id;
        ldToUp.Account__c=accountToUp.Id;
        update ldToUp;
    }
    Database.LeadConvert lc = new database.LeadConvert();
    lc.setLeadId(lead.Id);
    lc.setDoNotCreateOpportunity(True); //**IMPORTANT METHOD HERE**
    lc.setAccountId(accountToUp.Id);
    lc.setOwnerId(accountToUp.OwnerId);
    
    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    lc.setConvertedStatus(convertStatus.MasterLabel);
    Database.LeadConvertResult lcr = Database.convertLead(lc);
    ////////////////////
    
    
    //////////////////Transfer SMS History, Phonecalls to Account//////////////////
    NewEnquirySectionController nesc = new NewEnquirySectionController();
    nesc.calculateCallTime(accountToUp.Id,ld.Id);
    //////////////////Transfer SMS History, Phonecalls to Account//////////////////
}

public void convertLeadOnline(Lead ld, Account account, String fnameParam, String lnameParam, String dobParam, String idTypeParam, String idNumberParam, String ldEmailParam, String ldMobileParam, String ldCRNParam)
{
    System.debug('##fnameParam ' + fnameParam);
    System.debug('##lnameParam ' + lnameParam);
    System.debug('##dobParam ' + dobParam);
    System.debug('##idTypeParam ' + idTypeParam);
    System.debug('##idNumberParam ' + idNumberParam);
    System.debug('##ldEmailParam ' + ldEmailParam);
    System.debug('##ldMobileParam ' + ldMobileParam);
    System.debug('##ldCRNParam ' + ldCRNParam);

    try{
        List<Opportunity> updateOppList = new List<Opportunity>();
        Decimal fnInstalment = 0;
        List<Cart_Item__c> cartItems = [SELECT Id,Fortnightly_Instalment_Value__c FROM Cart_Item__c WHERE Lead__c = :ld.Id AND Consent_Received__c = true];
        for(Cart_Item__c ci : cartItems){
            fnInstalment += (ci.Fortnightly_Instalment_Value__c == null ? 0 : ci.Fortnightly_Instalment_Value__c);
        }

        Account accountToUp = new Account();
        accountToUp.Probable_Account__c = ld.Probable_Account__c;
        accountToUp.Probable_Territory__c = ld.Probable_Territory__c;
        accountToUp.Rent4Keeps_Payment_C__c = fnInstalment;
        accountToUp.OCR_Address__c = ocrAddress;
        accountToUp.Opt_out_marketing_material__c = ld.HasOptedOutOfEmail;
        accountToUp.Last_Online_Activity_DateTime__c = Datetime.now();
        accountToUp.External_Transfer_Relationship__c = null;

        if(idTypeParam != null && idTypeParam != ''){
            accountToUp.Identification_Type__c = idTypeParam;
        }
        if(idNumberParam != null && idNumberParam != ''){
            accountToUp.Identification_No__c = idNumberParam;
        }
        if(dobParam != null && dobParam != ''){
            accountToUp.Birthdate__c = Date.valueOf(dobParam);
        }
        if(ldEmailParam!=null && !ldEmailParam.containsIgnoreCase('declined') && !ldEmailParam.equalsIgnoreCase('na') && !ldEmailParam.containsIgnoreCase('not provided') && !ldEmailParam.containsIgnoreCase('not available'))
        {
            accountToUp.PersonEmail=ldEmailParam;
        }
        if(ldMobileParam!=null && !ldMobileParam.containsIgnoreCase('declined') && !ldMobileParam.equalsIgnoreCase('na') && !ldMobileParam.containsIgnoreCase('not provided') && !ldMobileParam.containsIgnoreCase('not available'))
        {
            accountToUp.PersonMobilePhone=ldMobileParam;
        }
        if(ldCRNParam != null && ldCRNParam != ''){
            List<String> territoryIdsWithRecordAccess = getTerritoriesWithAccess(lead.OwnerId);
            ldCRNParam = ldCRNParam.toUpperCase();
            List<Account> tempAcctList = new List<Account>();
            if(account!=null && account.Id!=null){
                if(stateMasterState == 'NZ'){
                    tempAcctList = [SELECT Id FROM Account WHERE WINZ_No__c =: ldCRNParam AND Id !=: account.Id AND Territory_Number__c in: territoryIdsWithRecordAccess LIMIT 1];
                }else{
                    tempAcctList = [SELECT Id FROM Account WHERE Centrepay_Ref_No__c =: ldCRNParam AND Id !=: account.Id AND Territory_Number__c in: territoryIdsWithRecordAccess LIMIT 1];
                }
            }else{
                if(stateMasterState == 'NZ'){
                    tempAcctList = [SELECT Id FROM Account WHERE WINZ_No__c =: ldCRNParam AND Territory_Number__c in: territoryIdsWithRecordAccess LIMIT 1];
                }else{
                    tempAcctList = [SELECT Id FROM Account WHERE Centrepay_Ref_No__c =: ldCRNParam AND Territory_Number__c in: territoryIdsWithRecordAccess LIMIT 1];
                }
            }
            if(tempAcctList.size() == 0 && stateMasterState == 'NZ'){
                accountToUp.WINZ_No__c = ldCRNParam;
            }
            if(tempAcctList.size() == 0 && stateMasterState != 'NZ'){
                accountToUp.Centrepay_Ref_No__c = ldCRNParam;
            }
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
        
        if(account!=null && account.Id!=null)
        {
            String hybridEmployeeId;
            if(account.Territory_Number__c <> null)
            {
                List<Employee__c> empList = [SELECT Id FROM Employee__c WHERE Territory__r.Name = '1000' AND Name = 'Hybrid Application' ORDER BY Territory__r.Name DESC LIMIT 1];
                hybridEmployeeId = (empList.size() > 0 ? empList[0].Id : null);
            }
            accountToUp.Id = account.Id;
            //Make all Credit Matrix values blank as an Enquiry is created
            if(account.Enquiry_Date__c == null || (account.Enquiry_Date__c!=null && account.Enquiry_Date__c.daysBetween(Date.today()) > 21) || (lead.Lead_Medium__c == 'Marketing to Customer' && (account.Enquiry_Status__c == null || account.Enquiry_Status__c <> 'Enquiry')))
            {
                accountToUp.CM_Scheduled_Amount__c=null;
                accountToUp.CM_COGS__c=null;
                accountToUp.CM_Product_Category__c=null;
                accountToUp.CM_Serviceable__c=null;
                accountToUp.CM_No_of_Missed_Payments_Last_6_FN__c=null;
                accountToUp.CM_Combined_Dollar_Exposure__c=null;
                accountToUp.CM_No_of_Days_Missed_Since_Last_Payments__c=null;
                accountToUp.CM_Equifax_Rental_Default__c=null;
                accountToUp.CM_Equifax_Non_Rental_Default__c=null;
                accountToUp.Product_Category_Selected__c=null;
                accountToUp.Product_COGS_for_Agreement__c=null;
                //accountToUp.Product_Term_for_Agreement__c=null;
                accountToUp.AgreementId_for_Current_Enquiry__c=null;
                accountToUp.CM_Product_Category_Comments__c=null;
                accountToUp.CM_COGS_Comments__c=null;
                accountToUp.CM_Scheduled_Amount_Comments__c=null;
                accountToUp.CM_OutstandingDefRental_Comp_Comments__c=null;
                accountToUp.CM_OutstandingDefNonRental_Comp_Comments__c =null;
                accountToUp.CM_Equifax_Score_Comments__c=null;
                accountToUp.CM_days_since_last_Payment_Comments__c=null;
                accountToUp.CM_Missed_from_last_6_FN_pymts_Comments__c=null;
                accountToUp.CM_Serviceablilty_Comments__c=null;
                accountToUp.CM_Bankruptcy_Part_9_Agreements_Comments__c=null;
                accountToUp.CM_Reason_to_go_forward__c=null;
                accountToUp.Address_Verified__c=false;
                accountToUp.Income_Verified__c=false;
                accountToUp.Expense_Verified__c=false;
                accountToUp.Address_Verification_Type__c=null;
                accountToUp.Income_Verification_Type__c=null;
                accountToUp.Expense_Verification_Type__c=null;
                accountToUp.Other_Rental_Company_Details__c=null;
            
                accountToUp.Bank_Institution__c=null;
                accountToUp.SMS_for_MyGov_Sent__c=true;
                accountToUp.SMS_for_BankStatement_Sent__c=true;
                accountToUp.AccessID_BankStatement__c=null;
                accountToUp.AccessID_MyGov__c=null;
                accountToUp.AccessID_MyGov__c=null;
                if(stateMasterState=='NZ')
                {
                    accountToUp.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFNZ-'+account.Customer_No__c;
                }
                else
                {
                    //accountToUp.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFCO-'+account.Customer_No__c+'?withCentrelink=false';
                    //accountToUp.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/r/b/RFCO-'+account.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                    accountToUp.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+account.Customer_No__c;
                    accountToUp.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+account.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                }
                accountToUp.BankStatement_Status__c=null;
                accountToUp.MyGov_Status__c=null;
                accountToUp.BankStatement_Date__c=null;
                accountToUp.MyGov_Date__c=null;
                accountToUp.MyGov_Final_Page__c = false;
                accountToUp.Bank_Final_Page__c = false;
                accountToUp.BankStatement_Amend__c = false;
                accountToUp.Is_PhotoId_Attached_After_Enquiry__c = false;
                
                accountToUp.Basic_Info_Online__c = false;
                accountToUp.RO_Online__c =false;
                accountToUp.Income_Online__c = false;
                accountToUp.Expense_Online__c = false;
                accountToUp.Referees_Online__c = false;
                accountToUp.Equifax_Online__c = false;
                accountToUp.Next_Online_Step_Param__c = null;
                
                accountToUp.Shared_Expenses_Sent__c = null;
                accountToUp.Shared_Expenses_Confirmed__c = null;
                accountToUp.Shared_Expenses_Online__c = false;
                accountToUp.Rent_Online__c = false;
                accountToUp.Tobacco_Alcohol_Online__c = false;
                accountToUp.Transport_Travel_Online__c = false;
                accountToUp.Utilities_Online__c = false;
                accountToUp.Clothing_Online__c = false;
                accountToUp.Credit_Card_Online__c = false;
                accountToUp.Household_Online__c = false;
                accountToUp.Insurance_Online__c = false;
                accountToUp.Loan_Online__c = false;
                accountToUp.Mobile_Online__c = false;
                accountToUp.Other_Regular_Online__c = false;
                accountToUp.Other_Rental_Online__c = false;
            
                accountToUp.Equifax_SMS_Consent_Sent__c=false;
                accountToUp.Equifax_SMS_Consent_Received__c=false;
                accountToUp.Equifax_Consent_Received_DateTime__c=null;
            
                accountToUp.Referees_Contacted_for_Current_Enquiry__c=0;
                accountToUp.Referees_Added_For_Current_Enquiry__c=0;
                accountToUp.Enquiry_Status__c = 'Enquiry';
                accountToUp.Enquiry_Date__c = Date.today();
                accountToUp.Enquiry_Datetime__c = Datetime.now();
                
                accountToUp.Hybrid_Link_Finish_Datetime__c =null;
            
                accountToUp.CAM_Basic__c = false;
                accountToUp.CAM_Contact__c = false;
                accountToUp.CAM_Income__c = false;
                accountToUp.CAM_Expense__c = false;
                accountToUp.CAM_Equifax__c = false;
                accountToUp.CAM_Credit_Matrix__c = false;
                accountToUp.CAM_Referees__c = false;
                accountToUp.CAM_Support_Docs__c = false;
                accountToUp.CAM_Submit__c = false;
                
                accountToUp.Rep_Name__c = null;
                accountToUp.Rep_Responsible_For_Converting_Lead__c = null;
                
                accountToUp.Consent_URL__c = null;
                accountToUp.Consent_URLSent_DateTime__c = Datetime.now();
                //accountToUp.Consent_URL_Opened_DateTime__c = null;
                //accountToUp.Consent_URL_Device_Info__c = null;
                accountToUp.Consent_URL_Latitude__c = ld.Hybrid_Link_Latitude__c;
                accountToUp.Consent_URL_Longitude__c = ld.Hybrid_Link_Longitude__c;
                accountToUp.Consent_URL_Address__c = ld.Hybrid_Link_Address__c;
                accountToUp.Rep_Name__c = 'Hybrid Application';
                accountToUp.Rep_Responsible_For_Converting_Lead__c = hybridEmployeeId;
                accountToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
                ///////////////////////////////////////////////////////////////
                
                //check recordaccess
                //List<UserRecordAccess> leadOwnerAccess = [SELECT RecordId,HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: ld.OwnerId AND RecordId =: account.Id];
                //Boolean recordaccess = leadOwnerAccess.size() > 0 ? leadOwnerAccess[0].HasReadAccess : false;
                //System.debug('********recordaccess ' + recordaccess);
                Boolean dormantCanConvert = false;
                Boolean recordaccess = true;
                
                System.debug('********recordaccess ' + recordaccess);
                System.debug('********leadOwnerId ' + ld.OwnerId);
                System.debug('********acctId ' + account.Id);
                System.debug('********shortname ' + account.Territory_Number__r.Short_Name__c);      
                 
                String creditGuideLineTerritory = dormantCanConvert ? ld.Territory_Number__c : account.Territory_Number__c;
                    
                List<Credit_Guideline__c> creditGuidelines = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: creditGuideLineTerritory ORDER BY CreatedDate DESC LIMIT 1];
                if(creditGuidelines.size()>0)
                {
                    accountToUp.Credit_Guideline__c = creditGuidelines[0].Id;
                }
            }
            System.debug('********account.Enquiry_Date__c ' + account.Enquiry_Date__c);
            System.debug('********lead.Rent4Keeps_Account__c ' + lead.Rent4Keeps_Account__c);
            System.debug('********account.Rent4Keeps_Account__c ' + account.Rent4Keeps_Account__c);
            if(!lead.Opt_In_Info_From_Rent4keeps__c && (account.Enquiry_Date__c == null || account.Enquiry_Date__c.daysBetween(Date.today()) > 30)){
                accountToUp.Rent4Keeps_Account__c = null;
            }else if(lead.Opt_In_Info_From_Rent4keeps__c){
                accountToUp.Rent4Keeps_Account__c = lead.Rent4Keeps_Account__c;
            }
            System.debug('********accountToUp.Rent4Keeps_Account__c ' + accountToUp.Rent4Keeps_Account__c);
            
            if((ld.Lead_Medium__c == 'Marketing to Customer' || ld.Lead_Medium__c == 'Retention' || ld.Lead_Medium__c == 'Retention SMS') && rWord <> null && rWord.trim() <> '')
            {
                accountToUp.Last_Retention_Reply__c = rWord;
                accountToUp.Last_Retention_Reply_Date__c = Date.today();
            }
            accountToUp.Next_Online_Step_Param__c = 'sdbsa';
            accountToUp.Last_Online_Activity_Datetime__c = Datetime.now();
            accountToUp.Photo_Id_Front__c = lead.Photo_Id_Front__c;
            accountToUp.Photo_Id_Back__c = lead.Photo_Id_Back__c;
            accountToUp.Is_PhotoId_Attached_After_Enquiry__c = true;
            accountToUp.Application_Logs__c = lead.Application_Logs__c;
            
            //credit guide
            if(lead.Credit_Check_Consent__c){
                accountToUp.Equifax_Consent_Received_DateTime__c = DateTime.now();
                accountToUp.Equifax_SMS_Consent_Received__c = true;
            }else{
                accountToUp.Equifax_Consent_Received_DateTime__c = null;
                accountToUp.Equifax_SMS_Consent_Received__c = false;
            }
            
            //requirements
            accountToUp.Product_Interested_In__c = lead.Product_Interested_In__c;
            accountToUp.Product_Name_for_Agreement__c = lead.Product_Name_for_Agreement__c;
            accountToUp.Product_Description__c = lead.Product_Requirements__c;
            accountToUp.Loan_Purpose__c = lead.Loan_Purpose__c;
            accountToUp.Requirements_and_Objectives__c = lead.Requirements_and_Objectives__c;
            accountToUp.Why_consumer_lease__c = lead.Why_use_a_Sale_of_Goods_by_Instalment__c;
            accountToUp.Benefit_of_Consumer_Lease_with_R4K__c = lead.Benefit_of_Sale_of_Goods_by_Instalment__c;
            accountToUp.RO_Online__c = lead.RO_Online__c;
            accountToUp.Bankruptcy_Part_9_Agreements__c = null;
                 
            update accountToUp;
            
            if(updateOppList.size() > 0){
                update updateOppList;
            }

            List<Cart_Item__c> oldCartItems = [SELECT Id,Fortnightly_Instalment_Value__c FROM Cart_Item__c WHERE Account__c = :accountToUp.Id];
            delete oldCartItems;
        }
        else
        {
            String hybridEmployeeId;
            if(ld.Territory_Number__c <> null)
            {
                List<Employee__c> empList = [SELECT Id FROM Employee__c WHERE Territory__r.Name = '1000' AND Name = 'Hybrid Application' ORDER BY Territory__r.Name DESC LIMIT 1];
                hybridEmployeeId = (empList.size() > 0 ? empList[0].Id : null);
            }
            
            /*if(ld.FirstName!=null && !ld.FirstName.containsIgnoreCase('declined') && !ld.FirstName.equalsIgnoreCase('na') && !ld.FirstName.containsIgnoreCase('not provided') && !ld.FirstName.containsIgnoreCase('not available'))
            {
                accountToUp.FirstName=ld.FirstName;
            }
            if(ld.LastName!=null && !ld.LastName.containsIgnoreCase('declined') && !ld.LastName.equalsIgnoreCase('na') && !ld.LastName.containsIgnoreCase('not provided') && !ld.LastName.containsIgnoreCase('not available'))
            {
                accountToUp.LastName=ld.LastName;
            }*/
            accountToUp.FirstName = fnameParam;
            accountToUp.LastName = lnameParam;
            accountToUp.OwnerId = ld.OwnerId;
            accountToUp.Territory_Number__c = ld.Territory_Number__c;
            accountToUp.CurrencyIsoCode = ld.Territory_Number__r.State_Master_State__c == 'NZ' ? 'NZD' : 'AUD';
            accountToUp.Referees_Contacted_for_Current_Enquiry__c=0;
            accountToUp.Referees_Added_For_Current_Enquiry__c=0;
            accountToUp.Enquiry_Status__c = 'Enquiry';
            accountToUp.Enquiry_Date__c = Date.today();
            accountToUp.Enquiry_Datetime__c = Datetime.now();
            accountToUp.Consent_URLSent_DateTime__c = Datetime.now();
            accountToUp.Consent_URL_Latitude__c = ld.Hybrid_Link_Latitude__c;
            accountToUp.Consent_URL_Longitude__c = ld.Hybrid_Link_Longitude__c;
            accountToUp.Consent_URL_Address__c = ld.Hybrid_Link_Address__c;
            accountToUp.Rep_Name__c = 'Hybrid Application';
            accountToUp.Rep_Responsible_For_Converting_Lead__c = hybridEmployeeId;
            accountToUp.Hybrid_Link_Allocation_Datetime__c = Datetime.now();
            
            RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Enquiry' limit 1];
            accountToUp.RecordTypeId = personAccountRecordType.Id;
            
            List<Credit_Guideline__c> creditGuidelines = [SELECT Id FROM Credit_Guideline__c WHERE Territory__c =: ld.Territory_Number__c ORDER BY CreatedDate DESC LIMIT 1];
            if(creditGuidelines.size()>0)
                accountToUp.Credit_Guideline__c = creditGuidelines[0].Id;
                
            if((ld.Lead_Medium__c == 'Referee EDM' || ld.Lead_Medium__c == 'Marketing to Customer') && ld.Referring_Customer__c <> null)
            {
                List<Global_Search__c> gSearch = [Select id,Applicant__r.Id,Applicant__r.Name,Suburb__c,Territory_Name__c from Global_Search__c where Applicant__c =: ld.Referring_Customer__c LIMIT 1];
                accountToUp.Referring_Applicant__c = gSearch.size() > 0 ? gSearch[0].Id : null;
            }
            accountToUp.Customer_No__c = AccountUtil.generateCustomerNumberforAccount(ld.Territory_Number__r.Applicant_Customer_Prefix__c,isCreditContract);
            accountToUp.SMS_for_MyGov_Sent__c=true;
            accountToUp.SMS_for_BankStatement_Sent__c=true;
            if(stateMasterState=='NZ')
            {
                accountToUp.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFNZ-'+accountToUp.Customer_No__c;
            }
            else
            {
                //accountToUp.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFCO-'+accountToUp.Customer_No__c+'?withCentrelink=false';
                //accountToUp.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/r/b/RFCO-'+accountToUp.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                accountToUp.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+accountToUp.Customer_No__c;
                accountToUp.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+accountToUp.Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
            }
            
            if(lead.Opt_In_Info_From_Rent4keeps__c){
                accountToUp.Rent4Keeps_Account__c = lead.Rent4Keeps_Account__c;
            }
            accountToUp.Next_Online_Step_Param__c = 'sdbsa';
            accountToUp.Last_Online_Activity_Datetime__c = Datetime.now();
            accountToUp.Photo_Id_Front__c = lead.Photo_Id_Front__c;
            accountToUp.Photo_Id_Back__c = lead.Photo_Id_Back__c;
            accountToUp.Is_PhotoId_Attached_After_Enquiry__c = true;
            accountToUp.Application_Logs__c = lead.Application_Logs__c;
            
            //credit guide
            if(lead.Credit_Check_Consent__c){
                accountToUp.Equifax_Consent_Received_DateTime__c = DateTime.now();
                accountToUp.Equifax_SMS_Consent_Received__c = true;
            }else{
                accountToUp.Equifax_Consent_Received_DateTime__c = null;
                accountToUp.Equifax_SMS_Consent_Received__c = false;
            }
            
            //requirements
            accountToUp.Product_Interested_In__c = lead.Product_Interested_In__c;
            accountToUp.Product_Name_for_Agreement__c = lead.Product_Name_for_Agreement__c;
            accountToUp.Product_Description__c = lead.Product_Requirements__c;
            accountToUp.Loan_Purpose__c = lead.Loan_Purpose__c;
            accountToUp.Requirements_and_Objectives__c = lead.Requirements_and_Objectives__c;
            accountToUp.Why_consumer_lease__c = lead.Why_use_a_Sale_of_Goods_by_Instalment__c;
            accountToUp.Benefit_of_Consumer_Lease_with_R4K__c = lead.Benefit_of_Sale_of_Goods_by_Instalment__c;
            accountToUp.RO_Online__c = lead.RO_Online__c;
            accountToUp.Bankruptcy_Part_9_Agreements__c = null;
            
            insert accountToUp;
        }
            
        //Convert
        system.debug('convertedAccountId: '+accountToUp.Id);
        if(accountToUp!=null)
        {
            Lead ldToUp = new Lead();
            ldToUp.Id=ld.Id;
            ldToUp.Account__c=accountToUp.Id;
            update ldToUp;
        }
        Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(lead.Id);
        lc.setDoNotCreateOpportunity(True); //**IMPORTANT METHOD HERE**
        lc.setAccountId(accountToUp.Id);
        lc.setOwnerId(accountToUp.OwnerId);
        
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        ////////////////////
        
        
        //////////////////Transfer SMS History, Phonecalls to Account//////////////////
        NewEnquirySectionController nesc = new NewEnquirySectionController();
        nesc.calculateCallTime(accountToUp.Id,ld.Id);
        //////////////////Transfer SMS History, Phonecalls to Account//////////////////
        
        
        if(accountToUp != null && lead != null){
            List<Attachment> leadAttachList = [SELECT Id, Name, Body, ContentType FROM Attachment WHERE ParentId =: lead.Id];
            List<Attachment> attachList = new List<Attachment>();
            for(Integer i=0; i<leadAttachList.size(); i++){
                Attachment attachment = new Attachment();
                attachment.Body = leadAttachList[i].Body;
                attachment.Name = leadAttachList[i].Name;    
                attachment.contentType = leadAttachList[i].contentType;
                attachment.ParentId = accountToUp.Id;
                attachList.add(attachment);
            }
            System.debug(attachList.size());
            if(attachList.size() > 0){
                insert attachList;
            }
            if(leadAttachList.size() > 0){
                delete leadAttachList;
            }
        }

        //Add account lookup on cart items
        for(Cart_Item__c ci : cartItems){
            ci.Account__c = accountToUp.Id;
        }
        update cartItems;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','convertLeadOnline',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void save()
{
    try
    {
    String firstName=Apexpages.currentPage().getParameters().get('firstName');
    String lastName=Apexpages.currentPage().getParameters().get('lastName');
    String phone=Apexpages.currentPage().getParameters().get('phone');
    String email=Apexpages.currentPage().getParameters().get('email');
    String gender=Apexpages.currentPage().getParameters().get('gender');
    
    String streetName=Apexpages.currentPage().getParameters().get('streetName');
    String suburb=Apexpages.currentPage().getParameters().get('suburb');
    String state=Apexpages.currentPage().getParameters().get('state');
    String postalCode=Apexpages.currentPage().getParameters().get('postalCode');
    String country=Apexpages.currentPage().getParameters().get('country');
    String latitude=Apexpages.currentPage().getParameters().get('latitude');
    String longitude=Apexpages.currentPage().getParameters().get('longitude');
    
    String dob=Apexpages.currentPage().getParameters().get('dob');
    String idVType=Apexpages.currentPage().getParameters().get('idVType');
    String idVTypeOther=Apexpages.currentPage().getParameters().get('idVTypeOther');
    String driverLicence=Apexpages.currentPage().getParameters().get('driverLicence');
    String hasProvidedConsent=Apexpages.currentPage().getParameters().get('hasProvidedConsent');
    
    String addEqEnquiries=Apexpages.currentPage().getParameters().get('addEqEnquiries');
    String addEqRentalDefaults=Apexpages.currentPage().getParameters().get('addEqRentalDefaults');
    String addEqNonRentalDefaults=Apexpages.currentPage().getParameters().get('addEqNonRentalDefaults');
    String addComments=Apexpages.currentPage().getParameters().get('addComments');
    String pageParam=Apexpages.currentPage().getParameters().get('pageParam');
    
    system.debug('firstName: '+firstName+' lastName: '+lastName+ ' phone: '+phone+' email: '+email+' gender: '+gender+' pageParam: '+pageParam);
    system.debug('streetName: '+streetName+' suburb: '+suburb+ ' state: '+state+' postalCode: '+postalCode+' country: '+country+' latitude: '+latitude+' longitude: '+longitude);
    system.debug('dob: '+dob+' idVType: '+idVType+' driverLicence: '+driverLicence+' hasProvidedConsent: '+hasProvidedConsent+' addComments: '+addComments);
    system.debug('addEqEnquiries: '+addEqEnquiries);
    
    Account account = new Account();
    if(hasProvidedConsent=='true' && pageParam=='sdcp')
    {
        account.Equifax_SMS_Consent_Received__c = true;
    }
    
    if(acctId!=null && acctId!='')
    {
        List<Account> acctLst = [select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,Territory_Number__c,
            PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,
            Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Territory_Applicant_Customer_Prefix__c,
            MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,
            WrittenOff_s_Count__c,Last_Agreement_Close_Date__c,RecordType.Name,Territory_Number__r.Is_Credit_Contract__c
            from Account where id=:acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories Limit 1];
            
        account.Id = acctId;
        account.FirstName = firstName;
        account.LastName = lastName;
        account.PersonMobilePhone = phone;
        account.PersonEmail = email;
        account.Gender__pc = gender!=null && gender!='' && gender!='--Select Gender--' ? gender : null;
        
        account.PersonMailingStreet = streetName;
        account.PersonMailingCity = suburb;
        account.PersonMailingState = state;
        account.PersonMailingPostalCode = postalCode;
        account.PersonMailingCountry = country;
        account.Sensis_Latitude__c = latitude!=null && latitude!='' ? Decimal.valueOf(latitude) : null;
        account.Sensis_Longitude__c = longitude!=null && longitude!='' ? Decimal.valueOf(longitude) : null;
        
        account.Identification_No__c = driverLicence;
        account.Identification_Type__c = idVType;
        if(idVType=='Other')
            account.Explanation_for_Other_ID_type__c = idVTypeOther;
        account.BirthDate__c = dob!=null && dob!='' ? Date.valueOf(dob) : null;
        
        if(addEqEnquiries!=null && addEqEnquiries!='')
            account.Explanation_for_Recent_Enquiries__c = addEqEnquiries;
        if(addEqRentalDefaults!=null && addEqRentalDefaults!='' && addEqNonRentalDefaults!=null && addEqNonRentalDefaults!='') 
        {
             account.Explanation_for_All_Other_Defaults__c = '##Rental - '+addEqRentalDefaults.trim();
             account.Explanation_for_All_Other_Defaults__c += '\n##NonRental - '+addEqNonRentalDefaults.trim();
        }   
        else if(addEqRentalDefaults!=null && addEqRentalDefaults!='')
             account.Explanation_for_All_Other_Defaults__c = '##Rental - '+addEqRentalDefaults.trim();
        else if(addEqNonRentalDefaults!=null && addEqNonRentalDefaults!='')
             account.Explanation_for_All_Other_Defaults__c = '##NonRental - '+addEqNonRentalDefaults.trim();
        
        account.Enquiry_Notes__c = addComments;
        
        if(acctLst.size()>0)
        {
            if(acctLst[0].Customer_No__c!=null && acctLst[0].Customer_No__c!='' && (acctLst[0].Hybrid_URL_BankStatement__c==null || acctLst[0].Hybrid_URL_BankStatement__c==''))
            {
                account.SMS_for_MyGov_Sent__c=true;
                account.SMS_for_BankStatement_Sent__c=true;
                if(stateMasterState=='NZ')
                {
                    account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFNZ-'+acctLst[0].Customer_No__c;
                }
                else
                {
                    //account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFCO-'+acctLst[0].Customer_No__c+'?withCentrelink=false';
                    //account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/r/b/RFCO-'+acctLst[0].Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                    account.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+acctLst[0].Customer_No__c;
                    account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+acctLst[0].Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                }
            }
            else if((acctLst[0].Customer_No__c==null || acctLst[0].Customer_No__c=='') && acctLst[0].Territory_Applicant_Customer_Prefix__c!=null && acctLst[0].Territory_Applicant_Customer_Prefix__c!='')
            {
                //Generate and update Customer Number and add the hybrid url
                String currentCustomerNo=AccountUtil.generateCustomerNumberforAccount(acctLst[0].Territory_Applicant_Customer_Prefix__c,isCreditContract);
                system.debug('###custNo: '+currentCustomerNo);
                if(currentCustomerNo!=null)
                {
                    account.Customer_No__c = currentCustomerNo;
                    account.SMS_for_MyGov_Sent__c=true;
                    account.SMS_for_BankStatement_Sent__c=true;
                    if(stateMasterState=='NZ')
                    {
                        account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFNZ-'+currentCustomerNo;
                    }
                    else
                    {
                        //account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFCO-'+currentCustomerNo+'?withCentrelink=false';
                        //account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/r/b/RFCO-'+currentCustomerNo+'?withCentrelink=true&centrelinkOnly=true';
                        account.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+currentCustomerNo;
                        account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+currentCustomerNo+'?withCentrelink=true&centrelinkOnly=true';
                    }
                }
                
            }
        }
        update account;
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','save',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
    
}

public String addApplicant(String fname, String lname, Date dob, String crnNo, String mobile, String email, String streetname, String suburb, String state, String postcode, String country)
{
    List<PostCode__c> postcodes = new List<PostCode__c>();
    List<Default_Lead__c> dlList=new List<Default_Lead__c>();
    Map<String, Default_Lead__c> mapDLobj = new Map<String, Default_Lead__c>();
    String terId,ownerId;
    String startsWith='';   
    dlList=[SELECT ID,Name,Salesforce_user_id__c,starts_with__c,Territory_id__c FROM DEFAULT_LEAD__C];

    if(postcode=='0000')
        startsWith=postcode;
    else if(country=='NZ')
        startsWith='NZ';
    else
        startsWith=postcode.substring(0,1);
    system.debug('startsWith: '+startsWith);
    if(country=='NZ')
        postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c where Name=:postcode and Territory__r.State_Master_State__c='NZ'];
    else
        postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c where Name=:postcode and Territory__r.State_Master_State__c!='NZ'];
   
    
    if(postcodes.size()>0)
    {
        //leadObj.OwnerId=postcodes[0].Owner.Id;
        system.debug('OwnerId: '+postcodes[0].Territory__r.Owner.Id);
        ownerId=postcodes[0].Territory__r.Owner.Id;
        terId=postcodes[0].Territory__r.id;
    }
    else
    {
        if(mapDLobj.get(startsWith).Salesforce_user_id__c!=null)
        {
            system.debug('dl: '+mapDLobj.get(startsWith).Salesforce_user_id__c);
            ownerId=mapDLobj.get(startsWith).Salesforce_user_id__c;
            terId=mapDLobj.get(startsWith).Territory_id__c;
        }
            
    }
    RecordType personAccountRecordType = [SELECT Id, Name FROM RecordType WHERE SobjectType = 'Account' AND IsPersonType = true AND Name = 'Applicant' limit 1];
    Account acct = new Account();
    acct.FirstName = fname;
    acct.LastName = lname;
    acct.PersonMobilePhone = mobile;
    acct.PersonEmail = email;
    acct.BirthDate__c = dob;
    if(country == 'NZ')
        acct.WINZ_No__c = crnNo;
    else
        acct.Centrepay_Ref_No__c = crnNo;
    acct.PersonMailingStreet = streetName;
    acct.PersonMailingCity = suburb;
    acct.PersonMailingState = state;
    acct.PersonMailingPostalCode = postcode;
    acct.PersonMailingCountry = country;
    acct.Territory_Number__c = terId;
    acct.OwnerId = ownerId;
    acct.RecordTypeId = personAccountRecordType.Id;
    acct.CurrencyIsoCode = country == 'NZ' ? 'NZD' : 'AUD';
    insert acct;
    return acct.Id;
}

public void updateReferee()
{
    try
    {
    String firstName=Apexpages.currentPage().getParameters().get('rffirstName');
    String lastName=Apexpages.currentPage().getParameters().get('rflastName');
    
    String rfstreetName=Apexpages.currentPage().getParameters().get('rfstreetName');
    String rfsuburb=Apexpages.currentPage().getParameters().get('rfsuburb');
    String rfstate=Apexpages.currentPage().getParameters().get('rfstate');
    String rfpostalCode=Apexpages.currentPage().getParameters().get('rfpostalCode');
    
    String relation=Apexpages.currentPage().getParameters().get('relation');
    String years=Apexpages.currentPage().getParameters().get('years');
    String months=Apexpages.currentPage().getParameters().get('months');
    String contactFrequency=Apexpages.currentPage().getParameters().get('contactFrequency');
    
    String isCreditWorthy=Apexpages.currentPage().getParameters().get('isCreditWorthy');
    String addComments=Apexpages.currentPage().getParameters().get('addComments');
    
    String pageParam=Apexpages.currentPage().getParameters().get('pageParam');
    
    system.debug('rfId: '+rfId+' firstName: '+firstName+' lastName: '+lastName);
    system.debug('relation: '+relation+' years: '+years+' months: '+months+' contactFrequency: '+contactFrequency);
    system.debug('isCreditWorthy: '+isCreditWorthy+' addComments: '+addComments+' pageParam: '+pageParam);
    if(rfId!=null && rfId!='' && rfContactId!=null && rfContactId!='')
    {
        if(pageParam=='pd')
        {
            Contact upCt = new Contact();
            upCt.Id = rfContactId;
            if(firstName!=null && firstName!='')
                upCt.FirstName=firstName;
            if(lastName!=null && lastName!='')
                upCt.LastName=lastName;
            if(rfstreetName!=null && rfstreetName!='')
            {
                upCt.MailingStreet=rfstreetName;
                upCt.MailingCity = rfsuburb;
                upCt.MailingPostalCode=rfpostalCode;
                upCt.MailingState=rfstate;
            }
            update upCt;
        }
        else if(pageParam=='rl')
        {
            Referee__c upRf = new Referee__c();
            upRf.Id = rfId;
            upRf.Relationship__c = relation;
            upRf.Contact_Frequency_With_Applicant__c = contactFrequency;
            if(years=='Life')
            {
                upRf.Life__c = true;
                upRf.Years__c=null;
                upRf.Months__c=null;
            }
            else{
                upRf.Life__c = false;
                upRf.Years__c=years!=null ? Decimal.ValueOf(years) : null;
                upRf.Months__c=months;
            }
            update upRf;
        }
        else if(pageParam=='ci')
        {
            system.debug('##isCreditWorthy: '+isCreditWorthy+' ## '+isCreditWorthy=='true');
            Referee__c upRf = new Referee__c();
            upRf.Id = rfId;
            upRf.Contacted_Date_Time__c = Datetime.now();
            upRf.Contacted_On_Date__c = Date.today();
            upRf.Contacted__c = 'Yes';
            upRf.Confirmed_Willing_Referee__c = true;
            upRf.Credit_Worthiness__c = isCreditWorthy=='true' ? true : false;
            upRf.Notes__c = addComments;
            update upRf;
        }
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateReferee',rfId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
    
}

public void completeContactRefereeProcess()
{
    try
    { 
        String isOptOutForMarketing=Apexpages.currentPage().getParameters().get('isOptOutForMarketing');
        system.debug('isOptOutForMarketing: '+isOptOutForMarketing);
        if(rfId!=null && rfId!='' && rfContactId!=null && rfContactId!='')
        {
            Referee__c upRf = new Referee__c();
            upRf.Id = rfId;
            upRf.Contacted_Date_Time__c = Datetime.now();
            upRf.Contacted_On_Date__c = Date.today();
            upRf.Contacted__c = 'Yes';
            upRf.Confirmed_Willing_Referee__c = true; 
            upRf.Opt_Out_from_R4K_Marketing__c = isOptOutForMarketing=='true' ? true : false;
            update upRf;
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','completeContactRefereeProcess',rfId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
    
}

public PageReference completeContactRefereeProcessRedirect()
{
    completeContactRefereeProcess();
    return new PageReference('/apex/CAMProcess?formType=docs&id='+acctId+'&sectionType=referees').setRedirect(true);
    
}

public PageReference addReferee()
{
    String randomNumber=SecretUtil.generateRandomNumber();
    String finalUrl = onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&param=ref&n='+randomNumber+'&prevRefs=none';

    String firstName=Apexpages.currentPage().getParameters().get('rfirstName');
    String lastName=Apexpages.currentPage().getParameters().get('rlastName');
    String phone=Apexpages.currentPage().getParameters().get('rphone');
    String relation=Apexpages.currentPage().getParameters().get('relation');
    String isOnlineAddRef=Apexpages.currentPage().getParameters().get('isOnlineAddRef');
    String sharedExpense=Apexpages.currentPage().getParameters().get('sharedExpense');
    String sharedExpenseContribution=Apexpages.currentPage().getParameters().get('sharedExpenseContribution');
    String isFranchiseeAddingRef=Apexpages.currentPage().getParameters().get('isFranchiseeAddingRef');
    /*String email=Apexpages.currentPage().getParameters().get('remail');
    String streetName=Apexpages.currentPage().getParameters().get('rstreetName');
    String suburb=Apexpages.currentPage().getParameters().get('rsuburb');
    String state=Apexpages.currentPage().getParameters().get('rstate');
    String postalCode=Apexpages.currentPage().getParameters().get('rpostalCode');*/

    if(stateMasterState == 'NZ'){
        finalUrl = onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&param=ref&n='+randomNumber+'&prevRefs=none';
    }else if(isFranchiseeAddingRef=='yes'){
        finalUrl = '/apex/AddRefereePage?id='+acctId+'&param=ref&prevRefs=none&n='+randomNumber;
    }else{
        finalUrl = onlineURL + '/AddRefereePage?id='+acctId+'&param=ref&prevRefs=none&n='+randomNumber;
    }

    try
    {
        List<Account> accts = [select id,name,Territory_Number__r.Short_Name__c,Territory_Number__c,OwnerId from Account where id=:acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories];
        if(accts.size()>0)
        {
            List<Referee__c> refs = [select id, name,Referee_Name__r.MobilePhone,Referee_Name__c,Relationship__c,Sharing_Expenses__c,Referee_Added_Datetime__c
                                     from Referee__c where Applicant__c=: acctId and Referee_Name__r.MobilePhone=: phone order by CreatedDate desc LIMIT 1];
            Referee__c referee=new Referee__c();
            if(refs.size()>0)
            {
                //Generate short link
                String shortURL = '';
                String finalUrl2 = onlineRefereeURL+'/RefereeContactForm?rf='+refs[0].Id+'&n='+randomNumber;
                if(!Test.isRunningTest())
                {
                    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                    shortURL = sl.shortLinkGenerator(finalUrl2);
                }
                //////////////////////////////
                
                Contact contact = new Contact();
                contact.Id = refs[0].Referee_Name__c;
                if(firstName!=null && firstName!='')
                    contact.FirstName=firstName;
                if(lastName!=null && lastName!='')
                    contact.LastName=lastName;
                /*if(streetName!=null && streetName!='')
                    contact.MailingStreet=streetName;
                if(suburb!=null && suburb!='')
                    contact.MailingCity = suburb;
                if(postalCode!=null && postalCode!='')
                    contact.MailingPostalCode=postalCode;
                if(state!=null && state!='')
                    contact.MailingState=state;*/
                contact.MobilePhone=phone;
                update contact;
                
                system.debug('contactId: '+contact.Id);
                referee.id=refs[0].id;
                if(relation!=null && relation!='')
                    referee.Relationship__c = relation;
                referee.Referee_Added_Datetime__c=Datetime.now();
                referee.Contacted_Date_Time__c = null;
                referee.Contacted_On_Date__c = null;
                referee.Contacted__c = 'No';
                referee.Confirmed_Willing_Referee__c = false; 
                update referee;
                
                if((isFranchiseeAddingRef==null || isFranchiseeAddingRef=='') && (refs[0].Referee_Added_Datetime__c == null || refs[0].Referee_Added_Datetime__c.date().daysBetween(Date.today()) > 2))
                    sendRefereeSMSNew(referee.Id,shortURL);
            }
            else
            {
                Contact contact = new Contact();
                contact.FirstName=firstName;
                contact.LastName=lastName;
                /*contact.MailingStreet=streetName;
                contact.MailingCity = suburb;
                contact.MailingPostalCode=postalCode;
                contact.MailingState=state;
                contact.Email=email;*/
                contact.MobilePhone=phone;
                insert contact;
                system.debug('contactId: '+contact.Id);
                
                referee.Referee_Name__c=contact.id;
                referee.Applicant__c=acctId;
                if(relation!=null && relation!='')
                    referee.Relationship__c = relation;
                referee.Referee_Added_Datetime__c=Datetime.now();
                insert referee;
                
                if(isFranchiseeAddingRef==null || isFranchiseeAddingRef=='')
                    sendRefereeSMSNew(referee.Id,onlineRefereeURL+'/RefereeContactForm?rf='+referee.Id+'&n='+randomNumber);
            }
            
            Account acct = new Account();
            acct.id=acctId;
            acct.Last_Referee_Date__c=Date.today();
            acct.Last_Online_Activity_DateTime__c = Datetime.now();
            update acct;
            
            system.debug('refId: '+referee.Id);
            //if(!Test.isRunningTest())
            //    sendRefereeSMS(referee.Id,onlineRefereeURL);
        }
        
        return new PageReference(finalUrl).setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','addReferees',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference(finalUrl).setRedirect(true); 
    }
}

public PageReference redirectAndAddPreviousReferees()
{
    String randomNumber=SecretUtil.generateRandomNumber();
    String finalUrl = onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&param=ref&n='+randomNumber;
    //String addRefId=Apexpages.currentPage().getParameters().get('addRefId');
    String addPrevRefNo=Apexpages.currentPage().getParameters().get('addPrevRefNo');
        currentprevRefId=Apexpages.currentPage().getParameters().get('cpRefId');
        prevRefIds=Apexpages.currentPage().getParameters().get('prevRefs');
    String isOnlineRef=Apexpages.currentPage().getParameters().get('isOnlineRef');
    String isFranchiseeAddingPRef=Apexpages.currentPage().getParameters().get('isFranchiseeAddingPRef');
    List<String> lstPrevRefIds = new List<String>();
    system.debug('currentprevRefId: '+currentprevRefId+' prevRefIds: '+prevRefIds+' addPrevRefNo: '+addPrevRefNo+' isOnlineRef: '+isOnlineRef);
    
    if(stateMasterState == 'NZ'){
        finalUrl = onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&param=ref&n='+randomNumber;
    }else if(isFranchiseeAddingPRef=='yes'){
        finalUrl = '/apex/AddRefereePage?id='+acctId+'&param=ref&n='+randomNumber;
    }else{
        finalUrl = onlineURL + '/AddRefereePage?id='+acctId+'&param=ref&n='+randomNumber;
    }

    try
    {       
        List<Account> accts = [select id,name,Territory_Number__r.Short_Name__c,Territory_Number__c,OwnerId from Account where id=:acctId];
        if(accts.size()>0 && currentprevRefId!=null)
        {
            List<Referee__c> refs = [select id, name,Referee_Name__r.MobilePhone,Referee_Name__c,Relationship__c from Referee__c where id=: currentprevRefId LIMIT 1];
            Referee__c referee=new Referee__c();
            if(refs.size()>0)
            {
                //Generate short link
                String shortURL = '';
                String finalUrl2 = onlineRefereeURL+'/RefereeContactForm?rf='+refs[0].Id+'&n='+randomNumber+'&param=prevRef';
                
                if(!Test.isRunningTest())
                {
                    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                    shortURL = sl.shortLinkGenerator(finalUrl2);
                }
                //////////////////////////////
                
                Contact contact = new Contact();
                contact.Id = refs[0].Referee_Name__c;
                contact.MobilePhone=addPrevRefNo;
                update contact;
                
                system.debug('contactId: '+contact.Id);
                referee.id=refs[0].id;
                //if(relation!=null && relation!='')
                //    referee.Relationship__c = relation;
                referee.Referee_Added_Datetime__c=Datetime.now();
                referee.Contacted_Date_Time__c = null;
                referee.Contacted_On_Date__c = null;
                referee.Contacted__c = 'No';
                referee.Confirmed_Willing_Referee__c = false; 
                update referee;
                
                if(isFranchiseeAddingPRef==null || isFranchiseeAddingPRef=='')
                    sendRefereeSMSNew(referee.Id,shortURL);
            }
            
            Account acct = new Account();
            acct.id=acctId;
            acct.Last_Referee_Date__c=Date.today();
            acct.Next_Online_Step_Param__c='ref';
            acct.Last_Online_Activity_Datetime__c=Datetime.now();
            update acct;
            
            system.debug('refId: '+referee.Id);
        }
        
        if(prevRefIds!=null && prevRefIds!='' && prevRefIds!='none')
        {
            lstPrevRefIds = prevRefIds.split(',');
            prevRefIds = '';
            
            if(lstPrevRefIds.size()>0)
            {
                if(lstPrevRefIds.size()==1)
                {
                    currentprevRefId = lstPrevRefIds[0];
                    prevRefIds = 'none';
                }
                else
                {
                    for(Integer i=0; i<lstPrevRefIds.size(); i++)
                    {
                        if(i==0)
                        {
                            currentprevRefId = lstPrevRefIds[i];
                            lstPrevRefIds.remove(i);
                        }
                    }
                    if(lstPrevRefIds.size()>0)
                    {
                        for(String t: lstPrevRefIds)
                            prevRefIds = t + ',';
                        prevRefIds = prevRefIds!=null ?  prevRefIds.removeEnd(',') : 'none';
                    }
                    else
                        prevRefIds = 'none';
                }
                system.debug('lstPrevRefIds: '+lstPrevRefIds+' currentprevRefId: '+currentprevRefId+' prevRefIds: '+prevRefIds);
                finalUrl = finalUrl+'&prevRefs='+prevRefIds+'&cpRefId='+currentprevRefId;
            }
        }
        else
            finalUrl = finalUrl+'&prevRefs=none';
        
        return new PageReference(finalUrl).setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','redirectAndAddPreviousReferees',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference(finalUrl).setRedirect(true); 
    }
}

@future(callout=true)
public static void sendRefereeSMS(String refId,String onlineLink)
{
    String shortURL = '';
    String randomNumber=SecretUtil.generateRandomNumber();
    String finalUrl = onlineLink+'/RefereeContactForm?rf='+refId+'&n='+randomNumber;
    
    if(refId!=null && refId!='')
    {
        List<Referee__c> refs = [select id, name,Referee_Name__r.FirstName,Applicant__r.FirstName,Referee_Name__r.MobilePhone,SMS_Referee_Mobile__c,Referee_Name__c,Applicant__c,Applicant__r.OwnerId,Referee_Contact_Link__c from Referee__c where id=:refId LIMIT 1];
        if(refs.size()>0)
        {
            Referee__c ref = refs[0];
            String refMobileNo = ref.SMS_Referee_Mobile__c;
            String refName = ref.Referee_Name__r.FirstName;
            String custName = ref.Applicant__r.FirstName;
            String ownerId = ref.Applicant__r.OwnerId;
            ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
            shortURL = sl.shortLinkGenerator(finalURL);
            String smsTemplateForRef = 'Hi '+refName+', You have been nominated by '+custName+' as a character reference. Please click the below link to assist with R4K. '+shortURL;
            
            Referee__c upref = new Referee__c();
            upref.Id = ref.Id;
            upref.Referee_Contact_Link__c = shortURL;
            update upref;
            CommunicationUtil.sendSMS(refMobileNo,smsTemplateForRef,'RefereeContact','Referee__c',ref.Id,ownerId,false,null);
        }
    }
}

public void sendRefereeSMSNew(String refId,String finalURL)
{
    if(refId!=null && refId!='')
    {
        List<Referee__c> refs = [select id, name,Referee_Name__r.FirstName,Applicant__r.FirstName,Referee_Name__r.MobilePhone,SMS_Referee_Mobile__c,Referee_Name__c,Applicant__c,Applicant__r.OwnerId,Referee_Contact_Link__c from Referee__c where id=:refId LIMIT 1];
        if(refs.size()>0)
        {
            Referee__c ref = refs[0];
            String refMobileNo = ref.SMS_Referee_Mobile__c;
            String refName = ref.Referee_Name__r.FirstName;
            String custName = ref.Applicant__r.FirstName;
            String ownerId = ref.Applicant__r.OwnerId;
            String smsTemplateForRef = 'Hi '+refName+', You have been nominated by '+custName+' as a character reference. Please click the below link to assist with R4K. '+finalURL;
            
            Referee__c upref = new Referee__c();
            upref.Id = ref.Id;
            upref.Referee_Contact_Link__c = finalURL;
            update upref;
            CommunicationUtil.sendSMS(refMobileNo,smsTemplateForRef,'RefereeContact','Referee__c',ref.Id,ownerId,false,null);
        }
    }
}

public PageReference addReferral()
{
    String randomNumber=SecretUtil.generateRandomNumber();
    String finalUrl = onlineRefereeURL+'/RefereeOnlineEDM?id='+acctId+'&n='+randomNumber;
    try
    {
        String firstName=Apexpages.currentPage().getParameters().get('rfirstName');
        String lastName=Apexpages.currentPage().getParameters().get('rlastName');
        String phone=Apexpages.currentPage().getParameters().get('rphone');
        String email=Apexpages.currentPage().getParameters().get('remail');
        String streetName=Apexpages.currentPage().getParameters().get('rstreetName');
        String suburb=Apexpages.currentPage().getParameters().get('rsuburb');
        String state=Apexpages.currentPage().getParameters().get('rstate');
        String postalCode=Apexpages.currentPage().getParameters().get('rpostalCode');
        
        List<Account> accts = [select id,name,Territory_Number__r.Short_Name__c,Territory_Number__c,OwnerId from Account where id=:acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories];
        if(accts.size()>0)
        {
            SiteController sc = new SiteController();
            sc.accountId = acctId;
            sc.terId = accts[0].Territory_Number__c;
            sc.ownerId = accts[0].OwnerId;
            sc.rfname = firstName;
            sc.rlname = lastName;
            sc.rmobile = phone;
            sc.remail = email;
            sc.rAddress = streetName;
            sc.rCity = suburb;
            sc.rstate = state;
            sc.rpostCode = postalCode;
            sc.addReferralLogic();
        }
        
        
        return new PageReference(finalUrl).setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','addReferral',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference(finalUrl).setRedirect(true); 
    }
}

public PageReference equifaxSearch()
{
    String randomNumber=SecretUtil.generateRandomNumber();
    try
    {
        equifaxSearchLogic();
        
        if(equifaxValid){
            Account acctToUp = new Account();
            acctToUp.Id = acctId;
            acctToUp.Equifax_Online__c = true;
            update acctToUp;
            return new PageReference(onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&n='+randomNumber+'&param=eqenr').setRedirect(true);
        }
            
        return new PageReference(onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&n='+randomNumber+'&param=com').setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','equifaxSearch',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference(onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&n='+randomNumber+'&param=com').setRedirect(true);
    }
}

public void equifaxSearchLogic()
{
    equifaxValid = false;
    Datetime last21Date = Datetime.now().addDays(-21);
    if(acctId!=null && acctId!='')
    {   
        List<Account> accts = [select id,Name,FirstName,LastName,Gender__pc,Birthdate__c,Identification_No__c,Identification_Type__c,CurrencyIsoCode,Customer_No__c,
                        PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,Territory_Number__r.Name,OwnerId,State_Master_State__c,
                        Equifax_Enquiry_Id__c,Equifax_Enquiry_Datetime__c
                        from Account where id=:acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories and ( Equifax_Enquiry_Datetime__c=null or Equifax_Enquiry_Datetime__c <: last21Date) Limit 1];
        system.debug('accts.size: '+accts.size());
        if(accts.size()>0)
        {
            Account act = accts[0];
            if(act.Gender__pc!=null && act.Gender__pc!='' && act.State_Master_State__c!='NZ' && act.PersonMailingState!=null && act.PersonMailingState!='' && act.PersonMailingPostalCode!=null && act.PersonMailingPostalCode!='')
            {
                NewApplicantProcessController npc = new NewApplicantProcessController();
                
                npc.account = new Account();
                npc.account.Id = act.Id;
                npc.account.Customer_No__c = act.Customer_No__c; 
                npc.account.OwnerId = act.OwnerId;
                npc.account.Gender__pc = act.Gender__pc;
                npc.account.Birthdate__c = act.Birthdate__c;
                npc.equifaxEnquiryAmount = 3500;
                npc.equifaxEnquiryLastName = act.LastName;
                npc.equifaxEnquiryFirstName = act.FirstName;
                npc.driversLicense = act.FirstName;
                npc.equifaxEnquiryPreviousAddress = null;
                npc.equifaxEnquiryStreet = act.PersonMailingStreet;
                npc.equifaxEnquiryCity = act.PersonMailingCity;
                npc.equifaxEnquiryState = act.PersonMailingState;
                npc.equifaxEnquiryPostCode = act.PersonMailingPostalCode;
                npc.account.PersonMailingCountry = act.PersonMailingCountry;
                npc.account.CurrencyIsoCode = act.CurrencyIsoCode;
                npc.account.Equifax_Enquiry_Id__c = null;
                npc.account.Veda_File_Number__c = null;
                
                if(!Test.isrunningTest())
                    npc.performEquifaxSearch(act.Territory_Number__r.Name);
                system.debug('##equifaxEnquiryId: '+npc.account.Equifax_Enquiry_Id__c+' ageOfFile: '+npc.account.Equifax_Age_of_File__c);
                if(npc.account.Equifax_Age_of_File__c!=null && npc.account.Equifax_Age_of_File__c=='0 months')
                    equifaxValid = false;
                else
                    equifaxValid = true;
                if(npc.account.Equifax_Enquiry_Id__c!=null && npc.account.Equifax_Enquiry_Id__c!='')
                    getEquifaxPdf(npc.account.Equifax_Enquiry_Id__c, acctId, act.Name);
            }
        }
        else
        {
            List<Account> alreadyPresentValidEquifaxAccountLst = [select id,Name,FirstName,LastName,Gender__pc,Birthdate__c,Identification_No__c,Identification_Type__c,CurrencyIsoCode,Customer_No__c,
                        PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,Territory_Number__r.Name,OwnerId,State_Master_State__c,
                        Equifax_Enquiry_Id__c,Equifax_Enquiry_Datetime__c
                        from Account where id=:acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories and (Equifax_Age_of_File__c!=null and Equifax_Age_of_File__c<>'0 months') Limit 1];
            
            system.debug('alreadyPresentValidEquifaxAccountLst: '+alreadyPresentValidEquifaxAccountLst.size());
            if(alreadyPresentValidEquifaxAccountLst.size()>0)
                equifaxValid = true;
            else
                equifaxValid = false;    
        }
    }
}

public PageReference equifaxSearchForOnline()
{
    String randomNumber=SecretUtil.generateRandomNumber();
    try
    {  
        equifaxSearchLogic();  
        system.debug('equifaxValidOnline: '+equifaxValid);  
        if(acctId!=null && acctId!='')
        {
            Account acct = new Account();
            acct.Id = acctId;
            acct.Referees_Online__c = true;
            update acct;
        }  
        if(equifaxValid)
        {
            if(redo!=null && redo=='yes')
                return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&redo=yes').setRedirect(true);
            else
                return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&param=eqenr').setRedirect(true);
        }
    
        if(redo!=null && redo=='yes')
            return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&redo=yes').setRedirect(true);
        else        
            return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&param=com').setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','equifaxSearchForOnline',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        if(redo!=null && redo=='yes')
            return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&redo=yes').setRedirect(true);
        else        
            return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&param=com').setRedirect(true);
    }
}

@future(callout=true)
public static void getEquifaxPdf(String equifaxEnquiryId, String accountId, String accountName)
{
    try
    {
        VedaIntegration veda = new VedaIntegration(); 
        if(!Test.isrunningTest())   
            veda.getVedaPDFById(equifaxEnquiryId,accountId,accountName);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','getEquifaxPdf',accountId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void saveConsent()
{
    try
    {
        if(acctId!=null && acctId!='')
        { 
            Account account = new Account();
            account.Equifax_SMS_Consent_Received__c = true;      
            account.Equifax_Consent_Received_DateTime__c = Datetime.now();      
            account.Id = acctId;
            update account;
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','saveConsent',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }   
}

public void saveIndentificationType()
{
    String idType=Apexpages.currentPage().getParameters().get('idType');
    String idTypeOther=Apexpages.currentPage().getParameters().get('idTypeOther');
    try
    {
        if(acctId!=null && acctId!='' && idType!=null && idType!='')
        { 
            Account account = new Account();
            account.Identification_Type__c = idType;
            if(idType=='Other')
                account.Explanation_for_Other_ID_type__c = idTypeOther;
            account.Id = acctId;
            update account;
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','saveIndentificationType',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
    
}

public PageReference deleteCustomerPhotoId()
{
    String accountId=Apexpages.currentPage().getParameters().get('acctId');
    system.debug('accountId: '+accountId);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(acctId!=null && acctId!='' && custPhotoAtt!=null && custPhotoAtt!='')
    {
        List<Document> delDocs = [select id from Document where id=:custPhotoAtt];
        if(delDocs.size()>0)
            delete delDocs;
    
        Account acctToUp = new Account();
        acctToUp.Id = acctId;
        acctToUp.Last_Online_Activity_DateTime__c = Datetime.now();
        update acctToUp;
    }
    return new PageReference(onlineURL+'/R4KOnlineApplicationForm?id='+accountId+'&n='+randomNumber+'&param=sdcp').setRedirect(true);
}

public PageReference deleteSelfieId()
{
    String accountId=Apexpages.currentPage().getParameters().get('acctId');
    system.debug('accountId: '+accountId);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(acctId!=null && acctId!='' && custPhotoAtt!=null && custPhotoAtt!='')
    {
        List<Document> delDocs = [select id from Document where id=:custPhotoAtt];
        if(delDocs.size()>0)
            delete delDocs;
        
        Account acctToUp = new Account();
        acctToUp.Id = acctId;
        acctToUp.Last_Online_Activity_DateTime__c = Datetime.now();
        update acctToUp;
    }
    return new PageReference(onlineURL+'/R4KOnlineForm?id='+accountId+'&n='+randomNumber+'&param=sdcpa').setRedirect(true);
}

public PageReference deletePhotoIdForDocLink()
{
    String accountId=Apexpages.currentPage().getParameters().get('accountId');
    String type=Apexpages.currentPage().getParameters().get('type');
    system.debug('accountId: '+accountId+' type: '+type);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(acctId!=null && acctId!='')
    {
        String photoAtt = type=='back' ? photoAttBackId : photoAttId;
        List<Attachment> delAtts = [select id from Attachment where id=:photoAtt and parentId=:accountId Limit 1];
        if(delAtts.size()>0)
        {
            delete delAtts;
            
            Account acctToUp = new Account();
            acctToUp.Id = acctId;
            acctToUp.Is_PhotoId_Attached_After_Enquiry__c = false;
            acctToUp.Last_Online_Activity_DateTime__c = Datetime.now();
            update acctToUp;
        }
    }
    return new PageReference(onlineURL+'/R4KConsentFormDocLink?id='+accountId+'&n='+randomNumber).setRedirect(true);
}

public PageReference deletePhotoId()
{
    String accountId=Apexpages.currentPage().getParameters().get('accountId');
    String type=Apexpages.currentPage().getParameters().get('type');
    system.debug('accountId: '+accountId+' type: '+type);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(acctId!=null && acctId!='')
    {
        String photoAtt = type=='back' ? photoAttBackId : photoAttId;
        List<Attachment> delAtts = [select id from Attachment where id=:photoAtt and parentId=:accountId Limit 1];
        if(delAtts.size()>0)
        {
            delete delAtts;
            
            Account acctToUp = new Account();
            acctToUp.Id = acctId;
            acctToUp.Last_Online_Activity_DateTime__c = Datetime.now();
            if(type=='front')
                acctToUp.Is_PhotoId_Attached_After_Enquiry__c = false;
            update acctToUp;
        }
    }
    return new PageReference(onlineURL+'/R4KOnlineApplicationForm?id='+accountId+'&n='+randomNumber+'&param=sdid').setRedirect(true);
}

public PageReference deletePhotoIdOnline()
{
    String accountId=Apexpages.currentPage().getParameters().get('accountId');
    String type=Apexpages.currentPage().getParameters().get('type');
    system.debug('accountId: '+accountId+' type: '+type);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(acctId!=null && acctId!='')
    {
        String photoAtt = type=='back' ? photoAttBackId : photoAttId;
        List<Attachment> delAtts = [select id from Attachment where id=:photoAtt and parentId=:accountId Limit 1];
        
        List<Account> acctLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c from Account where id=:accountId LIMIT 1];
        if(acctLst.size()>0)
        {
            String photoDocId = type=='back' ? acctLst[0].Photo_Id_Back__c : acctLst[0].Photo_Id_Front__c;
            List<Document> delDocs = [select id from Document where id=:photoDocId];
            if(delDocs.size()>0)
                delete delDocs;
        }
            
        if(delAtts.size()>0)
        {
            delete delAtts;
        }
            
        Account acctToUp = new Account();
        acctToUp.Id = acctId;
        acctToUp.Last_Online_Activity_DateTime__c = Datetime.now();
        if(type=='front'){
            acctToUp.Is_PhotoId_Attached_After_Enquiry__c = false;
            acctToUp.Photo_Id_Front__c = null;
        }else if(type=='back'){
            acctToUp.Photo_Id_Back__c = null;
        }
        update acctToUp;
    }else if(ldId!=null && ldId!='')
    {
        String photoAtt = type=='back' ? photoAttBackId : photoAttId;
        List<Attachment> delAtts;
        
        if(type=='back'){
            delAtts = [select id from Attachment where Name LIKE 'Photo Id Back%' and parentId=:accountId];
        }else{
            delAtts = [select id from Attachment where (Name LIKE 'Photo Id.%' OR Name LIKE 'Photo Id Front%') and parentId=:accountId];
        }
        
        List<Lead> ldLst = [select id,Photo_Id_Front__c,Photo_Id_Back__c from Lead where id=:accountId LIMIT 1];
        if(ldLst.size()>0)
        {
            String photoDocId = type=='back' ? ldLst[0].Photo_Id_Back__c : ldLst[0].Photo_Id_Front__c;
            List<Document> delDocs = [select id from Document where id=:photoDocId];
            if(delDocs.size()>0)
                delete delDocs;
        }
            
        if(delAtts.size()>0)
        {
            delete delAtts;
            
            Lead ldToUp = new Lead();
            ldToUp.Id = ldId;
            if(type=='front'){
                ldToUp.Photo_Id_Front__c = null;
            }else if(type=='back'){
                ldToUp.Photo_Id_Back__c = null;
            }
            update ldToUp;
        }
    }
    return new PageReference(onlineURL+'/R4KOnlineForm?'+(acctId != null && acctId != '' ? ('id=' + acctId) : ('ld=' + ldId))+'&n='+randomNumber+'&redo='+redo+'&param='+(type=='back'?'sdidb':'sdid')).setRedirect(true);
}

public PageReference deleteWinzId()
{
    String winzId = apexpages.currentpage().getparameters().get('winzId');
    system.debug('winzId: '+winzId);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(winzId!=null && winzId!='' && acctId!=null && acctId!='')
    {
        List<Attachment> delAtts = [select id from Attachment where id=:winzId and parentId=:acctId Limit 1];
        if(delAtts.size()>0)
        {
            delete delAtts;
        }
        
        attsWinz = [select id,Name from Attachment where parentId=:acctId and Name like 'Proof of Income-%' and CreatedDate = LAST_N_days:21 Limit 1];
        if(attsWinz.size()==0)
        {
            Account at = new Account();
            at.Id= acctId;
            at.MyGov_Final_Page__c = false;
            update at;
        }
    }
    
    //return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber+'&param=sdwz&redo='+redo).setRedirect(true);
    return new PageReference(onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&n='+randomNumber+'&param=sdwz&redo='+redo).setRedirect(true);
}

public PageReference deleteWinzIdForDocLink()
{
    String winzId = apexpages.currentpage().getparameters().get('winzId');
    system.debug('winzId: '+winzId);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(winzId!=null && winzId!='' && acctId!=null && acctId!='')
    {
        List<Attachment> delAtts = [select id from Attachment where id=:winzId and parentId=:acctId Limit 1];
        if(delAtts.size()>0)
        {
            delete delAtts;
        }
        
        attsWinz = [select id,Name from Attachment where parentId=:acctId and Name like 'Proof of Income-%' and CreatedDate = LAST_N_days:21 Limit 1];
        if(attsWinz.size()==0)
        {
            Account at = new Account();
            at.Id= acctId;
            at.MyGov_Final_Page__c = false;
            update at;
        }
    }

    return new PageReference(onlineURL+'/R4KConsentFormDocLink?id='+acctId+'&n='+randomNumber+'&param=sdwz').setRedirect(true);
}

public PageReference deleteOtherId()
{
    String otherId = apexpages.currentpage().getparameters().get('otherId');
    system.debug('otherId: '+otherId);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(otherAttId!=null && otherAttId!='' && acctId!=null && acctId!='')
    {
        List<Attachment> delAtts = [select id from Attachment where id=:otherId and parentId=:acctId Limit 1];
        if(delAtts.size()>0)
        {
            delete delAtts;
        }
    }

    return new PageReference(onlineURL+'/R4KConsentFormDocLink?id='+acctId+'&n='+randomNumber+'&param=sdot').setRedirect(true);
}

public PageReference deleteOtherIdForHybridLink()
{
    String otherId = apexpages.currentpage().getparameters().get('otherId');
    String online = apexpages.currentpage().getparameters().get('online');
    system.debug('otherId: '+otherId);
    String randomNumber=SecretUtil.generateRandomNumber();
    if(otherAttId!=null && otherAttId!='' && acctId!=null && acctId!='')
    {
        List<Attachment> delAtts = [select id from Attachment where id=:otherId and parentId=:acctId Limit 1];
        if(delAtts.size()>0)
        {
            delete delAtts;
        }
    }
     
    if(online != null && online == 'yes')
    {
        return new PageReference(onlineURL+'/R4KOnlineOtherDocs?id='+acctId+'&n='+randomNumber+'&redo='+redo).setRedirect(true);
    }else
    {
        return new PageReference(onlineURL+'/R4KOnlineApplicationForm?id='+acctId+'&n='+randomNumber+'&param=sdot').setRedirect(true);
    }
}

public PageReference saveLead()
{
    String randomNumber=SecretUtil.generateRandomNumber();
    Lead ld = new Lead();
    ld.Id = ldId;
    ld.FirstName = ldFirstName;
    ld.LastName = ldLastName;
    ld.MobilePhone = ldMobile;
    ld.Street = ldStreet;
    ld.City = ldSuburb;
    ld.State = ldState;
    ld.PostalCode = ldPostCode;
    ld.Email = ldEmail;
    ld.Reason_for_Enquiry__c = ldReasonForEnquiry;
    ld.Desired_Product__c = ldDesiredProduct;
    
    if(lead.PostalCode == null || ldPostCode <> lead.PostalCode)
    {
        Boolean isLeadFromNZ = countryVal.contains('New Zealand') || countryVal.contains('NZ');
        List<PostCode__c> postcodes = new List<PostCode__c>();
        Map<String, Default_Lead__c> mapDLobj = new Map<String, Default_Lead__c>();
        if(isLeadFromNZ)
            postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c where Name=:ldPostCode and Territory__r.State_Master_State__c='NZ'];
        else
            postcodes=[select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c where Name=:ldPostCode and Territory__r.State_Master_State__c!='NZ'];
            
        List<DEFAULT_LEAD__C> dlList=[SELECT ID,Name,Salesforce_user_id__c,starts_with__c,Territory_id__c FROM DEFAULT_LEAD__C];
        
        for(Default_Lead__c dl:dlList)
        {
            mapDLobj.put(dl.starts_with__c,dl);
        }
        
        String startsWith='';
        if(ldPostCode=='0000')
            startsWith=ldPostCode;
        else if(isLeadFromNZ)
            startsWith='NZ';
        else
            startsWith = ldPostCode <> null && ldPostCode.trim() <> '' ? ldPostCode.substring(0,1) : '';
        system.debug('startsWith: '+startsWith);
        
        if(postcodes.size()>0)
        {
            ld.OwnerId=postcodes[0].Territory__r.Owner.Id;
            ld.Territory_Number__c=postcodes[0].Territory__r.id;
        } 
        else if(ldPostCode <> null && ldPostCode.trim() <> '')
        {
            if(mapDLobj.get(startsWith).Salesforce_user_id__c!=null)
            {
                ld.OwnerId=mapDLobj.get(startsWith).Salesforce_user_id__c;
                ld.Territory_Number__c=mapDLobj.get(startsWith).Territory_id__c;
            }
        }
    }
    update ld;
    return new PageReference(onlineURL+'/R4KLeadForm?ld='+ldId+'&n='+randomNumber+'&param=saved').setRedirect(true);
}

public PageReference createRetentionLead()
{
    try
    {    
        acctId = Apexpages.currentPage().getParameters().get('id');        
        String rOffer = Apexpages.currentPage().getParameters().get('rOffer');     
        
        system.debug('acctId: '+acctId);
        
        List<Account> retentionAcctList = [SELECT Id,FirstName,LastName,PersonMobilePhone,PersonEmail,OwnerId,PersonMailingPostalCode,PersonMailingStreet,PersonMailingCity,
                                            PersonMailingState,Name,SMS_Mobile__c,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,PersonMailingCountry,
                                            BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Customer_No__c,Equifax_SMS_Consent_Received__c,
                                            Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Territory_Number__r.Short_Name__c,
                                            Is_PhotoId_Attached_After_Enquiry__c,MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,
                                            Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,
                                            Last_Agreement_Close_Date__c,RecordType.Name FROM Account WHERE Id =: acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories LIMIT 1];
        
        if(retentionAcctList.size() > 0)
        {
            List<Lead> leadList = [SELECT Id,IsConverted FROM Lead WHERE 
                                    MobilePhone =: retentionAcctList[0].PersonMobilePhone AND LastName =: retentionAcctList[0].LastName 
                                    AND Lead_Medium__c = 'Marketing to Customer' AND CreatedDate = LAST_N_DAYS:30
                                    AND Retention_Success_SMS_Type__c =: rType 
                                    AND Agreement__c = null
                                    ORDER BY CreatedDate DESC LIMIT 1];
            
            //Online Link
            String randomNumber=SecretUtil.generateRandomNumber();
            String retentionLeadId;
            String finalUrl = onlineURL+'/R4KAccountEnquiry?ld='+retentionLeadId+'&param=smp&n='+randomNumber; 
            
            if(leadList.size() == 0)
            {
                //Create Lead
                Lead rlead = new Lead();
                rlead.FirstName = retentionAcctList[0].FirstName;
                rlead.LastName = retentionAcctList[0].LastName;
                rlead.MobilePhone = retentionAcctList[0].PersonMobilePhone;
                rlead.Email = retentionAcctList[0].PersonEmail;
                rlead.OwnerId = retentionAcctList[0].OwnerId;
                rlead.Territory_Number__c = retentionAcctList[0].Territory_Number__c;
                rlead.Not_Spam__c = 'yes';
                rlead.Lead_Medium__c = 'Marketing to Customer';
                if(rType <> null && rType.trim() <> '')
                {
                    rlead.Retention_Success_SMS_Type__c = rType;
                    rlead.e_gift_Offer_Amount__c = rOffer <> null && rOffer.trim() <> '' && Decimal.valueOf(rOffer) > 0 ? Decimal.valueOf(rOffer) : null;
                }
                insert rlead;        
                retentionLeadId = rlead.Id;
                finalUrl = onlineURL+'/R4KAccountEnquiry?ld='+retentionLeadId+'&param=smp&n='+randomNumber; 
                
                ApexPages.currentPage().getParameters().put('ld',rlead.Id);
                getFormDetails();
                convertLead(lead,retentionAcctList[0]);
                //convertLead(rlead,retentionAcctList[0]);
            }else
            {
                retentionLeadId = leadList[0].Id;
                
                if(!leadList[0].IsConverted)
                {
                    finalUrl = onlineURL+'/R4KAccountEnquiry?ld='+retentionLeadId+'&param=smp&n='+randomNumber;
                    ApexPages.currentPage().getParameters().put('ld',retentionLeadId);
                    getFormDetails();
                    convertLead(lead,retentionAcctList[0]);
                    //convertLead(leadList[0],retentionAcctList[0]);
                }else
                {
                    finalUrl = onlineURL+'/R4KEnquiryLandingPage?ld='+retentionLeadId+'&n='+randomNumber;
                }
            }
            return new PageReference(finalUrl).setRedirect(true);
        }
        return null;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','createRetentionLead',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void initOnlineAcknowledgement()
{
    String currentOppId = ApexPages.CurrentPage().getParameters().get('oppId');  
    opportunity = [select Id,AccountId,Account.Name,Name,Account.PersonMailingStreet,Account.PersonMailingCity,Account.PersonMailingState,Account.PersonMobilePhone,Account.PersonEmail,Rep_responsible_for_signing_Agreement__c,
                Account.Ezidebit_Starting_Date__c,Account.Tr4k_Agreement__c,Account.Tr4k_Agreement__r.TR4K_Parent_Agreement__c,Term__c,Number_Of_SP_for_Cross_Check__c,Scheduled_Amount__c,Amount,
                Account.Tr4k_Agreement__r.TR4K_Parent_Agreement__r.Contract_No__c,Contract_No__c ,Account.Territory_Number__c,Gift_To__c,Total_AAF__c,Account.Customer_Photo_Id__c,CustomerAuthCode__c,
                Account.Tr4k_Agreement__r.Name,Account.Tr4k_Agreement__r.StageName,Payment_Frequency__c,Account.Signed_Benefit_1__c,Account.Signed_Benefit_Amount_1__c,Account.Signed_Benefit_2__c,Signed_Latitude__c,
                Account.Signed_Benefit_Amount_2__c,Account.Ezidebit_Type__c,Account.Ezidebit_Signed_Amount__c,Account.Ezidebit_Frequency__c,CurrencyISOCode,Account.OwnerId,Account.Territory_Number__r.State_Master_State__c,
                Account.Territory_Number__r.Company_Territory__c,Account.SMS_Mobile__c,No_of_days_the_Application_been_Signed__c,Is_Tax_Invoice_Signed__c,Is_Consent_Signed__c,Is_Signed_Deduction_Form_Attached__c,
                Approval_Status__c,Referees_Contacted_In_The_Last_21_Days__c,Account.AgreementId_for_Current_Enquiry__c,Account.Tr4K_Agreement__r.Trak_TopUpId__c,Account.Tr4K_Agreement__r.Amount,Ezidebit_Starting_Date__c, 
                Account.Tr4K_Agreement__r.Scheduled_Amount__c,Account.Tr4K_Agreement__r.Term_Months__c,TaxInvoice_Short_Link__c,Requirements_Objectives__c,Why_was_the_agreement_approved__c,First_Paid_Date__c,Payment_Type__c,
                Why_not_phone_plan__c,Account.Customer_No__c,Online_TaxInvoice_Signed_Datetime__c,Account.Tr4K_Agreement__r.Trak_Service_Type__c,Rep_responsible_for_signing__c,Total_RRP__c,Is_Credit_Contract__c,
                Account.Ezidebit_Bank_Account_Holder_Name__c,Account.Ezidebit_Bank_AccountNo__c,Account.Ezidebit_Bank_Branch__c,Account.Ezidebit_Bank_BSB__c,Account.Ezidebit_Financial_Institution__c,NZ_Interest_Rate__c, 
                Account.Territory_Number__r.CLO_Model__c,Account.Serviceability__c,Account.Existing_R4K_Payment__c,Account.Rent4Keeps_Payment_C__c,Account.Priority1__c,Account.Priority1_Description__c,Total_Loan_Amount__c,
                Account.Priority2__c,Account.Priority2_Description__c,Account.Priority3__c,Account.Priority3_Description__c,Account.Eligible_Date__c,Account.Fortnightly_Scheduled_Payment__c,Account.PersonMailingPostalCode,
                Account.Territory_Number__r.Short_Name__c,RecordType.Name,Account.CRN__c,Account.Territory_Number__r.Centrepay_Account__c,Sign_Consumer_Lease__c,Account.Employer_Name__c,Account.Employment_Commencement_Date__c,Account.Employment_Type__c,
                Account.FirstName,Account.LastName,Account.Marital_Status__pc,Account.AFApplicantSignatureId__c,Account.AFApplicantInitialId__c, Account.Birthdate__c,Account.Number_of_Dependants__c,TaxInvoice_Signed_DateTime__c,
                Account.ApplicantSignatureId__c,Account.ApplicantInitialId__c,Account.PersonMailingCountry,Territory_Short_Name__c,Account.Territory_Number__r.Authorised_Representative_Of__c,Account.State_Master_State__c, 
                Account.Residential_Status__c,Account.Employment_Income__c,Account.Employment_Income_Details__c,Account.Centrelink_Benefit_Amount__c,Account.Centrelink_Benefit__c,Account.Centrelink_Check__c,Account.Company_Territory__c,
                Account.Centrelink_Benefit2__c,Account.Centrelink_Benefit3_Amount__c,Account.Centrelink_Benefit3__c,Account.Other_Centrelink_Benefit_Amount__c,Account.Other_Centrelink_Benefit__c,Account.Other_Income_Amount__c,
                Account.Other_Income_Source__c,Account.Highlevel_Income__c,Account.Rent_Mortgage_Board__c,Account.Rent_Mortgage_Board_Details__c,Account.Loan_Payments__c,Account.Loan_Payment_Details__c,Account.Car_Lease_Loan_Payment__c,
                Account.Car_Lease_Loan_Payment_Details__c,Account.Credit_Card__c,Account.Credit_Card_Details__c,Account.Other_Rental_Companies__c,Account.Other_Rental_2__c,Account.Other_Rental_Company_Name__c,Account.Other_Rental_Company_2_Name__c,
                Account.Insurance__c,Account.Insurance_Details__c,Account.Utilities__c,Account.Utilities_Details__c,Account.Food__c,Account.Food_Details__c,Account.Clothing__c,Account.Clothing_Details__c,Account.Tobacco_Alcohol__c,
                Account.Tobacco_Alcohol_Details__c,Account.Mobile_Expenses__c,Account.Mobile_Expenses_Details__c,Account.Entertaiment__c,Account.Entertaiment_Details__c,Account.OtherOutgoings__c,Account.Other_Details__c,Account.Centrepay_Outgoings__c,
                Account.Centrepay_Details__c,Account.Total_R4K_Payment__c,Account.Comfortable_Spending__c,Account.Disp_Income_A_D_E__c,Total_COGS_Less_AAF__c,Applicant2InitialId__c,Applicant2SignatureId__c,SalesRepSignatureId__c,Account.Territory_Number__r.A_C_L__c,    
                Account.Territory_Number__r.Trading_Name__c,Account.SalesRepSignatureId__c,Account.Employment_Income_Check__c,Account.Centrelink_Benefit2_Amount__c,Account.Territory_Number__r.Company_Name__c,Account.Territory_Number__r.A_B_N__c,Account.Territory_Number__r.Authorised_Representative_A_C_N__c,
                Account.Territory_Number__r.A_C_N__c,TIApplicantSignatureId__c,TIApplicantInitialId__c,Applicant_2_Last_Name__c,Applicant2_First_Name__c,Applicant2__c,Applicant2__r.PersonMobilePhone,Applicant2__r.PersonEmail,Account.Territory_Number__r.State_Master_Street__c,
                Account.Territory_Number__r.State_Master_Suburb__c,Account.Territory_Number__r.State_Master_Postcode__c,Account.Territory_Number__r.Mobile__c,Account.Territory_Number__r.Email__c,Account.Territory_Number__r.Authorised_Representative_Phone__c,Account.Territory_Number__r.Authorised_Representative_Email__c,Account.Territory_Number__r.Credit_Representative_Number__c,
                Account.Territory_Number__r.Ezidebit_DigitalKey__c,Account.Territory_Number__r.Master_Territory__c,Account.Territory_Number__r.Master_Territory__r.Ezidebit_DigitalKey__c,Rep_Name__c,Rep_Name__r.Name,                        
                Account.Territory_Number__r.Street_Address__c,Account.Territory_Number__r.Street_Suburb__c,Account.Territory_Number__r.Street_State__c,Account.Territory_Number__r.Street_Postcode__c,
                Account.Is_Disability_Support_Pension__c,Account.Carer__c,Account.Carer_Full_Name__c,Account.Carer_Phone_No__c,Account.Carer_Confirmation__c,Account.Length_of_Stay_in_Current_Address__c,Account.Territory_Number__r.Name,Account.Territory_Number__r.Is_Credit_Contract__c,
                Account.Territory_Number__r.PPB_Street__c,Account.Territory_Number__r.PPB_Suburb__c,Account.Territory_Number__r.PPB_State__c,Account.Territory_Number__r.PPB_Postcode__c,Account.Loan_Purpose__c                
                from Opportunity where id =: currentOppId LIMIT 1];
    
    tavExceedsLimit = false;
    isCreditContract = opportunity.Is_Credit_Contract__c;
    territoryNo = opportunity.Account.Territory_Number__r.Name;
    isCreditContractTerritory = opportunity.Account.Territory_Number__r.Is_Credit_Contract__c;
    oppLineItems = [SELECT id,name,Actual_Per_Fortnight__c,Description,Serial_Number__c,Term_Months__c, UnitPrice, TotalPrice, 
                    Delivery_Installation_Cost__c, Accessory_Cost__c, Insurance_Cost__c, Warranty_Cost__c, Misc_other__c, 
                    Manufacturer__c, Model_Number__c, RRP__c, Total_Cost_of_Rental_Goods__c,Weighted_AAF__c, Cash_Price__c 
                    FROM OpportunityLineItem where Opportunity.Id=:opportunity.Id];
    signEzidebitStartDateString = opportunity.Account.Ezidebit_Starting_Date__c <> null ? String.valueOf(opportunity.Account.Ezidebit_Starting_Date__c.day()) + '/' + String.valueOf(opportunity.Account.Ezidebit_Starting_Date__c.month()) + '/' + String.valueOf(opportunity.Account.Ezidebit_Starting_Date__c.year()) : String.valueOf(Date.today().day()) + '/' + String.valueOf(Date.today().month()) + '/' + String.valueOf(Date.today().year());
    locationCaptured = (opportunity.Signed_Latitude__c == null || opportunity.Signed_Latitude__c == '' || opportunity.Signed_Latitude__c == 'No Location Access' ? false : true);
    onlineSigningCode =  (opportunity.CustomerAuthCode__c == null ? 'Null' : opportunity.CustomerAuthCode__c.trim());
    finishedSigning = (opportunity.Is_Tax_Invoice_Signed__c && opportunity.TaxInvoice_Signed_DateTime__c <> null ? true : false);
    
    List<Postcode__c> postcodes = [select id,name,Member_Email__c,Senators_Email__c from Postcode__c where name =: opportunity.Account.PersonMailingPostalCode and Territory__r.State_Master_state__c<>'NZ' LIMIT 1];
    mpEmail = 'noreply@rent4keeps.com.au';
    senatorEmail = 'noreply@rent4keeps.com.au';
    custNameVal = opportunity.Account.Name;
    custStreet = opportunity.Account.PersonMailingStreet;
    custSuburb  = opportunity.Account.PersonMailingCity;
    custState = opportunity.Account.PersonMailingState;
    custPostCode = opportunity.Account.PersonMailingPostalCode;
    if(postcodes.size()>0)
    {
        if(postcodes[0].Member_Email__c!=null && postcodes[0].Member_Email__c!='')
            mpEmail = postcodes[0].Member_Email__c;
        if(postcodes[0].Senators_Email__c!=null && postcodes[0].Senators_Email__c!='')
            senatorEmail = postcodes[0].Senators_Email__c;
    }
    
    Decimal rrpCalculatedTAV = 0;
    totalRRP = 0;
    totalDeliveryFee = 0;
    applicationFee = 0;
    adminFee = 0;
    totalCashPrice = 0;
    
    for(OpportunityLineItem oppLine : oppLineItems){
        if(oppLine.Description != 'Fee' && oppLine.Description != 'Varied Product' && oppLine.Description != 'Repair Product'){
            totalRRP += (oppLine.RRP__c == null ? 0 : oppLine.RRP__c);
            totalCashPrice += (oppLine.Cash_Price__c == null ? 0 : oppLine.Cash_Price__c);
            totalDeliveryFee += (oppLine.Delivery_Installation_Cost__c == null ? 0 : oppLine.Delivery_Installation_Cost__c);
            applicationFee += (oppLine.Misc_other__c == null ? 0 : oppLine.Misc_other__c);
            adminFee += (oppLine.Weighted_AAF__c == null ? 0 : oppLine.Weighted_AAF__c);
        }
    }

    /*
    if(opportunity.Account.Territory_Number__r.State_Master_State__c != 'NZ'){
        rrpCalculatedTAV = (totalRRP + totalDeliveryFee + (totalRRP * 0.0395 * opportunity.Term__c));
        tavExceedsLimit = (opportunity.Amount > (rrpCalculatedTAV + 1) ? true : false);
        System.debug('****opportunity.Amount ' + opportunity.Amount);
        System.debug('****rrpCalculatedTAV ' + rrpCalculatedTAV);
        System.debug('****tavExceedsLimit ' + tavExceedsLimit);
    }
    */
}

public void updateSigningLogs()
{
    try
    {
        String log = ApexPages.CurrentPage().getParameters().get('log');
        String consumerLease = ApexPages.CurrentPage().getParameters().get('consumerLease');
          
        List<Opportunity> opplist = [SELECT Id,Signing_Logs__c,Account.Territory_State__c FROM Opportunity WHERE Id =: opportunity.Id LIMIT 1];
        if(opplist.size() > 0)
        {            
            DateTime currentLocalDatetime = Util.getStateTimeZoneDatetime(opplist[0].Account.Territory_State__c,DateTime.now());
            String dateTimeString = currentLocalDatetime.format('dd/MM') + ' ' + currentLocalDatetime.hour() + ':' + currentLocalDatetime.minute();
            
            Opportunity opp = new Opportunity();
            opp.Id = opplist[0].Id;
            opp.Signing_Logs__c = (opplist[0].Signing_Logs__c == null ? '' : (opplist[0].Signing_Logs__c + '\n')) + log + ' - ' + dateTimeString;
            
            if(consumerLease <> null && consumerLease == 'true')
            {
                opp.Sign_Consumer_Lease__c=true;
            }else if(consumerLease <> null && consumerLease == 'false')
            {
                opp.Sign_Consumer_Lease__c=false;
            }
            
            update opp;
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateSigningLogs',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public PageReference updateSigningTime()
{
    try
    {        
        List<Opportunity> signedOppList = [SELECT Id,TaxInvoice_Signed_DateTime__c FROM Opportunity WHERE Id =: opportunity.Id LIMIT 1];
        System.debug(signedOppList);
        String randomNumber = SecretUtil.generateRandomNumber();
        String ezidebitSetupStatus;
        if(signedOppList.size() > 0 && signedOppList[0].TaxInvoice_Signed_DateTime__c == null)
        {
            if((opportunity.Payment_Type__c == 'Ezidebit' || opportunity.Payment_Type__c == 'Both') && ((opportunity.Account.Company_Territory__c && (opportunity.Account.State_Master_State__c=='VIC' || opportunity.Account.State_Master_State__c=='SA' || opportunity.Account.State_Master_State__c=='NSW' || opportunity.Account.State_Master_State__c=='WA' || opportunity.Account.State_Master_State__c=='QLD')) || (opportunity.Account.Territory_Number__r.Short_Name__c=='Greensborough')))
            {
                R4KSignController rsc = new R4KSignController();
                ezidebitSetupStatus = 'Failed';
                String ezidebitAccountHolderName = null;
                String ezidebitDigitalKey = (opportunity.Account.Territory_Number__r.Master_Territory__c == null ? opportunity.Account.Territory_Number__r.Ezidebit_DigitalKey__c : opportunity.Account.Territory_Number__r.Master_Territory__r.Ezidebit_DigitalKey__c);
                if(!Test.isRunningTest())
                {
                    ezidebitSetupStatus = rsc.setupEzidebitDeduction((opportunity.Is_Credit_Contract__c ? opportunity.Contract_No__c : null), opportunity.AccountId, null, null, null, null, null, null);
                    EzidebitPCIAPI.BasicHttpBinding_IPCIService pCIStub = new EzidebitPCIAPI.BasicHttpBinding_IPCIService();
                    pCIStub.inputHttpHeaders_x = new Map<String, String>();
                    pCIStub.endpoint_x='https://api.ezidebit.com.au/v3-5/pci';
                    EzidebitPCIAPI.EziResponseOfAccountDetailsTHgMB7oL response = pCIStub.GetCustomerAccountDetails(ezidebitDigitalKey,'',(opportunity.Is_Credit_Contract__c ? opportunity.Contract_No__c : opportunity.Account.Customer_No__c));
                    if(response.DATA!=null)
                    {
                        ezidebitAccountHolderName = response.DATA.AccountHolderName;
                        System.debug('ezidebitAccountHolderName: '+response.DATA.AccountHolderName);
                    }
                    SalesforceAppIntegration sapp = new SalesforceAppIntegration();
                    sapp.attachR4KForms(opportunity.Id,opportunity.Payment_Type__c,false,ezidebitSetupStatus,ezidebitAccountHolderName); 
                } 
            }
            else
            {
                if(!Test.isRunningTest())
                {
                    SalesforceAppIntegration sapp = new SalesforceAppIntegration();
                    sapp.attachR4KForms(opportunity.Id,opportunity.Payment_Type__c,false,null,null);
                }
            }
            
            Opportunity opp = new Opportunity();
            opp.Id = opportunity.Id;
            opp.Online_AppForm_Signed_Datetime__c = DateTime.now();
            opp.Online_TaxInvoice_Signed_Datetime__c = DateTime.now();
            opp.Online_Consent_Signed_Datetime__c = DateTime.now();
            opp.Online_Deduction_Signed_Datetime__c = DateTime.now();
            opp.Is_Sign_Link__c = true;   
            if(ezidebitSetupStatus != null){
                opp.Ezidebit_Setup_Status__c = ezidebitSetupStatus;
                opp.Ezidebit_Setup_DateTime__c = DateTime.now();
            }    
            update opp; 
            
            ApexPages.currentPage().getParameters().put('id',opportunity.Id);
            SendMailController smc = new SendMailController();
            PageReference pg = smc.sendMail();
        }
        return new PageReference(onlineURL+'/R4KOnlineAcknowledgement?sectionType=signing-completed&oppId=' + opportunity.Id + '&n=' + randomNumber).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateSigningTime',opportunity.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
} 

public void saveSignature() 
{
    try
    {
        ApexPages.currentPage().getParameters().put('id',opportunity.Id);
        SendMailController smc = new SendMailController();
        smc.sendRetailOrderRequest(opportunity.Id);
        smc.sendR4KInvoice();
        
        String signatureBody = ApexPages.CurrentPage().getParameters().get('signatureBody'); 
        String signType = ApexPages.CurrentPage().getParameters().get('signTypeValue'); 
        String type = 'applicant';
        Boolean consumerLease = opportunity.Sign_Consumer_Lease__c;
        String signatureName = signType +'_'+type+'_'+opportunity.Id+'.png';
        
        //Add Signature
        Attachment a = new Attachment();
        a.ParentId = opportunity.Id;
        a.Body = EncodingUtil.base64Decode(signatureBody);
        
        List<Folder> qfolders=[select id from Folder where name='Sign'];
        Document d=new Document();
        if(qfolders.size()>0)
        {
            d.Name=signatureName;
            d.body=a.Body;
            d.folderid=qfolders[0].Id;
            d.isPublic=true;
            insert d;
        }
        
        Opportunity opp = new Opportunity();
        opp.Id = opportunity.Id;
        
        Account acct = new Account();
        acct.Id = opportunity.AccountId;
        
        if(signType == 'signature')
        {
            opp.ApplicantSignatureId__c=d.Id;
            acct.ApplicantSignatureId__c=d.Id;
            opp.TIApplicantSignatureId__c=d.Id;
            acct.AFApplicantSignatureId__c=d.Id;
            opp.CustomerSignatureId__c=d.Id;
        }
        else if(signType == 'initial')
        {
            opp.ApplicantInitialId__c=d.Id;
            acct.ApplicantInitialId__c=d.Id;
            opp.TIApplicantInitialId__c=d.Id;
            acct.AFApplicantInitialId__c=d.Id;
        }
        /////////////////////////
        opp.Is_Purchase_Receipt_Tax_Invoice_Attached__c = true;        
        update opp;
        update acct;
    }catch(Exception e)
    {
        ApexPages.Message errorMsg = new ApexPages.Message(ApexPages.severity.Error, 'Exception: '+e);
        ApexPages.addMessage(errorMsg);
        system.debug(e);
    }
}


public PageReference validateOTP()
{
    try
    {
        String otpCode = ApexPages.CurrentPage().getParameters().get('otpCode');
        Opportunity otpOpp = [SELECT Id,CustomerAuthCode__c FROM Opportunity WHERE Id =: opportunity.Id LIMIT 1];
        if(otpCode == otpOpp.CustomerAuthCode__c)
        {
            return new PageReference(onlineURL+'/R4KOnlineAcknowledgement?sectionType=app-sign&signType=signature&otpValidated=true&oppId=' + opportunity.Id + '&n=' + DateTime.now().getTime()).setRedirect(true);
        }
        return null;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','validateOTP',opportunity.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference sendOTPCode()
{
    try
    {
        String randomNumber = SecretUtil.generateRandomNumber();
        String smsTemplate = 'Please enter the R4K code '+randomNumber+' so that you can proceed to sign. Do not share it with others.';
        List <smagicinteract__smsmagic__c> smsObjectList = new List <smagicinteract__smsmagic__c>();
        String senderId = 'r4k';
        if(opportunity.Account.SMS_Mobile__c!=null && opportunity.Account.SMS_Mobile__c!='')
        {
            smagicinteract__smsMagic__c smsObject = new smagicinteract__smsMagic__c();
            smsObject.smagicinteract__SenderId__c = senderId;
            smsObject.smagicinteract__Name__c = 'CustomerAuthCode'; // records name
            smsObject.smagicinteract__Account__c = opportunity.AccountId;
            
            smsObject.OwnerId=opportunity.Account.OwnerId;
            smsObject.smagicinteract__ObjectType__c = 'Account'; // record type
            smsObject.smagicinteract__disableSMSOnTrigger__c = 0; // this field either be 0 or 1, if you specify the value as 1 then sms will not get send but entry of sms will get create under SMS History object
            smsObject.smagicinteract__external_field__c = smagicinteract.ApexAPI.generateUniqueKey();
            smsObject.smagicinteract__PhoneNumber__c = opportunity.Account.SMS_Mobile__c;
            smsObject.smagicinteract__SMSText__c = smsTemplate;
            smsObjectList.add(smsObject);
            String response = smagicinteract.ApexAPI.pushSMSCallout(smsObjectList);
            Database.insert(smsObjectList,false);
        }
        system.debug('smsObjectList: '+smsObjectList.size());
        if(smsObjectList.size()>0)
        {
            smagicinteract__smsmagic__c obj = new smagicinteract__smsmagic__c();
            obj.Id= smsObjectList[0].Id;
            obj.smagicinteract__SMSText__c = smsObjectList[0].smagicinteract__SMSText__c!=null ? smsObjectList[0].smagicinteract__SMSText__c.replace(randomNumber,'****') : null;
            update obj;
        }
        Opportunity opp = new Opportunity();
        opp.Id = opportunity.Id;
        opp.CustomerAuthCode__c = randomNumber;
        update opp;
    
        //return new PageReference('/apex/R4KOnlineAcknowledgement?sectionType=otp-div&oppId=' + opportunity.Id).setRedirect(true);
        return new PageReference(onlineURL+'/R4KOnlineAcknowledgement?sectionType=otp-div&oppId=' + opportunity.Id + '&n=' + DateTime.now().getTime()).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','sendOTPCode',null,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void saveSigningDeviceData() 
{
    try
    {
        String deviceName = ApexPages.CurrentPage().getParameters().get('deviceName');
        String deviceType = ApexPages.CurrentPage().getParameters().get('deviceType');
        String deviceBrand = ApexPages.CurrentPage().getParameters().get('deviceBrand');
        String deviceBrowser = ApexPages.CurrentPage().getParameters().get('deviceBrowser');
        String latitude = ApexPages.CurrentPage().getParameters().get('latitude');
        String longitude = ApexPages.CurrentPage().getParameters().get('longitude');
        String address = ApexPages.CurrentPage().getParameters().get('address');       
        
        Opportunity opp = new Opportunity();
        opp.Id = opportunity.Id;
        opp.Signed_Device_Info__c = deviceBrand + ' | '+ deviceName+ ' | '+ deviceType+' | '+deviceBrowser;
        opp.Signed_Latitude__c = latitude;
        opp.Signed_Longitude__c = longitude;
        opp.Signed_Location__c = address;
        update opp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','saveSigningDeviceData',opportunity.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void initTCs(){
    String terId = ApexPages.CurrentPage().getParameters().get('terId');
    ldId = ApexPages.CurrentPage().getParameters().get('ld');
    acctId = ApexPages.CurrentPage().getParameters().get('id');

    if(acctId != null && acctId != ''){
        List<Account> accts = [SELECT Id,Territory_Number__c,PersonEmail,PersonContactId,Equifax_SMS_Consent_Received__c,State_Master_State__c,
                                Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Hybrid_Link_Status__c,Opt_out_marketing_material__c 
                                FROM Account WHERE Id = :acctId LIMIT 1];
        if(accts.size() > 0){
            acct = accts[0];
            terId = accts[0].Territory_Number__c;
            creditGuideEmail = accts[0].PersonEmail;

            List<Lead> ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Account__r.PersonEmail,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Customer_No__c,Account__r.Name,Account__r.SMS_Mobile__c,Photo_Id_Front__c,Photo_Id_Back__c,Application_Logs__c,Account__r.PersonContactId,
                                Hybrid_Link_Device_Info__c,Photo_Id_Details__c,OCR_Text__c,OCR_Back_Text__c,OCR_Address__c,Territory_Number__r.Applicant_Customer_Prefix__c,Territory_State__c,Automation_Outcome__c,Account__r.Territory_Number__c,HasOptedOutOfEmail 
                                from Lead where IsConverted = true AND Account__c = :acct.Id ORDER BY CreatedDate DESC Limit 1];
            lead = ldLst.size() > 0 ? ldLst[0] : null;
        }    
    }else if(ldId != null && ldId != ''){
         List<Lead> ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Account__r.PersonEmail,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Customer_No__c,Account__r.Name,Account__r.SMS_Mobile__c,Photo_Id_Front__c,Photo_Id_Back__c,Application_Logs__c,Account__r.PersonContactId,
                                Hybrid_Link_Device_Info__c,Photo_Id_Details__c,OCR_Text__c,OCR_Back_Text__c,OCR_Address__c,Territory_Number__r.Applicant_Customer_Prefix__c,Territory_State__c,Automation_Outcome__c,Account__r.Territory_Number__c,HasOptedOutOfEmail 
                                from Lead where id=:ldId Limit 1];
        if(ldLst.size()>0)
        {
            lead = ldLst.size() > 0 ? ldLst[0] : null;
            if(ldLst[0].Account__c != null){
                List<Account> accts = [SELECT Id,Territory_Number__c,PersonEmail,PersonContactId,Equifax_SMS_Consent_Received__c,State_Master_State__c,
                                        Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Hybrid_Link_Status__c,Opt_out_marketing_material__c 
                                        FROM Account WHERE Id = :ldLst[0].Account__c LIMIT 1];
                if(accts.size() > 0){
                    acct = accts[0];
                    acctId = acct.Id;
                    terId = accts[0].Territory_Number__c;
                    creditGuideEmail = accts[0].PersonEmail;
                }
            }else{
                terId = ldLst[0].Territory_Number__c;
                creditGuideEmail = ldLst[0].Email;
            }
        }
    }
    if(terId != null && terId != ''){
        oppTerritory = [SELECT Id,Name,Company_Territory__c,Authorised_Representative_Of__c,Company_Name__c,Trading_Name__c,A_C_N__c,A_C_L__c,State_Master_State__c,
                        State_Master_Street__c,State_Master_Suburb__c,State_Master_Postcode__c,Authorised_Representative_Phone__c,Authorised_Representative_Email__c,
                        Mobile__c,Email__c,Credit_Representative_Number__c,Authorised_Representative_A_C_N__c,A_B_N__c, 
                        Street_Address__c,Street_Suburb__c,Street_State__c,Street_Postcode__c,
                        PPB_Street__c,PPB_Suburb__c,PPB_State__c,PPB_Postcode__c
                        FROM Territory__c WHERE Id =: terId];
        isCompanyTerritory = oppTerritory.Company_Territory__c;
        stateMasterState = oppTerritory.State_Master_State__c;
    }
}

public PageReference sendCreditGuideEmail(){
    try{
        String optInMarketing = ApexPages.CurrentPage().getParameters().get('optInMarketing');
        Messaging.reserveSingleEmailCapacity(2);
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        List<Messaging.Emailfileattachment> emailAttachmentList = new List<Messaging.Emailfileattachment>();
        List<Attachment> attachmentList = new List<Attachment>();
        
        PageReference pdf;
        Blob pdfBlob;
        String pdfname;
        String fileType;
        Attachment attach;
        Messaging.Emailfileattachment efa;

        if(lead != null){
            pdf = new PageReference(onlineURL + '/R4KCreditGuide?renderAs=pdf&ld=' + ldId);        
            try {
                pdfBlob = pdf.getContentAsPDF();  
            } catch (VisualforceException e) {
                pdfBlob = Blob.valueOf('Some Text');
            }
            pdfname = 'R4K Credit Guide.pdf';
            fileType = 'pdf';
            
            attach = new Attachment();
            attach.ParentId = lead.Id;
            attach.body = pdfBlob;
            attach.Name = pdfname; 
            attachmentList.add(attach);
            
            efa = new Messaging.Emailfileattachment();
            efa.setFileName(pdfname);
            efa.setBody(pdfBlob);
            emailAttachmentList.add(efa);
            
            pdf = new PageReference(onlineURL + '/R4KPrivacyStatement?renderAs=pdf&ld=' + ldId + '&optInMarketing=' + optInMarketing);        
            try {
                pdfBlob = pdf.getContentAsPDF();  
            } catch (VisualforceException e) {
                pdfBlob = Blob.valueOf('Some Text');
            }
            pdfname = 'R4K Privacy Statement.pdf';
            fileType = 'pdf';
            
            attach = new Attachment();
            attach.ParentId = lead.Id;
            attach.body = pdfBlob;
            attach.Name = pdfname; 
            attachmentList.add(attach);
            
            efa = new Messaging.Emailfileattachment();
            efa.setFileName(pdfname);
            efa.setBody(pdfBlob);
            emailAttachmentList.add(efa);
            
            String emailBody = 'Please find the attached R4K Credit Guide & Privacy Statement';
            String emailSubject = 'R4K Credit Guide & Privacy Statement';
            
            OrgWideEmailAddress owa = [select id, Address, DisplayName from OrgWideEmailAddress where DisplayName='Rent4Keeps Noreply' LIMIT 1];
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(emailSubject);
            email.setToAddresses(new List<String>{creditGuideEmail});
            email.setHtmlBody(emailBody);
            email.setFileAttachments(emailAttachmentList);
            email.setTargetObjectId(lead.Id);
            //email.setWhatId(lead.Id);
            email.setSaveAsActivity(true);
            email.setUseSignature(false);
            email.setTreatTargetObjectAsRecipient(false);
            email.setOrgWideEmailAddressId(owa.Id);
            emails.add(email);
            Messaging.sendEmail(emails);

            Lead creditLead = new Lead();
            creditLead.Id = lead.Id;
            creditLead.Credit_Check_Consent__c = true;
            creditLead.HasOptedOutOfEmail = (optInMarketing == 'yes' ? false : true);
            update creditLead;
            
            insert attachmentList;
            
            return new PageReference(onlineURL + '/R4KProductSummary?redo=yes&ld=' + lead.Id).setRedirect(true);
        }
        return null;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','sendCreditGuideEmail',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void updateEmployment()
{
    try
    {
        Decimal fnightlyEmploymentManual = (Apexpages.currentPage().getParameters().get('fnightlyEmploymentManual') <> null && Apexpages.currentPage().getParameters().get('fnightlyEmploymentManual') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('fnightlyEmploymentManual')) : 0;
        String employerName = Apexpages.currentPage().getParameters().get('employerName');
        String employmentType = Apexpages.currentPage().getParameters().get('employmentType');
        String employmentDate = Apexpages.currentPage().getParameters().get('employmentDate');
        
        Integer employmentday = Integer.valueOf(employmentDate.split('/')[0]);
        Integer employmentmonth = Integer.valueOf(employmentDate.split('/')[1]);
        Integer employmentyear = Integer.valueOf(employmentDate.split('/')[2]);
        
        Account tempAccount = [SELECT Id,Employment_Income_Details__c,Employment_Income__c FROM Account WHERE Id =: acctId LIMIT 1];
        
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Employment_Income__c = fnightlyEmploymentManual;
        accountToUp.Employer_Name__c = employerName;
        accountToUp.Employment_Type__c = employmentType;
        accountToUp.Employment_Commencement_Date__c = Date.newInstance(employmentyear,employmentmonth,employmentday);
        if(tempAccount.Employment_Income_Details__c == null || !tempAccount.Employment_Income_Details__c.containsIgnoreCase('Customer agreed with employment income from bank statement') || (tempAccount.Employment_Income__c == null) || (fnightlyEmploymentManual <> tempAccount.Employment_Income__c))
        {
            accountToUp.Employment_Income_Details__c = 'Customer manually entered employment income - $' + fnightlyEmploymentManual + '.';
        }
        accountToUp.Next_Online_Step_Param__c = (clinkBenefitsJSON == '' ? 'cbenincag' : 'cbenag');
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        List<Decimal> incomeExpense = getIncomeExpense('employment',fnightlyEmploymentManual);
        accountToUp.Highlevel_Income__c = incomeExpense[0];
        accountToUp.Comfortable_Spending__c = incomeExpense[1];
        accountToUp.Serviceability__c = incomeExpense[2];
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateEmployment',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}


public void updateEmploymentIncome()
{
    try
    {
        Decimal fnightlyEmployment = (Apexpages.currentPage().getParameters().get('fnightlyEmployment') <> null && Apexpages.currentPage().getParameters().get('fnightlyEmployment') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('fnightlyEmployment')) : 0;
        String employmentAgree = Apexpages.currentPage().getParameters().get('employmentAgree');
        
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Employment_Income__c = fnightlyEmployment;
        accountToUp.Employment_Income_Details__c = (employmentAgree == 'yes' ? 'Customer agreed with employment income from bank statement' : 'Customer manually entered employment income') + ' - $' + fnightlyEmployment + '.\nBank Statement Emplyment Income - $' + mogoEmployment + '.';
        accountToUp.Next_Online_Step_Param__c = 'employment';
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        List<Decimal> incomeExpense = getIncomeExpense('employment',fnightlyEmployment);
        accountToUp.Highlevel_Income__c = incomeExpense[0];
        accountToUp.Comfortable_Spending__c = incomeExpense[1];
        accountToUp.Serviceability__c = incomeExpense[2];
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateEmploymentIncome',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateBoardingIncome()
{
    try
    {
        String incomeOtherSharingName = Apexpages.currentPage().getParameters().get('incomeOtherSharingName');
        String incomeOtherSharingNumber = Apexpages.currentPage().getParameters().get('incomeOtherSharingNumber');
        String incomeOtherSharingRelation = Apexpages.currentPage().getParameters().get('incomeOtherSharingRelation');
        String incomeOtherSharingContact = Apexpages.currentPage().getParameters().get('incomeOtherSharingContact');
        String incomeOtherSharingReferee = Apexpages.currentPage().getParameters().get('incomeOtherSharingReferee');

        Account tempAccount = [SELECT Id,Other_Income_Details__c FROM Account WHERE Id =: acctId LIMIT 1];
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Other_Income_Details__c = (tempAccount.Other_Income_Details__c == null ? '' : tempAccount.Other_Income_Details__c + '\n') + (incomeOtherSharingName + ' can confirm the income. Relation - ' + incomeOtherSharingRelation + '. Mobile - ' + incomeOtherSharingNumber + '.');
        accountToUp.Next_Online_Step_Param__c = 'ref';
        accountToUp.CAM_Income__c = true;
        //accountToUp.Income_Online__c = true;
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        
        if(incomeOtherSharingReferee == 'yes' || incomeOtherSharingReferee == 'on')
        {
            Apexpages.currentPage().getParameters().put('rfirstName',incomeOtherSharingName.split(' ')[0]);
            Apexpages.currentPage().getParameters().put('rlastName',incomeOtherSharingName.split(' ').size() > 1 ? incomeOtherSharingName.split(' ')[1] : incomeOtherSharingName.split(' ')[0]);
            Apexpages.currentPage().getParameters().put('rphone',incomeOtherSharingNumber);
            Apexpages.currentPage().getParameters().put('relation',incomeOtherSharingRelation);
            addReferee();
        }
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateBoardingIncome',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void confirmOtherIncome(){
    Decimal fnightlyOtherInc = (Apexpages.currentPage().getParameters().get('fnightlyOtherInc') <> null && Apexpages.currentPage().getParameters().get('fnightlyOtherInc') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('fnightlyOtherInc')) : 0;
    String otherIncAgree = Apexpages.currentPage().getParameters().get('otherIncAgree');
    
    Account accountToUp = new Account();
    accountToUp.Id = acctId;
    accountToUp.Other_Income_Amount__c = fnightlyOtherInc;
    accountToUp.Other_Income_Details__c = 'Other - ' + (otherIncAgree == 'yes' ? 'Customer agreed with bank statement other income $' + otherInc + '.' : 'Customer manually entered other income $' + fnightlyOtherInc + '.\nBank Statement other income - $' + otherInc + '.');
    //accountToUp.CAM_Income__c = true;
    //accountToUp.Income_Online__c = true;
    accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
    List<Decimal> incomeExpense = getIncomeExpense('other income',fnightlyOtherInc);
    accountToUp.Highlevel_Income__c = incomeExpense[0];
    accountToUp.Comfortable_Spending__c = incomeExpense[1];
    accountToUp.Serviceability__c = incomeExpense[2];
    update accountToUp;
}

public void updateOtherIncome()
{
    try
    {
        Decimal fnightlyIncomeOther = (Apexpages.currentPage().getParameters().get('fnightlyIncomeOther') <> null && Apexpages.currentPage().getParameters().get('fnightlyIncomeOther') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('fnightlyIncomeOther')) : 0;
        String incomeOtherSource = Apexpages.currentPage().getParameters().get('incomeOtherSource');
        String incomeOtherVerify = Apexpages.currentPage().getParameters().get('incomeOtherVerify');

        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        if(otherInc <= 0){
            accountToUp.Other_Income_Amount__c = fnightlyIncomeOther;
            accountToUp.Other_Income_Details__c = 'Customer manually entered other income.\nOther Income Amount - $' + fnightlyIncomeOther + '.\nOther Income Source - ' + incomeOtherSource + '.';
        }else{
            Account tempAccount = [SELECT Id,Other_Income_Details__c FROM Account WHERE Id =: acctId LIMIT 1];
            accountToUp.Other_Income_Details__c = ((tempAccount.Other_Income_Details__c == null ? '' : tempAccount.Other_Income_Details__c + '\n') + 'Other Income Source - ' + incomeOtherSource + '.');
        }
        accountToUp.Other_Income_Source__c = incomeOtherSource;
        accountToUp.Next_Online_Step_Param__c = 'boardingag';
        accountToUp.CAM_Income__c = true;
        //accountToUp.Income_Online__c = true;
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        List<Decimal> incomeExpense = getIncomeExpense('other income',fnightlyIncomeOther);
        accountToUp.Highlevel_Income__c = incomeExpense[0];
        accountToUp.Comfortable_Spending__c = incomeExpense[1];
        accountToUp.Serviceability__c = incomeExpense[2];
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateOtherIncome',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateTransferRelationship(){
    String transferRelationship = Apexpages.currentPage().getParameters().get('transferRelationship');
    
    Account accountToUp = new Account();
    accountToUp.Id = acctId;
    accountToUp.External_Transfer_Relationship__c = 'Number of external transfers - ' + externalTransferTransactionCount + '\n' + 'Total External Transfers - $' + externalTransferDebitCount + '\n Customer selected the relationship of these transfers as follows : ' + transferRelationship;
    accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
    update accountToUp;
}


public void sendPUASMS(String smsGroup, String reasonForDN){
    String smsSenderId = 'r4k';
    String smsTemplateForCust;
    if(smsGroup == 'PUA-Declined'){
        smsSenderId = '61488884542';
        smsTemplateForCust = 'Sorry ' + acct.FirstName + ', your application was declined due to ' + reasonForDN + '. Reply \'HELP\' for support.';
    }else if(smsGroup == 'PUA-Approved'){
        smsTemplateForCust = 'Great news, ' + acct.FirstName + '! Your Preliminary Unsuitability Assessment passed. Your credit provider will contact you for final steps. Stay tuned!';
    }
    CommunicationUtil.sendSMS(acct.SMS_Mobile__c, smsTemplateForCust, smsGroup, 'Account', acct.Id, acct.ownerId, false, smsSenderId);
}

public Pagereference acceptPOATerms(){
    String poaTerm1 = Apexpages.currentPage().getParameters().get('poaTerm1');
    String poaTerm2 = Apexpages.currentPage().getParameters().get('poaTerm2');
    String poaTerm3 = Apexpages.currentPage().getParameters().get('poaTerm3');
    String poaTerm4 = Apexpages.currentPage().getParameters().get('poaTerm4');
    String poaTerm5 = Apexpages.currentPage().getParameters().get('poaTerm5');
    String poaTerm6 = Apexpages.currentPage().getParameters().get('poaTerm6');

    try{
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.PUA_Term_1__c = (poaTerm1 == 'yes' ? true : false);
        accountToUp.PUA_Term_2__c = (poaTerm2 == 'yes' ? true : false);
        accountToUp.PUA_Term_3__c = (poaTerm3 == 'yes' ? true : false);
        accountToUp.PUA_Term_4__c = (poaTerm4 == 'yes' ? true : false);
        accountToUp.PUA_Term_5__c = (poaTerm5 == 'yes' ? true : false);
        accountToUp.PUA_Term_6__c = (poaTerm6 == 'yes' ? true : false);
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        accountToUp.PUA_Status_DateTime__c = DateTime.now();
        accountToUp.PUA_Declined_Reason__c = null;
        accountToUp.PUA_Status__c = 'In Progress';
        accountToUp.Reason_why_application_did_not_go_ahead__c = null;
        String ramAssessment = 'Declined';

        PUA__c pua = new PUA__c();
        pua.Account__c = acctId;
        pua.Applicant_First_Name__c = acct.FirstName;
        pua.Enquiry_Date__c = acct.Enquiry_Date__c;
        pua.Enquiry_Status__c = acct.Enquiry_Status__c;
        pua.Territory__c = acct.Probable_Territory__c;
        pua.OwnerId = acct.Probable_Territory__r.OwnerId;

        if(accountToUp.PUA_Term_1__c && accountToUp.PUA_Term_2__c && accountToUp.PUA_Term_3__c && accountToUp.PUA_Term_4__c && accountToUp.PUA_Term_5__c && accountToUp.PUA_Term_6__c){
            ramAssessment = initialRAMAssessment(acctId);
            if(ramAssessment == 'Approved'){
                accountToUp.PUA_Status__c = ramAssessment;

                pua.Status__c = 'Approved';
            }else{
                accountToUp.PUA_Status__c = 'Declined';
                accountToUp.PUA_Declined_Reason__c = ramAssessment;
                accountToUp.Hybrid_Link_Finish_Datetime__c = Datetime.now();
                accountToUp.Reason_why_application_did_not_go_ahead__c = ('Hybrid Application - \n' + accountToUp.PUA_Declined_Reason__c);
                accountToUp.Enquiry_Status__c = (accountToUp.PUA_Declined_Reason__c.containsIgnoreCase('10% of income') ? 'DNS - Did Not Service' : 'DNQ - Did Not Qualify');
                
                pua.Failed_Reason__c = accountToUp.Reason_why_application_did_not_go_ahead__c;
                pua.Enquiry_Status__c = accountToUp.Enquiry_Status__c;
                pua.Status__c = 'Declined';
            }
        }else{
            accountToUp.PUA_Status__c = 'Declined';
            accountToUp.PUA_Declined_Reason__c = 'Customer declined the Responsible Lending Acknowledgement Terms.';
            accountToUp.Hybrid_Link_Finish_Datetime__c = Datetime.now();
            accountToUp.Reason_why_application_did_not_go_ahead__c = ('Hybrid Application - \n' + accountToUp.PUA_Declined_Reason__c);
            accountToUp.Enquiry_Status__c = 'DNQ - Did Not Qualify';

            pua.Failed_Reason__c = accountToUp.Reason_why_application_did_not_go_ahead__c;
            pua.Enquiry_Status__c = accountToUp.Enquiry_Status__c;
            pua.Status__c = 'Declined';
        }

        update accountToUp;
        insert pua;

        sendPUASMS(('PUA-' + pua.Status__c), accountToUp.Reason_why_application_did_not_go_ahead__c);
        if(ramAssessment == '' || ramAssessment == 'Approved'){
            return new Pagereference(onlineURL + '/R4KPUAAcknowledgement?id='+acctId).setRedirect(true);
        }else{
            return new Pagereference(onlineURL + '/R4KPUADeclined?id='+acctId).setRedirect(true);
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','acceptPOATerms',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference acceptAcknowledgement(){
    Savepoint sp = Database.setSavePoint();
    try{
        String acceptOrDecline = Apexpages.currentPage().getParameters().get('acceptOrDecline');
        
        if(acceptOrDecline == 'decline'){
            Account accountToUp = new Account();
            accountToUp.Id = acctId;
            accountToUp.PUA_Status__c = 'Declined';
            accountToUp.PUA_Declined_Reason__c = 'Customer chose to decline the Credit Proposal & Preliminary Unsuitability Assessment.';
            accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
            accountToUp.PUA_Status_DateTime__c = DateTime.now();
            accountToUp.Reason_why_application_did_not_go_ahead__c = ('Hybrid Application - \n' + accountToUp.PUA_Declined_Reason__c);
            accountToUp.Enquiry_Status__c = 'DNQ - Did Not Qualify';
            update accountToUp;

            PUA__c pua = new PUA__c();
            pua.Account__c = acctId;
            pua.Applicant_First_Name__c = acct.FirstName;
            pua.Enquiry_Date__c = acct.Enquiry_Date__c;
            pua.Territory__c = acct.Probable_Territory__c;
            pua.Failed_Reason__c = accountToUp.Reason_why_application_did_not_go_ahead__c;
            pua.Enquiry_Status__c = accountToUp.Enquiry_Status__c;
            pua.Status__c = 'Declined';
            pua.OwnerId = acct.Probable_Territory__r.OwnerId;
            insert pua;

            sendPUASMS('PUA-Declined', accountToUp.Reason_why_application_did_not_go_ahead__c);

            return new Pagereference(onlineURL + '/R4KPUADeclined?id='+acctId).setRedirect(true);
        }else{
            //transfer to credit provider
            Id masterAcctId = acctId;
            if(acct.Territory_Number__r.Name == '1000'){
                masterAcctId = AccountUtil.transferToCreditProvider(acctId);
            }
            //send acknowledgement, credit guide, privacy statements
            R4KOnlineApplicationController.sendAcknowledgementAndCreditGuide(masterAcctId);
            return new Pagereference(onlineURL + '/R4KPUACompletion?id='+masterAcctId).setRedirect(true);
        }
    }catch(Exception ex){
        Database.rollback(sp);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','acceptAcknowledgement',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

@future(callout=true)
public static void sendAcknowledgementAndCreditGuide(String masterAcctId){
    //Savepoint sp = Database.setSavePoint();
    try{
        if(masterAcctId != null){
            Account masterAcct = [SELECT Id,PersonContactId,PersonEmail,Opt_out_marketing_material__c FROM Account WHERE Id = :masterAcctId LIMIT 1];
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
            List<Messaging.Emailfileattachment> emailAttachmentList = new List<Messaging.Emailfileattachment>();
            List<Attachment> attachmentList = new List<Attachment>();
            
            PageReference pdf;
            Blob pdfBlob;
            String pdfname;
            String fileType;
            Attachment attach;
            Messaging.Emailfileattachment efa;
            
            pdf = new PageReference(SiteEndpoint__c.getValues('Online').URL__c + '/R4KPUAAcknowledgementPDF?renderAs=pdf&id=' + masterAcct.Id);        
            try {
                pdfBlob = pdf.getContentAsPDF();  
            } catch (VisualforceException e) {
                pdfBlob = Blob.valueOf('Some Text');
            }
            pdfname = 'R4K Credit Proposal & Preliminary Unsuitability Assessment.pdf';
            fileType = 'pdf';
            
            attach = new Attachment();
            attach.ParentId = masterAcct.Id;
            attach.body = pdfBlob;
            attach.Name = pdfname; 
            attachmentList.add(attach);
            
            efa = new Messaging.Emailfileattachment();
            efa.setFileName(pdfname);
            efa.setBody(pdfBlob);
            emailAttachmentList.add(efa);
            
            String emailBody = 'Please find the attached R4K Credit Proposal & Preliminary Unsuitability Assessment';
            String emailSubject = 'R4K Credit Proposal & Preliminary Unsuitability Assessment';
            
            OrgWideEmailAddress owa = [select id, Address, DisplayName from OrgWideEmailAddress where DisplayName='Rent4Keeps Noreply' LIMIT 1];
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(emailSubject);
            email.setToAddresses(new List<String>{masterAcct.PersonEmail});
            email.setHtmlBody(emailBody);
            email.setFileAttachments(emailAttachmentList);
            email.setTargetObjectId(masterAcct.PersonContactId);
            //email.setWhatId(lead.Id);
            email.setSaveAsActivity(true);
            email.setUseSignature(false);
            email.setTreatTargetObjectAsRecipient(false);
            email.setOrgWideEmailAddressId(owa.Id);
            emails.add(email);

            emailAttachmentList = new List<Messaging.Emailfileattachment>();
            emailBody = 'Please find the attached R4K Credit Guide & Privacy Statement';
            emailSubject = 'R4K Credit Guide & Privacy Statement';

            String optInMarketing = (masterAcct.Opt_out_marketing_material__c ? 'no' : 'yes');
            pdf = new PageReference(SiteEndpoint__c.getValues('Online').URL__c + '/R4KCreditGuide?renderAs=pdf&id=' + masterAcctId);        
            try {
                pdfBlob = pdf.getContentAsPDF();  
            } catch (VisualforceException e) {
                pdfBlob = Blob.valueOf('Some Text');
            }
            pdfname = 'R4K Credit Guide.pdf';
            fileType = 'pdf';
            
            attach = new Attachment();
            attach.ParentId = masterAcctId;
            attach.body = pdfBlob;
            attach.Name = pdfname; 
            attachmentList.add(attach);
            
            efa = new Messaging.Emailfileattachment();
            efa.setFileName(pdfname);
            efa.setBody(pdfBlob);
            emailAttachmentList.add(efa);
            
            pdf = new PageReference(SiteEndpoint__c.getValues('Online').URL__c + '/R4KPrivacyStatement?renderAs=pdf&id=' + masterAcctId + '&optInMarketing=' + optInMarketing);        
            try {
                pdfBlob = pdf.getContentAsPDF();  
            } catch (VisualforceException e) {
                pdfBlob = Blob.valueOf('Some Text');
            }
            pdfname = 'R4K Privacy Statement.pdf';
            fileType = 'pdf';
            
            attach = new Attachment();
            attach.ParentId = masterAcctId;
            attach.body = pdfBlob;
            attach.Name = pdfname; 
            attachmentList.add(attach);
            
            efa = new Messaging.Emailfileattachment();
            efa.setFileName(pdfname);
            efa.setBody(pdfBlob);
            emailAttachmentList.add(efa);
            
            email = new Messaging.SingleEmailMessage();
            email.setSubject(emailSubject);
            email.setToAddresses(new List<String>{masterAcct.PersonEmail});
            email.setHtmlBody(emailBody);
            email.setFileAttachments(emailAttachmentList);
            email.setTargetObjectId(masterAcct.PersonContactId);
            //email.setWhatId(lead.Id);
            email.setSaveAsActivity(true);
            email.setUseSignature(false);
            email.setTreatTargetObjectAsRecipient(false);
            email.setOrgWideEmailAddressId(owa.Id);
            emails.add(email);
            Messaging.sendEmail(emails);

            insert attachmentList;

            Account accountToUp = new Account();
            accountToUp.Id = masterAcctId;
            accountToUp.Equifax_SMS_Consent_Received__c = true;
            accountToUp.Equifax_Consent_Received_DateTime__c = Datetime.now();
            accountToUp.Hybrid_Link_Finish_Datetime__c = Datetime.now();
            update accountToUp;
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','sendAcknowledgementAndCreditGuide',masterAcctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        //Database.rollback(sp);
    }
}

public String initialRAMAssessment(String ramAcctId){
    String poaAssessment = '';
    Integer noOfDishonours = 0;
    Account ramAcct = [SELECT Id,Avg_No_of_Days_for_Income_Depletion__c,Bankruptcy_Part_9_Agreements__c,Equifax_No_of_Unpaid_Default_Rental__c,Rent4Keeps_Payment_C__c,Highlevel_Income__c 
                        FROM Account WHERE Id = :ramAcctId LIMIT 1];
    List<BankStatement_Generic_Category__c> bankGenCategList = [SELECT Id,Debit_Amount__c,Transaction_Count__c,Name 
                        FROM BankStatement_Generic_Category__c WHERE 
                        Name in ('Dishonours','Gambling','Debt Collection','Debt Consolidation','Overdrawn') AND 
                        BankStatement_R4K_Category__r.Account__c = :ramAcctId AND CreatedDate = LAST_N_DAYS:30];

    for(BankStatement_Generic_Category__c bankGenCateg : bankGenCategList){
        if(bankGenCateg.Name == 'Dishonours'){
            noOfDishonours++;
        }
    }
    if(ramAcct.Avg_No_of_Days_for_Income_Depletion__c == null || ramAcct.Avg_No_of_Days_for_Income_Depletion__c < 1){
        poaAssessment += (('Income Depletion Days - ') + ramAcct.Avg_No_of_Days_for_Income_Depletion__c + '\n');
    }
    if(noOfDishonours > 0){
        poaAssessment += (('Number of Dishonours - ') + noOfDishonours + '\n');
    }
    if(ramAcct.Highlevel_Income__c == null || ramAcct.Rent4Keeps_Payment_C__c == null || (ramAcct.Rent4Keeps_Payment_C__c / ramAcct.Highlevel_Income__c) > 0.1){
        poaAssessment += (('Instalment payment is > 10% of income ') + (ramAcct.Rent4Keeps_Payment_C__c + '/' + ramAcct.Highlevel_Income__c) + '\n');
    }
    if(ramAcct.Equifax_No_of_Unpaid_Default_Rental__c != null && ramAcct.Equifax_No_of_Unpaid_Default_Rental__c > 0){
        poaAssessment += ('Customer has rental defaults\n');
    }
    if(ramAcct.Bankruptcy_Part_9_Agreements__c != null && ramAcct.Bankruptcy_Part_9_Agreements__c == 'Yes'){
        poaAssessment += ('Customer is bankrupt\n');
    }
    if(poaAssessment == ''){
        poaAssessment = 'Approved';
    }
    return poaAssessment;
}

public void updateCentrelinkBenefit()
{
    try
    {
        Integer clinkBenefitIndex = (Apexpages.currentPage().getParameters().get('clinkBenefitIndex') <> null && Apexpages.currentPage().getParameters().get('clinkBenefitIndex') != '') ? Integer.valueOf(Apexpages.currentPage().getParameters().get('clinkBenefitIndex')) : 0;
        String clinkBenefitName = Apexpages.currentPage().getParameters().get('clinkBenefitName');
        Decimal cbenIncome = (Apexpages.currentPage().getParameters().get('cbenIncome') <> null && Apexpages.currentPage().getParameters().get('cbenIncome') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('cbenIncome')) : 0;
        String cbenAgree = Apexpages.currentPage().getParameters().get('cbenAgree');
        Account tempAccount = [SELECT Id,Mygov_Payment_Details__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c,Centrelink_Benefit2__c,Centrelink_Benefit2_Amount__c,Centrelink_Benefit3__c,Centrelink_Benefit3_Amount__c FROM Account WHERE Id =: acctId LIMIT 1];
        List<Decimal> incomeExpense;
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        if(clinkBenefitIndex == 0)
        {
            accountToUp.Centrelink_Benefit__c = clinkBenefitName;
            accountToUp.Centrelink_Benefit_Amount__c = cbenIncome;
            accountToUp.Mygov_Payment_Details__c = (tempAccount.Mygov_Payment_Details__c == null ? clinkBenefitName + '\n\r' : tempAccount.Mygov_Payment_Details__c + '\n\r' + clinkBenefitName + '\n\r') + (cbenAgree == 'yes' ? 'Customer agreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) : (cbenAgree == 'man' ? 'Customer manually entered $' : ('Customer disagreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) + ' and manually entered $')) + cbenIncome);
            incomeExpense = getIncomeExpense('cben1',cbenIncome);
        }
        else if(clinkBenefitIndex == 1)
        {
            accountToUp.Centrelink_Benefit2__c = clinkBenefitName;
            accountToUp.Centrelink_Benefit2_Amount__c = cbenIncome;
            accountToUp.Mygov_Payment_Details__c = (tempAccount.Mygov_Payment_Details__c == null ? clinkBenefitName + '\n\r' : tempAccount.Mygov_Payment_Details__c + '\n\r' + clinkBenefitName + '\n\r') + (cbenAgree == 'yes' ? 'Customer agreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) : (cbenAgree == 'man' ? 'Customer manually entered $' : ('Customer disagreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) + ' and manually entered $')) + cbenIncome);
            incomeExpense = getIncomeExpense('cben2',cbenIncome);
        }
        else if(clinkBenefitIndex == 2)
        {
            accountToUp.Centrelink_Benefit3__c = clinkBenefitName;
            accountToUp.Centrelink_Benefit3_Amount__c = cbenIncome;
            accountToUp.Mygov_Payment_Details__c = (tempAccount.Mygov_Payment_Details__c == null ? clinkBenefitName + '\n\r' : tempAccount.Mygov_Payment_Details__c + '\n\r' + clinkBenefitName + '\n\r') + (cbenAgree == 'yes' ? 'Customer agreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) : (cbenAgree == 'man' ? 'Customer manually entered $' : ('Customer disagreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) + ' and manually entered $')) + cbenIncome);
            incomeExpense = getIncomeExpense('cben3',cbenIncome);
        }
        else if(clinkBenefitIndex == 3)
        {
            accountToUp.Other_Centrelink_Benefit__c = clinkBenefitName;
            accountToUp.Other_Centrelink_Benefit_Amount__c = cbenIncome;
            accountToUp.Mygov_Payment_Details__c = (tempAccount.Mygov_Payment_Details__c == null ? clinkBenefitName + '\n\r' : tempAccount.Mygov_Payment_Details__c + '\n\r' + clinkBenefitName + '\n\r') + (cbenAgree == 'yes' ? 'Customer agreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) : (cbenAgree == 'man' ? 'Customer manually entered $' : ('Customer disagreed with mygov value $' + clinkBenefitMap.get(clinkBenefitName) + ' and manually entered $')) + cbenIncome);
            incomeExpense = getIncomeExpense('cben4',cbenIncome);
        }
        accountToUp.Next_Online_Step_Param__c = 'clinkben';
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        accountToUp.Highlevel_Income__c = incomeExpense[0];
        accountToUp.Comfortable_Spending__c = incomeExpense[1];
        accountToUp.Serviceability__c = incomeExpense[2];
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateCentrelinkBenefit',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateConsumerLeaseDetails()
{
    try
    {
        String whyConsumerLease = Apexpages.currentPage().getParameters().get('whyConsumerLease');
        String benefitsOfConsumerLease = Apexpages.currentPage().getParameters().get('benefitsOfConsumerLease');
        
        Lead ldToUp = new Lead();
        ldToUp.Id = ldId;
        ldToUp.Why_use_a_Sale_of_Goods_by_Instalment__c = whyConsumerLease;
        ldToUp.Benefit_of_Sale_of_Goods_by_Instalment__c = benefitsOfConsumerLease;
        ldToUp.RO_Online__c = true;
        update ldToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateConsumerLeaseDetails',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateProductDetails()
{
    try
    {
        String prodRequirement = Apexpages.currentPage().getParameters().get('prodRequirement');
        String prodName = Apexpages.currentPage().getParameters().get('prodName');
        String prodObjective = Apexpages.currentPage().getParameters().get('prodObjective');
        String productRequirement = Apexpages.currentPage().getParameters().get('productRequirement');
        
        Lead ldToUp = new Lead();
        ldToUp.Id = ldId;
        ldToUp.Product_Interested_In__c = prodRequirement;
        ldToUp.Product_Name_for_Agreement__c = prodName;
        ldToUp.Product_Requirements__c = prodObjective;
        ldToUp.Requirements_and_Objectives__c = productRequirement;
        ldToUp.Loan_Purpose__c = ('I am looking to purchase the following ' + prodRequirement.toLowerCase() + ' which is a ' + prodName.toLowerCase() + '.\n' + 'I would like to purchase this product because ' + prodObjective.toLowerCase() + '.\n' + 'To purchase this product I require a sale of goods by instalment as ' + productRequirement.toLowerCase());
        update ldToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateProductDetails',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateExpenseSummaryDetails()
{
    try
    {
        String type = Apexpages.currentPage().getParameters().get('type');
        String amount = Apexpages.currentPage().getParameters().get('amt');
        String details = Apexpages.currentPage().getParameters().get('details');
                
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        
        String description = 'Updated amount to $'+amount+' - '+details;
        if(type=='Rent')
        {
            accountToUp.Rent_Mortgage_Board__c = Decimal.valueOf(amount);
            accountToUp.Rent_Mortgage_Board_Details__c = acct.Rent_Mortgage_Board_Details__c+'\n'+description;
        }
        else if(type=='Loan')
        {
            accountToUp.Loan_Payments__c = Decimal.valueOf(amount);
            accountToUp.Loan_Payment_Details__c = acct.Loan_Payment_Details__c+'\n'+description;
        }
        else if(type=='Credit Card')
        {
            accountToUp.Credit_Card__c = Decimal.valueOf(amount);
            accountToUp.Credit_Card_Details__c = acct.Credit_Card_Details__c+'\n'+description;
        }
        else if(type=='Insurance')
        {
            accountToUp.Insurance__c = Decimal.valueOf(amount);
            accountToUp.Insurance_Details__c = acct.Insurance_Details__c+'\n'+description;
        }
        else if(type=='Household')
        {
            accountToUp.Food__c = Decimal.valueOf(amount);
            accountToUp.Food_Details__c = acct.Food_Details__c+'\n'+description;
        }
        else if(type=='Utilities')
        {
            accountToUp.Utilities__c = Decimal.valueOf(amount);
            accountToUp.Utilities_Details__c = acct.Utilities_Details__c+'\n'+description;
        }
        else if(type=='Transport')
        {
            accountToUp.Car_Lease_Loan_Payment__c = Decimal.valueOf(amount);
            accountToUp.Car_Lease_Loan_Payment_Details__c = acct.Car_Lease_Loan_Payment_Details__c+'\n'+description;
        }
        else if(type=='Mobile')
        {
            accountToUp.Mobile_Expenses__c = Decimal.valueOf(amount);
            accountToUp.Mobile_Expenses_Details__c = acct.Mobile_Expenses_Details__c+'\n'+description;
        }
        else if(type=='Clothing')
        {
            accountToUp.Clothing__c = Decimal.valueOf(amount);
            accountToUp.Clothing_Details__c = acct.Clothing_Details__c+'\n'+description;
        }
        else if(type=='Entertainment')
        {
            accountToUp.Tobacco_Alcohol__c = Decimal.valueOf(amount);
            accountToUp.Tobacco_Alcohol_Details__c = acct.Tobacco_Alcohol_Details__c+'\n'+description;
        }
        else if(type=='Other Rental')
        {
            accountToUp.Other_Rental_Companies__c = Decimal.valueOf(amount);
            accountToUp.Other_Rental_Company_Details__c = acct.Other_Rental_Company_Details__c+'\n'+description;
        }
        else if(type=='Other Expense')
        {
            accountToUp.OtherOutgoings__c = Decimal.valueOf(amount);
            accountToUp.Other_Details__c = acct.Other_Details__c+'\n'+description;
        }
        
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateExpenseSummaryDetails',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public PageReference confirmExpenseSummaryDetails()
{
    String param = Apexpages.currentPage().getParameters().get('param');
    String shortURL = '';
    String randomNumber=SecretUtil.generateRandomNumber();
    String finalurl= onlineURL+'/R4KOnlineForm?id='+acctId+'&n='+randomNumber;
    system.debug('##confirmExpenseSummaryDetails: '+param);
        
    try
    {           
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        
        if(param=='expsum')
        {
            String description = 'Confirmed the expense in Expense Summary';
            accountToUp.Rent_Mortgage_Board_Details__c = acct.Rent_Mortgage_Board_Details__c+'\n'+description;
            accountToUp.Loan_Payment_Details__c = acct.Loan_Payment_Details__c+'\n'+description;
            accountToUp.Credit_Card_Details__c = acct.Credit_Card_Details__c+'\n'+description;
            accountToUp.Insurance_Details__c = acct.Insurance_Details__c+'\n'+description;
            accountToUp.Food_Details__c = acct.Food_Details__c+'\n'+description;
            accountToUp.Utilities_Details__c = acct.Utilities_Details__c+'\n'+description;
            accountToUp.Car_Lease_Loan_Payment_Details__c = acct.Car_Lease_Loan_Payment_Details__c+'\n'+description;
            accountToUp.Mobile_Expenses_Details__c = acct.Mobile_Expenses_Details__c+'\n'+description;
            accountToUp.Clothing_Details__c = acct.Clothing_Details__c+'\n'+description;
            accountToUp.Tobacco_Alcohol_Details__c = acct.Tobacco_Alcohol_Details__c+'\n'+description;
            accountToUp.Other_Rental_Company_Details__c = acct.Other_Rental_Company_Details__c+'\n'+description;
            accountToUp.Other_Details__c = acct.Other_Details__c+'\n'+description;
            accountToUp.Expense_Online__c=true;
            R4KLeadController.ProbableAccountWrapper paWrap = R4KLeadController.findProbableAccount(null, acctId);
            accountToUp.Probable_Territory__c = (paWrap.probTerritory != null ? paWrap.probTerritory.Id : null);
            accountToUp.Probable_Account__c = (paWrap.ccAcct != null ? paWrap.ccAcct.Id : null);
            finalurl= onlineURL+'/R4KIncomeExpenseSummaryOnline?id='+acctId+'&param=sursum&n='+randomNumber;
        }
        else if(param=='incsum')
        {
            accountToUp.Income_Online__c=true;
            R4KLeadController.ProbableAccountWrapper paWrap = R4KLeadController.findProbableAccount(null, acctId);
            accountToUp.Probable_Territory__c = (paWrap.probTerritory != null ? paWrap.probTerritory.Id : null);
            accountToUp.Probable_Account__c = (paWrap.ccAcct != null ? paWrap.ccAcct.Id : null);
            finalurl= onlineURL+'/R4KIncomeExpenseSummaryOnline?id='+acctId+'&param=expsum&n='+randomNumber;
        }
        else if(param=='sursum')
        {
            finalurl= onlineURL+'/R4KOnlineForm?id='+acctId+'&param=finTerms&n='+randomNumber;
        
            if(!acct.Equifax_Online__c && (acct.Equifax_Enquiry_DateTime__c == null || acct.Equifax_Enquiry_DateTime__c.date().daysBetween(Date.today()) > 21 || acct.Equifax_Age_of_File__c == null || acct.Equifax_Age_of_File__c == '0 months')){
                accountToUp.PUA_Status__c = 'Attention Required';
                finalurl= onlineURL+'/R4KPUADeclined?id='+acctId+'&param=attention&n='+randomNumber;
            }
        }
        accountToUp.Last_Online_Activity_DateTime__c = DateTime.now();
        update accountToUp;
        return new PageReference(finalurl).setredirect(true);
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','confirmExpenseSummaryDetails',acctId+' - '+param,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference(finalurl).setredirect(true);
    }
}

public void updateAddress()
{
    try
    {
        streetNameVal = Apexpages.currentPage().getParameters().get('currentStreetAddress');
        suburbVal = Apexpages.currentPage().getParameters().get('currentSuburb');
        stateVal = Apexpages.currentPage().getParameters().get('currentState');
        countryVal = Apexpages.currentPage().getParameters().get('currentCountry');
        latVal = (Apexpages.currentPage().getParameters().get('currentLatitude') <> null && Apexpages.currentPage().getParameters().get('currentLatitude') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('currentLatitude')) : 0;
        lngVal = (Apexpages.currentPage().getParameters().get('currentLongitude') <> null && Apexpages.currentPage().getParameters().get('currentLongitude') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('currentLongitude')) : 0;
        postalCodeVal = Apexpages.currentPage().getParameters().get('currentPostcode');
                
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.PersonMailingStreet = streetNameVal;
        accountToUp.PersonMailingCity = suburbVal;
        accountToUp.PersonMailingState = stateVal;
        accountToUp.PersonMailingPostalCode = postalCodeVal;
        accountToUp.PersonMailingCountry = countryVal;
        accountToUp.Sensis_Latitude__c = latVal;
        accountToUp.Sensis_Longitude__c = lngVal;
        accountToUp.Next_Online_Step_Param__c = 'cuad';
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        update accountToUp;

        if(UserInfo.getOrganizationId() == '00D90000000hZ5L' && !Test.isRunningTest()){
            Account tempAcct = [SELECT Id, Equifax_Age_of_File__c, Equifax_Enquiry_DateTime__c FROM Account WHERE Id = :acctId LIMIT 1];
            if(tempAcct != null && (tempAcct.Equifax_Enquiry_DateTime__c == null || tempAcct.Equifax_Enquiry_DateTime__c.date().daysBetween(Date.today()) > 21 || tempAcct.Equifax_Age_of_File__c == null || tempAcct.Equifax_Age_of_File__c == '0 months')){
                equifaxSearch();
            }
        }
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateAddress',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateResidentialStatus()
{
    try
    {   
        lengthOfStayCurrent = (Apexpages.currentPage().getParameters().get('lengthOfStayCurrent') <> null && Apexpages.currentPage().getParameters().get('lengthOfStayCurrent') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('lengthOfStayCurrent')) : 0;
        residentialStatus = Apexpages.currentPage().getParameters().get('residentialStatus');
        landlordName = Apexpages.currentPage().getParameters().get('landlordName');
        landlordNumber = Apexpages.currentPage().getParameters().get('landlordNumber');
        
        System.debug('****lengthOfStayCurrent ' + lengthOfStayCurrent);
        System.debug('****residentialStatus ' + residentialStatus);
        System.debug('****landlordName ' + landlordName);
        System.debug('****landlordNumber ' + landlordNumber);
        
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Length_of_Stay_in_Current_Address__c = lengthOfStayCurrent;
        accountToUp.Residential_Status__c = residentialStatus;
        accountToUp.Landlord_Name__c = landlordName;
        accountToUp.Landlord_Telephone__c = landlordNumber;
        accountToUp.Next_Online_Step_Param__c = 'land';
        accountToUp.Basic_Info_Online__c = true;
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateResidentialStatus',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updatePreviousAddress()
{
    try
    {
        lengthOfStayPrevious = (Apexpages.currentPage().getParameters().get('lengthOfStayPrevious') <> null && Apexpages.currentPage().getParameters().get('lengthOfStayPrevious') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('lengthOfStayPrevious')) : 0;
        streetNameVal = Apexpages.currentPage().getParameters().get('previousStreetAddress');
        suburbVal = Apexpages.currentPage().getParameters().get('previousSuburb');
        stateVal = Apexpages.currentPage().getParameters().get('previousState');
        countryVal = Apexpages.currentPage().getParameters().get('previousCountry');
        latVal = (Apexpages.currentPage().getParameters().get('previousLatitude') <> null && Apexpages.currentPage().getParameters().get('previousLatitude') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('previousLatitude')) : 0;
        lngVal = (Apexpages.currentPage().getParameters().get('previousLongitude') <> null && Apexpages.currentPage().getParameters().get('previousLongitude') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('previousLongitude')) : 0;
        postalCodeVal = Apexpages.currentPage().getParameters().get('previousPostcode');
                
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Previous_Address__c = streetNameVal + ' ' + suburbVal + ' ' + stateVal + ' ' + postalCodeVal + ' ' + countryVal;
        accountToUp.Length_of_Stay_in_Previous_Address__c = lengthOfStayPrevious;
        accountToUp.Next_Online_Step_Param__c = 'rentag';
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        update accountToUp;

        if(UserInfo.getOrganizationId() == '00D90000000hZ5L' && !Test.isRunningTest()){
            Account tempAcct = [SELECT Id, Equifax_Age_of_File__c, Equifax_Enquiry_DateTime__c FROM Account WHERE Id = :acctId LIMIT 1];
            if(tempAcct != null && (tempAcct.Equifax_Enquiry_DateTime__c == null || tempAcct.Equifax_Enquiry_DateTime__c.date().daysBetween(Date.today()) > 21 || tempAcct.Equifax_Age_of_File__c == null || tempAcct.Equifax_Age_of_File__c == '0 months')){
                equifaxSearch();
            }
        }
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updatePreviousAddress',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateDependents()
{
    try
    {
        noOfDependents = (Apexpages.currentPage().getParameters().get('noOfDependents') <> null && Apexpages.currentPage().getParameters().get('noOfDependents') != '') ? Decimal.valueOf(Apexpages.currentPage().getParameters().get('noOfDependents')) : 0;
        maritalStatus = Apexpages.currentPage().getParameters().get('maritalStatus');
        
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Number_of_Dependants__c = noOfDependents;
        accountToUp.Marital_Status__pc = maritalStatus;
        accountToUp.Next_Online_Step_Param__c = 'foodag';
        accountToUp.Last_Online_Activity_Datetime__c = DateTime.now();
        update accountToUp;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateDependents',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateIdentificationNo()
{
    try
    {
    String identificationNo = Apexpages.currentPage().getParameters().get('identificationNo');
    if(acctId!=null && acctId!='')
    {
        Account account = new Account();
        account.Id = acctId;
        account.Identification_No__c = identificationNo;
        account.Next_Online_Step_Param__c = 'sdbsa';
        account.Last_Online_Activity_Datetime__c = DateTime.now();
        update account;
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateIdentificationNo',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateConsent()
{
    try
    {
    if(acctId!=null && acctId!='')
    {
        List<Account> acctLst = getAccountDetails(acctId);
        
        Account account = new Account();
        account.Id = acctId;
        account.Equifax_SMS_Consent_Received__c = true;
        account.Next_Online_Step_Param__c = 'sdida';
        account.Last_Online_Activity_Datetime__c = Datetime.now();
        
        if(acctLst.size()>0)
        {
            if(acctLst[0].Customer_No__c!=null && acctLst[0].Customer_No__c!='' && (acctLst[0].Hybrid_URL_BankStatement__c==null || acctLst[0].Hybrid_URL_BankStatement__c==''))
            {
                account.SMS_for_MyGov_Sent__c=true;
                account.SMS_for_BankStatement_Sent__c=true;
                if(stateMasterState=='NZ')
                {
                    account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFNZ-'+acctLst[0].Customer_No__c;
                }
                else
                {
                    //account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFCO-'+acctLst[0].Customer_No__c+'?withCentrelink=false';
                    //account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/r/b/RFCO-'+acctLst[0].Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                    account.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+acctLst[0].Customer_No__c;
                    account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+acctLst[0].Customer_No__c+'?withCentrelink=true&centrelinkOnly=true';
                }
            }
            else if((acctLst[0].Customer_No__c==null || acctLst[0].Customer_No__c=='') && acctLst[0].Territory_Applicant_Customer_Prefix__c!=null && acctLst[0].Territory_Applicant_Customer_Prefix__c!='')
            {
                //Generate and update Customer Number and add the hybrid url
                String currentCustomerNo=AccountUtil.generateCustomerNumberforAccount(acctLst[0].Territory_Applicant_Customer_Prefix__c,isCreditContract);
                system.debug('###custNo: '+currentCustomerNo);
                if(currentCustomerNo!=null)
                {
                    account.Customer_No__c = currentCustomerNo;
                    account.SMS_for_MyGov_Sent__c=true;
                    account.SMS_for_BankStatement_Sent__c=true;
                    if(stateMasterState=='NZ')
                    {
                        account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFNZ-'+currentCustomerNo;
                    }
                    else
                    {
                        //account.Hybrid_URL_BankStatement__c='https://www.bankstatements.com.au/r/b/RFCO-'+currentCustomerNo+'?withCentrelink=false';
                        //account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/r/b/RFCO-'+currentCustomerNo+'?withCentrelink=true&centrelinkOnly=true';
                        account.Hybrid_URL_BankStatement__c='https://scv.bankstatements.com.au/iframe/RMBV-'+currentCustomerNo;
                        account.Hybrid_URL_MyGov__c='https://www.bankstatements.com.au/iframe/start/RFKC-'+currentCustomerNo+'?withCentrelink=true&centrelinkOnly=true';
                    }
                }
                
            }
        }
        
        update account;
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateConsent',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public List<Account> getAccountDetails(String accountId)
{
    return [select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,PersonEmail,PersonMailingStreet, PersonMailingCity,Territory_Number__c,
            PersonMailingState,PersonMailingPostalCode,PersonMailingCountry,BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,
            Customer_No__c,Equifax_SMS_Consent_Received__c,Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Territory_Applicant_Customer_Prefix__c,
            MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,
            WrittenOff_s_Count__c,Last_Agreement_Close_Date__c,RecordType.Name,Centrepay_Ref_No__c,Territory_Number__r.Is_Credit_Contract__c
            from Account where id=:accountId AND Territory_Short_Name__c NOT IN: wideBayTerritories Limit 1];
}

public void updateBasicInfo()
{
    try
    {
    String firstName=Apexpages.currentPage().getParameters().get('firstName');
    String lastName=Apexpages.currentPage().getParameters().get('lastName');
    String dob=Apexpages.currentPage().getParameters().get('dob');
    String gender=Apexpages.currentPage().getParameters().get('gender');
    //String crn=Apexpages.currentPage().getParameters().get('crn');
    
    system.debug('firstName: '+firstName+' lastName: '+lastName+' dob: '+dob+' gender: '+gender);
    
    Account account = new Account();
    if(acctId!=null && acctId!='')
    {
        account.Id = acctId;
        account.FirstName = firstName;
        account.LastName = lastName;
        account.BirthDate__c = dob!=null && dob!='' ? Date.valueOf(dob) : null;
        account.Gender__pc = gender;
        account.Next_Online_Step_Param__c = 'cd';
        account.Last_Online_Activity_Datetime__c = DateTime.now();
        /*
        if(crn!=null && crn!='')
        {
            crn = crn.toUpperCase();
            List<Account> atLst = [select id from Account where id<>:acctId and Centrepay_Ref_No__c=:crn LIMIT 1];
            if(atLst.size()==0)
                account.Centrepay_Ref_No__c = crn;
        }
        */
        update account;
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateBasicInfo',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateContactDetails()
{
    try
    {
    String phone = Apexpages.currentPage().getParameters().get('phone');
    String email = Apexpages.currentPage().getParameters().get('email');
    if(acctId!=null && acctId!='')
    {
        List<Account> atLst = [select id,Mygov_Captured_Address__c,UnformattedAddress_VedaAlert_Report__c from Account where id =: acctId LIMIT 1];
        if(atLst.size() > 0)
        {
            currentAddress = atLst[0].Mygov_Captured_Address__c != null ? atLst[0].Mygov_Captured_Address__c : atLst[0].UnformattedAddress_VedaAlert_Report__c;
        }
        Account account = new Account();
        account.Id = acctId;
        account.PersonMobilePhone = phone;
        account.PersonEmail = email;
        account.Next_Online_Step_Param__c = (mygovAddress != null && mygovAddress != '') ? 'mygovaddrag' : ((mogoAddress != null && mogoAddress != '') ? 'bankaddrag' : 'addr');
        account.Last_Online_Activity_Datetime__c = DateTime.now();
        update account;
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateContactDetails',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void updateEquifaxNotes()
{
    try
    {
    String addEqEnquiries=Apexpages.currentPage().getParameters().get('addEqEnquiries');
    String addEqRentalDefaults=Apexpages.currentPage().getParameters().get('addEqRentalDefaults');
    String addEqNonRentalDefaults=Apexpages.currentPage().getParameters().get('addEqNonRentalDefaults');
    
    system.debug('addEqEnquiries: '+addEqEnquiries+' addEqRentalDefaults: '+addEqRentalDefaults+' addEqNonRentalDefaults: '+addEqNonRentalDefaults);
    
    Account account = new Account();
    account.Last_Online_Activity_Datetime__c = Datetime.now();
    if(acctId!=null && acctId!='')
    {   
        account.Id = acctId;
        
        if(addEqEnquiries!=null && addEqEnquiries!='')
        {
            account.Explanation_for_Recent_Enquiries__c = addEqEnquiries;
            account.Next_Online_Step_Param__c = 'eqrd';
        }
        if(addEqRentalDefaults!=null && addEqRentalDefaults!='' && addEqNonRentalDefaults!=null && addEqNonRentalDefaults!='') 
        {
             account.Explanation_for_All_Other_Defaults__c = '##Rental - '+addEqRentalDefaults.trim();
             account.Explanation_for_All_Other_Defaults__c += '\n##NonRental - '+addEqNonRentalDefaults.trim();
             account.Next_Online_Step_Param__c = 'com';
             account.Equifax_Online__c = true;
        }   
        else if(addEqRentalDefaults!=null && addEqRentalDefaults!='')
        {
             account.Explanation_for_All_Other_Defaults__c = '##Rental - '+addEqRentalDefaults.trim();
             account.Next_Online_Step_Param__c = 'eqnrd';
        }
        else if(addEqNonRentalDefaults!=null && addEqNonRentalDefaults!='')
        {
             account.Explanation_for_All_Other_Defaults__c = '##NonRental - '+addEqNonRentalDefaults.trim();
             account.Next_Online_Step_Param__c = 'com';
             account.Equifax_Online__c = true;
        }
        update account;
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateEquifaxNotes',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}
   
public void initAcknowledgement()
{
    acctId = Apexpages.currentPage().getParameters().get('id');
    ldId = Apexpages.currentPage().getParameters().get('ld');
    createNewOnlineLead = false;
    onlineAccountId = null;
    nextHybridStepParam = '';
    
    if(ldId!=null && ldId!='')
    {
        List<Lead> ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                            Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Account__r.Enquiry_Status__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,
                            OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                            Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Allocation_Datetime__c,Account__r.Equifax_SMS_Consent_Received__c,Account__r.Is_PhotoId_Attached_After_Enquiry__c,Account__r.Bank_Final_Page__c,
                            Account__r.MyGov_Final_Page__c,Account__r.State_Master_State__c
                            from Lead where id=:ldId Limit 1];
        
        if(ldLst.size()>0 && ldLst[0].IsConverted)
        {
            if(ldLst[0].Account__r.Enquiry_Status__c != 'Enquiry')
            {
                createNewOnlineLead = true;
                onlineAccountId = ldLst[0].Account__c;
            }
        
            if(!ldLst[0].Account__r.Equifax_SMS_Consent_Received__c)
            {
                nextHybridStepParam = 'cs';
            }
            else if(!ldLst[0].Account__r.Is_PhotoId_Attached_After_Enquiry__c)
            {
                nextHybridStepParam = 'sdcp';
            }
            else if(!ldLst[0].Account__r.Bank_Final_Page__c)
            {
                nextHybridStepParam = 'sdbs';
            }
            else if(!ldLst[0].Account__r.MyGov_Final_Page__c)
            {
                nextHybridStepParam = (ldLst[0].Account__r.State_Master_State__c == 'NZ' ? 'sdwz' : 'sdmg');
            }
            else if(ldLst[0].Account__r.Hybrid_Link_Status__c == 'All docs received' || ldLst[0].Account__r.Hybrid_Link_Status__c == 'Referees Added')
            {
                nextHybridStepParam = 'ref';
            }
            else if(ldLst[0].Account__r.Hybrid_Link_Status__c == 'Referees Contacted')
            {
                nextHybridStepParam = 'eqenr';
            }
            else
            {
                nextHybridStepParam = '';
            }
        }
    }
    else if(acctId!=null && acctId!='')
    {
        List<Account> onlineAcctList = [SELECT Id,Enquiry_Status__c,Enquiry_Date__c,Hybrid_Link_Finish_Datetime__c,Hybrid_Link_Status__c,State_Master_State__c,
                                        Equifax_SMS_Consent_Received__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c
                                         FROM Account WHERE Id =: acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories LIMIT 1];
        if(onlineAcctList.size()>0)
        {
            if((onlineAcctList[0].Enquiry_Status__c != 'Enquiry' || onlineAcctList[0].Enquiry_Date__c == null || onlineAcctList[0].Enquiry_Date__c.daysBetween(Date.today()) > 21))
            {
                createNewOnlineLead = true;
                onlineAccountId = onlineAcctList[0].Id;
            }
            if(!onlineAcctList[0].Equifax_SMS_Consent_Received__c)
            {
                nextHybridStepParam = 'cs';
            }
            else if(!onlineAcctList[0].Is_PhotoId_Attached_After_Enquiry__c)
            {
                nextHybridStepParam = 'sdcp';
            }
            else if(!onlineAcctList[0].Bank_Final_Page__c)
            {
                nextHybridStepParam = 'sdbs';
            }
            else if(!onlineAcctList[0].MyGov_Final_Page__c)
            {
                nextHybridStepParam = (onlineAcctList[0].State_Master_State__c == 'NZ' ? 'sdwz' : 'sdmg');
            }
            else if(onlineAcctList[0].Hybrid_Link_Status__c == 'All docs received' || onlineAcctList[0].Hybrid_Link_Status__c == 'Referees Added')
            {
                nextHybridStepParam = 'ref';
            }
            else if(onlineAcctList[0].Hybrid_Link_Status__c == 'Referees Contacted')
            {
                nextHybridStepParam = 'eqenr';
            }
            else
            {
                nextHybridStepParam = '';
            }
        }
    }
    system.debug('nextHybridStepParam: '+nextHybridStepParam);
}

public PageReference redirectToOnlineProcess()
{
    try
    {
        String params = '';
        Boolean paramPresent = false;
        Map<String,String> paramMap = ApexPages.currentPage().getParameters();
        for(String paramKey : paramMap.keySet())
        {
            if(paramKey == 'ld' || paramKey == 'id' || paramKey == 'param' || paramKey == 'redo')
            {
                params += (params == '' ? '?' : '&');
                params += paramKey;
                params += '=';
                params += paramMap.get(paramKey);
                
                if(paramKey == 'param')
                {
                    paramPresent = true;
                }
            }
        }   
        
        String shortURL = '';
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalUrl;
        
        if(Apexpages.currentPage().getURL().containsIgnoreCase('R4KOnlineFormAcknowledgementPage'))
        {
            finalUrl = onlineURL+'/R4KOnlineForm'+params+'&n='+randomNumber;
        }else
        {
            if(nextHybridStepParam!=null && nextHybridStepParam!='')
                finalUrl = onlineURL+'/R4KOnlineApplicationForm'+params+'&n='+randomNumber+(paramPresent ? '' : '&param='+nextHybridStepParam);
            else
                finalUrl = onlineURL+'/R4KOnlineApplicationForm'+params+'&n='+randomNumber;
        }
        
        return new PageReference(finalUrl).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','redirectToOnlineProcess','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference createOnlineLead()
{
    try
    {    
        if(onlineAccountId != null)
        {
            List<Account> onlineAcctList = [SELECT Id,FirstName,LastName,PersonMobilePhone,PersonEmail,OwnerId,PersonMailingPostalCode,PersonMailingStreet,PersonMailingCity,
                                                PersonMailingState,Name,SMS_Mobile__c,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,PersonMailingCountry,
                                                BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Customer_No__c,Equifax_SMS_Consent_Received__c,
                                                Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Territory_Number__r.Short_Name__c,
                                                Is_PhotoId_Attached_After_Enquiry__c,MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,
                                                Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Territory_Number__r.No_Postcode_Present__c,
                                                Last_Agreement_Close_Date__c,RecordType.Name,Rent4Keeps_Account__c FROM Account WHERE 
                                                Id =: onlineAccountId AND 
                                                Territory_Short_Name__c NOT IN: wideBayTerritories AND
                                                Territory_Number__r.Is_Credit_Contract__c = true LIMIT 1];
            
            if(onlineAcctList.size() > 0)
            {           
                //Online Link
                String shortURL = '';
                String randomNumber=SecretUtil.generateRandomNumber();
                String finalUrl = '';
                
                //Create Lead
                Lead rlead = new Lead();
                rlead.FirstName = onlineAcctList[0].FirstName;
                rlead.LastName = onlineAcctList[0].LastName;
                rlead.MobilePhone = onlineAcctList[0].PersonMobilePhone;
                rlead.Email = onlineAcctList[0].PersonEmail;
                rlead.OwnerId = onlineAcctList[0].OwnerId;
                rlead.Street = onlineAcctList[0].PersonMailingStreet;
                rlead.City = onlineAcctList[0].PersonMailingCity;
                rlead.State = onlineAcctList[0].PersonMailingState;
                rlead.Territory_Number__c = onlineAcctList[0].Territory_Number__c;
                rlead.Not_Spam__c = 'yes';
                rlead.Lead_Medium__c = 'Online';
                
                if(onlineAcctList[0].Territory_Number__r.No_Postcode_Present__c)
                {
                    rlead.PostalCode = onlineAcctList[0].PersonMailingPostalCode;
                }
                
                insert rlead;        
                
                if(!Test.isRunningTest())
                {
                    ApexPages.currentPage().getParameters().put('ld',rlead.Id);
                    getFormDetails();
                    convertLead(lead,onlineAcctList[0]);
                }
                
                if(Apexpages.currentPage().getURL().containsIgnoreCase('R4KOnlineFormAcknowledgementPage'))
                {
                    finalUrl = onlineURL+'/R4KOnlineForm?id='+onlineAcctList[0].Id+'&n='+randomNumber;
                }else
                {
                    finalUrl = onlineURL+'/R4KOnlineApplicationForm?id='+onlineAcctList[0].Id+'&param=cd&n='+randomNumber;
                }
                 
                return new PageReference(finalUrl).setRedirect(true);
            }else{
                return new PageReference(webURL + '/R4KApplyNow?formType=apply').setRedirect(true);
            }
        }
        return null;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','createOnlineLead',onlineAccountId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}
    
public PageReference resendOnlineLink()
{
    try
    {
        List<Attachment> photoIdAtts = new List<Attachment>();
        List<Document> photoIdDocs = new List<Document>();
        List<String> photoDocIds = new List<String>();
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Hybrid_Link_Finish_Datetime__c =null;
        accountToUp.Online_Link_Sent_DateTime__c = DateTime.now();
        
        if(!resetLinkId)
        {
            System.debug('****Reset Id');
            if(acct.Photo_Id_Front__c <> null && acct.Photo_Id_Front__c <> '')
            {
                photoDocIds.add(acct.Photo_Id_Front__c);
            }
            if(acct.Photo_Id_Back__c <> null && acct.Photo_Id_Back__c <> '')
            {
                photoDocIds.add(acct.Photo_Id_Back__c);
            }
            accountToUp.Is_PhotoId_Attached_After_Enquiry__c = false;
            accountToUp.Photo_Id_Front__c = null;
            accountToUp.Photo_Id_Back__c = null;
            photoIdAtts = [select id, name, ParentId, CreatedBy.Name,LastModifiedDate,CreatedDate from Attachment where parentId =: acctId AND CreatedDate = LAST_N_DAYS:21 AND Name LIKE 'Photo Id%'];
            if(photoDocIds.size() > 0)
            {
                photoIdDocs = [select id from Document where Id in: photoDocIds];
            }
        }
        if(!resetLinkBank)
        {
            System.debug('****Reset Bank');
            accountToUp.Bank_Final_Page__c = false;
            accountToUp.BankStatement_Date__c = null;
            accountToUp.BankStatement_Completion_Datetime__c = null;
            accountToUp.BankStatement_Amend__c = false;
        }
        if(!resetLinkMygov)
        {
            System.debug('****Reset Mygov');
            accountToUp.MyGov_Final_Page__c = false;
            accountToUp.MyGov_Date__c = null;
            accountToUp.myGov_Completion_Datetime__c = null;
        }

        //accountToUp.Is_PhotoId_Attached_After_Enquiry__c = resetLinkId;
        //accountToUp.Bank_Final_Page__c = resetLinkBank;
        //accountToUp.MyGov_Final_Page__c = resetLinkMygov;
        accountToUp.Basic_Info_Online__c = resetLinkBasic;
        accountToUp.Income_Online__c = resetLinkIncome;
        accountToUp.Expense_Online__c = resetLinkExpense;
        accountToUp.Referees_Online__c = resetLinkReferees;
        accountToUp.RO_Online__c = resetLinkRO;
        accountToUp.Equifax_Online__c = resetLinkEquifax;
        
        String shortURL = '';
        String randomNumber = SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KOnlineFormAcknowledgementPage?id='+acctId+'&redo=yes&n='+randomNumber;
        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
        if(!Test.isRunningTest())
        {
            shortURL = sl.shortLinkGenerator(finalURL);
        }
        String mobileNo = acct.SMS_Mobile__c;
        String smsTemplate = 'Hi ' + acct.Name + ', Please click the link below to finish the application process.\n' + shortURL;
        String smsGroupType = 'R4KOnline';
        String objectType = 'Account';
        String objectId = acctId;
        String ownerId = acct.OwnerId;
            
        CommunicationUtil.sendSMS(mobileNo , smsTemplate , smsGroupType , objectType , objectId , ownerId , false, null);
        update accountToUp;
        
        if(resetLinkId && photoIdAtts.size() > 0)
        {
            delete photoIdAtts;
        }
        if(resetLinkId && photoIdDocs.size() > 0)
        {
            delete photoIdDocs;
        }
        
        return new PageReference('/'+acctId).setredirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','resendOnlineLink','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public List<Decimal> getIncomeExpense(String type, Decimal value)
{
    try
    {
        List<Decimal> incExp = new List<Decimal>{0,0,0};
        Account tempAccount = [SELECT Id,Rent_Mortgage_Board__c,Food__c,Clothing__c,Utilities__c,Car_Lease_Loan_Payment__c,Mobile_Expenses__c,
                                Credit_Card__c,Loan_Payments__c,Insurance__c,Other_Rental_Companies__c,OtherOutgoings__c,Tobacco_Alcohol__c,
                                Centrelink_Benefit_Amount__c,Centrelink_Benefit2_Amount__c,Centrelink_Benefit3_Amount__c,Other_Centrelink_Benefit_Amount__c,Other_Income_Amount__c,
                                Employment_Income__c,Rent4Keeps_Payment_C__c,Existing_R4K_Payment__c,Centrepay_Outgoings__c FROM Account WHERE Id =: acctId LIMIT 1];
                                
        Decimal totalIncome = (tempAccount.Employment_Income__c == null ? 0 : tempAccount.Employment_Income__c) + (tempAccount.Centrelink_Benefit_Amount__c == null ? 0 : tempAccount.Centrelink_Benefit_Amount__c) + 
        (tempAccount.Centrelink_Benefit2_Amount__c == null ? 0 : tempAccount.Centrelink_Benefit2_Amount__c) + (tempAccount.Centrelink_Benefit3_Amount__c == null ? 0 : tempAccount.Centrelink_Benefit3_Amount__c) + 
        (tempAccount.Other_Centrelink_Benefit_Amount__c == null ? 0 : tempAccount.Other_Centrelink_Benefit_Amount__c) + (tempAccount.Other_Income_Amount__c == null ? 0 : tempAccount.Other_Income_Amount__c);
        
        Decimal totalExpense = (tempAccount.Rent_Mortgage_Board__c == null ? 0 : tempAccount.Rent_Mortgage_Board__c) + (tempAccount.Food__c == null ? 0 : tempAccount.Food__c) + 
        (tempAccount.Clothing__c == null ? 0 : tempAccount.Clothing__c) + (tempAccount.OtherOutgoings__c == null ? 0 : tempAccount.OtherOutgoings__c) + (tempAccount.Loan_Payments__c == null ? 0 : tempAccount.Loan_Payments__c) +
        (tempAccount.Car_Lease_Loan_Payment__c == null ? 0 : tempAccount.Car_Lease_Loan_Payment__c) + (tempAccount.Credit_Card__c == null ? 0 : tempAccount.Credit_Card__c) + (tempAccount.Insurance__c == null ? 0 : tempAccount.Insurance__c) + 
        (tempAccount.Utilities__c == null ? 0 : tempAccount.Utilities__c) + (tempAccount.Centrepay_Outgoings__c == null ? 0 : tempAccount.Centrepay_Outgoings__c) + (tempAccount.Tobacco_Alcohol__c == null ? 0 : tempAccount.Tobacco_Alcohol__c) + 
        (tempAccount.Mobile_Expenses__c == null ? 0 : tempAccount.Mobile_Expenses__c) + (tempAccount.Other_Rental_Companies__c == null ? 0 : tempAccount.Other_Rental_Companies__c) + 
        (tempAccount.Rent4Keeps_Payment_C__c == null ? 0 : tempAccount.Rent4Keeps_Payment_C__c) + (tempAccount.Existing_R4K_Payment__c == null ? 0 : tempAccount.Existing_R4K_Payment__c);
        
        if(type == 'rent')
        {
            totalExpense = totalExpense + value - (tempAccount.Rent_Mortgage_Board__c == null ? 0 : tempAccount.Rent_Mortgage_Board__c);
        }else if(type == 'food')
        {
            totalExpense = totalExpense + value - (tempAccount.Food__c == null ? 0 : tempAccount.Food__c);
        }else if(type == 'clothing')
        {
            totalExpense = totalExpense + value - (tempAccount.Clothing__c == null ? 0 : tempAccount.Clothing__c);
        }else if(type == 'other regular')
        {
            totalExpense = totalExpense + value - (tempAccount.OtherOutgoings__c == null ? 0 : tempAccount.OtherOutgoings__c);
        }else if(type == 'loan')
        {
            totalExpense = totalExpense + value - (tempAccount.Loan_Payments__c == null ? 0 : tempAccount.Loan_Payments__c);
        }else if(type == 'car')
        {
            totalExpense = totalExpense + value - (tempAccount.Car_Lease_Loan_Payment__c == null ? 0 : tempAccount.Car_Lease_Loan_Payment__c);
        }else if(type == 'credit')
        {
            totalExpense = totalExpense + value - (tempAccount.Credit_Card__c == null ? 0 : tempAccount.Credit_Card__c);
        }else if(type == 'insurance')
        {
            totalExpense = totalExpense + value - (tempAccount.Insurance__c == null ? 0 : tempAccount.Insurance__c);
        }else if(type == 'utilities')
        {
            totalExpense = totalExpense + value - (tempAccount.Utilities__c == null ? 0 : tempAccount.Utilities__c);
        }else if(type == 'cded')
        {
            totalExpense = totalExpense + value - (tempAccount.Centrepay_Outgoings__c == null ? 0 : tempAccount.Centrepay_Outgoings__c);
        }else if(type == 'alcohol')
        {
            totalExpense = totalExpense + value - (tempAccount.Tobacco_Alcohol__c == null ? 0 : tempAccount.Tobacco_Alcohol__c);
        }else if(type == 'mobile')
        {
            totalExpense = totalExpense + value - (tempAccount.Mobile_Expenses__c == null ? 0 : tempAccount.Mobile_Expenses__c);
        }else if(type == 'other rental')
        {
            totalExpense = totalExpense + value - (tempAccount.Other_Rental_Companies__c == null ? 0 : tempAccount.Other_Rental_Companies__c);
        }else if(type == 'employment')
        {
            totalIncome = totalIncome + value - (tempAccount.Employment_Income__c == null ? 0 : tempAccount.Employment_Income__c);
        }else if(type == 'other income')
        {
            totalIncome = totalIncome + value - (tempAccount.Other_Income_Amount__c == null ? 0 : tempAccount.Other_Income_Amount__c);
        }else if(type == 'cben1')
        {
            totalIncome = totalIncome + value - (tempAccount.Centrelink_Benefit_Amount__c == null ? 0 : tempAccount.Centrelink_Benefit_Amount__c);
        }else if(type == 'cben2')
        {
            totalIncome = totalIncome + value - (tempAccount.Centrelink_Benefit2_Amount__c == null ? 0 : tempAccount.Centrelink_Benefit2_Amount__c);
        }else if(type == 'cben3')
        {
            totalIncome = totalIncome + value - (tempAccount.Centrelink_Benefit3_Amount__c == null ? 0 : tempAccount.Centrelink_Benefit3_Amount__c);
        }else if(type == 'cben4')
        {
            totalIncome = totalIncome + value - (tempAccount.Other_Centrelink_Benefit_Amount__c == null ? 0 : tempAccount.Other_Centrelink_Benefit_Amount__c);
        }
        
        Decimal serviceability = 0;
        if(totalIncome > 0)
        {
            serviceability = ((totalIncome-totalExpense)*100/totalIncome).setScale(2);
        }
    
        incExp = new List<Decimal>{totalIncome,totalExpense,serviceability};
        return incExp;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','getIncomeExpense',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new List<Decimal>{0,0,0};
    }
}

public void initAcknowledgementRedirect()
{
    try
    {
        ldId = Apexpages.currentPage().getParameters().get('ld');
        acctId = Apexpages.currentPage().getParameters().get('id');
        redo = Apexpages.currentPage().getParameters().get('redo');
        List<Lead> ldLst = new List<Lead>();
        Boolean getLatestLead = true;
        isCreditContract = true;
        
        if(ldId!=null && ldId!='')
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Case__c,Case__r.Hybrid_Link_Opened_Datetime__c,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Active_Agreements__c,Account__r.Enquiry_Date__c,Account__r.Enquiry_Status__c,Account__r.No_Of_Active_Agreements__c,Territory_Number__r.Is_Credit_Contract__c,
                                Account__r.Company_Territory__c,Account__r.Territory_Short_Name__c,Account__r.Days_Since_Expected_Payment__c,Account__r.WrittenOff_s_Count__c,Account__r.Last_Default_Letter_Sent_Date__c,Account__r.Actual_Arrears__c,Account__r.Total_Paid_Amount_Active_Only__c,Credit_Check_Consent__c,RO_Online__c
                                from Lead where id=:ldId Limit 1];
        }else if(acctId!=null && acctId!='')
        {
            ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Case__c,Case__r.Hybrid_Link_Opened_Datetime__c,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Active_Agreements__c,Account__r.Enquiry_Date__c,Account__r.Enquiry_Status__c,Account__r.No_Of_Active_Agreements__c,Territory_Number__r.Is_Credit_Contract__c,
                                Account__r.Company_Territory__c,Account__r.Territory_Short_Name__c,Account__r.Days_Since_Expected_Payment__c,Account__r.WrittenOff_s_Count__c,Account__r.Last_Default_Letter_Sent_Date__c,Account__r.Actual_Arrears__c,Account__r.Total_Paid_Amount_Active_Only__c,Credit_Check_Consent__c,RO_Online__c
                                from Lead where IsConverted = true AND Account__c =: acctId ORDER BY CreatedDate DESC Limit 1];
            getLatestLead = false;
        }
        
        if(ldLst.size()>0)
        {
            lead = ldLst[0];
            ldId = lead.Id;
            ldMobile = ldLst[0].MobilePhone;
            acctId = ldLst[0].Account__c;
            leadEnquiryDynamicStatus = (ldLst[0].Applicant_Status__c == null ? 'New Enquiry' : ldLst[0].Applicant_Status__c);
            noOfActiveAgreements = Integer.valueOf(ldLst[0].Account__r.Active_Agreements__c);
            isCreditContract = ldLst[0].Territory_Number__r.Is_Credit_Contract__c;
            
            if(acctId != null && acctId != '')
            {
                if(getLatestLead)
                {
                    ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                    Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Case__c,Case__r.Hybrid_Link_Opened_Datetime__c,
                                    OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                    OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Active_Agreements__c,Account__r.Enquiry_Date__c,Account__r.Enquiry_Status__c,Account__r.No_Of_Active_Agreements__c,Territory_Number__r.Is_Credit_Contract__c,
                                    Account__r.Company_Territory__c,Account__r.Territory_Short_Name__c,Account__r.Days_Since_Expected_Payment__c,Account__r.WrittenOff_s_Count__c,Account__r.Last_Default_Letter_Sent_Date__c,Account__r.Actual_Arrears__c,Account__r.Total_Paid_Amount_Active_Only__c,Credit_Check_Consent__c,RO_Online__c
                                    from Lead where IsConverted = true AND Account__c =: acctId ORDER BY CreatedDate DESC Limit 1];
                    
                    if(ldLst.size()>0)
                    {
                        lead = ldLst[0];
                        ldId = lead.Id;
                        ldMobile = ldLst[0].MobilePhone;
                        acctId = ldLst[0].Account__c;
                        stateMasterState = ldLst[0].Account__r.State_Master_State__c;
                        leadEnquiryDynamicStatus = ldLst[0].Applicant_Status__c == null ? 'New Enquiry' : ldLst[0].Applicant_Status__c;
                        noOfActiveAgreements = Integer.valueOf(ldLst[0].Account__r.Active_Agreements__c);
                        isCreditContract = ldLst[0].Territory_Number__r.Is_Credit_Contract__c;
                    }
                }
                system.debug('##Re-evaluate');
                List<Opportunity> pastOppList = [SELECT Id,TaxInvoice_Signed_DateTime__c,Remaining_Amount__c,
                            Total_COGS_Less_AAF__c,Total_Paid_Amount__c,TaxInvoice_Signed_Date__c,
                            (Select Id,Name,Product_Type__c,HNC_Status_Change_Datetime__c,HNC_Delivery_Status__c From OpportunityLineItems) FROM Opportunity WHERE AccountId =: acctId AND StageName = 'Goods Delivered' AND RecordType.Name <> 'Trak SIM' AND TaxInvoice_Signed_DateTime__c <> null ORDER BY TaxInvoice_Signed_DateTime__c DESC];
                
                if(!((ldLst[0].Account__r.Company_Territory__c && (ldLst[0].Account__r.State_Master_State__c=='VIC' || ldLst[0].Account__r.State_Master_State__c=='SA' || ldLst[0].Account__r.State_Master_State__c=='NSW' || ldLst[0].Account__r.State_Master_State__c=='WA' || ldLst[0].Account__r.State_Master_State__c=='QLD' || ldLst[0].Account__r.State_Master_State__c=='NZ')) || ldLst[0].Account__r.Territory_Short_Name__c=='Greensborough'))
                {
                    leadEnquiryDynamicStatus = 'Buyout';
                }
                else if(((ldLst[0].Account__r.No_Of_Active_Agreements__c > 0 && ldLst[0].Account__r.Days_Since_Expected_Payment__c <> null && ldLst[0].Account__r.Days_Since_Expected_Payment__c > 30) || ldLst[0].Account__r.WrittenOff_s_Count__c > 0 || ldLst[0].Account__r.Last_Default_Letter_Sent_Date__c <> null || (ldLst[0].Account__r.No_Of_Active_Agreements__c > 0 && ldLst[0].Account__r.Actual_Arrears__c <> null && ldLst[0].Account__r.Actual_Arrears__c > 0 && ldLst[0].Account__r.Total_Paid_Amount_Active_Only__c <> null && ((ldLst[0].Account__r.Actual_Arrears__c / (ldLst[0].Account__r.Total_Paid_Amount_Active_Only__c + ldLst[0].Account__r.Actual_Arrears__c)) > 0.2))) || ldLst[0].Reason_For_Enquiry__c == 'Make Payment')
                {
                    leadEnquiryDynamicStatus = 'Collection';
                }                   
                else if(ldLst[0].Account__r.No_Of_Active_Agreements__c > 0 && pastOppList.size() > 0 && pastOppList[0].TaxInvoice_Signed_Date__c.daysBetween(Date.today()) <= 30 && ldLst[0].Account__r.Enquiry_Status__c != 'Enquiry' && !ldLst[0].Account__r.Enquiry_Status__c.startsWith('DN'))
                {
                    leadEnquiryDynamicStatus = 'Delivery Status';
                }
                else if(ldLst[0].Account__r.Enquiry_Date__c != null && ldLst[0].Account__r.Enquiry_Date__c.daysBetween(Date.today()) <= 30 && ldLst[0].Account__r.Enquiry_Status__c != null && (ldLst[0].Account__r.Enquiry_Status__c == 'Enquiry' || ldLst[0].Account__r.Enquiry_Status__c.startsWith('DN')))
                {
                    leadEnquiryDynamicStatus = 'Recent Application';
                }
                else if(ldLst[0].Reason_For_Enquiry__c == 'Existing Account Enquiry')
                {
                    leadEnquiryDynamicStatus = 'Account Enquiry';
                }
                else if(ldLst[0].Reason_For_Enquiry__c == 'Service Enquiry / Issue')
                {
                    leadEnquiryDynamicStatus = 'Service Enquiry';
                }
                else if(ldLst[0].Reason_For_Enquiry__c == 'Other')
                {
                    leadEnquiryDynamicStatus = 'Other Enquiry';
                }
            }
            
            System.debug('****leadEnquiryDynamicStatus ' + leadEnquiryDynamicStatus);
            System.debug('****ldLst[0].Applicant_Status__c ' + ldLst[0].Applicant_Status__c);
            if(ldLst[0].Applicant_Status__c == null || ldLst[0].Applicant_Status__c != leadEnquiryDynamicStatus || ldLst[0].Hybrid_Link_Opened_Datetime__c == null)
            {
                Lead ldAppStatus = new Lead();
                ldAppStatus.Id = ldLst[0].Id;
                if((ldLst[0].Applicant_Status__c == null || ldLst[0].Applicant_Status__c != leadEnquiryDynamicStatus) && !((ldLst[0].Applicant_Status__c == 'Recent Application' && leadEnquiryDynamicStatus == 'New Enquiry') || (ldLst[0].Applicant_Status__c == 'New Enquiry' && leadEnquiryDynamicStatus == 'Recent Application')))
                {
                    ldAppStatus.Applicant_Status__c = leadEnquiryDynamicStatus;
                    ldAppStatus.Applicant_Status_Logs__c = 'initAcknowledgementRedirect';
                }
                if(ldLst[0].Hybrid_Link_Opened_Datetime__c == null)
                {
                    ldAppStatus.Hybrid_Link_Opened_Datetime__c = DateTime.now();
                    if(ldLst[0].Case__c != null && ldLst[0].Case__r.Hybrid_Link_Opened_Datetime__c == null)
                    {
                        Case ldCs = new Case();
                        ldCs.Id = ldLst[0].Case__c;
                        ldCs.Hybrid_Link_Opened_Datetime__c = DateTime.now();
                        update ldCs;
                    }
                }
                update ldAppStatus; 
            }

            cartItems = [SELECT Id,Product_Inventory__c,Lead__c,Total_Price__c,Delivery_Fee__c,Quantity__c,UnitPrice__c,Cash_Price__c,
                        Product_Inventory__r.ProductName__c,Product_Warehouse__c,Product_Inventory__r.ProductCode__c ,
                        Account__c,APR__c,Consent_Received__c,Frequency__c,Term__c,Instalment_Value__c,TAV__c,Selected_Product__c
                        FROM Cart_Item__c WHERE Lead__c =: lead.Id AND Product_Inventory__c != null and Product_Warehouse__c!=null order by Cash_Price__c desc];
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','initAcknowledgementRedirect',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void initNavBar(Account navAcct)
{
    try
    {   
        consentPending = true;
        productPending = true;
        documentsPending = true;
        assessmentPending = true;
        unsuitabilityPending = true;
        signingPending = true;
        deliveryPending = true;
        puaDeclined = false;
        
        List<Opportunity> oppList = [SELECT Id,Delivery_Date__c,TaxInvoice_Signed_Datetime__c,Approval_Status__c,
                            (Select Id,Description,Name,HNC_Delivery_Status__c,Tracking_Number__c,Tracking_Link__c,HNC_Status_Change_Datetime__c From OpportunityLineItems) 
                            FROM Opportunity WHERE AccountId =: navAcct.Id AND StageName = 'Goods Delivered' AND (CreatedDate = LAST_N_DAYS:30 OR TaxInvoice_Signed_Datetime__c = LAST_N_DAYS:30)
                            ORDER BY CreatedDate DESC LIMIT 1];
                            
        stateMasterState = navAcct.State_Master_State__c;  
        if(navAcct.Equifax_SMS_Consent_Received__c){
            consentPending = false;
        }

        if(navAcct.RO_Online__c){
            productPending = false;
        }
        
        if(navAcct.Is_PhotoId_Attached_After_Enquiry__c && navAcct.Bank_Final_Page__c && navAcct.MyGov_Final_Page__c){
            documentsPending = false;
        }
        
        if(navAcct.Basic_Info_Online__c && navAcct.Expense_Online__c && navAcct.Income_Online__c){
            assessmentPending = false;
        }

        if(navAcct.Hybrid_Link_Finish_DateTime__c != null){
            consentPending = false;
            productPending = false;
            documentsPending = false;
            assessmentPending = false;
            unsuitabilityPending = false;
            puaDeclined = (navAcct.PUA_Status__c == 'Declined' ? true : false);
        }
        
        if(oppList.size() > 0){
            consentPending = false;
            productPending = false;
            documentsPending = false;
            assessmentPending = false;
            
            if(oppList[0].Approval_Status__c == 'Approved' && oppList[0].TaxInvoice_Signed_Datetime__c != null){
                signingPending = false;
            }
        }
        
        if(oppList.size() > 0 && oppList[0].OpportunityLineItems.size() > 0){
            Integer prodDeliveryCount = 0;
            for(OpportunityLineItem opl : oppList[0].OpportunityLineItems){
                if(opl.HNC_Delivery_Status__c != 'Delivered'){
                    deliveryPending = true;
                    nextOnlineLandingStep = 'Delivery';       
                }else{
                    prodDeliveryCount++;
                }
            }
            if(prodDeliveryCount == oppList[0].OpportunityLineItems.size()){
                deliveryPending = false;
            }
            deliveryProducts = oppList[0].OpportunityLineItems;
        }
        
        if(!signingPending){
            consentPending = false;
            productPending = false;
            documentsPending = false;
            assessmentPending = false;
            unsuitabilityPending = false;
        }
        
        if(consentPending){
            currentOnlineLandingStep = 'Consent';
        }else if(productPending){
            currentOnlineLandingStep = 'Product Requirements';
        }else if(!navAcct.Is_PhotoId_Attached_After_Enquiry__c && documentsPending){
            currentOnlineLandingStep = 'Documents';
            nextOnlineLandingStep = 'Photo Id';
        }else if(!navAcct.Bank_Final_Page__c && documentsPending){
            currentOnlineLandingStep = 'Documents';
            nextOnlineLandingStep = 'Bank Statement';
        }else if(!navAcct.MyGov_Final_Page__c && documentsPending){
            currentOnlineLandingStep = 'Documents';
            nextOnlineLandingStep = (stateMasterState == 'NZ' ? 'Proof of Income' : 'MyGov Statement');
        }else if(!navAcct.Basic_Info_Online__c && assessmentPending){
            currentOnlineLandingStep = 'Verification';
            nextOnlineLandingStep = 'Contact Details';
        }else if(!navAcct.Income_Online__c && assessmentPending){
            currentOnlineLandingStep = 'Verification';
            nextOnlineLandingStep = 'Income';
        }else if(!navAcct.Expense_Online__c && assessmentPending){
            currentOnlineLandingStep = 'Verification';
            nextOnlineLandingStep = 'Expenses';
        }else if(navAcct.Hybrid_Link_Finish_DateTime__c == null && unsuitabilityPending){
            currentOnlineLandingStep = 'Preliminary Unsuitability Assessment';
            nextOnlineLandingStep = 'Acknowledgement';
        }else if(oppList.size() == 0){
            currentOnlineLandingStep = 'Approval & Signing';
            nextOnlineLandingStep = 'Approval';
        }else if(oppList.size() > 0 && oppList[0].Approval_Status__c != 'Approved' && signingPending){
            currentOnlineLandingStep = 'Approval & Signing';
            nextOnlineLandingStep = 'Approval';
        }else if(oppList.size() > 0 && oppList[0].Approval_Status__c == 'Approved' && oppList[0].TaxInvoice_Signed_Datetime__c == null && signingPending){
            currentOnlineLandingStep = 'Approval & Signing';
            nextOnlineLandingStep = 'Signing';
        }else if(oppList.size() > 0 && oppList[0].OpportunityLineItems.size() > 0 && deliveryPending){
            for(OpportunityLineItem opl : oppList[0].OpportunityLineItems){
                if(opl.HNC_Delivery_Status__c != 'Delivered'){
                    currentOnlineLandingStep = 'Delivery';        
                }
            }
        }
        
        System.debug('****consentPending ' + consentPending);
        System.debug('****productPending ' + productPending);
        System.debug('****documentsPending ' + documentsPending);
        System.debug('****assessmentPending ' + assessmentPending);
        System.debug('****unsuitabilityPending ' + unsuitabilityPending);
        System.debug('****signingPending ' + signingPending);
        System.debug('****deliveryPending ' + deliveryPending);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','initNavBar',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void initR4KOnlineLandingPage()
{
    try
    {
        ldId = Apexpages.currentPage().getParameters().get('ld');
        acctId = Apexpages.currentPage().getParameters().get('id');
        redo = Apexpages.currentPage().getParameters().get('redo');
        
        if(ldId != null && ldId != '')
        {
            List<Lead> ldList = [SELECT Id,Account__c,Applicant_Status__c,Account__r.State_Master_State__c,Account__r.Company_Territory__c,Account__r.Territory_Short_Name__c FROM Lead WHERE Id =: ldId LIMIT 1];
            if(ldList.size() > 0)
            {
                lead = ldList[0];
                acctId = ldList[0].Account__c != null ? ldList[0].Account__c : null;
                leadEnquiryDynamicStatus = ldList[0].Applicant_Status__c==null ? 'New Enquiry' : ldList[0].Applicant_Status__c; 
                stateMasterState = ldList[0].Account__r.State_Master_State__c;     
            } 
        }
        
        if(acctId != null && acctId != '')
        {
            if(lead == null || ldId == null || ldId == '')
            {
                List<Lead> ldList = [SELECT Id,Account__c,Applicant_Status__c,Account__r.State_Master_State__c,Account__r.Company_Territory__c,Account__r.Territory_Short_Name__c FROM Lead WHERE Account__c =: acctId AND IsConverted = true ORDER BY CreatedDate DESC LIMIT 1];
                if(ldList.size() > 0)
                {
                    lead = ldList[0];
                    ldId = ldList[0].Id;
                    acctId = ldList[0].Account__c != null ? ldList[0].Account__c : acctId;
                    leadEnquiryDynamicStatus = ldList[0].Applicant_Status__c==null ? 'New Enquiry' : ldList[0].Applicant_Status__c;
                    stateMasterState = ldList[0].Account__r.State_Master_State__c;        
                }
            }
            
            List<Account> accts = [SELECT Id,Name,Customer_No__c,Why_consumer_lease__c,Benefit_of_Consumer_Lease_with_R4K__c,Product_Interested_In__c,Product_Description__c,
                                     Specify_Other_Benefits_of_Consumer_Lease__c,Why_not_phone_plan__c,CAM_Equifax__c,CAM_Expense__c,CAM_Basic__c,Agreement_Completed_Date__c,Active_Agreements__c,
                                     Enquiry_Date__c,Residential_Status__c,AgreementId_for_Current_Enquiry__c,Centrelink_Benefit__c,Centrelink_Benefit_Amount__c,State_Master_State__c,
                                     Equifax_SMS_Consent_Received__c,Customer_Photo_Id__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,MyGov_Final_Page__c,Basic_Info_Online__c,
                                     Income_Online__c,Expense_Online__c,Referees_Online__c,RO_Online__c,Equifax_Online__c,Hybrid_Link_Finish_Datetime__c,PUA_Status__c 
                                     FROM Account WHERE Id =: acctId LIMIT 1];
        
            if(accts.size()>0)
            {
               acct = accts[0];
               initNavBar(acct);
            }
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','initR4KOnlineLandingPage',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void initAccountEnquiry()
{
    try
    {
        isCreditContract = true;
        isConverted = false;
        noOfActiveAgreements = 0;
        ldId = Apexpages.currentPage().getParameters().get('ld');
        system.debug('##initAccountEnquiry: '+ldId);
        if(ldId!=null && ldId!='')
        {
            List<Lead> ldList = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,Account__r.Hybrid_Link_Finish_Datetime__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Probable_Account__c,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Customer_No__c,Account__r.Name,Account__r.SMS_Mobile__c,Territory_State__c,Territory_Number__r.Is_Credit_Contract__c
                                from Lead where id=:ldId Limit 1];
                                
            if(ldList.size() > 0)
            {
                lead = ldList[0];
                ldMobile = lead.MobilePhone;
                followUpRepMobile = lead.Territory_Number__r.Lead_Phone__c;
                istimeout = lead.OTP_Code_Auth_Datetime__c != null && (DateTime.now().getTime() - lead.OTP_Code_Auth_Datetime__c.getTime() < 1800000) ? false : true;
                acctId = (ldList[0].Account__c != null ? ldList[0].Account__c : (ldList[0].Probable_Account__c != null ? ldList[0].Probable_Account__c : acctId));
                leadEnquiryDynamicStatus = ldList[0].Applicant_Status__c==null ? 'New Enquiry' : ldList[0].Applicant_Status__c;
                isCreditContract = lead.Territory_Number__r.Is_Credit_Contract__c;
                
                if(acctId != null && acctId != '')
                {
                    List<Account> accts = [select id, name, FirstName,LastName,PersonMobilePhone,SMS_Mobile__c,Customer_No__c,Customer_Photo_Id__c,WrittenOff_s_Count__c,
                                            Last_Collection_Activity__c,Last_Collection_Activity__r.Collection_Outcome1__c,Last_Collection_Activity__r.Short_Link__c,Actual_Arrears__c,
                                            Active_Agreements__c,Fortnightly_Scheduled_Payment__c,LastPaymentRecieved__c,Last_Payment_Upload_Date__c,Schedule_Amount__c,OwnerId,State_Master_State__c,
                                            Territory_Number__c,Territory_Number__r.Is_Credit_Contract__c
                                            from Account where id=:acctId AND Territory_Short_Name__c NOT IN: wideBayTerritories Limit 1];
                    
                    if(accts.size() > 0)
                    {
                        acct = accts[0];
                        isCreditContract = acct.Territory_Number__r.Is_Credit_Contract__c;
                        isConverted = true;
                        stateMasterState = acct.State_Master_State__c; 
                        breakEvenReached = false;
                        agmtFinishingIn90Days = false;
                        actualArrears = 0;
                        activeOppList = [SELECT Id,Name,Amount,Remaining_Amount__c,Fortnightly_Schedule_Payment__c,Next_Payment_Due_Date__c,
                                        No_of_Remaining_Payments_to_be_Made__c,Payment_Frequency__c,Scheduled_Amount__c,Total_COGS_Less_AAF__c,Contract_No__c,
                                        Total_Paid_Amount__c,Expected_Close_Date__c,Actual_Arrears__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Collection_Outcome1__c,Last_Collection_Activity__r.Short_Link__c 
                                        FROM Opportunity WHERE AccountId =: acctId AND StageName in ('Goods Delivered','Written Off / Bad Debt') AND RecordType.Name <> 'Trak SIM' ORDER BY Actual_Arrears__c,Taxinvoice_Signed_Datetime__c DESC];
                        activeOppSelectOptions = new List<SelectOption>();
                        activeOppSelectOptions.add(new SelectOption('--None--','--None--'));
                        for(Opportunity activeOpp : activeOppList){
                            if(nextPaymentDueDate == null || (activeOpp.Next_Payment_Due_Date__c != null && activeOpp.Next_Payment_Due_Date__c < nextPaymentDueDate)){
                                nextPaymentDueDate = activeOpp.Next_Payment_Due_Date__c;
                            }
                            activeOppSelectOptions.add(new SelectOption(activeOpp.Name,activeOpp.Name));
                            if(activeOpp.Total_Paid_Amount__c != null && activeOpp.Total_Paid_Amount__c >= activeOpp.Total_COGS_Less_AAF__c){
                                breakEvenReached = true;
                            }else{
                                breakEvenReached = false;
                            }
                            if(activeOpp.Expected_Close_Date__c != null && Date.today().daysBetween(activeOpp.Expected_Close_Date__c) <= 100){
                                agmtFinishingIn90Days = true;
                            }
                            actualArrears += (activeOpp.Actual_Arrears__c == null ? 0 : activeOpp.Actual_Arrears__c);
                            noOfActiveAgreements++;
                        }
                        activeOppSelectOptions.add(new SelectOption('Other','Other'));
                    }
                }
                closeWeCareCasesOnSummary();
            }
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','initAccountEnquiry',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void createEnquiryCase()
{
    try
    {
        String enquiryType = Apexpages.currentPage().getParameters().get('enquiryType');
        String enquiryOpp = Apexpages.currentPage().getParameters().get('enquiryOpp');
        String enquiryNotes = Apexpages.currentPage().getParameters().get('enquiryNotes');
        String rFromDt=Apexpages.currentPage().getParameters().get('rFromDt');
        String rFromTi=Apexpages.currentPage().getParameters().get('rFromTi');
        enquiryOpp = (enquiryOpp == null || enquiryOpp == '') ? 'Other' : enquiryOpp;
        
        DateTime todayDateTime = DateTime.now();
        String dateTimeString = todayDateTime.format('dd/MM') + ' ' + todayDateTime.hour() + ':' + todayDateTime.minute();
        String weCareRecordTypeId = Util.getRecordTypeInfosByDeveloperName('Case').get('We_Care').Id;
        String collectionRecordTypeId = Util.getRecordTypeInfosByDeveloperName('Case').get('Collection').Id;
        String closedRecordTypeId = Util.getRecordTypeInfosByDeveloperName('Case').get('R4K_Closed_Case').Id;
        String caseRecordTypeId = (lead.Applicant_Status__c == 'Collection' ? collectionRecordTypeId : weCareRecordTypeId);
        String caseOwnerId;
        String caseId;
        String assignedTo = (lead.Applicant_Status__c == 'Collection' ? 'Collection' : 'We Care');
        String callBackDateTimeStr = rFromDt+' '+rFromTi+':00';
        DateTime callBackDateTime = DateTime.valueOfGMT(callBackDateTimeStr);
        System.debug('##callBackDateTime ' + callBackDateTime);
        System.debug('##lead.Territory_State__c ' + lead.Territory_State__c);
        System.debug('##UserInfo.getTimeZone().getID() ' + UserInfo.getTimeZone().getID());
        System.debug('##stateToTimezone.get(lead.Territory_State__c) ' + stateToTimezone.get(lead.Territory_State__c));
        callBackDateTime = callBackDateTime.addMinutes(Util.getTimeDifferenceBetweenUsers(UserInfo.getTimeZone().getID(), stateToTimezone.get(lead.Territory_State__c)));
        System.debug('##callBackDateTime ' + callBackDateTime);
        callBackDateTimeStr = callBackDateTime.format('dd MMM yyyy h:mm a', stateToTimezone.get(lead.Territory_State__c)) + ' ' + lead.Territory_State__c + ' timezone.';
        List<Case> csList = [SELECT Id,Description,Status,OwnerId,Hybrid_Link_Opened_Datetime__c FROM Case WHERE AccountId =: lead.Account__c AND Status <> 'Closed' AND RecordTypeId =: caseRecordTypeId ORDER BY CreatedDate DESC LIMIT 1];
        if(csList.size() == 0)
        {
            csList = [SELECT Id,Description,Status,OwnerId,Hybrid_Link_Opened_Datetime__c FROM Case WHERE AccountId =: lead.Account__c AND Status = 'Closed' AND ClosedDate = LAST_N_DAYS:10 AND RecordTypeId =: closedRecordTypeId AND Assigned_To__c =: assignedTo ORDER BY ClosedDate DESC LIMIT 1];
        }
        if(lead.Applicant_Status__c != null && lead.Applicant_Status__c != 'Recent Application' && lead.Applicant_Status__c != 'New Enquiry')
        {
            Case cs = new Case();
            if(csList.size() > 0)
            {
                cs.Id = csList[0].Id;
                caseId = csList[0].Id;
                cs.Callback_Requested_DateTime__c = callBackDateTime;
                cs.Description = dateTimeString + '\n\n' + 'Reason for enquiry : ' + enquiryOpp + '\n' + 'Notes / Comments : ' + enquiryNotes + '\n' + 'Callback requested on ' + callBackDateTimeStr + (csList[0].Description == null ? '' : '\n\n' + csList[0].Description);
                cs.Type = enquiryType;
                cs.Status = (csList[0].Status == 'Closed' ? 'Re-Opened' : csList[0].Status);
                cs.RecordTypeId = caseRecordTypeId;
                cs.Reason_For_Closing__c = null;
                if(csList[0].Hybrid_Link_Opened_Datetime__c == null)
                {
                    cs.Hybrid_Link_Opened_Datetime__c = DateTime.now();
                }
                update cs;
                caseOwnerId = csList[0].OwnerId;
            }else
            {
                User caseUser;
                List<User> wecareUsers = [SELECT Id,Name FROM User WHERE Name in ('Darranda Admin','NZ CLO','Darranda Collections','IT Admin')];
                for(User us : wecareUsers)
                {
                    if(lead.Account__r.State_Master_State__c == 'NZ' && us.Name == 'NZ CLO')
                    {
                        caseUser = us;
                        break;
                    }else if(lead.Account__r.State_Master_State__c <> 'NZ' && lead.Applicant_Status__c == 'Collection' && us.Name == 'Darranda Collections')
                    {
                        caseUser = us;
                        break;
                    }else if(lead.Account__r.State_Master_State__c <> 'NZ' && lead.Applicant_Status__c != 'Collection' && us.Name == 'Darranda Admin')
                    {
                        caseUser = us;
                        break;
                    }else if(caseUser == null && us.Name == 'IT Admin'){
                        caseUser = us;
                    }
                }
                
                cs.Lead__c = ldId;
                cs.Origin = 'Web';
                cs.Subject = lead.Account__r.Name + ' (' + lead.Account__r.Customer_No__c + ')';
                cs.Callback_Requested_DateTime__c = callBackDateTime;
                cs.Description = dateTimeString + '\n\n' + 'Reason for enquiry : ' + enquiryOpp + '\n' + 'Notes / Comments : ' + enquiryNotes + '\n' + 'Callback requested on ' + callBackDateTimeStr;
                cs.Priority = 'Level 3 - High';
                cs.Status = 'New';
                cs.Type = enquiryType;
                cs.RecordTypeId = caseRecordTypeId;
                cs.OwnerId = caseUser != null ? caseUser.Id : UserInfo.getUserId();
                cs.Assigned_To__c = assignedTo;
                cs.AccountId = lead.Account__c;
                cs.Hybrid_Link_Opened_Datetime__c = DateTime.now();
                caseOwnerId = cs.OwnerId;
                
                if(lead.Applicant_Status__c == 'Collection')
                {
                    Opportunity collectionsOpp;
                    if(acct.Territory_Number__r.Is_Credit_Contract__c){
                        if(enquiryOpp != null && enquiryOpp.trim() != '' && enquiryOpp != 'Other'){
                            enquiryOpp = enquiryOpp.trim();
                            for(Opportunity arrearOpp : activeOppList){
                                if(arrearOpp.Name == enquiryOpp){
                                    collectionsOpp = arrearOpp;
                                    break;
                                }
                            }
                        }else if(activeOppList.size() > 0){
                            collectionsOpp = activeOppList[0];
                        }

                        if(collectionsOpp != null && collectionsOpp.Last_Collection_Activity__c == null || collectionsOpp.Last_Collection_Activity__r.Collection_Outcome1__c != 'In Progress'){
                            Collection_Activity__c ca = new Collection_Activity__c();
                            ca.Applicant__c = acct.Id;
                            ca.Agreement__c = collectionsOpp.Id;
                            ca.Collection_Outcome1__c = 'In Progress';
                            ca.Activity_Type__c = 'Missed';
                            ca.Minimum_Amount_Expected_From_Payer__c = ((collectionsOpp.Scheduled_Amount__c == null ? 0 : collectionsOpp.Scheduled_Amount__c)/2);
                            insert ca;
                            cs.Collection_Activity__c = ca.Id;
                            
                            Account acctToUp = new Account();
                            acctToUp.Id = acct.Id;
                            acctToUp.Last_Collection_Activity__c = ca.Id;
                            update acctToUp;

                            Opportunity colOpp = new Opportunity();
                            colOpp.Id = collectionsOpp.Id;
                            colOpp.Last_Collection_Activity__c = ca.Id;
                            update colOpp;
                        }else{
                            cs.Collection_Activity__c = (collectionsOpp != null ? collectionsOpp.Last_Collection_Activity__c : acct.Last_Collection_Activity__c);
                        }
                    }else{
                        if(acct.Last_Collection_Activity__c == null || acct.Last_Collection_Activity__r.Collection_Outcome1__c != 'In Progress')
                        {
                            Collection_Activity__c ca = new Collection_Activity__c();
                            ca.Applicant__c = acct.Id;
                            ca.Collection_Outcome1__c = 'In Progress';
                            ca.Activity_Type__c = 'Missed';
                            ca.Minimum_Amount_Expected_From_Payer__c = ((acct.Schedule_Amount__c == null ? 0 : acct.Schedule_Amount__c)/2);
                            insert ca;
                            cs.Collection_Activity__c = ca.Id;
                            
                            Account acctToUp = new Account();
                            acctToUp.Id = acct.Id;
                            acctToUp.Last_Collection_Activity__c = ca.Id;
                            update acctToUp;
                        }else
                        {
                            cs.Collection_Activity__c = acct.Last_Collection_Activity__c;
                        }
                    }
                }
                insert cs;
                caseId = cs.Id;
            }
        }else
        {
            User caseUser;
            List<User> wecareUsers = [SELECT Id,Name FROM User WHERE Name in ('NZ CLO','R4K Services','NSW SR','IT Admin')];
            for(User us : wecareUsers)
            {
                if(lead.Account__r.State_Master_State__c == 'NZ' && us.Name == 'NZ CLO')
                {
                    caseUser = us;
                    break;
                }else if(lead.Account__r.State_Master_State__c == 'NSW' && us.Name == 'NSW SR')
                {
                    caseUser = us;
                    break;
                }else if(lead.Account__r.State_Master_State__c != 'NZ' && lead.Account__r.State_Master_State__c != 'NSW' && us.Name == 'R4K Services')
                {
                    caseUser = us;
                    break;
                }else if(caseUser == null && us.Name == 'IT Admin'){
                    caseUser = us;
                }
            }
            PhoneCall__c pc = new PhoneCall__c();
            pc.Account__c = lead.Account__c;
            pc.Call_Type__c = 'Incoming SMS';
            pc.OwnerId = caseUser.Id;
            pc.SMS_Message__c = 'Customer requested a callback on ' + callBackDateTimeStr + '\n\n' + enquiryNotes;
            pc.Mobile__c = lead.Account__r.SMS_Mobile__c;
            pc.Lead__c = lead.Id;
            pc.Type__c = (lead.Account__r.State_Master_State__c == 'NZ' ? 'NZ CLO' : (lead.Account__r.State_Master_State__c == 'NSW' ? 'NSW CLO' : 'Darranda CLO'));
            //pc.CallStartDateTime__c = callBackDateTime;
            insert pc;
        }
        
        if(lead.Applicant_Status__c != null && lead.Applicant_Status__c != 'Recent Application' && lead.Applicant_Status__c != 'New Enquiry')
        {               
            String empStateMasterState = (lead.Account__r.State_Master_State__c == 'NSW' ? 'NSW' : (lead.Account__r.State_Master_State__c == 'NZ' ? 'NZ' : 'VIC')); //should be changed later
            List<Employee__c> employeeList = [SELECT Id,Name,Territory__c,Territory__r.State_Master_State__c FROM Employee__c WHERE Name in ('We Care','Collections','Hybrid Application') AND Territory__r.State_Master_State__c =: empStateMasterState ORDER BY Name ASC];
            Employee__c hybridEmployee;
            Employee__c wecareEmployee;
            Employee__c collectionsEmployee;
            
            for(Integer e=0; e<employeeList.size(); e++)
            {
                if(employeeList[e].Name == 'Collections')
                {
                    collectionsEmployee = employeeList[e];
                }
                else if(employeeList[e].Name == 'We Care')
                {
                    wecareEmployee = employeeList[e];
                }
                else if(employeeList[e].Name == 'Hybrid Application')
                {
                    hybridEmployee = employeeList[e];
                }
            }
           
            Account csAcct = new Account();
            csAcct.Id = lead.Account__c;
            csAcct.Enquiry_Status__c = 'Existing Account Enquiry';
            csAcct.Rep_Responsible_For_Converting_Lead__c = (wecareEmployee != null ? wecareEmployee.Id : hybridEmployee.Id);
            update csAcct;
                        
            Lead csLd = new Lead();
            csLd.Id = ldId;
            csLd.Applicant_Status__c = enquiryType;
            csLd.Callback_Requested_DateTime__c = callBackDateTime;
            csLd.Applicant_Status_Logs__c = 'createEnquiryCase';
            csLd.Case__c = caseId;
            update csLd; 
        }
    }catch(Exception ex){
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KOnlineApplicationController','createEnquiryCase',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public PageReference closeWeCareCases()
{
    try
    {
        hasProvidedConsentVal = false;
        Boolean newLeadCreated = false;
        String latestLeadId = ldId;
        String accountEnquiryRecordTypeId = Util.getRecordTypeInfosByDeveloperName('Case').get('We_Care').Id;
        List<Case> upcsList = new List<Case>();
        List<Case> csList = [SELECT Id,Description,Status FROM Case WHERE AccountId =: lead.Account__c AND Status <> 'Closed' AND RecordTypeId =: accountEnquiryRecordTypeId];    
        for(Integer c=0;c<csList.size();c++)
        {
            Case cs = new Case();
            cs.Id = csList[c].Id;
            cs.Status = 'Closed';
            cs.Reason_For_Closing__c = 'New Application';
            upcsList.add(cs);
        }
        update upcsList;
        
        List<Account> onlineAcctList = [SELECT Id,FirstName,LastName,PersonMobilePhone,PersonEmail,OwnerId,PersonMailingPostalCode,PersonMailingStreet,PersonMailingCity,
                                                PersonMailingState,Name,SMS_Mobile__c,No_of_Agreements__c,Company_Territory__c,WINZ_No__c,Territory_Number__c,PersonMailingCountry,
                                                BirthDate__c,Identification_No__c,Identification_Type__c,MOGO_Bank_Institution_Selected__c,Customer_No__c,Equifax_SMS_Consent_Received__c,
                                                Hybrid_URL_BankStatement__c,Bank_Institution__c,AccessID_BankStatement__c,Hybrid_URL_MyGov__c,Consent_URL_Opened_DateTime__c,Territory_Number__r.Short_Name__c,
                                                Is_PhotoId_Attached_After_Enquiry__c,MyGov_Final_Page__c,Bank_Final_Page__c,Enquiry_Date__c,Enquiry_Status__c,State_Master_State__c,Sensis_Latitude__c,
                                                Sensis_Longitude__c,Hybrid_Link_Allocation_Datetime__c,Enquiry_Notes__c,Hybrid_Link_Finish_Datetime__c,WrittenOff_s_Count__c,Territory_Number__r.No_Postcode_Present__c,
                                                Last_Agreement_Close_Date__c,RecordType.Name,No_of_times_lead_has_been_converted__c
                                                FROM Account WHERE Id =: lead.Account__c AND Territory_Short_Name__c NOT IN: wideBayTerritories LIMIT 1];
        
        if(onlineAcctList.size() > 0)
        {
            hasProvidedConsentVal = onlineAcctList[0].Equifax_SMS_Consent_Received__c;
            if(onlineAcctList[0].Enquiry_Status__c != null && (onlineAcctList[0].Enquiry_Status__c.startsWith('DN') || (onlineAcctList[0].Enquiry_Status__c == 'Enquiry' && (onlineAcctList[0].Enquiry_Date__c == null || onlineAcctList[0].Enquiry_Date__c.daysBetween(Date.today()) > 30))))
            {
                //Create Lead
                Lead rlead = new Lead();
                rlead.FirstName = onlineAcctList[0].FirstName;
                rlead.LastName = onlineAcctList[0].LastName;
                rlead.MobilePhone = onlineAcctList[0].PersonMobilePhone;
                rlead.Email = onlineAcctList[0].PersonEmail;
                rlead.OwnerId = onlineAcctList[0].OwnerId;
                rlead.Street = onlineAcctList[0].PersonMailingStreet;
                rlead.City = onlineAcctList[0].PersonMailingCity;
                rlead.State = onlineAcctList[0].PersonMailingState;
                rlead.Territory_Number__c = onlineAcctList[0].Territory_Number__c;
                rlead.Not_Spam__c = 'yes';
                rlead.Lead_Medium__c = 'Online';
                rlead.Applicant_Status__c = 'New Enquiry';
                rlead.Applicant_Status_Logs__c = 'New Online Lead - closeWeCareCases';
                if(onlineAcctList[0].Territory_Number__r.No_Postcode_Present__c)
                {
                    rlead.PostalCode = onlineAcctList[0].PersonMailingPostalCode;
                }
                insert rlead; 
                latestLeadId = rlead.Id;
                newLeadCreated = true;
            }else if(lead.Applicant_Status__c == null || (lead.Applicant_Status__c <> 'New Enquiry' && lead.Applicant_Status__c <> 'Recent Application'))
            {
                Lead csLd = new Lead();
                csLd.Id = ldId;
                csLd.Applicant_Status__c = 'New Enquiry';
                csLd.Applicant_Status_Logs__c = 'closeWeCareCases';
                update csLd; 
            }
            
            if(newLeadCreated || (lead.Applicant_Status__c <> 'New Enquiry' && lead.Applicant_Status__c <> 'Recent Application'))
            {
                String empStateMasterState = (lead.Account__r.State_Master_State__c == 'NSW' ? 'NSW' : (lead.Account__r.State_Master_State__c == 'NZ' ? 'NZ' : 'VIC')); //should be changed later
                List<Employee__c> employeeList = [SELECT Id,Name,Territory__c,Territory__r.State_Master_State__c FROM Employee__c WHERE Name in ('We Care','Collections','Hybrid Application') AND Territory__r.State_Master_State__c =: empStateMasterState ORDER BY Name ASC];
                Employee__c hybridEmployee;
                Employee__c wecareEmployee;
                Employee__c collectionsEmployee;
                
                for(Integer e=0; e<employeeList.size(); e++)
                {
                    if(employeeList[e].Name == 'Collections')
                    {
                        collectionsEmployee = employeeList[e];
                    }
                    else if(employeeList[e].Name == 'We Care')
                    {
                        wecareEmployee = employeeList[e];
                    }
                    else if(employeeList[e].Name == 'Hybrid Application')
                    {
                        hybridEmployee = employeeList[e];
                    }
                }
                
                Account acctToUp = new Account();
                acctToUp.Id = onlineAcctList[0].Id;
                acctToUp.Enquiry_Status__c = 'Enquiry';
                acctToUp.Rep_Responsible_For_Converting_Lead__c = hybridEmployee.Id;
                acctToUp.OwnerId = onlineAcctList[0].OwnerId;
                acctToUp.Enquiry_Date__c = Date.today();
                acctToUp.Enquiry_DateTime__c = DateTime.now();
                
                //Make all Credit Matrix values blank as an Enquiry is created
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
                acctToUp.No_of_times_lead_has_been_converted__c = onlineAcctList[0].No_of_times_lead_has_been_converted__c;
                acctToUp.TR4K_Link_Status__c = null;
                
                if(onlineAcctList[0].Enquiry_Date__c == null || onlineAcctList[0].Enquiry_Date__c.daysBetween(Date.today()) > 21)
                {
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
                    hasProvidedConsentVal = false;
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
            
                if(newLeadCreated)
                { 
                    NewEnquirySectionController nesc = new NewEnquirySectionController();
                    nesc.doConvert(latestLeadId,acctToUp);
                    nesc.calculateCallTime(acctToUp.Id,latestLeadId);
                }
            }
        }
        String randomNumber=SecretUtil.generateRandomNumber();
        if(hasProvidedConsentVal){
            return new PageReference(onlineURL+'/R4KOnlineForm?ld='+latestLeadId+'&redo=yes&n='+randomNumber).setRedirect(true);
        }else{
            return new PageReference(onlineURL+'/R4KCreditGuide?ld='+latestLeadId+'&redo=yes&n='+randomNumber).setRedirect(true);
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','closeWeCareCases',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference redirectToPaymentLink()
{
    try
    {
        String colOppNo = ApexPages.currentPage().getParameters().get('colOppNo');
        String paymentLink;
        if(isCreditContract && activeOppList.size() > 0){
            Opportunity colOpp = activeOppList[0];
            for(Opportunity copp : activeOppList){
                if(copp.Contract_No__c == colOppNo){
                    colOpp = copp;
                }
            }
            if(colOpp.Last_Collection_Activity__c != null && colOpp.Last_Collection_Activity__r.Collection_Outcome1__c == 'In Progress' && colOpp.Last_Collection_Activity__r.Short_Link__c != null)
            {
                paymentLink = colOpp.Last_Collection_Activity__r.Short_Link__c;
            }else if(colOpp.Last_Collection_Activity__c == null || colOpp.Last_Collection_Activity__r.Collection_Outcome1__c != 'In Progress' || colOpp.Last_Collection_Activity__r.Short_Link__c == null)
            {
                EzidebitSiteController es = new EzidebitSiteController();
                if(!Test.isRunningTest() && colOpp != null)
                {
                    paymentLink = es.createEncryptedURL('',acct.Id+'/'+colOpp.Id);
                    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                    paymentLink = sl.shortLinkGenerator(paymentLink);
                }
                Collection_Activity__c ca = new Collection_Activity__c();
                if(colOpp.Last_Collection_Activity__c == null || colOpp.Last_Collection_Activity__r.Collection_Outcome1__c != 'In Progress')
                {
                    ca.Applicant__c = acct.Id;
                    ca.Agreement__c = colOpp.Id;
                    ca.Collection_Outcome1__c = 'In Progress';
                    ca.Short_Link__c = paymentLink;
                    ca.Activity_Type__c = 'Missed';
                    ca.Minimum_Amount_Expected_From_Payer__c = ((colOpp.Scheduled_Amount__c == null ? 0 : colOpp.Scheduled_Amount__c)/2);
                    ca.Collection_Officer__c = 'CAP User';
                    insert ca;
                    
                    Account acctToUp = new Account();
                    acctToUp.Id = acct.Id;
                    acctToUp.Last_Collection_Activity__c = ca.Id;
                    update acctToUp;
                    
                    Opportunity clOpp = new Opportunity();
                    clOpp.Id = colOpp.Id;
                    clOpp.Last_Collection_Activity__c = ca.Id;
                    update clOpp;
                }else
                {
                    ca.Id = acct.Last_Collection_Activity__c;
                    ca.Short_Link__c = paymentLink;
                    update ca;
                }
            }
        }else{
            if(acct.Last_Collection_Activity__c != null && acct.Last_Collection_Activity__r.Collection_Outcome1__c == 'In Progress' && acct.Last_Collection_Activity__r.Short_Link__c != null)
            {
                paymentLink = acct.Last_Collection_Activity__r.Short_Link__c;
            }else if(acct.Last_Collection_Activity__c == null || acct.Last_Collection_Activity__r.Collection_Outcome1__c != 'In Progress' || acct.Last_Collection_Activity__r.Short_Link__c == null)
            {
                EzidebitSiteController es = new EzidebitSiteController();
                if(!Test.isRunningTest() && activeOppList.size() > 0)
                {
                    paymentLink = es.createEncryptedURL('',acct.Id+'/'+activeOppList[0].Id);
                    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                    paymentLink = sl.shortLinkGenerator(paymentLink);
                }
                Collection_Activity__c ca = new Collection_Activity__c();
                if(acct.Last_Collection_Activity__c == null || acct.Last_Collection_Activity__r.Collection_Outcome1__c != 'In Progress')
                {
                    ca.Applicant__c = acct.Id;
                    ca.Collection_Outcome1__c = 'In Progress';
                    ca.Short_Link__c = paymentLink;
                    ca.Activity_Type__c = 'Missed';
                    ca.Minimum_Amount_Expected_From_Payer__c = ((acct.Schedule_Amount__c == null ? 0 : acct.Schedule_Amount__c)/2);
                    ca.Collection_Officer__c = 'CAP User';
                    insert ca;
                    
                    Account acctToUp = new Account();
                    acctToUp.Id = acct.Id;
                    acctToUp.Last_Collection_Activity__c = ca.Id;
                    update acctToUp;
                }else
                {
                    ca.Id = acct.Last_Collection_Activity__c;
                    ca.Short_Link__c = paymentLink;
                    update ca;
                }
            }
        }
        return new PageReference(paymentLink).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','redirectToPaymentLink',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void resetBank()
{
    try
    {
        String bankRedoAgree = Apexpages.currentPage().getParameters().get('bankRedoAgree');
        String randomNumber=SecretUtil.generateRandomNumber();
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.Last_Online_Activity_DateTime__c = Datetime.now();
        if(bankRedoAgree != null && bankRedoAgree == 'yes')
        {
            accountToUp.BankStatement_Amend__c = true;
        }else if(bankRedoAgree != null && bankRedoAgree == 'remove')
        {
            accountToUp.Bank_Final_Page__c = false;
            accountToUp.BankStatement_Date__c = null;
            accountToUp.BankStatement_Completion_Datetime__c = null;
            accountToUp.BankStatement_Amend__c = false;
        }
        update accountToUp;
        //return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&redo=yes&param=sdbsaLogin&n='+randomNumber).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','resetBank',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        //return null;
    }
}

public PageReference resetMygov()
{
    try
    {
        String mygovRedoAgree = Apexpages.currentPage().getParameters().get('mygovRedoAgree');
        String randomNumber=SecretUtil.generateRandomNumber();
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        accountToUp.MyGov_Final_Page__c = false;
        accountToUp.MyGov_Date__c = null;
        accountToUp.myGov_Completion_Datetime__c = null;
        accountToUp.Last_Online_Activity_DateTime__c = Datetime.now();
        update accountToUp;
        return new PageReference(onlineURL+'/R4KOnlineForm?id='+acctId+'&redo=yes&param=sdmg&n='+randomNumber).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','resetMygov',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void sendOCRRequest(String documentId, String ocrLeadId, String frontOrBack)
{
    try{
        photoIdDetails = '';
        ocrText = '';
        String datePattern = '\\d{4}-\\d{2}-\\d{2}|\\d{2}-\\d{2}-\\d{4}|\\d{2}/\\d{2}/\\d{4}|\\d{2}.\\d{2}.\\d{2}|\\d{2} \\b(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \\d{4}|\\d{2} \\b(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC) \\d{4}|\\d{8}';
        Pattern pat;
        Matcher mat;
        
        String photoIdEncoded = ''; 
        List<Document> idDocs = [SELECT Id,Body FROM Document WHERE Id =: documentId LIMIT 1];
        if(idDocs.size() > 0){
            Blob documentBody = idDocs[0].Body;
            photoIdEncoded = EncodingUtil.base64Encode(documentBody);
        }
        Http http = new Http();  
        HttpRequest  request = new HttpRequest();
        request.setMethod('POST');       
        //request.setHeader('Content-Length', '2000');
        request.setHeader('Content-Type', 'application/json'); 
        request.setEndpoint('https://vision.googleapis.com/v1/images:annotate?key=' + googleOCRKey);            
        String reqBody = '{"requests": [{"image": {"content": "' + photoIdEncoded + '"}, "features": [{"type": "TEXT_DETECTION"} ] } ] }';
        //System.debug(reqBody);
        request.setTimeout(60000);
        request.setBody(reqBody);         
        HttpResponse response = http.send(request);         
        responseText = response.getBody();
        System.debug(responseText);
        
        textBlocks = new List<TextBlock>();
        idName = '';
        idLastName = '';
        idFirstName = '';
        Integer postcodeIndex = 0;         
        GoogleOCRJSON2Apex gocr;

        if(responseText != null){
            gocr = GoogleOCRJSON2Apex.parse(responseText);
            System.debug(gocr);
        }
        if(responseText != null && gocr != null && gocr.responses != null && gocr.responses.size() > 0 && gocr.responses[0].fullTextAnnotation != null && gocr.responses[0].textAnnotations != null)
        {
            GoogleOCRJSON2Apex.Responses gresp = gocr.responses[0];
            encodedText = gresp.fullTextAnnotation.text.toUpperCase();
            ocrText = encodedText;
            ocrText = ocrText.replaceAll('\n',' ');
            ocrText = ocrText.replaceAll('\'',' ');
            System.debug(encodedText);
        
            idState = ((encodedText.containsIgnoreCase('VICTORIA AUSTRALIA') || encodedText.containsIgnoreCase('vic roads')) ? 'VIC' : (encodedText.containsIgnoreCase('NEW SOUTH WALES') ? 'NSW' : (encodedText.containsIgnoreCase('WESTERN AUSTRALIA') ? 'WA' : (encodedText.containsIgnoreCase('SOUTH AUSTRALIA') ? 'SA' : (encodedText.containsIgnoreCase('QUEENSLAND') ? 'QLD' : (encodedText.containsIgnoreCase('NORTHERN TERRITORY') ? 'NT' : (encodedText.containsIgnoreCase('TASMANIA') ? 'TAS' : (encodedText.containsIgnoreCase('AUSTRALIAN CAPITAL TERRITORY') ? 'ACT' : (encodedText.containsIgnoreCase('NEW ZEALAND') ? 'NZ' : null)))))))));
            
            idType = ((encodedText.containsIgnoreCase('Driver Licence') || encodedText.containsIgnoreCase('Driver\'s Licence') || encodedText.containsIgnoreCase('Learner Permit') || encodedText.containsIgnoreCase('Learner\'s Permit')) ? 'Driver Licence' : ((encodedText.containsIgnoreCase('PROOF OF AGE') || encodedText.containsIgnoreCase('PHOTO IDENTIFICATION CARD') || encodedText.containsIgnoreCase('PHOTO CARD')) ? 'Proof of Age Card' : (encodedText.containsIgnoreCase('Keypass') ? 'Keypass' : (encodedText.containsIgnoreCase('Passport') ? 'Passport' : null))));
    
            if(idType == 'Passport')
            {
                if(encodedText.containsIgnoreCase('NEW ZEALAND'))
                {
                    idState = 'NZ';
                }else if(encodedText.containsIgnoreCase('AUSTRALIA'))
                {
                    idState = 'AU';
                }
            }
            
            System.debug('****idType' + idType + '****');
            System.debug('****idState ' + idState);
            
            if(idType == 'Driver Licence' || idType == 'Passport'){
                if(idState == null && idType == 'Driver Licence'){
                    for(Integer i=0; i<gresp.textAnnotations.size(); i++)
                    {
                        if(gresp.textAnnotations[i].description.length() == 4 && gresp.textAnnotations[i].description.isNumeric())
                        {
                            idState = (gresp.textAnnotations[i].description.startsWith('3') ? 'VIC' : (gresp.textAnnotations[i].description.startsWith('5') ? 'SA' : (gresp.textAnnotations[i].description.startsWith('7') ? 'TAS' : (gresp.textAnnotations[i].description.startsWith('6') ? 'WA' : (gresp.textAnnotations[i].description.startsWith('08') ? 'NT' : (gresp.textAnnotations[i].description.startsWith('4') ? 'QLD' : (gresp.textAnnotations[i].description.startsWith('2') ? 'NSW' : '')))))));
                        }
                    }
                }
                System.debug('****idState ' + idState);
                System.debug('****idName ' + idName);
                
                for(Integer i=0; i<gresp.textAnnotations.size(); i++)
                {
                    if((gresp.textAnnotations[i].description == 'VIC' || gresp.textAnnotations[i].description == 'SA' || gresp.textAnnotations[i].description == 'NSW' || gresp.textAnnotations[i].description == 'ACT' || gresp.textAnnotations[i].description == 'QLD' || gresp.textAnnotations[i].description == 'WA' || gresp.textAnnotations[i].description == 'NT' || gresp.textAnnotations[i].description == 'TAS' || gresp.textAnnotations[i].description == 'NZ' || gresp.textAnnotations[i].description == 'ADELAIDE') && (i < (gresp.textAnnotations.size() - 1)) && gresp.textAnnotations[i+1].description.isNumeric())
                    {
                        idPostcode = gresp.textAnnotations[i+1].description;
                        idAddress = idPostcode;
                        postcodeIndex = i+1;
                        break;
                    }
                }
                System.debug('****idPostcode ' + idPostcode);
                System.debug('****idAddress ' + idAddress);
                
                for(Integer i=0; i<gresp.textAnnotations.size(); i++)
                {
                    if(idState == 'SA' && gresp.textAnnotations[i].description.isNumeric() && gresp.textAnnotations[i].description.length() == 4 && gresp.textAnnotations[i].description.startsWith('5'))
                    {
                        idPostcode = gresp.textAnnotations[i].description;
                        idAddress = idPostcode;
                        postcodeIndex = i;
                        break;
                    }else if(idState == 'TAS' && gresp.textAnnotations[i].description.isNumeric() && gresp.textAnnotations[i].description.length() == 4 && gresp.textAnnotations[i].description.startsWith('7'))
                    {
                        idPostcode = gresp.textAnnotations[i].description;
                        idAddress = idPostcode;
                        postcodeIndex = i;
                        break;
                    }
                }
                System.debug('****idPostcode ' + idPostcode);
                System.debug('****idAddress ' + idAddress);
                
                if(idPostcode != null)
                {
                    Boolean foundStreetNumber = false;
                    for(Integer i=postcodeIndex-1; i>=0; i--)
                    {
                        if(foundStreetNumber && !gresp.textAnnotations[i].description.isNumeric())
                        {
                            break;
                        }
                        if(gresp.textAnnotations[i].description.isNumeric())
                        {
                            foundStreetNumber = true;
                        }
                        idAddress = gresp.textAnnotations[i].description + ' ' + idAddress;
                    }
                    idAddress = idAddress.trim();
                }
                System.debug('****idPostcode ' + idPostcode);
                System.debug('****idAddress ' + idAddress);
                
                String previousBlockText = '';
                for(GoogleOCRJSON2Apex.Pages pag : gresp.fullTextAnnotation.pages)
                {
                    for(Integer i=0; i<pag.blocks.size(); i++)
                    {
                        TextBlock tb = new TextBlock();
                        tb.serial = textBlocks.size() + 1;
                        tb.text = '';
                        for(GoogleOCRJSON2Apex.Paragraphs pg : pag.blocks[i].paragraphs)
                        {
                            for(GoogleOCRJSON2Apex.Words_Z wd : pg.words)
                            {
                                for(GoogleOCRJSON2Apex.Symbols_Z symb : wd.symbols)
                                {
                                    tb.text += symb.text;
                                }
                                tb.text += ' ';    
                            }    
                        }
                        tb.text = tb.text.trim();
                        tb.text = tb.text.toUpperCase();
                        textBlocks.add(tb);    
                        System.debug('****' + tb.text + '****');
                        if(idName == '' && idState == 'NZ')
                        {
                            idName = (tb.text.contains('NAME / NOM') ? tb.text.substringAfterLast('NAME / NOM') : (tb.text.contains('GIVEN NAMES') ? tb.text.substringAfterLast('GIVEN NAMES') : (tb.text.contains('FIRST NAMES') ? tb.text.substringAfterLast('FIRST NAMES') : (tb.text.contains('SURNAME') ? tb.text.substringAfterLast('SURNAME') : '')))) + ' ' + idName;
                        }
                        idName = idName.trim();
                        System.debug('****idName ' + idName);
                        System.debug('****idFirstName ' + idFirstName);
                        System.debug('****idLastName ' + idLastName);
                        
                        if(tb.text.containsIgnoreCase('DATE OF BIRTH') || tb.text.containsIgnoreCase('DOB'))
                        {
                            idDates = new List<String>();
                            pat = Pattern.compile(datePattern);
                            mat = pat.matcher(tb.text);
                        
                            while (mat.find()) {
                                idDates.add(mat.group());
                                if(mat.group().length() > 4){
                                    String yearStr = mat.group().substring(mat.group().length()-4);
                                    if(yearStr.isNumeric() && ((Date.today().year() - Integer.valueOf(yearStr)) > 14 && (Date.today().year() - Integer.valueOf(yearStr)) < 90)){
                                        idDOB = mat.group();
                                        System.debug('****idDOB ' + idDOB);
                                        break;
                                    }
                                }
                            }
                            System.debug(idDates);
                        }
                        System.debug('****idDOB ' + idDOB);
                        
                        if(tb.text.containsIgnoreCase('DATE OF EXPIRY') || tb.text.containsIgnoreCase('EXPIRY DATE') || tb.text.containsIgnoreCase('EXPIRY') || tb.text.containsIgnoreCase('EXPIRES'))
                        {
                            idDates = new List<String>();
                            pat = Pattern.compile(datePattern);
                            mat = pat.matcher(tb.text);
                        
                            while (mat.find()) {
                                idDates.add(mat.group());
                                idExpiry = mat.group();
                                break;
                            }
                            System.debug(idDates);
                        }
                        
                        if(tb.text.containsIgnoreCase('PERMIT NO') || tb.text.containsIgnoreCase('LICENCE NO') || tb.text.containsIgnoreCase('LICENCE NUMBER') || tb.text.containsIgnoreCase('PASSPORT NO.') || tb.text.containsIgnoreCase('DOCUMENT NO.') || (tb.text.containsIgnoreCase('CLASS') && idState == 'SA'))
                        {
                            idNumber = (tb.text.containsIgnoreCase('LICENCE NO.') ? tb.text.toUpperCase().substringAfterLast('LICENCE NO.') : (tb.text.containsIgnoreCase('PASSPORT NO.') ? tb.text.toUpperCase().substringAfterLast('PASSPORT NO.') : (tb.text.containsIgnoreCase('DOCUMENT NO.') ? tb.text.toUpperCase().substringAfterLast('DOCUMENT NO.') : (tb.text.containsIgnoreCase('LICENCE NO .') ? tb.text.toUpperCase().substringAfterLast('LICENCE NO .') : (tb.text.containsIgnoreCase('LICENCE NO') ? tb.text.toUpperCase().substringAfterLast('LICENCE NO') : (tb.text.containsIgnoreCase('LICENCE NUMBER') ? tb.text.toUpperCase().substringAfterLast('LICENCE NUMBER') : (tb.text.containsIgnoreCase('CLASS') ? tb.text.toUpperCase().substringBefore('CLASS') : (tb.text.containsIgnoreCase('PERMIT NO') ? tb.text.toUpperCase().substringAfterLast('PERMIT NO') : null))))))));
    
                            if(idNumber != null){
                                idNumber = idNumber.trim();
                                idNumber = idNumber.substringBefore(' ');
                            }
                        }
                        System.debug('****idNumber ' + idNumber);
                        previousBlockText = tb.text;    
                    }
                }
                
                if(idNumber == null && idState == 'NZ'){
                    pat = Pattern.compile('\\b[A-Za-z]{2}\\d{6}\\b');
                    mat = pat.matcher(encodedText);
                    while (mat.find()) {
                        idNumber = mat.group();
                        break;
                    }
                    System.debug('****idNumber ' + idNumber);
                }
                
                if(idName == '' && idType == 'Passport'){
                    if(idState == 'AU' && encodedText.contains('<<<<<<<<<<<<<<')){
                        String passportStartText = encodedText.split('<<<<<<<<<<<<<<')[0];
                        idFirstName = passportStartText.substringAfterLast('<<').replaceAll('<',' ');
                        idLastName = passportStartText.substringBefore('<<').substringAfter('<').replace('AUS','');
                        idName = idFirstName + ' ' + idLastName;
                    }else if(idState == 'NZ' && encodedText.contains('<<<<<<<<<<<<<<')){
                        String passportStartText = encodedText.split('<<<<<<<<<<<<<<')[0];
                        idFirstName = passportStartText.substringAfterLast('<<').replaceAll('<',' ');
                        idLastName = passportStartText.substringBefore('<<').substringAfter('<').replace('NZL','');
                        idName = idFirstName + ' ' + idLastName;
                    }
                }
            }
            if(idType == 'Keypass' || Test.isRunningTest()){
                String previousBlockText = '';
                for(GoogleOCRJSON2Apex.Pages pag : gresp.fullTextAnnotation.pages)
                {
                    for(Integer i=0; i<pag.blocks.size(); i++)
                    {
                        TextBlock tb = new TextBlock();
                        tb.serial = textBlocks.size() + 1;
                        tb.text = '';
                        for(GoogleOCRJSON2Apex.Paragraphs pg : pag.blocks[i].paragraphs)
                        {
                            for(GoogleOCRJSON2Apex.Words_Z wd : pg.words)
                            {
                                for(GoogleOCRJSON2Apex.Symbols_Z symb : wd.symbols)
                                {
                                    tb.text += symb.text;
                                }
                                tb.text += ' ';    
                            }    
                        }
                        tb.text = tb.text.trim();
                        textBlocks.add(tb);    
                        System.debug('****' + tb.text + '****');
                                            
                        if(tb.text.containsIgnoreCase('DOB'))
                        {
                            idDates = new List<String>();
                            pat = Pattern.compile(datePattern);
                            mat = pat.matcher(tb.text);
                        
                            while (mat.find()) {
                                idDates.add(mat.group());
                                if(mat.group().length() > 4){
                                    String yearStr = mat.group().substring(mat.group().length()-4);
                                    if(yearStr.isNumeric() && ((Date.today().year() - Integer.valueOf(yearStr)) > 14 && (Date.today().year() - Integer.valueOf(yearStr)) < 90)){
                                        idDOB = mat.group();
                                        System.debug('****idDOB ' + idDOB);
                                        break;
                                    }
                                }
                            }
                            System.debug(idDates);
                        }
                        String expPattern = '\\d{2}-\\d{2}';
                        if(tb.text.containsIgnoreCase('Expiry'))
                        {
                            idDates = new List<String>();
                            pat = Pattern.compile(expPattern);
                            mat = pat.matcher(tb.text);
                        
                            while (mat.find()) {
                                idDates.add(mat.group());
                                idExpiry = mat.group();
                            }
                            System.debug(idDates);
                        }
                        
                        if(tb.text.containsIgnoreCase('No.'))
                        {
                            if(tb.text.containsIgnoreCase('NO.'))
                            {
                                idNumber = tb.text.toUpperCase().substringAfterLast('NO.');
                            }
                            
                            if(idNumber != null){
                                idNumber = idNumber.trim();
                            }
                        }
                        System.debug('****idNumber ' + idNumber);
                        previousBlockText = tb.text;    
                    }
                }
            }
            if(idType == 'Proof of Age Card' || Test.isRunningTest()){            
                for(Integer i=0; i<gresp.textAnnotations.size(); i++)
                {
                    if((gresp.textAnnotations[i].description == 'VIC' || gresp.textAnnotations[i].description == 'SA' || gresp.textAnnotations[i].description == 'NSW' || gresp.textAnnotations[i].description == 'ACT' || gresp.textAnnotations[i].description == 'QLD' || gresp.textAnnotations[i].description == 'WA' || gresp.textAnnotations[i].description == 'NT' || gresp.textAnnotations[i].description == 'TAS' || gresp.textAnnotations[i].description == 'NZ' || gresp.textAnnotations[i].description == 'ADELAIDE') && (i < (gresp.textAnnotations.size() - 1)) && gresp.textAnnotations[i+1].description.isNumeric())
                    {
                        idPostcode = gresp.textAnnotations[i+1].description;
                        idAddress = idPostcode;
                        postcodeIndex = i+1;
                        break;
                    }
                }
                System.debug('****idPostcode ' + idPostcode);
                System.debug('****idAddress ' + idAddress);
                
                for(Integer i=0; i<gresp.textAnnotations.size(); i++)
                {
                    if(idState == 'SA' && gresp.textAnnotations[i].description.isNumeric() && gresp.textAnnotations[i].description.length() == 4 && gresp.textAnnotations[i].description.startsWith('5'))
                    {
                        idPostcode = gresp.textAnnotations[i].description;
                        idAddress = idPostcode;
                        postcodeIndex = i;
                        break;
                    }else if(idState == 'TAS' && gresp.textAnnotations[i].description.isNumeric() && gresp.textAnnotations[i].description.length() == 4 && gresp.textAnnotations[i].description.startsWith('7'))
                    {
                        idPostcode = gresp.textAnnotations[i].description;
                        idAddress = idPostcode;
                        postcodeIndex = i;
                        break;
                    }
                }
                System.debug('****idPostcode ' + idPostcode);
                System.debug('****idAddress ' + idAddress);
                
                if(idPostcode != null)
                {
                    Boolean foundStreetNumber = false;
                    for(Integer i=postcodeIndex-1; i>=0; i--)
                    {
                        if(foundStreetNumber && !gresp.textAnnotations[i].description.isNumeric())
                        {
                            break;
                        }
                        if(gresp.textAnnotations[i].description.isNumeric())
                        {
                            foundStreetNumber = true;
                        }
                        idAddress = gresp.textAnnotations[i].description + ' ' + idAddress;
                    }
                    idAddress = idAddress.trim();
                }
                System.debug('****idPostcode ' + idPostcode);
                System.debug('****idAddress ' + idAddress);
                
                String previousBlockText = '';
                for(GoogleOCRJSON2Apex.Pages pag : gresp.fullTextAnnotation.pages)
                {
                    for(Integer i=0; i<pag.blocks.size(); i++)
                    {
                        TextBlock tb = new TextBlock();
                        tb.serial = textBlocks.size() + 1;
                        tb.text = '';
                        for(GoogleOCRJSON2Apex.Paragraphs pg : pag.blocks[i].paragraphs)
                        {
                            for(GoogleOCRJSON2Apex.Words_Z wd : pg.words)
                            {
                                for(GoogleOCRJSON2Apex.Symbols_Z symb : wd.symbols)
                                {
                                    tb.text += symb.text;
                                }
                                tb.text += ' ';    
                            }    
                        }
                        tb.text = tb.text.trim();
                        textBlocks.add(tb);    
                        System.debug('****' + tb.text + '****');
                        if(tb.text.containsIgnoreCase('Date of Birth') || tb.text.containsIgnoreCase('DOB'))
                        {
                            idDates = new List<String>();
                            pat = Pattern.compile(datePattern);
                            mat = pat.matcher(tb.text);
                        
                            while (mat.find()) {
                                idDates.add(mat.group());
                                if(mat.group().length() > 4){
                                    String yearStr = mat.group().substring(mat.group().length()-4);
                                    if(yearStr.isNumeric() && ((Date.today().year() - Integer.valueOf(yearStr)) > 14 && (Date.today().year() - Integer.valueOf(yearStr)) < 90)){
                                        idDOB = mat.group();
                                        System.debug('****idDOB ' + idDOB);
                                        break;
                                    }
                                }
                            }
                            System.debug(idDates);
                        }
                        
                        if(tb.text.containsIgnoreCase('Card Number') || tb.text.containsIgnoreCase('REFERENCE NO . / CRN') || tb.text.containsIgnoreCase('REFERENCE NO'))
                        {
                            idNumber = (tb.text.containsIgnoreCase('Card Number') ? tb.text.toUpperCase().substringAfterLast('CARD NUMBER') : (tb.text.containsIgnoreCase('REFERENCE NO . / CRN') ? tb.text.toUpperCase().substringAfterLast('REFERENCE NO . / CRN') : (tb.text.containsIgnoreCase('REFERENCE NO') ? tb.text.toUpperCase().substringAfterLast('REFERENCE NO') : '')));
                            
                            if(idNumber != null){
                                idNumber = idNumber.trim();
                            }
                        }
                        System.debug('****idNumber ' + idNumber);
                        previousBlockText = tb.text;    
                    }
                }
                
                if(idNumber == null){
                    pat = Pattern.compile('\\b[A-Za-z]{2}\\d{4}\\b|\\b\\d{8}\\b');
                    mat = pat.matcher(encodedText);
                    while (mat.find()) {
                        idNumber = mat.group();
                        break;
                    }
                    System.debug('****idNumber ' + idNumber);
                }
            }
            System.debug('****idDOB ' + idDOB);
            if(idDOB == null || Test.isRunningTest()){
                idDates = new List<String>();
                pat = Pattern.compile(datePattern);
                mat = pat.matcher(encodedText);
            
                while (mat.find()) {
                    idDates.add(mat.group());
                    if(mat.group().length() > 4){
                        String yearStr = mat.group().substring(mat.group().length()-4);
                        if(yearStr.isNumeric() && ((Date.today().year() - Integer.valueOf(yearStr)) > 14 && (Date.today().year() - Integer.valueOf(yearStr)) < 90)){
                            idDOB = mat.group();
                            System.debug('****idDOB ' + idDOB);
                            break;
                        }
                    }
                }
                System.debug(idDates);
            }
            
            System.debug('****idName ' + idName);
            if(idName != null && idName != ''){
                pat = Pattern.compile('^[a-zA-Z\' ]+$');
                mat = pat.matcher(idName);
                if(!mat.find()){
                    idName = null;
                    idFirstName = null;
                    idLastName = null;     
                } 
            }
            
            System.debug('****idName ' + idName);
            System.debug('****idFirstName ' + idFirstName);
            System.debug('****idLastName ' + idLastName);
            if((idName == null || idName == '') && ldFirstName != null && ldFirstName != '' && ldLastName != null && ldLastName != ''){
                if(ocrText.containsIgnoreCase(ldFirstName) && ocrText.containsIgnoreCase(ldLastName)){
                    if(ocrText.indexOf(ldFirstName.toUpperCase()) < ocrText.indexOf(ldLastName.toUpperCase())){
                        idName = (ldFirstName.toUpperCase() + ' ' + ocrText.substringBetween(ldFirstName.toUpperCase(), ldLastName.toUpperCase()) + ' ' + ldLastName.toUpperCase());
                    }else{
                        idName = (ldFirstName.toUpperCase() + ' ' + ocrText.substringBetween(ldLastName.toUpperCase(), ldFirstName.toUpperCase()) + ' ' + ldLastName.toUpperCase());
                    }
                }
            }else if(idName != null && idName != ''){
                idName = idName.trim();
                idName = idName.replaceAll('TASMANIA','').replaceAll('QUEENSLAND','').replaceAll('SOUTH AUSTRALIA','').replaceAll('WESTERN AUSTRALIA','').replaceAll('AUSTRALIA','').replaceAll('NEW ZEALAND','');
                idFirstName = idName.substringBeforeLast(' ');
                idLastName = idName.substringAfterLast(' ');
                if(ocrText.containsIgnoreCase(idFirstName) && ocrText.containsIgnoreCase(idLastName)){
                    if(ocrText.indexOf(idFirstName.toUpperCase()) < ocrText.indexOf(idLastName.toUpperCase())){
                        idName = (idFirstName.toUpperCase() + ' ' + ocrText.substringBetween(idFirstName.toUpperCase(), idLastName.toUpperCase()) + ' ' + idLastName.toUpperCase());
                    }else{
                        idName = (idFirstName.toUpperCase() + ' ' + ocrText.substringBetween(idLastName.toUpperCase(), idFirstName.toUpperCase()) + ' ' + idLastName.toUpperCase());
                    }
                }
            }
            System.debug('****idName ' + idName);
            System.debug('****idFirstName ' + idFirstName);
            System.debug('****idLastName ' + idLastName);
            if((idFirstName == null || idFirstName == '') && ldFirstName != null && ldFirstName != '' && ocrText.containsIgnoreCase(ldFirstName)){
                idFirstName = ldFirstName.toUpperCase();
                //idName += (' ' + idFirstName);
            }
            if((idLastName == null || idLastName == '') && ldLastName != null && ldLastName != '' && ocrText.containsIgnoreCase(ldLastName)){
                idLastName = ldLastName.toUpperCase();
                //idName += (' ' + idLastName);
            }
            System.debug('****idName ' + idName);
            System.debug('****idFirstName ' + idFirstName);
            System.debug('****idLastName ' + idLastName);
            if(idName != null && idName != ''){
                idName = idName.trim();
                idName = idName.replaceAll('TASMANIA','').replaceAll('QUEENSLAND','').replaceAll('SOUTH AUSTRALIA','').replaceAll('WESTERN AUSTRALIA','').replaceAll('AUSTRALIA','').replaceAll('NEW ZEALAND','');
                idFirstName = idName.substringBeforeLast(' ');
                idLastName = idName.substringAfterLast(' ');
            }
            System.debug('****idName ' + idName);
            System.debug('****idFirstName ' + idFirstName);
            System.debug('****idLastName ' + idLastName);
            System.debug('****idDOB ' + idDOB);
    
            if(idDOB != null && idDOB != ''){
                idDOB = idDOB.trim();
                idDOB = idDOB.replaceAll('TASMANIA','').replaceAll('QUEENSLAND','').replaceAll('SOUTH AUSTRALIA','').replaceAll('WESTERN AUSTRALIA','').replaceAll('AUSTRALIA','').replaceAll('NEW ZEALAND','');
                idDOB = parseDateString(idDOB);
                if(idDOB.length() == 8 && !idDOB.contains('-') && !idDOB.contains('/')){
                    idDOB = (idDOB.substring(0,2) + '/' + idDOB.substring(2,4) + '/' + idDOB.substring(4));
                }
            }
            System.debug('****idDOB ' + idDOB);
            
            if(idNumber != null && idNumber != ''){
                idNumber = idNumber.trim();
                idNumber = idNumber.replaceAll('TASMANIA','').replaceAll('QUEENSLAND','').replaceAll('SOUTH AUSTRALIA','').replaceAll('WESTERN AUSTRALIA','').replaceAll('AUSTRALIA','').replaceAll('NEW ZEALAND','');
            }
            idType = (idType == 'Driver Licence' ? 'Driver License' : idType);
            ocrText = (ocrText + ' ' + ((idDOB != null && idDOB != '') ? idDOB : ''));
            ocrText = ocrText.trim();
            photoIdDetails = ('OCR:\n\nFirstName - ' + idFirstName + '\nLastName - ' + idLastName + '\nDOB - ' + idDOB + '\nId Type - ' + idType + '\nId Number - ' + idNumber + '\nId Address - ' + idAddress);
            if(ocrLeadId != null && ocrLeadId != ''){
                Lead ldToUp = new Lead();
                ldToUp.Id = ocrLeadId;
                if(frontOrBack == 'front'){
                    ldToUp.Photo_Id_Details__c = photoIdDetails;
                    ldToUp.OCR_Text__c = ocrText;
                    ldToUp.OCR_Address__c = findAddressSubstring(ocrText);
                }
                if(frontOrBack == 'back'){
                    ocrBackText = ocrText;
                    ldToUp.OCR_Back_Text__c = ocrBackText;
                    ldToUp.OCR_Address__c = findAddressSubstring(ocrBackText);
                }
                update ldToUp;
            }
        }
        if((idFirstName == null || idFirstName.trim() == '') && ldFirstName != null && ldFirstName != ''){
            idFirstName = ldFirstName;
        }
        if((idLastName == null || idLastName.trim() == '') && ldLastName != null && ldLastName != ''){
            idLastName = ldLastName;
        }
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','sendOCRRequest',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public String findAddressSubstring(String addressText) {
    String addressSubstring = '';
    String addressPattern = '(VIC|SA|WA|QLD|TAS|NSW|NT|NZ)\\s\\d{4}';
    Pattern regexPattern = Pattern.compile(addressPattern);
    Matcher matcher = regexPattern.matcher(addressText);
    List<Integer> addressIndices = new List<Integer>();
    
    while (matcher.find()) {
        addressIndices.clear();
        addressIndices.add(matcher.start());
        addressIndices.add(matcher.end() - 1);
    }
    System.debug('addressIndices - ' + addressIndices);
    
    if(addressIndices.size() == 0){
        String postcodePattern = '[a-zA-Z]\\s[34502768]\\d{3}\\s';
        regexPattern = Pattern.compile(postcodePattern);
        matcher = regexPattern.matcher(addressText);
        while (matcher.find()) {
            addressSubstring = matcher.group();
            addressIndices.add(matcher.start());
        }
    }
    
    System.debug('addressSubstring - ' + addressSubstring);
    System.debug('addressIndices - ' + addressIndices);
    
    
    if(addressIndices.size() > 0){
        addressSubstring = (addressIndices.size() > 1 ? addressText.substring(addressIndices[0],addressIndices[1]+1) : addressSubstring);
        Boolean foundStreetNumber = false;
        List<String> addressCells = addressText.substring(0,addressIndices[0]).split(' ');
        for(Integer a = addressCells.size()-1; a >= 0 ; a--){
            if(addressCells[a].isNumeric() || addressCells[a].substring(0,1).isNumeric()){
                foundStreetNumber = true;
                if(a >= 1 && addressCells[a-1].isNumeric()){
                    foundStreetNumber = false;    
                }
            }
            addressSubstring = (addressCells[a] + ' ' + addressSubstring);
            if(foundStreetNumber){
                break;
            }
        }
    }
    
    addressSubstring = (addressSubstring.length() > 200 ? addressSubstring.substring(0,200) : addressSubstring);
    System.debug('addressSubstring - ' + addressSubstring);
        
    return addressSubstring;
}

public String parseDateString(String dateString) {
    try{
        Map<String,String> monthMap = new Map<String,String>();
        monthMap.put('JAN','01');monthMap.put('FEB','02');
        monthMap.put('MAR','03');monthMap.put('APR','04');
        monthMap.put('MAY','05');monthMap.put('JUN','06');
        monthMap.put('JUL','07');monthMap.put('AUG','08');
        monthMap.put('SEP','09');monthMap.put('OCT','10');
        monthMap.put('NOV','11');monthMap.put('DEC','12');
        
        String datePattern = '\\d{4}-\\d{2}-\\d{2}';
        Pattern pat = Pattern.compile(datePattern);
        Matcher mat = pat.matcher(dateString);
        while (mat.find()){
            return (mat.group().split('-')[2] + '/' + mat.group().split('-')[1] + '/' + mat.group().split('-')[0]);
        }
        
        datePattern = '\\d{2}-\\d{2}-\\d{4}';
        pat = Pattern.compile(datePattern);
        mat = pat.matcher(dateString);
        while (mat.find()){
            return (mat.group().split('-')[0] + '/' + mat.group().split('-')[1] + '/' + mat.group().split('-')[2]);
        }
        
        datePattern = '\\d{2}/\\d{2}/\\d{4}';
        pat = Pattern.compile(datePattern);
        mat = pat.matcher(dateString);
        while (mat.find()){
            return mat.group();
        }
        
        datePattern = '\\d{2} \\b(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \\d{4}|\\d{2} \\b(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC) \\d{4}';
        pat = Pattern.compile(datePattern);
        mat = pat.matcher(dateString);
        while (mat.find()){
            return (mat.group().split(' ')[0] + '/' + monthMap.get(mat.group().split(' ')[1].toUpperCase()) + '/' + mat.group().split(' ')[2]);
        }

        datePattern = '\\d{8}';
        pat = Pattern.compile(datePattern);
        mat = pat.matcher(dateString);
        while (mat.find()){
            return (mat.group().substring(0,2) + '/' + mat.group().substring(2,4) + '/' + mat.group().substring(4));
        }
        
        return dateString;
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','parseDateString',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return dateString;
    }
}

public void updateApplicationLogs()
{
    try{
        String logs = Apexpages.currentPage().getParameters().get('logs');
        String userAgent = Apexpages.currentPage().getParameters().get('userAgent');
        String userStackAccessKey = '728fddff7b1ea4c8a54ed4c6b7226004';
        String userStackBaseURL = 'https://api.userstack.com/detect?fields=device.name,device.type,device.brand,browser.name,browser.version&access_key=';    
        String linkOpenedDeviceBrand = '',linkOpenedDeviceName = '',linkOpenedDeviceType = '',linkOpenedDeviceBrowser = '',linkDeviceInfo = '';
        linkDeviceInfo = userAgent;
        System.debug('****logs ' + logs);
        System.debug('****userAgent ' + userAgent);

        List<Lead> tempLeads = new List<Lead>();
        if(ldId != null && ldId != ''){
            tempLeads = [SELECT Id,Territory_Number__c,Territory_Number__r.State_Master_State__c,Application_Logs__c,Territory_State__c 
                                    FROM Lead WHERE Id =: ldId LIMIT 1];
        }else if(acctId != null && acctId != ''){
            tempLeads = [SELECT Id,Territory_Number__c,Territory_Number__r.State_Master_State__c,Application_Logs__c,Territory_State__c 
                                    FROM Lead WHERE Account__c =: acctId ORDER BY CreatedDate DESC LIMIT 1];
        }
        if(tempLeads.size() > 0){
            DateTime currentLocalDatetime = Util.getStateTimeZoneDatetime(tempLeads[0].Territory_State__c,DateTime.now());
            String dateTimeString = currentLocalDatetime.format('dd/MM') + ' ' + currentLocalDatetime.hour() + ':' + currentLocalDatetime.minute();
        
            Lead ldToUp = new Lead();
            ldToUp.Id = tempLeads[0].Id;
            ldToUp.Application_Logs__c = (tempLeads[0].Application_Logs__c == null ? '' : tempLeads[0].Application_Logs__c) + '\n' + logs + ' - ' + dateTimeString + (linkDeviceInfo != '' ? (' - ' + linkDeviceInfo) : '');
            update ldToUp;
        }
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','updateApplicationLogs',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void remindMeIn(){
    try{
        String remindMeIn = Apexpages.currentPage().getParameters().get('remindMeIn');
        System.debug('##remindMeIn ' + remindMeIn);

        Lead ldToUp = new Lead();
        ldToUp.Id = ((ldId != null && ldId != '') ? ldId : ((latestLdId != null && latestLdId != '') ? latestLdId : null));
        if(remindMeIn.equalsIgnoreCase('9AM')){
            Date myTomDate = Date.today().addDays(1);
            Time my9amTime = Time.newInstance(9, 0, 0, 0);
            DateTime my9amDateTime = DateTime.newInstance(myTomDate, my9amTime);
            ldToUp.Callback_Requested_DateTime__c = my9amDateTime.addMinutes(Util.getTimeDifferenceBetweenUsers(UserInfo.getTimeZone().getID(), stateToTimezone.get(lead.Probable_Territory__r.State_Master_State__c)));
        }else{
            ldToUp.Callback_Requested_DateTime__c = DateTime.now().addMinutes(Integer.valueOf(remindMeIn));
        }
        update ldToUp;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KOnlineApplicationController','remindMeIn',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void submitCallbackRequest()
{
    try
    {
        String rFromDt=Apexpages.currentPage().getParameters().get('rFromDt');
        String rFromTi=Apexpages.currentPage().getParameters().get('rFromTi');
        System.debug('****rFromDt ' + rFromDt + ' ****rFromTi ' + rFromTi);
        Integer callback_year = Integer.valueOf(rFromDt.split('-')[0]);
        Integer callback_month = Integer.valueOf(rFromDt.split('-')[1]);
        Integer callback_day = Integer.valueOf(rFromDt.split('-')[2]);
        Integer callback_hour = Integer.valueOf(rFromTi.split(':')[0]);
        Integer callback_minute = Integer.valueOf(rFromTi.split(':')[1]);
        System.debug(callback_year + '-' + callback_month + '-' + callback_day + '-' + callback_hour + '-' + callback_minute);
        DateTime callBackDateTime = DateTime.newInstance(callback_year, callback_month, callback_day, callback_hour, callback_minute, 0);
        System.debug(callBackDateTime);
        callBackDateTime = Util.getStateTimeZoneDatetimeToAddInput(lead.Territory_State__c,callBackDateTime);
        System.debug(callBackDateTime);
        if((ldId != null && ldId != '') || (latestLdId != null && latestLdId != '')){
            System.debug(callBackDateTime);
            Lead ldToUp = new Lead();
            ldToUp.Id = ((ldId != null && ldId != '') ? ldId : ((latestLdId != null && latestLdId != '') ? latestLdId : null));
            ldToUp.Callback_Requested_DateTime__c = callBackDateTime;
            update ldToUp;
        }
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('R4KOnlineApplicationController','submitCallbackRequest',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void getExternalTransferStats()
{
    List<BankStatement_Generic_Category__c> bgs = [select id,Transaction_Count__c,Debit_Amount__c from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=: acctId and Name='External Transfers' LIMIT 1];
    if(bgs.size()>0)
    {
        externalTransferTransactionCount = Integer.valueOf(bgs[0].Transaction_Count__c);
        externalTransferDebitCount = bgs[0].Debit_Amount__c;
    }
        
}

public Decimal applicationFee{get;set;}
public Decimal adminFee{get;set;}
public Decimal totalCashPrice{get;set;}
public Decimal totalDeliveryFee{get;set;}
public Decimal totalRRP{get;set;}

public String territoryNo{get;set;}
public String creditGuideEmail{get;set;}
public Boolean isCreditContractTerritory{get;set;}

public String googleOCRKey{get;set;}
public String responseText{get;set;}
public String encodedText{get;set;}
public List<TextBlock> textBlocks{get;set;}
public List<String> idDates{get;set;}
public String idType{get;set;}
public String idState{get;set;}
public String idDOB{get;set;}
public String idExpiry{get;set;}
public String idNumber{get;set;}
public String idName{get;set;}
public String idFirstName{get;set;}
public String idLastName{get;set;}
public String idAddress{get;set;}
public String idPostcode{get;set;}
public String photoIdFrontId{get;set;}
public String photoIdBackId{get;set;}
public String parentId{get;set;}
public Boolean hasAddedPhotoIdBack{get;set;}
public String photoIdDetails{get;set;}
public String ocrText{get;set;}
public String ocrBackText{get;set;}
public String ocrAddress{get;set;}
public String latestLdId{get;set;}

public class TextBlock
{
    public Integer serial{get;set;}
    public String text{get;set;}
}

public List<OpportunityLineItem> deliveryProducts{get;set;}
public Boolean consentPending{get;set;}
public Boolean productPending{get;set;}
public Boolean documentsPending{get;set;}
public Boolean assessmentPending{get;set;}
public Boolean signingPending{get;set;}
public Boolean deliveryPending{get;set;}
public Boolean unsuitabilityPending{get;set;}
public Boolean puaDeclined{get;set;}

public String currentAddress{get;set;}
public Decimal lengthOfStayCurrent{get;set;}
public String residentialStatus{get;set;}
public String landlordName{get;set;}
public String landlordNumber{get;set;}
public Decimal lengthOfStayPrevious{get;set;}
public String previousAddress{get;set;}
public Decimal noOfDependents{get;set;}
public String maritalStatus{get;set;}
public String sharedDetails{get;set;}

public String mygovAddress{get;set;}
public String mogoAddress{get;set;}

public Decimal mygovLoan{get;set;}
public Decimal mygovRent{get;set;}
public Decimal mygovUtilities{get;set;}
public Decimal mogoR4KRental{get;set;}
public Decimal mygovOtherCentrepayDeductions{get;set;}

public Decimal mogoRent{get;set;}
public Decimal mogoHousehold{get;set;}
public Decimal mogoClothing{get;set;}
public Decimal mogoUtilities{get;set;}
public Decimal mogoTransport{get;set;}
public Decimal mogoMobile{get;set;}
public Decimal mogoCredit{get;set;}
public Decimal mogoLoan{get;set;}
public Decimal mogoAlcohol{get;set;}
public Decimal mogoInsurance{get;set;}
public Decimal mogoOtherRental{get;set;}
public Decimal mogoOther{get;set;}
public Decimal mogoEmployment{get;set;}
public Decimal mogoCentrelinkIncome{get;set;}

public Territory__c oppTerritory{get;set;} 
public Boolean createNewOnlineLead{get;set;}
public String onlineAccountId{get;set;}
public Opportunity opportunity{get;set;}
public List<OpportunityLineItem> oppLineItems {get;set;}

public String signEzidebitStartDateString{get;set;}

public Boolean locationCaptured{get;set;}
public Boolean onlineLocationCaptured{get;set;}
public Boolean onlineDeviceCaptured{get;set;}
public String onlineSigningCode{get;set;}
public Map<String,Decimal> clinkBenefitMap{get;set;}
public String clinkBenefitsJSON{get;set;}
public String mpEmail{get;set;}
public String senatorEmail{get;set;}
public String custNameVal{get;set;}
public String custStreet{get;set;}
public String custSuburb{get;set;}
public String custState{get;set;}
public String custPostCode{get;set;}

public Boolean resetLinkId{get;set;}
public Boolean resetLinkBank{get;set;}
public Boolean resetLinkMygov{get;set;}
public Boolean resetLinkBasic{get;set;}
public Boolean resetLinkIncome{get;set;}
public Boolean resetLinkExpense{get;set;}
public Boolean resetLinkReferees{get;set;}
public Boolean resetLinkRO{get;set;}
public Boolean resetLinkEquifax{get;set;}
public Boolean resetLinkProduct{get;set;}

public Decimal sharedExpenseMaxAmt{get;set;}
public Integer refExpensesLeft{get;set;}

public class EnquiryWrap{
    public String name{get;set;}
    public String dateVal{get;set;}
    public Decimal amount{get;set;}
}

public class Expense
{
    public String name{get;set;}
    public Decimal amount{get;set;}
    public Boolean isChecked{get;set;}
}

public class CentrepayWrapper
{
    public String name{get;set;}
    public Decimal income{get;set;}
}
}