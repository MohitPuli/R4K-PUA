public class CAMProcessController
{

public String acctId{get;set;}
public String formType{get;set;}
public String sectionType{get;set;}
public Account account{get;set;}
public Opportunity opportunity{get;set;}
public List<OpportunityLineItem> products{get;set;}
public Boolean isHybridApplication{get;set;}

public String primaryCentrelink {get;set;}
public Boolean showPrimaryCentrelink {get;set;}

public String firstNameVal {get;set;}
public String lastNameVal {get;set;}
public String genderVal {get;set;}
public String phoneVal {get;set;}
public String homePhoneVal {get;set;}
public String contactGeneralNotes {get;set;}
public String emailVal {get;set;}
public String streetNameVal {get;set;}
public String suburbVal {get;set;}
public String stateVal {get;set;}
public String countryVal {get;set;}
public Decimal latVal {get;set;}
public Decimal lngVal {get;set;}
public String postalCode {get;set;}
public String postalCodeVal {get;set;}
public String streetName {get;set;}
public String suburb {get;set;}
public String state {get;set;}
public String country {get;set;}
public String unformattedAddressVal {get;set;}
public Decimal lengthOfStayCurrent {get;set;}
public Decimal lengthOfStayPrevious {get;set;}
public String previousAddress{get;set;}
public String currentAddressNotes{get;set;}
public String centrepayRefNo{get;set;}
public String referringAppContDate{get;set;}
public Boolean showTable {get;set;}
public Boolean showTableSelected {get;set;}
public List<Global_Search__c> gSearch {get;set;}
public String refApplicantId{get;set;}
public Decimal ageVal{get;set;}

public String residentialStatus{get;set;}
public String landlordName{get;set;}
public String landlordPhone{get;set;}
public String residentialDetails{get;set;}

public String dobVal {get;set;}
public String idTypeVal {get;set;}
public String idTypeValOther {get;set;}
public String driverLicenceVal {get;set;}
public String stateMasterState {get;set;}

public Decimal equifaxEnquiryAmount{get;set;}
public String driversLicense{get;set;}
public Boolean successfulEnquiry{get;set;}
public String driversLicenseVersion{get;set;}
public String equifaxEnquiryState{get;set;}
public String equifaxEnquiryReferenceNumber{get;set;}
public String equifaxEnquiryStreet{get;set;}
public String equifaxEnquiryCity{get;set;}
public String equifaxEnquiryPostCode{get;set;}
public String equifaxEnquiryPreviousAddress{get;set;}
public String equifaxEnquiryId{get;set;}

public String bankSelected {get;set;}
public String benefit1Option {get;set;}
public String benefit2Option {get;set;}
public String benefit3Option {get;set;}
public String otherBenefitOption {get;set;}
public Decimal benefit1Amount {get;set;}
public Decimal benefit2Amount {get;set;}
public Decimal benefit3Amount {get;set;}
public Decimal otherBenefitAmount {get;set;}

public String employerName{get;set;}
public String employmentIncomeDetails{get;set;}
public Decimal employmentIncomeAmount{get;set;}
public String employmentType{get;set;}
public String employmentStartDate{get;set;}

public String otherIncomeSource{get;set;}
public String otherIncomeDetails{get;set;}
public Decimal otherIncomeAmount{get;set;}

public String requirement{get;set;}
public String objectives{get;set;}
public String prodRequirement{get;set;}
public String whyConsumerLease{get;set;}
public String loanPurpose{get;set;}
public String whyNotPhonePlan{get;set;}
public String benefitsOfConsumerLease{get;set;}
public String otherBenefitsOfConsumerLease{get;set;}
public String productInterested{get;set;}
public Integer productTerm{get;set;}

public String enquiryStatus{get;set;}
public String enquiryNotes{get;set;}
public String reasonWhyApplicationDidNotGoAhead{get;set;}
public Boolean optOutOfMarketingMaterial{get;set;}

public Boolean bankStatementAttached {get;set;}
public Boolean myGovAttached {get;set;}
public Boolean equifaxAttached {get;set;}
public Boolean idAttached {get;set;}

public AttachmentWrapper idAtt{get;set;}
public AttachmentWrapper mygovAtt{get;set;}
public AttachmentWrapper bankAtt{get;set;}
public AttachmentWrapper equifaxAtt{get;set;}
public AttachmentWrapper idAddressAtt{get;set;}
public List<AttachmentWrapper> incomeExpenseAttachmentWrapper{get;set;}
public List<AttachmentWrapper> clinkAttachmentWrapper{get;set;}
public List<AttachmentWrapper> bankAttachmentWrapper{get;set;}
public List<AttachmentWrapper> otherAttachmentWrapper{get;set;}

public NewApplicantProcessController npc{get;set;}

public Decimal crmRent{get;set;}
public Decimal crmLoan{get;set;}
public Decimal crmCredit{get;set;}
public Decimal crmInsurance{get;set;}
public Decimal crmHousehold{get;set;}
public Decimal crmUtilities{get;set;}
public Decimal crmCar{get;set;}
public Decimal crmMobile{get;set;}
public Decimal crmClothing{get;set;}
public Decimal crmTobacco{get;set;}
public Decimal crmOtherTotal{get;set;}
public Decimal crmCpay{get;set;}

public Decimal mogoRent{get;set;}
public Decimal mogoLoan{get;set;}
public Decimal mogoCredit{get;set;}
public Decimal mogoInsurance{get;set;}
public Decimal mogoHousehold{get;set;}
public Decimal mogoUtilities{get;set;}
public Decimal mogoCar{get;set;}
public Decimal mogoMobile{get;set;}
public Decimal mogoClothing{get;set;}
public Decimal mogoTobacco{get;set;}
public String mogoOther{get;set;}
public Decimal mogoOtherTotal{get;set;}

public Decimal existingR4KPayment{get;set;}
public Decimal newR4KPayment{get;set;}

public String cpayDetails{get;set;}
public String rentExpenseDetails{get;set;}
public String loanExpenseDetails{get;set;}
public String creditCardExpenseDetails{get;set;}
public String insuranceExpenseDetails{get;set;}
public String householdExpenseDetails{get;set;}
public String utilitiesExpenseDetails{get;set;}
public String travelExpenseDetails{get;set;}
public String mobileExpenseDetails{get;set;}
public String clothingExpenseDetails{get;set;}
public String tobaccoExpenseDetails{get;set;}
public String otherExpenseDetails{get;set;}
public String expenseOtherGeneralNotes{get;set;}
public String agmtComplOtherRentalDate{get;set;}

public Decimal creditMaxCOGSWhiteGoods{get;set;}
public Decimal creditMaxCOGSElectronics{get;set;}
public Decimal creditTotalFNIncomePercent{get;set;}
public Decimal creditMaxCOGSPhones{get;set;}
public Decimal creditOutstandingRentalDefaults{get;set;}
public Decimal creditOutstandingNonRentalDefaults{get;set;}
public Decimal creditEquifaxScore{get;set;}
public Decimal creditDaysSinceLastPayment{get;set;}
public Decimal creditPaymentsMissed{get;set;}
public Decimal creditServiceability{get;set;}
public Decimal creditBreakEvenShortfall{get;set;}
public String creditMaxTermElectronics{get;set;}
public String creditMaxTermWhiteGoods{get;set;}
public String creditMaxTerm{get;set;}
public Decimal creditMaxNoActiveAgreements{get;set;}
public Decimal creditMaxNoMobileAgreements{get;set;}
public Decimal creditMaxTAVPerAgreement{get;set;}
public Decimal creditMaxRemainingAmount{get;set;}
public Decimal creditMinTotalReferees{get;set;}
public Decimal creditMinRefereesBeingFamily{get;set;}
public Decimal creditMinRefereesBeingFamilySharedAccom{get;set;}
public Decimal creditTAVRemainingAmountPercentRentalDefaults{get;set;}
public String creditCriteriaType{get;set;}
public Boolean creditMaxTermPassed{get;set;}

public String CM_ServiceabilityComments{get;set;}
public String CM_Missed_from_last_6_FN_pymts_Comments{get;set;}
public String CM_NoOfActiveAgreementsComments{get;set;}
public String CM_NoOfMobileAgreementsComments{get;set;}
public String CM_MaximumTAVComments{get;set;}
public String CM_MaximumRemainingAmountComments{get;set;}
public String CM_MaximumBreakEvenShortFallComments{get;set;}
public String CM_RefereesContactedComments{get;set;}
public String CM_NoOfRefereesBeingFamilyComments{get;set;}
public String CM_NoOfRefereesBeingFamilySharedComments{get;set;}
public String CM_Part9AgreementsComments{get;set;}
public String CM_TermComments{get;set;}
public String CM_RemAmountRentalDefaultComments{get;set;}
public String CM_Bankruptcy_Part_9_Agreements_Comments{get;set;}
public String CM_Equifax_Score_Comments{get;set;}
public String CM_OutstandingDefNonRental_Comp_Comments{get;set;}
public String CM_OutstandingDefRental_Comp_Comments{get;set;}
public String CM_Scheduled_Amount_Comments{get;set;}
public String CM_COGS_Comments{get;set;}
public String CM_Product_Category_Comments{get;set;}

public String CM_ProductCategory{get;set;}
public String CM_ProductName{get;set;}
public String CM_ProductTerm{get;set;}
public Decimal CM_ProductCOGS{get;set;}
public Decimal CM_ProductRRP{get;set;}
public Decimal CM_ProductSchedAmount{get;set;}

public String oldTerm{get;set;}
public Decimal oldCost{get;set;}

public Boolean showProductTable{get;set;}
public Boolean showProductTableSelected{get;set;}
public String soqlForProducts{get;set;}
public Boolean showContactTable{get;set;}
public List<Product2> CM_products {get;set;}

public Boolean showCriteria {get;set;}
public Decimal totalIncome {get;set;}
public Decimal totalExpense {get;set;}

public Decimal for6months{get;set;}
public Decimal for9months{get;set;}
public Decimal for12months{get;set;}
public Decimal for18months{get;set;}
public Decimal for24months{get;set;}
public Decimal for30months{get;set;}
public Decimal for36months{get;set;}

public Boolean newCustomer {get;set;}
public String criteriaType {get;set;}
public String specialMessage {get;set;}

public Boolean checkedCriteriaforCM {get;set;}
public Boolean criteriaCheckedBeforeAgreementCreation {get;set;}
public Boolean ignoreMissedPayment {get;set;}

public static final String RENTAL='Rental';
public static final String NONRENTAL='Non-Rental';

public static final String NEWSTART='Newstart Allowance / JobSeeker only';
public static final String YOUTH='Youth Allowance only';
public static final String AUSTUDY='Austudy only';
public static final String ABSTUDY='Abstudy only';
public static final String GOVT='Other Govt Benefits';

public static final String NEWSTARTAL='Newstart Allowance / JobSeeker';
public static final String YOUTHAL='Youth Allowance';
public static final String AUSTUDYAL='Austudy';
public static final String ABSTUDYAL='Abstudy';

public static final String EASY='EASY';
public static final String EASYEXISTING='EASYEXISTING';
public static final String HARD='HARD';
public static final String NA='NA';

public static final String YES='Yes';
public static final String NO='No';

public SelectOption[] primaryCentrelinks { 
    public get;
    private set;
}

public String vedaNonRentalDefault {get;set;}
public String vedaRentalDefault {get;set;}

public Boolean showEquifaxScore{get;set;}
public Boolean showDefaultRental{get;set;}
public Boolean showDefaultNonRental{get;set;}

public String CM_PaymentFrequency{get;set;}
public Decimal CM_No_of_Missed_Payments_Last_6_FN{get;set;}
public Integer noOfActiveAgreements{get;set;}
public Integer noOfMobileAgreements{get;set;}
public Decimal totalTAV{get;set;}
public Decimal currentTAV{get;set;}
public Decimal totalRemainingAmount{get;set;}
public Decimal breakEvenShortFall{get;set;}

public Boolean redAny{get;set;}
public Boolean redProductCategory{get;set;}
public Boolean redCOGS{get;set;}
public Boolean redScheduledAmount{get;set;}
public Boolean redDefaultRental{get;set;}
public Boolean redDefaultNonRental{get;set;}
public Boolean redEquifaxScore{get;set;}
public Boolean redBankruptcy{get;set;}
public Boolean redPart9{get;set;}
public Boolean redServiceability{get;set;}
public Boolean redNoOfDaysMissed{get;set;}
public Boolean redNoOfMissedPayments{get;set;}
public Boolean redRefereesTotal{get;set;}
public Boolean redRefereesBeingFamMember{get;set;}
public Boolean redRefereesBeingFamMemberSharing{get;set;}
public Boolean redTotalAgmts{get;set;}
public Boolean redMobileAgmts{get;set;}
public Boolean redTotalTAV{get;set;}
public Boolean redTotalRemAmt{get;set;}
public Boolean redBES{get;set;}
public Boolean redTerm{get;set;}
public Boolean redRemAmountRentalDefault{get;set;}

public Integer refereesBeingFamMeber{get;set;}
public Integer refereesBeingFamMemberSharing{get;set;}
public Integer refereesContacted{get;set;}
public Integer totalRefereeAddedCounter{get;set;}
public List<Referee__c> totalRefList{get;set;}
public List<Referee__c> totalRefAdded{get;set;}

public List<Opportunity> otherAgmts{get;set;}
public Boolean equifaxValid{get;set;}

public Datetime hybridLinkAllocationDateTime {get;set;}
public Datetime hybridLinkOpenedDateTime {get;set;}
public String hybridLinkStatus {get;set;}
public String hybridLinkDeviceInfo {get;set;}
public String hybridLinkAddress {get;set;}

public List<SelectOption> repList{get;set;} 
public String existingRepSelectedId{get;set;}
public String existingRepSelectedName{get;set;}
public List<String> territoryIdsWithRecordAccess{get;set;}

public Decimal equifaxScore{get;set;}
public String equifaxPart9{get;set;}
public String equifaxFileNumber{get;set;}
public String equifaxPart10Bank{get;set;}
public Decimal equifaxDefaultsRental{get;set;}
public Decimal equifaxDefaultsNonRental{get;set;}
public Decimal equifaxRemainigAmountDefaults{get;set;}

public List<Equifax_Defaults__c> equifaxDefaults{get;set;}
public List<Equifax_Defaults__c> equifaxRentalDefaults{get;set;}
public List<Equifax_Defaults__c> equifaxNonRentalDefaults{get;set;}
public List<Equifax_Defaults__c> otherEquifaxDefaults{get;set;}
public Equifax_Defaults__c editDefault{get;set;}
public Integer equifaxRentalCount{get;set;}
public Integer equifaxNonRentalCount{get;set;}

public String selectedDefaultCompanyName{get;set;}
public String selectedDefaultDate{get;set;}
public String selectedDefaultStatus{get;set;}
public Decimal selectedDefaultAmount{get;set;}
public String selectedDefaultNotes{get;set;}
public String selectedDefaultCompanyType{get;set;}

public Boolean showOtherBenefits{get;set;}

public String agreementIdForCurrentEnquiry{get;set;}
public Boolean isProductsAddedForAgreement{get;set;}
public Boolean allDocsSigned{get;set;}

public String agmtStage{get;set;}
public String agmtFrequency{get;set;}
public String agmtTerm{get;set;}
public String agmtGiftTo{get;set;}
public String agmtDeliveryDate{get;set;}
public Decimal agmtSchdAmt{get;set;}
public Decimal agmtTAV{get;set;}
public String whyWasTheAgreementApproved{get;set;}

public OpportunityLineItem editProduct{get;set;}
public String prodDescription{get;set;}
public String prodmodelNo{get;set;}
public String prodimeiNo{get;set;}
public String prodserialNo{get;set;}
public Date prodinvoiceDate{get;set;}
public String prodinvoiceNumber{get;set;}

public List<NewApplicantProcessController.ExpenseTransactions> rentTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> loanTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> insuranceTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> creditCardTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> travelTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> householdTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> utilitiesTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> mobileTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> tobaccoTransactions{get;set;}
public List<NewApplicantProcessController.ExpenseTransactions> clothingTransactions{get;set;}
public List<NewApplicantProcessController.OtherExpense> otherExpenseList{get;set;}

public Decimal CA_actualArrears{get;set;}
public Decimal CA_actualArrearsOriginal{get;set;}
public Decimal CA_actualArrearsWrittenOff{get;set;}
public Decimal CA_actualArrearsOriginalWrittenOff{get;set;}
public Decimal CA_remainingAmountWrittenOff{get;set;}
public Decimal CA_tavWrittenOff{get;set;}
public Decimal CA_totalPaidWrittenOff{get;set;}
public Decimal CA_totalAgreements{get;set;}
public Decimal CA_activeAgreements{get;set;}
public Decimal CA_totalTAV{get;set;}
public Decimal CA_totalPaid{get;set;}
public Decimal CA_totalRemaining{get;set;}
public Decimal CA_scheduledAmount{get;set;}
public Boolean secondEquifaxSearch{get;set;}
public Boolean isROFilled{get;set;}
public String custPhotoAtt{get;set;}

public Boolean expenseDetailsMissing{get;set;}
public Boolean maritalStatusMissing{get;set;}
public Boolean addressVerificationMissing{get;set;}
public Boolean incomeVerificationMissing{get;set;}
public Boolean expenseVerificationMissing{get;set;}
public Boolean employerNameMissing{get;set;}
public Boolean employmentDateMissing{get;set;}
public Boolean serviceabilityCommentsMissing{get;set;}
public Boolean roMissing{get;set;}
public Boolean lengthOfStayMissing{get;set;}
public String todayDateString{get;set;}
public Boolean overrideDocs{get;set;}
public Decimal totalIncomeAmt{get;set;}
public Decimal totalRentalsAmt{get;set;}
public Decimal mygovRentalsAmt{get;set;}
public String territoryNo{get;set;}
public String otherRentalCompanyDetails{get;set;}

public Opportunity approvalOpp{get;set;}
public Boolean hasRecordaccess{get;set;}

public List<BankStatement_Generic_Category__c> rentCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> loanCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> creditcardCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> insuranceCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> householdCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> utilitiesCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> travelCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> mobileCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> clothingCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> alcoholCatTransactions {get;set;}
public List<BankStatement_Generic_Category__c> otherexpenseCatTransactions {get;set;}

public final String onlineURL = SiteEndpoint__c.getValues('Online').URL__c;
public final String onlineRefereeURL = SiteEndpoint__c.getValues('RefereeEDM').URL__c;

public void doSecondEquifaxSearch()
{
    secondEquifaxSearch = true;
}

public void setEquifaxBoolean()
{
    if(account.Equifax_No_of_Unpaid_Default_Rental__c == null || account.Equifax_No_of_Unpaid_Default_Rental__c <> equifaxRentalCount)
    {
        showDefaultRental = true;
    }
    
    if(account.Equifax_No_of_Unpaid_Default_NonRental__c == null || account.Equifax_No_of_Unpaid_Default_NonRental__c <> equifaxNonRentalCount)
    {
        showDefaultNonRental = true;
    }
    
    account.Equifax_No_of_Unpaid_Default_Rental__c = account.Equifax_No_of_Unpaid_Default_Rental__c == null ? 0 : account.Equifax_No_of_Unpaid_Default_Rental__c;
    account.Equifax_No_of_Unpaid_Default_NonRental__c = account.Equifax_No_of_Unpaid_Default_NonRental__c == null ? 0 : account.Equifax_No_of_Unpaid_Default_NonRental__c;

    if(account.Score_of_Equifax__c == null || account.Score_of_Equifax__c == 0)
    {
        showEquifaxScore = true;
        account.Score_of_Equifax__c = 0;
    }
}

public CAMProcessController()
{
    acctId = Apexpages.currentPage().getParameters().get('id');
    oppId = ApexPages.CurrentPage().getParameters().get('oppId');
    if(oppId != null && oppId != ''){
        List<Opportunity> approvalOppList = [select id,AccountId,Account.Product_Category_Selected__c,Account.Product_Name_for_Agreement__c,Account.Product_COGS_for_Agreement__c,
                                            Account.Product_Term_for_Agreement__c,Account.Rent4Keeps_Payment_C__c,Account.CM_Scheduled_Amount__c,CM_Scheduled_Amount_Comments__c,
                                            Account.Name,Account.Customer_No__c,Name,Contract_No__c,Credit_Guideline__c,Credit_Guideline__r.Name,Account.Territory_Number__r.State_Master_State__c,
                                            Account.Territory_Number__c,Account.Territory_Number__r.Company_Territory__c,Account.Territory_Number__r.Short_Name__c,Approval_Status__c, 
                                            Account.Rep_Responsible_For_Converting_Lead__r.Name,Account.Rep_Responsible_For_Converting_Lead__c,Rep_Name__r.Name,Rep_Name__c,Account.Product_RRP_for_Agreement__c,
                                            Rep_Name__r.Not_Eligible_for_Auto_Approval__c,CM_Reason_to_go_forward__c,Answers_To_Credit_Officer_Comments__c,CM_Dishonours__c,CM_Payment_Frequency__c,
                                            CM_Gambling__c,CM_Collection_And_Consolidation__c,CM_Overdrawn__c,CM_Jobseeker__c,CM_Debt_vs_Income_Ratio_Greater_Than_50__c,Resubmit__c,Account.Product_Delivery_Fee_For_Agreement__c,
                                            CM_OutstandingDefRental_Comp_Comments__c,CM_OutstandingDefNonRental_Comp_Comments__c,CM_Equifax_Score_Comments__c,CM_Bankruptcy_Part_9_Agreements_Comments__c,
                                            CM_Missed_from_last_6_FN_pymts_Comments__c,AF_CA_Final_Comments__c,AF_CA_Credit_Officer_Name__c,Credit_Guideline__r.Line_Manager_Full_Name__c,Payment_Frequency__c                                            
                                            from Opportunity where id=:oppId LIMIT 1];
        if(approvalOppList.size() > 0){ 
            approvalOpp = approvalOppList[0]; 
            acctId = approvalOpp.AccountId;
            lineManagerName = (approvalOpp.AF_CA_Credit_Officer_Name__c == null ? approvalOpp.AF_CA_Credit_Officer_Name__c : (approvalOpp.Credit_Guideline__r.Line_Manager_Full_Name__c == null ? '' : approvalOpp.Credit_Guideline__r.Line_Manager_Full_Name__c));
            lineManagerComments = approvalOpp.AF_CA_Final_Comments__c;
            approvalStatus = approvalOpp.Approval_Status__c;
            answersToCreditOfficerComments = approvalOpp.Answers_To_Credit_Officer_Comments__c;
            CM_PaymentFrequency = approvalOpp.CM_Payment_Frequency__c;
             //check recordaccess
            hasRecordAccess = false;
            List<UserRecordAccess> userAccess = [SELECT RecordId,HasEditAccess,HasReadAccess FROM UserRecordAccess WHERE UserId =: UserInfo.getUserId() AND RecordId =: approvalOpp.Id];
            if(userAccess.size() > 0)
            {
                hasRecordAccess = userAccess[0].HasReadAccess;
            }
            System.debug('****hasRecordAccess ' + hasRecordAccess);
        }
    }
    
    formType = Apexpages.currentPage().getParameters().get('formType') == null ? 'docs' : Apexpages.currentPage().getParameters().get('formType');
    sectionType = Apexpages.currentPage().getParameters().get('sectionType') == null ? (formType == 'docs' ? 'id' : (formType == 'assessment' ? 'ro' :  (formType == 'signing' ? 'sourcing': 'id')))  : Apexpages.currentPage().getParameters().get('sectionType');
    
    account = [SELECT Id, Customer_No__c, FirstName,LastName,PersonMobilePhone,PersonEmail,Sensis_Latitude__c,Sensis_Longitude__c,Gender__pc,Referring_Applicant_Contacted_Date__c,Centrelink_Benefits_Verified__c,Employment_Income_Verified__c,
                Birthdate__c,Belongs_to_Aboriginals_and_Torres_Strait__c,Equifax_Age_of_File__c,Veda_Notes__c,Equifax_Enquiry_DateTime__c,CM_COGS_Comments__c,No_of_Agreements__c,Is_IDR__c,  
                Serviceability_Comments__c,Explanation_for_All_Other_Defaults__c, Explanation_for_Recent_Enquiries__c,Big_Sale_Media__c,SMS_Mobile__c,Referring_Applicant__c,Referring_Applicant__r.Name,
                Fortnightly_Scheduled_Payment__c, Actual_Arrears_After_Variation__c, No_Of_Active_Agreements__c,IsPersonAccount,CM_days_since_last_Payment_Comments__c,Applicant_Last_Payment_Status__c, 
                Remaining_Amount_Active_Agreements__c,Application_Signed_Date__c,State_Master_State__c,CM_No_of_Days_Missed_Since_Last_Payments__c,CM_No_of_Missed_Payments_Last_6_FN__c,CM_Missed_from_last_6_FN_pymts_Comments__c, 
                Centrelink_Benefit__c,Highlevel_Income__c,Identification_Type__c ,Identification_No__c ,CM_Combined_Dollar_Exposure__c,CM_Serviceablilty_Comments__c,CM_Reason_to_go_forward__c,
                PersonMailingStreet,PersonMailingCity,PersonMailingState,PersonMailingPostalCode,PersonMailingCountry ,CurrencyIsoCode,CM_COGS__c,CM_Scheduled_Amount__c,CM_Equifax_Rental_Default__c,
                No_of_Equifax_Enquiries_Last_6_Month__c,Bankruptcy_Part_9_Agreements__c,Age__c,Other_Centrelink_Benefit__c,Other_Centrelink_Benefit_Amount__c,CM_Equifax_Non_Rental_Default__c,
                Schedule_Amount__c,Ezidebit_Signed_Amount__c,Other_Income_Details__c,Enquiry_Date__c,Residential_Status__c,Credit_Guideline__r.Line_Manager_Full_Name__c,AgmtCompDateOtherRentalCompany__c,
                Signed_Benefit_Amount_1__c,Signed_Benefit_Amount_2__c,Signed_Benefit_1__c,Signed_Benefit_2__c,Part_9_Agreements__c,Address_Verification_Type__c,Income_Verification_type__c,Expense_Verification_Type__c, 
                Centrelink_Benefit_Amount__c,Centrelink_Benefit2_Amount__c,Centrelink_Benefit3_Amount__c,Employment_Income__c,Other_Income_Amount__c,Other_Income_Source__c,
                Employer_Name__c,Employment_Income_Details__c,Centrelink_Benefit2__c,Centrelink_Benefit3__c,MOGO_Captured_Address__c,Equifax_SMS_Consent_Received__c,Customer_Photo_Id__c,Photo_Id_Front__c,Photo_Id_Back__c,
                myGov_Captured_Address__c,UnformattedAddress_VedaAlert_Report__c,Bank_Institution__c,myGov_Payment_Details__c,Equifax_No_of_Unpaid_Default_NonRental__c,Product_Other_Rental_Company__c,
                Rent_Mortgage_Board_Details__c,Loan_Payment_Details__c,Credit_Card_Details__c,Insurance_Details__c,Food_Details__c,Utilities_Details__c,Car_Lease_Loan_Payment_Details__c,
                Mobile_Expenses_Details__c,Clothing_Details__c,Tobacco_Alcohol_Details__c,Other_Details__c,MOGO_Rent__c,MOGO_Loan__c,MOGO_Credit_Card__c,MOGO_Insurance__c,MOGO_Household__c,MOGO_Utilities__c,MOGO_Car_Petrol_Travel__c,MOGO_Mobile__c,MOGO_Clothing__c,
                MOGO_Tobacco_Alcohol__c,MOGO_Other_Total__c,MOGO_Other__c,MOGO_Rent_Transactions__c,MOGO_Loan_Transactions__c,MOGO_Credit_Card_Transactions__c,MOGO_Insurance_Transactions__c,MOGO_Household_Transactions__c,MOGO_Utilities_Transactions__c,MOGO_Travel_Transactions__c,
                MOGO_Mobile_Transactions__c,MOGO_Clothing_Transactions__c,MOGO_Tobacco_Alcohol_Transactions__c,MOGO_Other_Transactions__c,Active_Agreements__c,Length_of_Stay_in_Current_Address__c,Centrepay_Ref_No__c,
                Rent_Mortgage_Board__c,Food__c,Clothing__c,Loan_Payments__c,Employment_Type__c,Employment_Commencement_Date__c,Veda_File_Number__c,Score_of_Equifax__c,Equifax_No_of_Unpaid_Default_Rental__c,   
                Credit_Card__c,Insurance__c,Utilities__c,Car_Lease_Loan_Payment__c,Explanation_for_Other_ID_type__c,Total_Agreement_Amount_Active_Only__c,Landlord_Name__c,Landlord_Telephone__c,Residential_Details__c,
                Mobile_Expenses__c,Tobacco_Alcohol__c,OtherOutgoings__c,Current_Address_Notes__c,Product_Name_for_Agreement__c,Product_Description__c,LastPaymentRecieved__c,Days_Since_Expected_Payment__c,Missed_Payment__c,Site_Visit__c,Termination__c,
                Rent4Keeps_Payment_C__c,Notes__c,Existing_R4K_Payment__c,Total_R4K_Payment__c,Why_consumer_lease__c,Benefit_of_Consumer_Lease_with_R4K__c,Enquiries_in_the_last_6_months__c,
                Comfortable_Spending__c,sharing_expenses_with_others__c,Shared_Expense_with__c,How_did_you_verify_shared_expenses__c,CM_Serviceable__c,CM_Product_Category__c,CM_Product_Category_Comments__c, 
                Expense_Items_in_Shared_Expense__c,Other_General_Notes__c,Centrepay_Outgoings__c,Centrepay_Details__c,Why_not_phone_plan__c,Product_COGS_for_Agreement__c,Length_of_Stay_in_Previous_Address__c,Previous_Address__c,
                Other_Rental_Companies__c,Other_Rental_2__c,Serviceability__c, OwnerId,Specify_Other_Benefits_of_Consumer_Lease__c,Product_Interested_In__c,Last_Collection_Activity__r.Collection_Outcome1__c,Last_Collection_Activity__c,Last_Collection_Activity__r.Name,Last_Collection_Activity__r.Collection_Notes__c,
                Other_Rental_Company_Name__c,Other_Rental_Company_2_Name__c,Other_Rental_Company_Details__c,Other_Rental_Company_Details_2__c,CM_Scheduled_Amount_Comments__c,PersonHomePhone,General_Notes__c,
                Credit_Guideline__c,Territory_Number__c,Territory_Number__r.Email__c,Territory_Number__r.Physical_Manager__c,CM_Bankruptcy_Part_9_Agreements_Comments__c,CM_Equifax_Score_Comments__c,Territory_Number__r.OwnerId,
                Consent_URL_Opened_DateTime__c,Consent_URL_Address__c,Consent_URL_Device_Info__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Status__c,Rep_Responsible_For_Converting_Lead__c,Consent_URL_Latitude__c,Consent_URL_Longitude__c,
                Territory_Number__r.State_Master_State__c,Territory_Number__r.Short_Name__c,Territory_Number__r.Company_Territory__c,CM_OutstandingDefNonRental_Comp_Comments__c,CM_OutstandingDefRental_Comp_Comments__c,
                Credit_Guideline__r.CreatedDate,Credit_Guideline__r.CurrencyIsoCode,Credit_Guideline__r.EasyExisting_BankruptcyPart9Agmts__c,Credit_Guideline__r.EasyExisting_BreakEvenShortfall__c,Enquiry_Status__c,Opt_out_marketing_material__c,Reason_why_application_did_not_go_ahead__c,Enquiry_Notes__c,  
                Credit_Guideline__r.EasyExisting_Electronics_COGS__c,Credit_Guideline__r.EasyExisting_Equifax_Score__c,Credit_Guideline__r.EasyExisting_No_of_days_since_last_pymnt__c,Credit_Guideline__r.EasyExisting_No_of_payments_missed__c,Credit_Guideline__r.EasyExisting_Outstanding_Non_Rental_Def__c,Credit_Guideline__r.EasyExisting_Outstanding_Rental_Defaults__c,
                Credit_Guideline__r.EasyExisting_Phones_COGS__c,Credit_Guideline__r.EasyExisting_Serviceability__c,Credit_Guideline__r.EasyExisting_Total_FN_Rental_Agreement__c,Credit_Guideline__r.EasyExisting_WGS_COGS__c,
                Credit_Guideline__r.Easy_BankruptcyPart9Agmts__c,Credit_Guideline__r.Easy_Electronics_COGS__c,Credit_Guideline__r.Easy_Equifax_Score__c,Credit_Guideline__r.Easy_No_of_days_since_last_payment__c,
                Credit_Guideline__r.Easy_No_of_payments_missed__c,Credit_Guideline__r.Easy_Outstanding_Non_Rental_Defaults__c,Credit_Guideline__r.Easy_Outstanding_Rental_Defaults__c,Credit_Guideline__r.Easy_Phones_COGS__c,Credit_Guideline__r.Hard_Term_Consumer_Electronics__c,
                Credit_Guideline__r.Easy_Serviceability__c,Credit_Guideline__r.Easy_Total_FN_Rental_Agreement__c,Credit_Guideline__r.Easy_WGS_COGS__c,Credit_Guideline__r.Hard_BankruptcyPart9Agmts__c,Credit_Guideline__r.Hard_Electronics_COGS__c,Credit_Guideline__r.Hard_Term_Whitegoods__c,
                Credit_Guideline__r.Hard_Equifax_Score__c,Credit_Guideline__r.Hard_No_of_days_since_last_payment__c,Credit_Guideline__r.Hard_No_of_payments_missed__c,Credit_Guideline__r.Hard_Outstanding_Non_Rental_Defaults__c,Credit_Guideline__r.Hard_Outstanding_Rental_Defaults__c,
                Credit_Guideline__r.Hard_Phones_COGS__c,Credit_Guideline__r.Hard_Serviceability__c,Credit_Guideline__r.Hard_Total_FN_Rental_Agreement__c,Credit_Guideline__r.Hard_WGS_COGS__c,Credit_Guideline__r.Id,Credit_Guideline__r.IsDeleted,Credit_Guideline__r.LastActivityDate,
                Credit_Guideline__r.LastModifiedById,Credit_Guideline__r.LastModifiedDate,Credit_Guideline__r.Line_Manager__c,Credit_Guideline__r.Name,Credit_Guideline__r.OwnerId,Credit_Guideline__r.Territory__c,Credit_Guideline__r.EasyExisting_Term_Whitegoods__c,
                Credit_Guideline__r.Hardest_Total_FN_Rental_Agreement__c,Credit_Guideline__r.Hardest_BankruptcyPart9Agmts__c,Credit_Guideline__r.Hardest_Equifax_Score__c,Credit_Guideline__r.Hardest_Electronics_COGS__c,Credit_Guideline__r.Hardest_Phones_COGS__c,
                Credit_Guideline__r.Hardest_WGS_COGS__c,Credit_Guideline__r.Hardest_No_of_days_since_last_payment__c,Credit_Guideline__r.Hardest_No_of_payments_missed__c,Credit_Guideline__r.Hardest_Outstanding_Non_Rental_Defaults__c,Credit_Guideline__r.EasyExisting_Term_Consumer_Electronics__c,
                Credit_Guideline__r.Hardest_Outstanding_Rental_Defaults__c,Credit_Guideline__r.Hardest_Serviceability__c,Credit_Guideline__r.Hardest_BreakEvenShortfall__c,Credit_Guideline__r.Hardest_Term_Consumer_Electronics__c,Credit_Guideline__r.Hardest_Term_Whitegoods__c,
                Credit_Guideline__r.Hardest_No_of_Active_Agreements__c,Credit_Guideline__r.Hardest_TAV_per_Agreement__c,Credit_Guideline__r.Hardest_Remaining_Amount_per_Applicant__c,Credit_Guideline__r.Hardest_Total_No_of_Referees__c,Credit_Guideline__r.Hardest_no_of_Referees_being_family__c,
                Credit_Guideline__r.Hardest_No_of_Refs_Being_Family_Shared__c,Credit_Guideline__r.Hardest_Rem_Amount_Rental_Defaults__c,Credit_Guideline__r.Easy_Term_Consumer_Electronics__c,Credit_Guideline__r.Easy_Term_Whitegoods__c,Credit_Guideline__r.Easy_No_of_Active_Agreements__c,
                Credit_Guideline__r.Easy_TAV_per_Agreement__c,Credit_Guideline__r.Easy_Remaining_Amount_per_Applicant__c,Credit_Guideline__r.Easy_Total_No_of_Referees__c,Credit_Guideline__r.Easy_no_of_Referees_being_family_Member__c,Credit_Guideline__r.Easy_No_of_Referees_Being_Family_Shared__c,
                AgreementId_for_Current_Enquiry__c,Credit_Guideline__r.EasyExisting_No_of_Active_Agreements__c,Credit_Guideline__r.EasyExisting_TAV_per_Agreement__c,Credit_Guideline__r.EasyExisting_Rem_Amount_per_Applicant__c,Credit_Guideline__r.EasyExisting_Total_No_of_Referees__c,Credit_Guideline__r.EasyExisting_no_of_Referees_being_family__c,
                Credit_Guideline__r.Hard_No_of_Active_Agreements__c,Credit_Guideline__r.Hard_TAV_per_Agreement__c,Credit_Guideline__r.Hard_Remaining_Amount_per_Applicant__c,Credit_Guideline__r.Hard_Total_No_of_Referees__c,Credit_Guideline__r.Hard_no_of_Referees_being_family_Member__c,Credit_Guideline__r.Hard_No_of_Referees_Being_Family_Shared__c,
                CAM_Expense__c,CAM_Equifax__c,CAM_Basic__c,Any_enquiry_in_the_past_6_month__c,Marital_Status__pc,Number_of_Dependants__c,Is_Disability_Support_Pension__c,Carer__c,Carer_Full_Name__c,Carer_Phone_No__c,Carer_Confirmation__c,CM_Payment_Frequency__c,Credit_Guideline__r.Bankruptcy_Part_10_Agmts_Discharged__c, 
                Credit_Guideline__r.EasyExisting_No_Refs_Being_Family_Shared__c,Credit_Guideline__r.EasyExisting_Rem_Amount_Rental_Defaults__c,Account.Product_Term_for_Agreement__c,Account.Product_Category_Selected__c,Account.Product_RRP_for_Agreement__c,Account.Employed_Months__c,Account.Last_Payment_Upload_Date__c,
                Account.Latest_Agreement_Created_Date__c,Basic_Info_Online__c,RO_Online__c,Income_Online__c,Expense_Online__c,Referees_Online__c,Equifax_Online__c,Hybrid_URL_BankStatement__c,Hybrid_URL_MyGov__c,Is_PhotoId_Attached_After_Enquiry__c,Bank_Final_Page__c,Mygov_Final_Page__c,
                Credit_Guideline__r.Hardest_No_of_Mobile_Agreements__c,Credit_Guideline__r.Hard_No_of_Mobile_Agreements__c,Credit_Guideline__r.EasyExisting_No_of_Mobile_Agreements__c,Credit_Guideline__r.Easy_No_of_Mobile_Agreements__c,Territory_Number__r.Name,WINZ_No__c,Bankruptcy_Status__c,
                Credit_Guideline__r.Bankruptcy_And_Part_10_Agreements__c,Credit_Guideline__r.Collection_And_Consolidation__c,Credit_Guideline__r.Debt_vs_Income_ratio_Greater_Than_50__c,Credit_Guideline__r.Dishonours__c,Credit_Guideline__r.Equifax_Score_Less_than_200__c,Credit_Guideline__r.Equifax_Score_Less_than_400__c,
                Credit_Guideline__r.Equifax_Score_Less_than_600__c,Credit_Guideline__r.Gambling__c,Credit_Guideline__r.Max_Income_Available__c,Credit_Guideline__r.Non_Rental_Defaults__c,Credit_Guideline__r.No_of_Payments_Missed_Last_6_Payments__c,Credit_Guideline__r.Overdrawn__c,Credit_Guideline__r.Rental_Defaults__c,
                Number_of_Dishonours__c,Gambling_Expenditure__c,Collection_and_Consolidation__c,Overdrawn__c,Credit_Guideline__r.Dishonours_Greater_than_threshold__c,Credit_Guideline__r.Jobseeker_less_than_threshold__c,Credit_Guideline__r.Jobseeker__c,CM_Dishonours__c,CM_Gambling__c,CM_Collection_And_Consolidation__c,CM_Overdrawn__c,CM_Jobseeker__c,
                CM_Debt_vs_Income_Ratio_Greater_Than_50__c,Rep_Responsible_For_Converting_Lead__r.Name,Rent4Keeps_Account__c,Rent4Keeps_Account__r.Name,WrittenOff_s_Count__c,Rent4Keeps_Account__r.Last_Collection_Activity__c,Rent4Keeps_Account__r.Last_Collection_Activity__r.Collection_Outcome1__c,Rent4Keeps_Account__r.Territory_Number__c,Rent4Keeps_Account__r.Territory_Number__r.Name,
                Avg_No_of_Days_for_Income_Depletion__c,Product_Delivery_Fee_For_Agreement__c,Loan_Purpose__c,Requirements_and_Objectives__c,External_Transfer_Relationship__c
                FROM Account WHERE Id =: acctId LIMIT 1];
    
    resetHybridLinkId = false;
    resetHybridLinkBank = false;
    resetHybridLinkMygov = false;
    resetLinkId = account.Is_PhotoId_Attached_After_Enquiry__c;
    resetLinkBank = account.Bank_Final_Page__c;
    resetLinkMygov = account.MyGov_Final_Page__c;
    resetLinkBasic = account.Basic_Info_Online__c;
    resetLinkIncome = account.Income_Online__c;
    resetLinkExpense = account.Expense_Online__c;
    resetLinkReferees = account.Referees_Online__c;
    resetLinkRO = account.RO_Online__c;
    resetLinkEquifax = account.Equifax_Online__c;
    sendMOGOMyGovSMS = (account.Hybrid_URL_MyGov__c == null || account.Hybrid_URL_MyGov__c == '' ? true : false);
    sendMOGOBankSMS = (account.Hybrid_URL_BankStatement__c == null || account.Hybrid_URL_BankStatement__c == '' ? true : false);
    isROFilled = false;
    showApprovalScreen = false;
    showRepAutoEligibleMessage = false;
    territoryNo = account.Territory_Number__r.Name;
    creditMinTotalReferees = 2;
    creditMinRefereesBeingFamilySharedAccom = 1;
    creditMinRefereesBeingFamily = 1;
    
    hybridLinkOpenedDateTime = account.Consent_URL_Opened_DateTime__c;
    hybridLinkAddress = account.Consent_URL_Address__c;
    hybridLinkDeviceInfo = account.Consent_URL_Device_Info__c;
    hybridLinkAllocationDateTime = account.Hybrid_Link_Allocation_Datetime__c;
    hybridLinkStatus = account.Hybrid_Link_Status__c;
    isHybridApplication = account.Hybrid_Link_Allocation_Datetime__c <> null ? true : false;
    
    whyNotPhonePlan = account.Why_not_phone_plan__c;
    productInterested = account.Product_Interested_In__c;
    requirement = account.Product_Name_for_Agreement__c;
    objectives = account.Product_Description__c;
    prodRequirement = account.Requirements_and_Objectives__c;
    loanPurpose = account.Loan_Purpose__c;
    whyConsumerLease = account.Why_consumer_lease__c;
    benefitsOfConsumerLease = account.Benefit_of_Consumer_Lease_with_R4K__c;
    otherBenefitsOfConsumerLease = account.Specify_Other_Benefits_of_Consumer_Lease__c;
    
    if(account.Benefit_of_Consumer_Lease_with_R4K__c != null && account.Benefit_of_Consumer_Lease_with_R4K__c.equals('Other'))
    {
        showOtherBenefits = true;
    }
    /*
    if(productInterested <> null && objectives <> null && whyConsumerLease <> null && benefitsOfConsumerLease <> null)
    {
        isROFilled = true;    
    }
    */
    isROFilled = (Account.Why_consumer_lease__c == null || Account.Why_consumer_lease__c.trim() == '' || Account.Benefit_of_Consumer_Lease_with_R4K__c == null || Account.Benefit_of_Consumer_Lease_with_R4K__c.trim() == '' || Account.Benefit_of_Consumer_Lease_with_R4K__c == '--None--' || Account.Product_Interested_In__c == null || Account.Product_Interested_In__c.trim() == '' || Account.Product_Interested_In__c == '--None--' || Account.Product_Description__c == null || Account.Product_Description__c.trim() == '' || Account.Product_Description__c == 'None' || Account.Product_Description__c == '--None--' || Account.Loan_Purpose__c == null || Account.Loan_Purpose__c.trim() == '' || Account.Requirements_and_Objectives__c == null || Account.Requirements_and_Objectives__c.trim() == '' || Account.Requirements_and_Objectives__c.trim() == 'None' || (Account.Benefit_of_Consumer_Lease_with_R4K__c == 'Other' && (Account.Specify_Other_Benefits_of_Consumer_Lease__c == null || Account.Specify_Other_Benefits_of_Consumer_Lease__c.trim() == '')) || (Account.Product_Interested_In__c == 'Phones' && (Account.Why_not_phone_plan__c == null || Account.Why_not_phone_plan__c.trim() == ''))) ? false : true;
    
    firstNameVal = account.FirstName;
    lastNameVal = account.LastName;
    genderVal = account.Gender__pc;
    dobVal = account.Birthdate__c == null ? '' : account.Birthdate__c.format();
    ageVal = account.Age__c == null ? 0 : account.Age__c;
    
    phoneVal = account.PersonMobilePhone;
    emailVal = account.PersonEmail;
    homePhoneVal = account.PersonHomePhone;
    contactGeneralNotes = account.General_Notes__c;
    
    unformattedAddressVal = account.UnformattedAddress_VedaAlert_Report__c;
    streetNameVal = account.PersonMailingStreet;
    suburbVal = account.PersonMailingCity;
    stateVal = account.PersonMailingState;
    countryVal = account.PersonMailingCountry;
    latVal = account.Sensis_Latitude__c;
    lngVal = account.Sensis_Longitude__c;
    postalCodeVal = account.PersonMailingPostalCode;
    idTypeVal = account.Identification_Type__c;
    idTypeValOther = account.Explanation_for_Other_ID_type__c;
    if(idTypeValOther!=null && idTypeValOther!='')
    {
        idTypeValOther = idTypeValOther.replace('\r\n', ' ');
        idTypeValOther = idTypeValOther.replace('\n', ' ');
        idTypeValOther = idTypeValOther.replace('\r', ' ');
    }
    driverLicenceVal = account.Identification_No__c;
    stateMasterState = account.State_Master_State__c;
    bankSelected = account.Bank_Institution__c;
    centrepayRefNo = (stateMasterState == 'NZ' ? account.WINZ_No__c : account.Centrepay_Ref_No__c);
    
    streetName = streetNameVal;
    suburb = suburbVal;
    state = stateVal;
    postalCode = postalCodeVal;
    lengthOfStayCurrent = account.Length_of_Stay_in_Current_Address__c;
    currentAddressNotes = account.Current_Address_Notes__c;
    
    previousAddress = account.Previous_Address__c;
    lengthOfStayPrevious = account.Length_of_Stay_in_Previous_Address__c;
    
    residentialStatus = account.Residential_Status__c;
    landlordName = account.Landlord_Name__c;
    landlordPhone = Account.Landlord_Telephone__c;
    residentialDetails = Account.Residential_Details__c;
    
    referringAppContDate = Account.Referring_Applicant_Contacted_Date__c <> null ? Account.Referring_Applicant_Contacted_Date__c.format() : '';
    refApplicantId = Account.Referring_Applicant__c;
    
    enquiryStatus = account.Enquiry_Status__c;
    reasonWhyApplicationDidNotGoAhead = account.Reason_why_application_did_not_go_ahead__c;
    enquiryNotes = account.Enquiry_Notes__c;
    optOutOfMarketingMaterial = account.Opt_out_marketing_material__c;
    existingRepSelectedId = account.Rep_Responsible_For_Converting_Lead__c;
    
    benefit1Amount = account.Centrelink_Benefit_Amount__c == null ? 0 : account.Centrelink_Benefit_Amount__c;
    benefit1Option = account.Centrelink_Benefit__c == null ? '' : account.Centrelink_Benefit__c;
    benefit2Amount = account.Centrelink_Benefit2_Amount__c == null ? 0 : account.Centrelink_Benefit2_Amount__c;
    benefit2Option = account.Centrelink_Benefit2__c == null ? '' : account.Centrelink_Benefit2__c;
    benefit3Amount = account.Centrelink_Benefit3_Amount__c == null ? 0 : account.Centrelink_Benefit3_Amount__c;
    benefit3Option = account.Centrelink_Benefit3__c == null ? '' : account.Centrelink_Benefit3__c;
    otherBenefitAmount = account.Other_Centrelink_Benefit_Amount__c == null ? 0 : account.Other_Centrelink_Benefit_Amount__c;
    otherBenefitOption = account.Other_Centrelink_Benefit__c == null ? '' : account.Other_Centrelink_Benefit__c;
    
    existingR4KPayment = account.Existing_R4K_Payment__c == null ? 0 : account.Existing_R4K_Payment__c;
    newR4KPayment = account.Rent4Keeps_Payment_C__c == null ? 0 : account.Rent4Keeps_Payment_C__c;
    
    employerName = Account.Employer_Name__c == null ? '' : Account.Employer_Name__c;
    employmentIncomeDetails = Account.Employment_Income_Details__c == null ? '' : Account.Employment_Income_Details__c;
    employmentIncomeAmount = Account.Employment_Income__c == null ? 0 : Account.Employment_Income__c;
    employmentType = Account.Employment_Type__c == null ? '--None--' : Account.Employment_Type__c;
    employmentStartDate = Account.Employment_Commencement_Date__c == null ? '' : Account.Employment_Commencement_Date__c.format();
    expenseOtherGeneralNotes = Account.Other_General_Notes__c;
    
    otherIncomeSource = Account.Other_Income_Source__c == null ? '' : Account.Other_Income_Source__c;
    otherIncomeDetails = Account.Other_Income_Details__c == null ? '' : Account.Other_Income_Details__c;
    otherIncomeAmount = Account.Other_Income_Amount__c == null ? 0 : Account.Other_Income_Amount__c;
    
    otherRentalCompanyDetails = (Account.Other_Rental_Company_Details__c == null ? '' : Account.Other_Rental_Company_Details__c.replaceAll('\n','').replaceAll('\r','').replaceAll('\'',''));
    mygovRentalsAmt = 0;
    List<Centrepay__c> cpayList = [SELECT Id,Amount__c,Benefit_Type__c,Company_Name__c,Deduction_Type__c,Account__c,Account__r.Territory_Company_Name__c,Category__c,Applicant_Name__c,
                                    Income__c,Next_Payment_Date__c,Expense_Type__c FROM Centrepay__c WHERE Account__c =: acctId AND CreatedDate = LAST_N_DAYS:21 ORDER BY CreatedDate DESC];
    if(cpayList.size() > 0)
    {
        for(Integer c=0; c<cpayList.size(); c++)
        {
            if(cpayList[c].Expense_Type__c == 'Rental Companies' && (cpayList[c].Company_Name__c == null || cpayList[c].Company_Name__c == '' || cpayList[c].Company_Name__c.length() < 10 || !cpayList[c].Company_Name__c.substring(0,10).equalsIgnoreCase(cpayList[c].Account__r.Territory_Company_Name__c.substring(0,10)))){
                mygovRentalsAmt += (cpayList[c].Amount__c == null ? 0 : cpayList[c].Amount__c); 
            }
        }
    }
    totalIncomeAmt = (((Account.Centrelink_Benefit_Amount__c!=null ? Account.Centrelink_Benefit_Amount__c : 0) + (Account.Centrelink_Benefit2_Amount__c!=null ? Account.Centrelink_Benefit2_Amount__c : 0) + (Account.Centrelink_Benefit3_Amount__c!=null ? Account.Centrelink_Benefit3_Amount__c : 0) + (Account.Other_Centrelink_Benefit_Amount__c!=null ? Account.Other_Centrelink_Benefit_Amount__c : 0) + (Account.Employment_Income__c!=null ? Account.Employment_Income__c : 0) + (Account.Other_Income_Amount__c!=null ? Account.Other_Income_Amount__c : 0)));
    totalRentalsAmt = (Account.Other_Rental_Companies__c!=null ? Account.Other_Rental_Companies__c : 0) + Account.Fortnightly_Scheduled_Payment__c;
    System.debug('****totalIncomeAmt ' + totalIncomeAmt);
    System.debug('****totalRentalsAmt ' + totalRentalsAmt);
    
    if(account.AgmtCompDateOtherRentalCompany__c!=null)
    {
        DateTime agmtComplOtherRental = DateTime.newInstance(account.AgmtCompDateOtherRentalCompany__c.year(), account.AgmtCompDateOtherRentalCompany__c.month(), account.AgmtCompDateOtherRentalCompany__c.day());
        agmtComplOtherRentalDate=agmtComplOtherRental.format('dd/MM/yyyy');
    }
    
    otherAgmts = [select id, name,AccountId, StageName,Requirements_Objectives__c, Amount, Scheduled_Amount__c,
                    CreatedDate,Actual_Arrears__c,Actual_Arrears_Original__c,Total_Paid_Amount__c,Remaining_Amount__c  from Opportunity where AccountId=:Account.Id and RecordType.Name <> 'Trak SIM' order by CreatedDate desc];
    CA_actualArrears = 0;
    CA_actualArrearsOriginal = 0;
    CA_actualArrearsWrittenOff = 0;
    CA_actualArrearsOriginalWrittenOff = 0;
    CA_remainingAmountWrittenOff = 0;
    CA_tavWrittenOff = 0;
    CA_totalPaidWrittenOff = 0;
    CA_totalAgreements = otherAgmts.size();
    CA_activeAgreements = 0;
    CA_totalTAV = 0;
    CA_totalPaid = 0;
    CA_totalRemaining = 0;
    CA_scheduledAmount = 0;
    CM_PaymentFrequency = Account.CM_Payment_Frequency__c;
    
    for(Opportunity opp : otherAgmts)
    {
        if(opp.StageName == 'Goods Delivered')
        {
            CA_actualArrears += (opp.Actual_Arrears__c == null ? 0 : opp.Actual_Arrears__c);
            CA_actualArrearsOriginal += (opp.Actual_Arrears_Original__c == null ? 0 : opp.Actual_Arrears_Original__c);
            CA_activeAgreements++;
            CA_totalTAV += (opp.Amount == null ? 0 : opp.Amount);
            CA_totalPaid += (opp.Total_Paid_Amount__c == null ? 0 : opp.Total_Paid_Amount__c);
            CA_totalRemaining += (opp.Remaining_Amount__c == null ? 0 : opp.Remaining_Amount__c);
            CA_scheduledAmount += (opp.Scheduled_Amount__c == null ? 0 : opp.Scheduled_Amount__c);
        }
        
        if(opp.StageName == 'Written Off / Bad Debt')
        {
            CA_actualArrearsWrittenOff += (opp.Actual_Arrears__c == null ? 0 : opp.Actual_Arrears__c);
            CA_actualArrearsOriginalWrittenOff += (opp.Actual_Arrears_Original__c == null ? 0 : opp.Actual_Arrears_Original__c);
            CA_remainingAmountWrittenOff += (opp.Remaining_Amount__c == null ? 0 : opp.Remaining_Amount__c);
            CA_tavWrittenOff += (opp.Amount == null ? 0 : opp.Amount);
            CA_totalPaidWrittenOff += (opp.Total_Paid_Amount__c == null ? 0 : opp.Total_Paid_Amount__c); 
        }
    }
    
    bankStatementAttached = false;
    myGovAttached = false;
    equifaxAttached = false;
    idAttached = false;
    isProductsAddedForAgreement = false;
    allDocsSigned = false;
    currentApprovalStatus = '';
    
    equifaxFileNumber = Account.Veda_File_Number__c;
    equifaxScore = Account.Score_of_Equifax__c;
    equifaxPart9 = Account.Part_9_Agreements__c == null ? 'No' : Account.Part_9_Agreements__c;
    equifaxPart10Bank = Account.Bankruptcy_Part_9_Agreements__c == null ? 'No' : Account.Bankruptcy_Part_9_Agreements__c;
    equifaxDefaultsRental = Account.Equifax_No_of_Unpaid_Default_Rental__c;
    equifaxDefaultsNonRental = Account.Equifax_No_of_Unpaid_Default_NonRental__c;
    
    if(Account.PersonMailingState != null)
    {
        if(stateMasterState == 'NZ'){
            equifaxEnquiryState = Account.PersonMailingState;
        }else if(Account.PersonMailingState.trim().toLowerCase() == 'vic' || Account.PersonMailingState.trim().toLowerCase() == 'victoria'){
            equifaxEnquiryState = 'VIC';
        }else if(Account.PersonMailingState.trim().toLowerCase() == 'wa' || Account.PersonMailingState.trim().toLowerCase() == 'western australia'){
            equifaxEnquiryState  = 'WA';
        }else if(Account.PersonMailingState.trim().toLowerCase() == 'sa' || Account.PersonMailingState.trim().toLowerCase() == 'south australia'){
            equifaxEnquiryState  = 'SA';
        }else if(Account.PersonMailingState.trim().toLowerCase() == 'nsw' || Account.PersonMailingState.trim().toLowerCase() == 'new south wales'){
            equifaxEnquiryState  = 'NSW';
        }else if(Account.PersonMailingState.trim().toLowerCase() == 'qld' || Account.PersonMailingState.trim().toLowerCase() == 'queensland'){
            equifaxEnquiryState  = 'QLD';
        }else if(Account.PersonMailingState.trim().toLowerCase() == 'nt' || Account.PersonMailingState.trim().toLowerCase() == 'northern territory'){
            equifaxEnquiryState  = 'NT';
        }else if(Account.PersonMailingState.trim().toLowerCase() == 'tas' || Account.PersonMailingState.trim().toLowerCase() == 'tasmania'){
            equifaxEnquiryState  = 'TAS';
        }else{
            equifaxEnquiryState  = '--None--';
        }
    }else{
        equifaxEnquiryState  = (stateMasterState == 'NZ' ? null : '--None--');
    }
    equifaxEnquiryStreet = streetNameVal;
    equifaxEnquiryCity = suburbVal;
    equifaxEnquiryPostCode = postalCodeVal;
    driversLicense = (Account.Identification_Type__c != null && Account.Identification_Type__c == 'Driver License') ? Account.Identification_No__c : null;
    equifaxEnquiryPreviousAddress = Account.Previous_Address__c; 
    
    agreementIdForCurrentEnquiry = Account.AgreementId_for_Current_Enquiry__c;
    products = new List<OpportunityLineItem>();
    
    if(agreementIdForCurrentEnquiry!=null && agreementIdForCurrentEnquiry!='')
    {
        opportunity = [select id,name,Term__c,Payment_Frequency__c,Is_Tax_Invoice_Signed__c,TaxInvoice_Signed_DateTime__c,Amount,Scheduled_Amount__c,
                        StageName,Term_Months__c,Gift_To__c,Delivery_Date__c,Approval_Status__c,Why_was_the_agreement_approved__c,
                        Is_Consent_Signed__c,Is_Delivery_Receipt_Attached__c,Is_Purchase_Receipt_Tax_Invoice_Attached__c,Is_Signed_Deduction_Form_Attached__c,
                        CM_Referees_Contacted_Comments__c,CM_No_of_Referees_Being_Family_Comments__c,CM_No_of_Refs_Family_Shared_Comments__c,CM_Maximum_Break_Even_Shortfall_Comments__c,
                        CM_Maximum_Remaining_Amount_Comments__c,CM_Maximum_TAV_Comments__c,CM_No_of_Active_Agreements_Comments__c,CM_No_of_Mobile_Agreements_Comments__c,CM_Part_9_Agreements_Comments__c,CM_Term_Comments__c,CM_Rem_Amount_Rental_Default_Comments__c,
                        Contract_No__c,CM_Reason_to_go_forward__c,Credit_Guideline__c,Credit_Guideline__r.Name,AF_CA_Final_Comments__c,CM_Payment_Frequency__c,
                        AccountId,Account.Product_Category_Selected__c,Account.Product_Name_for_Agreement__c,Account.Product_COGS_for_Agreement__c,
                        Account.Product_Term_for_Agreement__c,Account.Rent4Keeps_Payment_C__c,Account.CM_Scheduled_Amount__c,CM_Scheduled_Amount_Comments__c,
                        Account.Name,Account.Customer_No__c,Account.Territory_Number__r.State_Master_State__c,Account.Product_RRP_for_Agreement__c, 
                        Account.Territory_Number__c,Account.Territory_Number__r.Company_Territory__c,Account.Territory_Number__r.Short_Name__c, 
                        Account.Rep_Responsible_For_Converting_Lead__r.Name,Account.Rep_Responsible_For_Converting_Lead__c,Rep_Name__r.Name,Rep_Name__c,
                        Rep_Name__r.Not_Eligible_for_Auto_Approval__c,Answers_To_Credit_Officer_Comments__c,CM_Dishonours__c,
                        CM_Gambling__c,CM_Collection_And_Consolidation__c,CM_Overdrawn__c,CM_Jobseeker__c,CM_Debt_vs_Income_Ratio_Greater_Than_50__c,Resubmit__c,
                        CM_OutstandingDefRental_Comp_Comments__c,CM_OutstandingDefNonRental_Comp_Comments__c,CM_Equifax_Score_Comments__c,CM_Bankruptcy_Part_9_Agreements_Comments__c,
                        CM_Missed_from_last_6_FN_pymts_Comments__c,AF_CA_Credit_Officer_Name__c,Credit_Guideline__r.Line_Manager_Full_Name__c
                        from Opportunity where id=:agreementIdForCurrentEnquiry LIMIT 1];
        if(oppId == null || oppId == ''){
            approvalOpp = opportunity;
        }
        agmtStage = opportunity.StageName;
        agmtFrequency = opportunity.Payment_Frequency__c;
        agmtTerm = opportunity.Term_Months__c;
        agmtGiftTo = opportunity.Gift_To__c;
        agmtDeliveryDate = opportunity.Delivery_Date__c == null ? null : opportunity.Delivery_Date__c.format();
        agmtSchdAmt = opportunity.Scheduled_Amount__c;
        agmtTAV = opportunity.Amount;
        currentApprovalStatus = opportunity.Approval_Status__c == null ? '' : opportunity.Approval_Status__c;
        approvalStatus = currentApprovalStatus;
        whyWasTheAgreementApproved = opportunity.Why_was_the_agreement_approved__c;
        
        products = [select id,name,Description,Serial_Number__c,Term_Months__c,Opportunity.Number_Of_SP_for_Cross_Check__c,Actual_Per_Fortnight__c,TotalPrice from OpportunityLineItem where OpportunityId=: agreementIdForCurrentEnquiry];
        allDocsSigned = opportunity.TaxInvoice_Signed_DateTime__c!=null && opportunity.Is_Consent_Signed__c && opportunity.Is_Signed_Deduction_Form_Attached__c ? true : false;
        isProductsAddedForAgreement = products.size()>0 ? true : false;
        
        CM_RefereesContactedComments = opportunity.CM_Referees_Contacted_Comments__c;
        CM_NoOfRefereesBeingFamilyComments = opportunity.CM_No_of_Referees_Being_Family_Comments__c;
        CM_NoOfRefereesBeingFamilySharedComments = opportunity.CM_No_of_Refs_Family_Shared_Comments__c;
        CM_MaximumBreakEvenShortFallComments = opportunity.CM_Maximum_Break_Even_Shortfall_Comments__c;
        CM_MaximumRemainingAmountComments = opportunity.CM_Maximum_Remaining_Amount_Comments__c;
        CM_MaximumTAVComments = opportunity.CM_Maximum_TAV_Comments__c;
        CM_NoOfActiveAgreementsComments = opportunity.CM_No_of_Active_Agreements_Comments__c;
        CM_NoOfMobileAgreementsComments = opportunity.CM_No_of_Mobile_Agreements_Comments__c;
        CM_Part9AgreementsComments = opportunity.CM_Part_9_Agreements_Comments__c;
        CM_TermComments = opportunity.CM_Term_Comments__c;
        CM_RemAmountRentalDefaultComments = opportunity.CM_Rem_Amount_Rental_Default_Comments__c;
        CM_PaymentFrequency = opportunity.CM_Payment_Frequency__c;
        
        if(account.Territory_Number__r.Company_Territory__c && account.No_Of_Active_Agreements__c > 1){
            totalRentalsAmt = (totalRentalsAmt - (Account.Other_Rental_Companies__c!=null ? Account.Other_Rental_Companies__c : 0));
        }
    }else{
        if(account.Territory_Number__r.Company_Territory__c && account.No_Of_Active_Agreements__c >= 1){
            totalRentalsAmt = (totalRentalsAmt - (Account.Other_Rental_Companies__c!=null ? Account.Other_Rental_Companies__c : 0));
        }
    }
    System.debug('****totalRentalsAmt ' + totalRentalsAmt);
    CM_PaymentFrequency = (CM_PaymentFrequency == null ? 'Fortnightly' : CM_PaymentFrequency);
    
    ignoreMissedPayment = false;
    showEquifaxScore = false;
    showDefaultRental = false;
    showDefaultNonRental = false;  
    showOtherBenefits = false; 
    
    if(account.Centrelink_Benefit__c==NEWSTARTAL || (account.Centrelink_Benefit__c != null && account.Centrelink_Benefit__c.containsIgnoreCase('Newstart')))
    {
        primaryCentrelink=NEWSTART;
        showPrimaryCentrelink=true;
    }
    else if(account.Centrelink_Benefit__c==YOUTHAL)
    {
        primaryCentrelink=Youth;
        showPrimaryCentrelink=true;
    }
    else if(account.Centrelink_Benefit__c==AUSTUDYAL)
    {
        primaryCentrelink=AUSTUDY;
        showPrimaryCentrelink=true;
    }
    else if(account.Centrelink_Benefit__c==ABSTUDYAL)
    {
        primaryCentrelink=ABSTUDY;
        showPrimaryCentrelink=true;
    }
    else if(account.Centrelink_Benefit__c!=null)
    {
        showPrimaryCentrelink=false;
        primaryCentrelink=GOVT;
    }
    else
    {
        showPrimaryCentrelink=false;
    }
    
    String[] primaryCentrelinkvalues = new String[]{'--Select--',NEWSTART,YOUTH,GOVT};
    this.primaryCentrelinks = new SelectOption[]{};
    
    for (String c: primaryCentrelinkvalues) {
        this.primaryCentrelinks.add(new SelectOption(c,c));
    }
    
    if(account.Benefit_of_Consumer_Lease_with_R4K__c != null && account.Benefit_of_Consumer_Lease_with_R4K__c.equals('Other'))
    {
        showOtherBenefits = true;
    }
    todayDateString = DateTime.now().format('ddMMyyyy');
    overrideDocs = false;
}

public void changePrimaryBenefit()
{
    if(primaryCentrelink==NEWSTART || (primaryCentrelink != null && primaryCentrelink.containsIgnoreCase('Newstart')))
    {
        showPrimaryCentrelink=true;
        account.Centrelink_Benefit__c=NEWSTARTAL;
    }
    else if(primaryCentrelink==YOUTH)
    {
        showPrimaryCentrelink=true;
        account.Centrelink_Benefit__c=YOUTHAL;
    }
    else if(primaryCentrelink==AUSTUDY)
    {
        showPrimaryCentrelink=true;
        account.Centrelink_Benefit__c=AUSTUDYAL;
    }
    else if(primaryCentrelink==ABSTUDY)
    {
        showPrimaryCentrelink=true;
        account.Centrelink_Benefit__c=ABSTUDYAL;
    }
    else
    {
        showPrimaryCentrelink=false;
        account.Centrelink_Benefit__c=null;
        System.debug('****Other Benefits');
    }
}

public void toggleOtherBenefits(){
    System.debug('toggleOtherBenefits called');
    showOtherBenefits = false;
    if(account.Benefit_of_Consumer_Lease_with_R4K__c != null && account.Benefit_of_Consumer_Lease_with_R4K__c.equals('Other'))
    {
        showOtherBenefits = true;
    }
}

public PageReference updateAccount()
{    
    try
    {
        String accordionType = Apexpages.currentPage().getParameters().get('accordionType');
        String nextFormType = Apexpages.currentPage().getParameters().get('nextFormType');
        String nextSectionType = Apexpages.currentPage().getParameters().get('nextSectionType');
        
        System.debug('accordionType : ' + accordionType);
        System.debug('nextFormType : ' + nextFormType);
        System.debug('nextSectionType : ' + nextSectionType);
        
        Account acct = new Account();
        acct.Id = acctId;
        
        if(formType == 'assessment' && sectionType == 'id' && (accordionType == null || accordionType == 'basic' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            acct.FirstName = firstNameVal;
            acct.LastName = lastNameVal;
            //acct.PersonMobilePhone = phone;
            //acct.PersonEmail = email;
            acct.Gender__pc = genderVal!=null && genderVal!='' && genderVal!='--Select Gender--' ? genderVal : null;
            
            acct.PersonMailingStreet = streetNameVal;
            acct.PersonMailingCity = suburbVal;
            acct.PersonMailingState = stateVal;
            acct.PersonMailingPostalCode = postalCodeVal;
            acct.PersonMailingCountry = countryVal;
            acct.Sensis_Latitude__c = latVal;
            acct.Sensis_Longitude__c = lngVal;
            
            acct.Identification_No__c = driverLicenceVal;
            acct.Identification_Type__c = idTypeVal;
            if(idTypeVal=='Other')
            {
                acct.Explanation_for_Other_ID_type__c = idTypeValOther;
            }
            acct.BirthDate__c = dobVal!=null && dobVal!='' ? Date.parse(dobVal) : null;
            acct.Marital_Status__pc = Account.Marital_Status__pc;
            acct.Number_of_Dependants__c = Account.Number_of_Dependants__c;
            List<Account> tempAcctList = new List<Account>();
            if(stateMasterState == 'NZ'){
                tempAcctList = [SELECT Id FROM Account WHERE WINZ_No__c =: centrepayRefNo AND Id !=: acctId AND Territory_Number__c in: territoryIdsWithRecordAccess LIMIT 1];
                if(tempAcctList.size() == 0){
                    acct.WINZ_No__c = centrepayRefNo;
                }
            }else{
                tempAcctList = [SELECT Id FROM Account WHERE Centrepay_Ref_No__c =: centrepayRefNo AND Id !=: acctId AND Territory_Number__c in: territoryIdsWithRecordAccess LIMIT 1];
                if(tempAcctList.size() == 0){
                    acct.Centrepay_Ref_No__c = centrepayRefNo;
                }
            }
            if(acct.BirthDate__c <> null)
            {
                Integer daysDOB = acct.BirthDate__c.daysBetween(Date.Today());
                Integer ageDOB = Integer.valueOf(daysDOB/365);
                
                if(ageDOB < 18)
                {
                    throw new TestException('No product can be serviced as the Applicant is less than 18 years old');
                }
            }
        }
        
        if(formType == 'assessment' && sectionType == 'id' && (accordionType == null || accordionType == 'enquiry' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            acct.Enquiry_Status__c = enquiryStatus;
            acct.Reason_why_application_did_not_go_ahead__c = reasonWhyApplicationDidNotGoAhead;
            acct.Enquiry_Notes__c = enquiryNotes;
            acct.Opt_out_marketing_material__c = optOutOfMarketingMaterial;
            acct.Rep_Responsible_For_Converting_Lead__c = existingRepSelectedId;
        }
        
        if(formType == 'assessment' && sectionType == 'id' && (accordionType == null || accordionType == 'contact' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            acct.PersonMobilePhone = phoneVal;
            acct.PersonEmail = emailVal;
            acct.PersonHomePhone = homePhoneVal;
            acct.General_Notes__c = contactGeneralNotes;
        }
        
        if(formType == 'assessment' && sectionType == 'id' && (accordionType == null || accordionType == 'cmailing' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            acct.PersonMailingStreet = streetName;
            acct.PersonMailingCity = suburb;
            acct.PersonMailingState = state;
            acct.PersonMailingPostalCode = postalCode;
            acct.Length_of_Stay_in_Current_Address__c = lengthOfStayCurrent;
            acct.Current_Address_Notes__c = currentAddressNotes;
            acct.Address_Verification_Type__c = account.Address_Verification_Type__c;
        }
        
        if(formType == 'assessment' && sectionType == 'id' && (accordionType == null || accordionType == 'pmailing' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            acct.Previous_Address__c = previousAddress;
            acct.Length_of_Stay_in_Previous_Address__c = lengthOfStayPrevious;
        }
        
        if(formType == 'assessment' && sectionType == 'id' && (accordionType == null || accordionType == 'landlord' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            acct.Residential_Status__c = residentialStatus;
            acct.Landlord_Name__c = landlordName;
            acct.Landlord_Telephone__c = landlordPhone;
            acct.Residential_Details__c = residentialDetails;
        }
        
        if(formType == 'assessment' && sectionType == 'id' && (accordionType == null || accordionType == 'refApplicant' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            acct.Referring_Applicant__c = refApplicantId <> null && refApplicantId.trim() <> '' ? refApplicantId : null;
            acct.Referring_Applicant_Contacted_Date__c = referringAppContDate <> null && referringAppContDate.trim() <> '' ? Date.parse(referringAppContDate) : null;
        }
        
        if(formType == 'assessment' && sectionType == 'equifax' && (accordionType == null || accordionType == 'info' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            if(equifaxFileNumber <> null && equifaxFileNumber.trim() <> '')
            {
                List<Account> eqAcctList = [SELECT Id FROM Account WHERE Id <>: acctId AND Veda_File_Number__c =: equifaxFileNumber AND Territory_Number__r.Is_Credit_Contract__c = true AND Territory_Number__c in: territoryIdsWithRecordAccess LIMIT 1];
                if(eqAcctList.size() > 0)
                {
                    throw new TestException('Equifax File Number already present');
                }
            }
            
            acct.Veda_File_Number__c = equifaxFileNumber;
            acct.Score_of_Equifax__c = equifaxScore;
            acct.Part_9_Agreements__c = equifaxPart9;
            acct.Bankruptcy_Part_9_Agreements__c = equifaxPart10Bank;
            acct.Equifax_No_of_Unpaid_Default_Rental__c = equifaxDefaultsRental;
            acct.Equifax_No_of_Unpaid_Default_NonRental__c = equifaxDefaultsNonRental;
            acct.Any_enquiry_in_the_past_6_month__c = Account.Any_enquiry_in_the_past_6_month__c;
            acct.No_of_Equifax_Enquiries_Last_6_Month__c = Account.No_of_Equifax_Enquiries_Last_6_Month__c;
            acct.Explanation_for_Recent_Enquiries__c = Account.Explanation_for_Recent_Enquiries__c;
            acct.Veda_Notes__c = Account.Veda_Notes__c;
            acct.Explanation_for_All_Other_Defaults__c = Account.Explanation_for_All_Other_Defaults__c;
        }
        
        if(formType == 'signing' && sectionType == 'sourcing' && (accordionType == null || accordionType == 'info' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {             
            if(agreementIdForCurrentEnquiry <> null && agreementIdForCurrentEnquiry.trim() <> '')
            {
                Opportunity oppp = new Opportunity();
                oppp.id = agreementIdForCurrentEnquiry;
                oppp.StageName = agmtStage;
                oppp.Payment_Frequency__c = agmtFrequency;
                oppp.Term_Months__c = agmtTerm;
                //oppp.Gift_To__c = agmtGiftTo;
                oppp.Why_was_the_agreement_approved__c = whyWasTheAgreementApproved;
                oppp.Delivery_Date__c = agmtDeliveryDate <> null && agmtDeliveryDate.trim() <> '' ? Date.parse(agmtDeliveryDate) : null;
                /////////////////////
                if(opportunity <> null && (opportunity.StageName <> oppp.StageName || opportunity.Payment_Frequency__c <> oppp.Payment_Frequency__c || opportunity.Term_Months__c <> oppp.Term_Months__c || opportunity.Delivery_Date__c <> oppp.Delivery_Date__c))
                {
                    oppp.AF_Audit_Notification_Task_ID__c = 'CAM3';
                }
                /////////////////////
                update oppp;
            }
        }
        
        if(formType == 'assessment' && sectionType == 'ro')
        { 
            acct.Why_not_phone_plan__c = whyNotPhonePlan;
            acct.Product_Interested_In__c = Account.Product_Interested_In__c;
            acct.Product_Name_for_Agreement__c = requirement;
            acct.Product_Description__c = objectives;
            acct.Requirements_and_Objectives__c = prodRequirement;
            acct.Loan_Purpose__c = loanPurpose;
            acct.Why_consumer_lease__c = (whyConsumerLease != null && whyConsumerLease.length() > 254 ? whyConsumerLease.substring(0,254) : whyConsumerLease);
            acct.Benefit_of_Consumer_Lease_with_R4K__c = Account.Benefit_of_Consumer_Lease_with_R4K__c;
            acct.Specify_Other_Benefits_of_Consumer_Lease__c = otherBenefitsOfConsumerLease;
        }
        
        if(formType == 'assessment' && sectionType == 'bank')
        { 
            acct.Centrelink_Benefit_Amount__c = benefit1Amount == null ? 0 : benefit1Amount;
            acct.Centrelink_Benefit__c = Account.Centrelink_Benefit__c;
            acct.Centrelink_Benefit2_Amount__c = benefit2Amount == null ? 0 : benefit2Amount;
            acct.Centrelink_Benefit2__c = Account.Centrelink_Benefit2__c;
            acct.Centrelink_Benefit3_Amount__c = benefit3Amount == null ? 0 : benefit3Amount;
            acct.Centrelink_Benefit3__c = Account.Centrelink_Benefit3__c;
            acct.Other_Centrelink_Benefit_Amount__c = otherBenefitAmount == null ? 0 : otherBenefitAmount;
            acct.Other_Centrelink_Benefit__c = Account.Other_Centrelink_Benefit__c;
            acct.Centrelink_Benefits_Verified__c = Account.Centrelink_Benefits_Verified__c;
            acct.Is_Disability_Support_Pension__c = Account.Is_Disability_Support_Pension__c;
            acct.Carer__c = Account.Carer__c;
            acct.Carer_Full_Name__c = Account.Carer_Full_Name__c;
            acct.Carer_Phone_No__c = Account.Carer_Phone_No__c;
            acct.Carer_Confirmation__c = Account.Carer_Confirmation__c;
        }
        
        if(formType == 'assessment' && sectionType == 'bank')
        { 
            acct.Centrepay_Outgoings__c = crmCpay == null ? 0 : crmCpay;
            acct.Centrepay_Details__c = cpayDetails;
        }
        
        if(formType == 'assessment' && sectionType == 'bank')
        {    
            acct.Rent4Keeps_Payment_C__c = newR4KPayment == null ? 0 : newR4KPayment;
            acct.Serviceability_Comments__c = Account.Serviceability_Comments__c;
            acct.Notes__c = Account.Notes__c;
        }
        
        if(formType == 'assessment' && sectionType == 'bank')
        {    
            acct.Employer_Name__c = employerName;
            acct.Employment_Income_Details__c = employmentIncomeDetails;
            acct.Employment_Income__c = employmentIncomeAmount == null ? 0 : employmentIncomeAmount;
            acct.Employment_Type__c = employmentType;
            acct.Employment_Commencement_Date__c = (employmentStartDate == null || employmentStartDate.trim() == '') ? null : Date.parse(employmentStartDate);
            acct.Employment_Income_Verified__c = Account.Employment_Income_Verified__c;
            
            acct.Other_Income_Source__c = otherIncomeSource;
            acct.Other_Income_Details__c = otherIncomeDetails;
            acct.Other_Income_Amount__c = otherIncomeAmount == null ? 0 : otherIncomeAmount;
        }
        
        if(formType == 'assessment' && sectionType == 'bank' && (accordionType == null || accordionType == 'otherrental' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {    
            acct.AgmtCompDateOtherRentalCompany__c = (agmtComplOtherRentalDate!=null && agmtComplOtherRentalDate!='') ? Date.parse(agmtComplOtherRentalDate) : null;
            acct.Other_Rental_Companies__c = Account.Other_Rental_Companies__c;
            acct.Other_Rental_Company_Details__c = Account.Other_Rental_Company_Details__c;
            acct.Other_Rental_Company_Name__c = Account.Other_Rental_Company_Name__c;
            acct.Product_Other_Rental_Company__c = Account.Product_Other_Rental_Company__c;
        }
        
        if(formType == 'assessment' && sectionType == 'bank' && (accordionType == null || accordionType == 'expSharing' || accordionType == '' || (nextFormType <> null && nextFormType == 'next')))
        {    
            acct.Sharing_expenses_with_others__c = Account.Sharing_expenses_with_others__c;
            acct.Shared_Expense_with__c = Account.Shared_Expense_with__c;
            acct.How_did_you_verify_shared_expenses__c = Account.How_did_you_verify_shared_expenses__c;
            acct.Expense_Items_in_Shared_Expense__c = Account.Expense_Items_in_Shared_Expense__c;
        }
        
        if(formType == 'assessment' && sectionType == 'bank')
        {    
            acct.Rent_Mortgage_Board_Details__c = rentExpenseDetails;
            acct.Loan_Payment_Details__c = loanExpenseDetails;
            acct.Credit_Card_Details__c = creditCardExpenseDetails;
            acct.Insurance_Details__c = insuranceExpenseDetails;
            acct.Food_Details__c = householdExpenseDetails;
            acct.Utilities_Details__c = utilitiesExpenseDetails;
            acct.Car_Lease_Loan_Payment_Details__c = travelExpenseDetails;
            acct.Mobile_Expenses_Details__c = mobileExpenseDetails;
            acct.Clothing_Details__c = clothingExpenseDetails;
            acct.Tobacco_Alcohol_Details__c = tobaccoExpenseDetails;
            acct.Other_Details__c = otherExpenseDetails;
            acct.Other_General_Notes__c = expenseOtherGeneralNotes;
            
            acct.Rent_Mortgage_Board__c = crmRent == null ? 0 : crmRent;
            acct.Loan_Payments__c = crmLoan == null ? 0 : crmLoan;
            acct.Credit_Card__c = crmCredit == null ? 0 : crmCredit;
            acct.Insurance__c = crmInsurance == null ? 0 : crmInsurance;
            acct.Food__c = crmHousehold == null ? 0 : crmHousehold;
            acct.Utilities__c = crmUtilities == null ? 0 : crmUtilities;
            acct.Car_Lease_Loan_Payment__c = crmCar == null ? 0 : crmCar;
            acct.Mobile_Expenses__c = crmMobile == null ? 0 : crmMobile;
            acct.Clothing__c = crmClothing == null ? 0 : crmClothing;
            acct.Tobacco_Alcohol__c = crmTobacco == null ? 0 : crmTobacco;
            acct.OtherOutgoings__c = crmOtherTotal == null ? 0 : crmOtherTotal;
            
            acct.Income_Verification_Type__c = account.Income_Verification_Type__c;
            acct.Expense_Verification_Type__c = account.Expense_Verification_Type__c;
        }
        
        if(formType == 'assessment' && sectionType == 'bank')
        {
            acct.CAM_Income__c = Account.CAM_Expense__c;
            acct.CAM_Expense__c = Account.CAM_Expense__c;
            
            Decimal totalIncomeServ = (employmentIncomeAmount == null ? 0 : employmentIncomeAmount) + (benefit1Amount == null ? 0 : benefit1Amount) + (benefit2Amount == null ? 0 : benefit2Amount) + (benefit3Amount == null ? 0 : benefit3Amount) + (otherBenefitAmount == null ? 0 : otherBenefitAmount) + (otherIncomeAmount == null ? 0 : otherIncomeAmount);
            acct.Highlevel_Income__c = totalIncomeServ;
            
            Decimal totalExpenseServ = (crmRent == null ? 0 : crmRent) + (crmHousehold == null ? 0 : crmHousehold) + (crmClothing == null ? 0 : crmClothing) + (crmOtherTotal == null ? 0 : crmOtherTotal) + (crmLoan == null ? 0 : crmLoan) + (crmCar == null ? 0 : crmCar) + (crmCredit == null ? 0 : crmCredit) + (crmInsurance == null ? 0 : crmInsurance)
                                    + (crmUtilities == null ? 0 : crmUtilities) + (crmCpay == null ? 0 : crmCpay) + (crmTobacco == null ? 0 : crmTobacco) + (crmMobile == null ? 0 : crmMobile) + (Account.Other_Rental_Companies__c == null ? 0 : Account.Other_Rental_Companies__c)
                                    + (newR4KPayment == null ? 0 : newR4KPayment) + (existingR4KPayment == null ? 0 : existingR4KPayment);
            acct.Comfortable_Spending__c = totalExpenseServ;
            
            if(totalIncomeServ>0)
                acct.Serviceability__c=((totalIncomeServ-totalExpenseServ)*100/totalIncomeServ).setScale(2);
            else
                acct.Serviceability__c=0;
        }
        
        if(formType == 'assessment' && sectionType == 'id')
        {             
            acct.CAM_Basic__c = Account.CAM_Basic__c;
            acct.CAM_Contact__c = Account.CAM_Basic__c;
        }
        
        if(formType == 'assessment' && sectionType == 'equifax')
        {             
            acct.CAM_Equifax__c = Account.CAM_Equifax__c;
        }
        
        if(formType == 'assessment' && sectionType == 'credit' && showApprovalScreen)
        {             
            acct.Marital_Status__pc = Account.Marital_Status__pc;
            acct.Length_of_Stay_in_Current_Address__c = Account.Length_of_Stay_in_Current_Address__c;
            acct.Address_Verification_Type__c = Account.Address_Verification_Type__c;
            acct.Employer_Name__c = Account.Employer_Name__c;
            acct.Employment_Commencement_Date__c = employmentStartDate <> null && employmentStartDate.trim() <> '' ? Date.parse(employmentStartDate) : null;
            acct.Income_Verification_type__c = Account.Income_Verification_type__c;
            acct.Expense_Verification_Type__c = Account.Expense_Verification_Type__c;
            acct.Serviceability_Comments__c = Account.Serviceability_Comments__c;
        }
        
        if(formType == 'assessment' || formType == 'docs')
        {
            if(formType == 'docs')
            {
                acct.X3_Step_Docs__c = true;
            }else{
                acct.X3_Step_Assessment__c = true;    
            }
            
            update acct;
        }
        
        if(nextFormType <> null && nextSectionType <> null && nextFormType == 'next' && nextSectionType == 'next')
        {
            if(formType == 'docs')
            {
                if(sectionType == 'confirmation')
                {
                    nextFormType = 'docs';
                    nextSectionType = 'id';
                }else if(sectionType == 'id')
                {
                    nextFormType = 'docs';
                    nextSectionType = 'bank';
                }else if(sectionType == 'bank')
                {
                    nextFormType = 'docs';
                    nextSectionType = 'mygov';
                }else if(sectionType == 'mygov')
                {
                    nextFormType = 'docs';
                    nextSectionType = 'referees';
                }else if(sectionType == 'referees')
                {
                    nextFormType = 'docs';
                    nextSectionType = 'equifax';
                }else if(sectionType == 'equifax')
                {
                    nextFormType = 'assessment';
                    nextSectionType = 'ro';
                }
            }else if(formType == 'assessment')
            {
                if(sectionType == 'ro')
                {
                    nextFormType = 'assessment';
                    nextSectionType = 'id';
                }else if(sectionType == 'id')
                {
                    nextFormType = 'assessment';
                    nextSectionType = 'bank';
                }else if(sectionType == 'bank')
                {
                    nextFormType = 'assessment';
                    nextSectionType = 'equifax';
                }else if(sectionType == 'equifax')
                {
                    nextFormType = 'assessment';
                    nextSectionType = 'credit';
                }else if(sectionType == 'credit')
                {
                    nextFormType = 'signing';
                    nextSectionType = 'sourcing';
                }
            }else if(formType == 'signing')
            {
                nextFormType = 'signing';
                nextSectionType = 'sign';
            }
            
            return new PageReference('/apex/CAMProcess?formType='+nextFormType+'&sectionType='+nextSectionType+'&id='+acctId).setRedirect(true);
        }
        else if(nextFormType <> null && nextSectionType <> null && nextFormType <> '' && nextSectionType <> '' && nextFormType <> 'next' && nextSectionType <> 'next')
        {
            return new PageReference('/apex/CAMProcess?formType='+nextFormType+'&sectionType='+nextSectionType+'&id='+acctId).setRedirect(true);
        }else
        {
            return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
        }
    }
    catch(Exception ex)
    {
        String saveErrorMessage = 'Please check the entered data.\n';
        
        if(String.valueOf(ex).containsIgnoreCase('Centrepay_Ref_No__c duplicates'))
        {
            saveErrorMessage += 'Centrepay Ref No already present.\n';
        }else if(String.valueOf(ex).containsIgnoreCase('WINZ_No__c duplicates'))
        {
            saveErrorMessage += 'WINZ No already present.\n';
        }else if(String.valueOf(ex).containsIgnoreCase('Equifax File Number already present'))
        {
            saveErrorMessage += 'Equifax File Number already present.\n';
        }else if(String.valueOf(ex).containsIgnoreCase('No product can be serviced as the Applicant is less than 18 years old'))
        {
            saveErrorMessage += 'No product can be serviced as the Applicant is less than 18 years old.\n';
        }else{
            saveErrorMessage += String.valueOf(ex);
        }
        
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.severity.ERROR,saveErrorMessage);
        ApexPages.addMessage(myMsg);
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CAMProcessController','updateAccount',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        //return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
        return null;
    }
}

public void getDocuments()
{
    Map<String,AttachmentWrapper> clinkDedWrapMap = new Map<String,AttachmentWrapper>();
    Map<String,AttachmentWrapper> eziDedWrapMap = new Map<String,AttachmentWrapper>();
    Map<String,List<AttachmentWrapper>> bankStatWrapMap = new Map<String,List<AttachmentWrapper>>();
    Map<String,AttachmentWrapper> clinkStatWrapMap = new Map<String,AttachmentWrapper>();
    List<AttachmentWrapper> tempAttachmentWrapper = new List<AttachmentWrapper>();
    incomeExpenseAttachmentWrapper = new List<AttachmentWrapper>();
    clinkAttachmentWrapper = new List<AttachmentWrapper>();
    bankAttachmentWrapper = new List<AttachmentWrapper>();
    otherAttachmentWrapper = new List<AttachmentWrapper>();
    
    List<Attachment> atts = [select id, name, ParentId, CreatedBy.Name,LastModifiedDate,CreatedDate from Attachment where parentId =: acctId AND CreatedDate = LAST_N_DAYS:21 order by CreatedDate DESC];
    //List<GoogleDoc> googleDocs = [select id,Name,parentId,url,CreatedBy.Name,LastModifiedDate,CreatedDate from GoogleDoc where parentId =: acctId AND CreatedDate = LAST_N_DAYS:21 order by LastModifiedDate asc];
    
    if(account.Customer_Photo_Id__c <> null && account.Customer_Photo_Id__c <> '')
    {
        List<Document> attsCustomerPhoto = [select id,Name from Document where id=:account.Customer_Photo_Id__c and CreatedDate = LAST_N_days:21 Limit 1];
        if(attsCustomerPhoto.size()>0)
        {
            custPhotoAtt = attsCustomerPhoto[0].Id;
        }
    }
    
    if(atts.size()>0)
    {
        for(Attachment att : atts)
        {    
            if(att.Name.startsWith('Photo Id') && !att.Name.startsWith('Photo Id Back') && !att.Name.startsWith('Photo Id Address') && idAtt == null)
            {
                AttachmentWrapper photoAtt = new AttachmentWrapper();
                photoAtt.Id = att.Id;
                photoAtt.Name = 'Photo Id';
                photoAtt.type = 'Attachment';
                photoAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
                idAtt = photoAtt;
                idAttached = true;
            }
            if(att.Name.startsWith('Photo Id Address') && idAddressAtt == null)
            {
                idAddressAtt = new AttachmentWrapper();
                idAddressAtt.Id = att.Id;
                idAddressAtt.Name = 'Photo Id Address';
                idAddressAtt.type = 'Attachment';
                idAddressAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
            }           
            if(att.Name.startsWith('BankStatementCategorised_'))
            {
                AttachmentWrapper bankStAtt = new AttachmentWrapper();
                bankStAtt.Id = att.Id;
                bankStAtt.Name = 'Bank Statement Categorized';
                bankStAtt.type = 'Attachment';
                bankStAtt.url = (att.Name.endsWithIgnoreCase('.html') ? ('/apex/BankStatementCategorisedPage?id='+att.Id) : ('/servlet/servlet.FileDownload?file='+att.Id));            
                bankAtt = bankStAtt;
                incomeExpenseAttachmentWrapper.add(bankStAtt);
                bankAttachmentWrapper.add(bankStAtt);
                bankStatementAttached = true;
            }
            if(att.Name.startsWith('BankStatement_'))
            {
                AttachmentWrapper bankStAtt = new AttachmentWrapper();
                bankStAtt.Id = att.Id;
                bankStAtt.Name = 'Bank Statement';
                bankStAtt.type = 'Attachment';
                bankStAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
                if(bankAtt == null)
                {
                    bankAtt = bankStAtt;
                }
                incomeExpenseAttachmentWrapper.add(bankStAtt);
                bankAttachmentWrapper.add(bankStAtt);
                bankStatementAttached = true;
            }
            if(att.Name.startsWith('myGov_'))
            {
                AttachmentWrapper incomeStAtt = new AttachmentWrapper();
                incomeStAtt.Id = att.Id;
                incomeStAtt.Name = 'Income Statement';
                incomeStAtt.type = 'Attachment';
                incomeStAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
                mygovAtt = incomeStAtt;
                incomeExpenseAttachmentWrapper.add(incomeStAtt);
                clinkAttachmentWrapper.add(incomeStAtt);
                myGovAttached = true;
            }
            if(att.Name.startsWith('Equifax_') && equifaxAtt == null)
            {
                AttachmentWrapper equifaxStAtt = new AttachmentWrapper();
                equifaxStAtt.Id = att.Id;
                equifaxStAtt.Name = 'Equifax';
                equifaxStAtt.type = 'Attachment';
                equifaxStAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
                equifaxAtt = equifaxStAtt;
                equifaxAttached = true;
            }
            if(att.Name.startsWith('Other File'))
            {
                AttachmentWrapper otherAtt = new AttachmentWrapper();
                otherAtt.Id = att.Id;
                otherAtt.Name = 'Other File';
                otherAtt.type = 'Attachment';
                otherAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
                otherAttachmentWrapper.add(otherAtt);
            }
            if(att.Name.startsWith('Proof of Income-'))
            {
                AttachmentWrapper proofIncomeAtt = new AttachmentWrapper();
                proofIncomeAtt.Id = att.Id;
                String proofType = att.Name.substring(16);
                proofIncomeAtt.Name = proofType.substring(0,proofType.lastIndexOf('.'));
                //proofIncomeAtt.Name = att.Name;
                proofIncomeAtt.type = 'Attachment';
                proofIncomeAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
                incomeExpenseAttachmentWrapper.add(proofIncomeAtt);
                clinkAttachmentWrapper.add(proofIncomeAtt);
            }
            if(att.Name.startsWith('CreditMatrix'))
            {
                AttachmentWrapper creditMatrixAtt = new AttachmentWrapper();
                creditMatrixAtt.Id = att.Id;
                creditMatrixAtt.Name = att.Name;
                creditMatrixAtt.type = 'Attachment';
                creditMatrixAtt.url = '/servlet/servlet.FileDownload?file='+att.Id;
            }
        }
    }
    
    ApexPages.currentPage().getParameters().put('id',account.id);
    ApexPages.StandardController stdController = new ApexPages.StandardController(account);
    NewApplicantProcessController npc = new NewApplicantProcessController(stdController);
    npc.initializeExpensesMappingPage();
    
    crmRent = account.Rent_Mortgage_Board__c == null ? 0 : account.Rent_Mortgage_Board__c;
    crmLoan = account.Loan_Payments__c == null ? 0 : account.Loan_Payments__c;
    crmCredit = account.Credit_Card__c == null ? 0 : account.Credit_Card__c;
    crmInsurance = account.Insurance__c == null ? 0 : account.Insurance__c;
    crmHousehold = account.Food__c == null ? 0 : account.Food__c;
    crmUtilities = account.Utilities__c == null ? 0 : account.Utilities__c;
    crmCar = account.Car_Lease_Loan_Payment__c == null ? 0 : account.Car_Lease_Loan_Payment__c;
    crmMobile = account.Mobile_Expenses__c == null ? 0 : account.Mobile_Expenses__c;
    crmClothing = account.Clothing__c == null ? 0 : account.Clothing__c;
    crmTobacco = account.Tobacco_Alcohol__c == null ? 0 : account.Tobacco_Alcohol__c;
    crmOtherTotal = account.OtherOutgoings__c == null ? 0 : account.OtherOutgoings__c;
    crmCpay = Account.Centrepay_Outgoings__c == null ? 0 : account.Centrepay_Outgoings__c;
    
    mogoRent = npc.mogoRent;
    mogoLoan = npc.mogoLoan;
    mogoCredit = npc.mogoCredit;
    mogoInsurance = npc.mogoInsurance;
    mogoHousehold = npc.mogoHousehold;
    mogoUtilities = npc.mogoUtilities;
    mogoCar = npc.mogoCar;
    mogoMobile = npc.mogoMobile;
    mogoClothing = npc.mogoClothing;
    mogoTobacco = npc.mogoTobacco;
    mogoOther = npc.mogoOther;
    mogoOtherTotal = npc.mogoOtherTotal;
    
    rentExpenseDetails = npc.rentExpenseDetails;
    loanExpenseDetails = npc.loanExpenseDetails;
    creditCardExpenseDetails = npc.creditCardExpenseDetails;
    insuranceExpenseDetails = npc.insuranceExpenseDetails;
    householdExpenseDetails = npc.householdExpenseDetails;
    utilitiesExpenseDetails = npc.utilitiesExpenseDetails;
    travelExpenseDetails = npc.travelExpenseDetails;
    mobileExpenseDetails = npc.mobileExpenseDetails;
    clothingExpenseDetails = npc.clothingExpenseDetails;
    tobaccoExpenseDetails = npc.tobaccoExpenseDetails;
    otherExpenseDetails = npc.otherExpenseDetails;
    cpayDetails = account.Centrepay_Details__c;
    
    rentTransactions = npc.rentTransactions;
    loanTransactions = npc.loanTransactions;
    insuranceTransactions = npc.insuranceTransactions;
    creditCardTransactions = npc.creditCardTransactions;
    travelTransactions = npc.travelTransactions;
    householdTransactions = npc.householdTransactions;
    utilitiesTransactions = npc.utilitiesTransactions;
    mobileTransactions = npc.mobileTransactions;
    tobaccoTransactions = npc.tobaccoTransactions;
    clothingTransactions = npc.clothingTransactions;
    otherExpenseList = npc.otherExpenseList;
    
    requirement = account.Product_Name_for_Agreement__c == null ? '' : account.Product_Name_for_Agreement__c;
    objectives = account.Product_Description__c == null ? '' : account.Product_Description__c;
    whyConsumerLease = account.Why_consumer_lease__c == null ? '' : account.Why_consumer_lease__c;
    benefitsOfConsumerLease = account.Benefit_of_Consumer_Lease_with_R4K__c == null ? '' : account.Benefit_of_Consumer_Lease_with_R4K__c;
    otherBenefitsOfConsumerLease = account.Specify_Other_Benefits_of_Consumer_Lease__c == null ? '' : account.Specify_Other_Benefits_of_Consumer_Lease__c;
    productInterested = account.Product_Interested_In__c == null ? '' : account.Product_Interested_In__c;
    whyNotPhonePlan = account.Why_not_phone_plan__c == null ? '' : account.Why_not_phone_plan__c;   
    
    creditMatrixAction();
    GetAllReds();
    
    totalRefList = [select id,Name,Referee_Name__c,Referee_Name__r.Name,Phone__c,Contacted__c,Contacted_On_Date__c,Referee_Added_Datetime__c,Relationship__c,Confirmed_Willing_Referee__c from Referee__C where Applicant__r.Id=:account.Id];
    totalRefereeAddedCounter = 0;
    totalRefAdded = new List<Referee__c>();
    
    if(totalRefList.size()>0)
    {
        for(Referee__c ref:totalRefList)
        {
            /*if(ref.Contacted__c=='Yes' && ref.Contacted_On_Date__c!=null && enquiryDate!=null)
            {
                system.debug('enquiryDate: '+enquiryDate);
                system.debug('ref.Contacted_On_Date__c: '+ref.Contacted_On_Date__c);
                
                daysBetweenEnquiryAndRefereeContacted=Math.abs(enquiryDate.daysBetween(ref.Contacted_On_Date__c));
                
                system.debug('daysBetweenEnquiryAndRefereeContacted: '+daysBetweenEnquiryAndRefereeContacted);
                if(daysBetweenEnquiryAndRefereeContacted<=21)
                {
                    refereeCounter++;
                }
            }*/
            
            //system.debug('ref.Referee_Added_Datetime__c: ' + ref.Referee_Added_Datetime__c);
            //system.debug('daysBetween: ' + (ref.Referee_Added_Datetime__c <> null ? ref.Referee_Added_Datetime__c.date().daysBetween(enquiryDate) : null));
            
            //noOfWillingReferees += (ref.Confirmed_Willing_Referee__c <> null && ref.Confirmed_Willing_Referee__c==true && ref.Contacted_On_Date__c != null && enquiryDate != null && ref.Contacted_On_Date__c >= enquiryDate) ? 1 : 0;
            totalRefereeAddedCounter += (ref.Referee_Added_Datetime__c <> null && account.Enquiry_Date__c <> null && account.Enquiry_Date__c.daysBetween(ref.Referee_Added_Datetime__c.date()) >= -3) ? 1 : 0;
            
            if(ref.Referee_Added_Datetime__c <> null && account.Enquiry_Date__c <> null && account.Enquiry_Date__c.daysBetween(ref.Referee_Added_Datetime__c.date()) >= -3)
            {
                totalRefAdded.add(ref);
            }
            
            //familyRefereeAddedCounter += (ref.Relationship__c <> null && ref.Relationship__c == 'Family Member' && ref.Referee_Added_Datetime__c <> null && enquiryDate <> null && enquiryDate.daysBetween(ref.Referee_Added_Datetime__c.date()) >= -3) ? 1 : 0;
            //familyRefereeContactedCounter += (ref.Relationship__c <> null && ref.Relationship__c == 'Family Member' && ref.Contacted__c <> null && ref.Contacted__c=='Yes' && ref.Contacted_On_Date__c <> null && enquiryDate <> null && ref.Contacted_On_Date__c >= enquiryDate) ? 1 : 0;
            
            //System.debug('totalRefereeAddedCounter : ' + totalRefereeAddedCounter);
            //System.debug('familyRefereeAddedCounter : ' + familyRefereeAddedCounter);
            //System.debug('familyRefereeContactedCounter : ' + familyRefereeContactedCounter);
        }
    }
    
    npc.primaryMatches = new List<NewApplicantProcessController.PossibleMatch>();
    npc.possibleMatches = new List<NewApplicantProcessController.PossibleMatch>();
    equifaxRemainigAmountDefaults = totalRemainingAmount;

    criteriaCalculator();
    getEmployees();
    getEquifaxDefaults();
    
    if(Test.isRunningTest() || Apexpages.currentPage().getURL().containsIgnoreCase('R4KOnlineFormSummaryPage') || sectionType == 'confirmation')
    {
        initSummaryPage();
        getBankStatementCategories();
    }
    
}

public PageReference resendHybridLink()
{
    List<Attachment> photoIds = new List<Attachment>();
    Account acct = new Account();
    acct.Id = acctId;
    acct.Hybrid_Link_Finish_Datetime__c = null;
    
    if(resetHybridLinkId)
    {
        acct.Is_PhotoId_Attached_After_Enquiry__c = false;
        photoIds = [select id, name, ParentId, CreatedBy.Name,LastModifiedDate,CreatedDate from Attachment where parentId =: acctId AND CreatedDate = LAST_N_DAYS:21 AND Name LIKE 'Photo Id%'];
    }
    
    if(resetHybridLinkBank)
    {
        acct.Bank_Final_Page__c = false;
        acct.BankStatement_Date__c = null;
        acct.BankStatement_Completion_Datetime__c = null;
    }
    
    if(resetHybridLinkMygov)
    {
        acct.MyGov_Final_Page__c = false;
        acct.MyGov_Date__c = null;
        acct.myGov_Completion_Datetime__c = null;
    }
    
    String shortURL = '';
    String randomNumber = SecretUtil.generateRandomNumber();
    String finalUrl = onlineURL+'/R4KHybridFormAcknowledgementPage?id='+acctId+'&n='+randomNumber;
    ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
    shortURL = sl.shortLinkGenerator(finalURL);
    String mobileNo = account.SMS_Mobile__c;
    String smsTemplate = 'Hi ' + account.FirstName + ' ' + account.LastName + ', Please click the link below to finish the application process.\n' + shortURL;
    String smsGroupType = 'R4KHybrid';
    String objectType = 'Account';
    String objectId = acctId;
    String ownerId = account.OwnerId;
        
    CommunicationUtil.sendSMS(mobileNo , smsTemplate , smsGroupType , objectType , objectId , ownerId , false, null);
    update acct;
    
    if(resetLinkId && photoIds.size() > 0)
    {
        delete photoIds;
    }
    return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
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
        //accountToUp.Hybrid_Link_Finish_Datetime__c =null;
        accountToUp.Online_Link_Sent_DateTime__c = DateTime.now();
        
        if(!resetLinkId)
        {
            System.debug('****Reset Id');
            if(account.Photo_Id_Front__c <> null && account.Photo_Id_Front__c <> '')
            {
                photoDocIds.add(account.Photo_Id_Front__c);
            }
            if(account.Photo_Id_Back__c <> null && account.Photo_Id_Back__c <> '')
            {
                photoDocIds.add(account.Photo_Id_Back__c);
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
        /*accountToUp.Basic_Info_Online__c = resetLinkBasic;
        accountToUp.Income_Online__c = resetLinkIncome;
        accountToUp.Expense_Online__c = resetLinkExpense;
        accountToUp.Referees_Online__c = resetLinkReferees;
        accountToUp.RO_Online__c = resetLinkRO;
        accountToUp.Equifax_Online__c = resetLinkEquifax;*/
        
        String shortURL = '';
        String randomNumber = SecretUtil.generateRandomNumber();
        String finalUrl = onlineURL+'/R4KOnlineFormAcknowledgementPage?id='+acctId+'&redo=yes&n='+randomNumber;
        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
        if(!Test.isRunningTest())
        {
            shortURL = sl.shortLinkGenerator(finalURL);
        }
        String mobileNo = account.SMS_Mobile__c;
        String smsTemplate = 'Hi ' + account.FirstName + ' ' + account.LastName + ', Please click the link below to finish the application process.\n' + shortURL;
        String smsGroupType = 'R4KOnline';
        String objectType = 'Account';
        String objectId = acctId;
        String ownerId = account.OwnerId;
            
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
        
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('CAMProcessController','resendOnlineLink','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference createConsentLink()
{
    try
    {
        List<CommunicationUtil.SMSWrapper> smsWrapperList = new List<CommunicationUtil.SMSWrapper>();
        CommunicationUtil.SMSWrapper smsWrap;
        String creditGuideURL = 'https://rent4keeps.secure.force.com/MOGO/R4KCreditGuide?terId='+account.Territory_Number__c;
        String shortURL = '';
        String consentURLDate, consentURL;
        String randomNumber=SecretUtil.generateRandomNumber();
        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
        //String finalUrl = 'https://r4kfullsb-rent4keeps.cs31.force.com/MOGO/R4KConsentForm?id='+account.Id+'&n='+randomNumber; //sandbox
        String finalUrl = 'https://rent4keeps.secure.force.com/MOGO/R4KConsentForm?id='+account.Id+'&n='+randomNumber; //production
        String custMobileNo = account.SMS_Mobile__c; 
        String accountId = account.id;
        String ownerId = account.OwnerId; 
        String smsTemplateForCust = 'Hi ' + Account.FirstName + ', as part of the R4K application process we will need some information from you. Please tap on the link below to start\n';
        
        System.debug('****sendMOGOBankSMS ' + sendMOGOBankSMS);
        System.debug('****sendMOGOMyGovSMS ' + sendMOGOMyGovSMS);
        System.debug('****Customer No ' + account.Customer_No__c);
        //System.debug('****bankInstitutionSearchText ' + bankInstitutionSearchText);
        
        
        Account accountToUp = new Account();
        accountToUp.Id = acctId;
        
        //BankStatement
        ////////////////////////////////////////
        if(sendMOGOBankSMS)
        {
            accountToUp.AccessID_BankStatement__c = null;
            accountToUp.BankStatement_Status__c = null;
            accountToUp.Hybrid_URL_BankStatement__c = null;
            accountToUp.SMS_for_BankStatement_Sent__c = false;
            accountToUp.Bank_Final_Page__c = false;
            accountToUp.BankStatement_Date__c = null;
            
            String bankHybridURL;
            
            if(account.Territory_Number__r.State_Master_State__c == 'NZ')
            {
                bankHybridURL = 'https://www.bankstatements.co.nz/r/b/RFNZ-' + account.Customer_No__c;
            }else{
                bankHybridURL = 'https://scv.bankstatements.com.au/iframe/RMBV-' + account.Customer_No__c;
            }
            
            String bankShortURL = sl.shortLinkGenerator(bankHybridURL);
            
            accountToUp.Hybrid_URL_BankStatement__c = bankShortURL;
            accountToUp.SMS_for_BankStatement_Sent__c = true;
            accountToUp.BankStatement_Status__c = 'CREATED';
            accountToUp.SMS_for_BankStatement_Sent__c=true;
        }
        
        
        //MyGov
        ///////////////////////////////////////////
        if(sendMOGOMyGovSMS)
        {
            accountToUp.AccessID_MyGov__c = null;
            accountToUp.MyGov_Status__c = null;
            accountToUp.Hybrid_URL_MyGov__c = null;
            accountToUp.SMS_for_MyGov_Sent__c = false;
            accountToUp.MyGov_Final_Page__c = false;            
            
            String myGovHybridURL = 'https://www.bankstatements.com.au/iframe/start/RFKC-' + account.Customer_No__c + '?withCentrelink=true&centrelinkOnly=true';
            String myGovShortURL = sl.shortLinkGenerator(myGovHybridURL);
            
            accountToUp.Hybrid_URL_MyGov__c = myGovShortURL;
            accountToUp.SMS_for_MyGov_Sent__c = true;
            accountToUp.MyGov_Status__c = 'CREATED';
        }
        
        shortURL = sl.shortLinkGenerator(finalURL);
            
        smsTemplateForCust = smsTemplateForCust + shortURL;
        
        system.debug('consentURL: '+shortURL);
            
        if(!((account.Territory_Number__r.Company_Territory__c && (account.Territory_Number__r.State_Master_State__c=='VIC' || account.Territory_Number__r.State_Master_State__c=='SA' || account.Territory_Number__r.State_Master_State__c=='NSW' || account.Territory_Number__r.State_Master_State__c=='WA' || account.Territory_Number__r.State_Master_State__c=='NZ')) || (account.Territory_Number__r.Short_Name__c=='Greensborough') || (account.Territory_Number__r.Short_Name__c=='Wide Bay')))
        {
            creditGuideURL = sl.shortLinkGenerator(creditGuideURL);    
            system.debug('creditGuideURL: '+ creditGuideURL);
            
            smsWrap = new CommunicationUtil.SMSWrapper();
            smsWrap.objectId = accountId;
            smsWrap.mobileNo = custMobileNo;  
            smsWrap.smsGroupType = 'R4KCreditGuide';                  
            smsWrap.objectType = 'Account';                  
            smsWrap.ownerId = ownerId;                  
            smsWrap.smsTemplate = 'Thank you for your recent inquiry with Rent4keeps ' + account.Territory_Number__r.Short_Name__c + '! Here is a link to our Credit Guide. ' + creditGuideURL;                 
            smsWrapperList.add(smsWrap);
        }
    
        accountToUp.Consent_URL__c = shortURL;
        accountToUp.Consent_URLSent_DateTime__c = DateTime.Now();
        accountToUp.Consent_URL_Opened_DateTime__c = null;
        accountToUp.Consent_URL_Device_Info__c = null;
        accountToUp.Consent_URL_Latitude__c = null;
        accountToUp.Consent_URL_Longitude__c = null;
        accountToUp.Consent_URL_Address__c = null;
        update accountToUp;
        
        smsWrap = new CommunicationUtil.SMSWrapper();
        smsWrap.objectId = accountId;
        smsWrap.mobileNo = custMobileNo;  
        smsWrap.smsGroupType = 'R4KConsentLink';                  
        smsWrap.objectType = 'Account';                  
        smsWrap.ownerId = ownerId;                  
        smsWrap.smsTemplate = smsTemplateForCust;                  
        smsWrapperList.add(smsWrap);
        
        CommunicationUtil.sendBulkSMS(smsWrapperList,null);
        //CommunicationUtil.sendSMS(custMobileNo,smsTemplateForCust,'R4KConsentLink','Account',accountId,ownerId,false);
        
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('CAMProcessController','createConsentLink','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference overrideDocs()
{
    String docSearchQuery = (sectionType == 'id' ? 'Photo Id%' : (sectionType == 'bank' ? 'BankStatement_%' : (sectionType == 'mygov' ? 'myGov%' : '')));
    Integer startingCounter = sectionType == 'id' ? 1 : 0;
    
    System.debug('****docSearchQuery ' + docSearchQuery);
    System.debug('****startingCounter ' + startingCounter);
    System.debug('****overrideDocs ' + overrideDocs);
    
    if(overrideDocs && docSearchQuery <> '')
    {
        List<Attachment> allUploadedDocs = [select id, name, ParentId, CreatedBy.Name,LastModifiedDate,CreatedDate from Attachment where parentId =: acctId AND CreatedDate = LAST_N_DAYS:21 AND Name LIKE: docSearchQuery ORDER BY CreatedDate DESC];
        
        if(allUploadedDocs.size() > startingCounter)
        {
            List<Attachment> deleteDocs = new List<Attachment>();
            
            for(Integer i=startingCounter; i<allUploadedDocs.size(); i++)
            {
                deleteDocs.add(allUploadedDocs[i]);
            }
            
            delete deleteDocs;
        }
        
        if(sectionType == 'bank' || sectionType == 'mygov')
        {
            List<Attachment> otherDocs = [SELECT Id,Name FROM Attachment WHERE Name LIKE 'Other File-%' ORDER BY CreatedDate DESC LIMIT 1];
            
            if(otherDocs.size() > 0)
            {
                Attachment at = new Attachment();
                at.Id = otherDocs[0].Id;
                at.Name = (sectionType == 'bank' ? 'BankStatement_R4K_' : 'myGov_') + account.FirstName + ' ' + account.LastName + '_' + todayDateString + '.' + otherDocs[0].Name.substringAfterLast('.');
                update at;
            }
        }
    }
    return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
}

public void equifaxSearch()
{
    String randomNumber = SecretUtil.generateRandomNumber();
    try
    {
        equifaxValid = false;
        npc = new NewApplicantProcessController();
        npc.successfulEnquiry = false;
        npc.account = new Account();
        npc.account.Id = acctId;
        npc.account.Customer_No__c = account.Customer_No__c; 
        npc.account.OwnerId = account.OwnerId;
        npc.account.Gender__pc = genderVal;
        npc.account.Birthdate__c = dobVal == null ? null : Date.parse(dobVal);
        npc.equifaxEnquiryAmount = equifaxEnquiryAmount;
        npc.equifaxEnquiryLastName = lastNameVal;
        npc.equifaxEnquiryFirstName = firstNameVal;
        npc.driversLicense = driversLicense;
        npc.driversLicenseVersion = driversLicenseVersion;
        npc.equifaxEnquiryPreviousAddress = null;
        npc.equifaxEnquiryStreet = equifaxEnquiryStreet;
        npc.equifaxEnquiryCity = equifaxEnquiryCity;
        npc.equifaxEnquiryState = equifaxEnquiryState;
        npc.equifaxEnquiryPostCode = equifaxEnquiryPostCode;
        npc.account.PersonMailingCountry = account.PersonMailingCountry;
        npc.account.CurrencyIsoCode = account.CurrencyIsoCode;
        npc.account.Equifax_Enquiry_Id__c = null;
        npc.account.Veda_File_Number__c = null;
        
        if(stateMasterState != 'NZ'){
            if(!Test.isrunningTest())
            {
                npc.performEquifaxSearch(account.Territory_Number__r.Name);
            }
            
            system.debug('##equifaxEnquiryId: '+npc.account.Equifax_Enquiry_Id__c+' ageOfFile: '+npc.account.Equifax_Age_of_File__c);
            equifaxEnquiryId = npc.account.Equifax_Enquiry_Id__c;
        }else{
            if(!Test.isrunningTest())
            {
                npc.sendEquifaxRequestNZ(account.Territory_Number__r.Name);
            }
        }
        
        if(npc.successfulEnquiry)
        {    
            equifaxValid = true;
        }else
        {
            equifaxValid = false;
        }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CAMProcessController','equifaxSearch',acctId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void possibleMatchSearch()
{
    npc.Account.Veda_File_Number__c = ApexPages.currentPage().getParameters().get('vedaFileNumber');
    npc.driversLicense = ApexPages.currentPage().getParameters().get('license');
    npc.Account.Gender__pc = ApexPages.currentPage().getParameters().get('gender');
    npc.Account.Birthdate__c = ApexPages.currentPage().getParameters().get('dob') == null ? null : Date.parse(ApexPages.currentPage().getParameters().get('dob'));
    npc.newEquifaxEnquiry();
}

public PageReference getEquifaxPDFNZ()
{
    try{
        System.debug('getEquifaxPDFNZ');
        if(npc.primarymatches != null && npc.primarymatches.size() > 0 && npc.primarymatches[0].enquiryId != null){
            System.debug(npc.primarymatches[0].enquiryId);
            npc.attachEquifaxPDFNZ(npc.primarymatches[0].enquiryId);
        }
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CAMProcessController','getEquifaxPDFNZ',account.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }
}

public PageReference getEquifaxPdf()
{
    try
    {
        VedaIntegration veda = new VedaIntegration(); 
        if(!Test.isrunningTest())   
        {
            veda.getVedaPDFById(equifaxEnquiryId,account.Id,account.FirstName + ' ' + account.LastName);
        }

        Account acctToUp = new Account();
        acctToUp.Id = acctId;
        acctToUp.Equifax_Online__c = true;
        acctToUp.PUA_Status__c = 'In Progress';
        update acctToUp;
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('CAMProcessController','getEquifaxPdf',account.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }
}

public void getEmployees()
{
    territoryIdsWithRecordAccess = new List<String>();   
    List<String> allterritoriesIds = new List<String>();
    List<Territory__c> allterritories = [SELECT Id, Name, Company_Territory__c FROM Territory__c WHERE (Status__c = 'Active' OR Name LIKE '9%') AND Is_Credit_Contract__c = true LIMIT 200];
    for(Territory__c territory : allterritories){
        allterritoriesIds.add(territory.Id);
    }
    List<UserRecordAccess> territoriesWithRecordAccess = [SELECT RecordId FROM UserRecordAccess WHERE UserId=:UserInfo.getUserId() AND HasReadAccess = true ANd RecordId in: allterritoriesIds LIMIT 200];
    for(UserRecordAccess territory : territoriesWithRecordAccess)
    {
        territoryIdsWithRecordAccess.add(territory.RecordId);
    }
    System.debug(territoryIdsWithRecordAccess);
    
    employeeMap = new Map<String,Employee__c>();
    existingRepSelectedId = Account.Rep_Responsible_For_Converting_Lead__c == null ? null : String.valueOf(Account.Rep_Responsible_For_Converting_Lead__c).substring(0,15);
    List<Employee__c> employeeList = [SELECT Id,Name,Not_Eligible_for_Auto_Approval__c FROM Employee__c WHERE Status__c = 'Active' AND Territory__c in: territoryIdsWithRecordAccess ORDER BY Name ASC];
    repList = new List<SelectOption>();
    repList.add(new SelectOption('', '--None--'));
    
    for(Integer i=0; i<employeeList.size(); i++)
    {
        repList.add(new SelectOption(String.valueOf(employeeList[i].Id).substring(0,15), employeeList[i].Name.replaceAll('\'','')));
        
        if(existingRepSelectedId <> null && String.valueOf(employeeList[i].Id).substring(0,15) == existingRepSelectedId)
        {
            existingRepSelectedName = employeeList[i].Name.replaceAll('\'','');
        }
        
        if(approvalOpp != null && approvalOpp.Rep_name__c != null){
            if(approvalOpp.Rep_name__c <> null && String.valueOf(employeeList[i].Id).substring(0,15) == String.valueOf(approvalOpp.Rep_name__c).substring(0,15))
            {
                repEmployee = employeeList[i];
            }
        }
        employeeMap.put(employeeList[i].Id,employeeList[i]);
    }
}

//////////////////////////////////////////////Equifax Defaults
public void getEquifaxDefaults()
{
    Date startDate=Date.today().addDays(-365);
    Date endDate=Date.today();
    equifaxDefaults = new List<Equifax_Defaults__c>();
    equifaxRentalDefaults = new List<Equifax_Defaults__c>();
    equifaxNonRentalDefaults = new List<Equifax_Defaults__c>();
    
    equifaxDefaults=[select id,name,Company_Type__c,Company_Name__c,Unpaid_Default_Date__c,Amount__c,Status__c,Default_Notes__c,Match__c from Equifax_Defaults__c where Applicant__c=:account.Id order by Unpaid_Default_Date__c desc];
    
    otherEquifaxDefaults=[select id,name,Company_Type__c,Company_Name__c,Unpaid_Default_Date__c,Amount__c,Status__c,Default_Notes__c,Match__c from Equifax_Defaults__c where Applicant__c=:account.Id and Company_Type__c = 'Non-Rental' and Unpaid_Default_Date__c<=:startDate];
    
    system.debug('startDate: '+startDate+' endDate: '+endDate+' equifaxDefaults: '+equifaxDefaults.size());
    equifaxRentalCount=0;
    equifaxNonRentalCount=0;
    if(equifaxDefaults.size()>0)
    {
        //Remove all Non-Rental after 12 months
        Integer j = 0;
        while (j < equifaxDefaults.size())
        {
          if((equifaxDefaults.get(j).Company_Type__c=='Non-Rental' && equifaxDefaults.get(j).Unpaid_Default_Date__c<startDate) || !equifaxDefaults.get(j).Match__c)
          {
            equifaxDefaults.remove(j);
          }else
          {
            j++;
          }
        }
        ///////////////////////////////////////
         
        //Get Rental and Non-Rental count
        for(Equifax_Defaults__c eq : equifaxDefaults)
        {
            if(eq.Company_Type__c=='Rental')
            {
                equifaxRentalCount++;
                equifaxRentalDefaults.add(eq);
            }else if(eq.Company_Type__c=='Non-Rental')
            {
                equifaxNonRentalCount++; 
                equifaxNonRentalDefaults.add(eq);
            }
        }
        ///////////////////////////////////
    }
}

public void editDefault()
{
    selectedDefaultCompanyName = null;
    selectedDefaultCompanyType = null;
    selectedDefaultDate = null;
    selectedDefaultStatus = null;
    selectedDefaultAmount = null;
    selectedDefaultNotes = null; 
    
    String selectedDefaultId = Apexpages.currentPage().getParameters().get('selectedDefaultId');
    
    List<Equifax_Defaults__c> editDefaults = equifaxDefaults = [select id,name,Company_Type__c,Company_Name__c,Unpaid_Default_Date__c,
                                            Amount__c,Status__c,Default_Notes__c,Match__c from Equifax_Defaults__c where id=:selectedDefaultId];
    
    if(editDefaults.size()>0)
    {
        editDefault = editDefaults[0];  
        selectedDefaultCompanyName = editDefault.Company_Name__c;
        selectedDefaultCompanyType = editDefault.Company_Type__c;
        selectedDefaultDate = editDefault.Unpaid_Default_Date__c.format();
        selectedDefaultStatus = editDefault.Status__c;
        selectedDefaultAmount = editDefault.Amount__c;
        selectedDefaultNotes = editDefault.Default_Notes__c;   
    }

    //return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
}

public PageReference saveEditedDefault()
{
    Equifax_Defaults__c ed = new Equifax_Defaults__c();    
    ed.Company_Name__c = selectedDefaultCompanyName;
    ed.Company_Type__c = selectedDefaultCompanyType;
    ed.Unpaid_Default_Date__c = selectedDefaultDate == null ? null : Date.parse(selectedDefaultDate);
    ed.Status__c = selectedDefaultStatus;
    ed.Amount__c = selectedDefaultAmount;
    ed.Default_Notes__c = selectedDefaultNotes;
    ed.Applicant__c = acctId;
    ed.Match__c = true;
    
    if(editDefault <> null)
    {
        ed.Id = editDefault.Id;
        update ed;
    }else
    {
        insert ed;
    }
    return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
}

public PageReference deleteEditedDefault()
{
    delete editDefault ;
    return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
}

public void editProduct()
{
    String selectedProductId = Apexpages.currentPage().getParameters().get('selectedProductId');
    
    List<OpportunityLineItem> editProducts  = [select id,name,Description,Model_Number__c,IMIE_Number__c,Serial_Number__c,ServiceDate,Invoice_Number__c,
                                            Cost_of_Goods__c,RRP__c,Recommended_TAV__c,Weighted_AAF__c from OpportunityLineItem where id=:selectedProductId];
    
    if(editProducts.size()>0)
    {
        editProduct = editProducts[0];  
        prodDescription = editProduct.Description;
        prodmodelNo = editProduct.Model_Number__c;
        prodimeiNo = editProduct.IMIE_Number__c;
        prodserialNo = editProduct.Serial_Number__c;
        prodinvoiceDate = editProduct.ServiceDate;
        prodinvoiceNumber = editProduct.Invoice_Number__c;   
    }
}

public PageReference saveEditedProduct()
{
    OpportunityLineItem ol = new OpportunityLineItem(); 
    ol.Id = editProduct.Id;   
    ol.Description = prodDescription;
    /*ol.UnitPrice = tav;
    ol.Cost_of_Goods__c = invoiceAmt;
    ol.RRP__c = rrp;
    ol.Delivery_Installation_Cost__c = deliveryCost;
    ol.Weighted_AAF__c = aafAmt;
    ol.Accessory_Cost__c = accessoryCost;
    ol.Insurance_Cost__c = insuranceCost;
    ol.Recommended_TAV__c = minTAV;*/
    ol.Model_Number__c = prodmodelNo;
    ol.IMIE_Number__c = prodimeiNo;
    ol.Serial_Number__c = prodserialNo;
    ol.ServiceDate = prodinvoiceDate;
    ol.Invoice_Number__c = prodinvoiceNumber;
    update ol;
    
    return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
}

public String sortDir {
get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;  }
set;
}
public String sortFieldForProducts{
get  { if (sortFieldForProducts == null) {sortFieldForProducts = 'Name'; } return sortFieldForProducts;  }
set;
}

public void runQueryForProducts() {
    try 
    {
        showProductTable=true;
        showProductTableSelected=false;
        CM_products = Database.query(soqlForProducts + ' order by ' + sortFieldForProducts + ' ' + sortDir + ' limit 20');
        if(products.size()>0)
        {
            showContactTable=true;
        }else
        {
            showContactTable=false;
        }
    }catch (Exception e) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops!'));
    }
}

public void runSearchForProducts() 
{
    String prodCategory = '%'+Apexpages.currentPage().getParameters().get('prodCategory');
    soqlForProducts = 'select id,Name,ProductCode,Criteria_Type__c from Product2 where isactive=true and Criteria_Type__c<>null AND Family <> \'CMI Accessories\' AND Family <> \'Optional Product\'';
    System.debug('prodCategory: '+prodCategory+' soqlForProducts: '+soqlForProducts);
    if(!prodCategory.trim().equals('%'))
    {
        soqlForProducts += ' and Name LIKE \''+String.escapeSingleQuotes(prodCategory)+'%\'';
        runQueryForProducts();
    }else
    {
        CM_Products = new List<Product2>();
        showProductTable=false;
    }
}

// runs the search with parameters passed via Javascript
public void runSearch() 
{
    String firstName = Apexpages.currentPage().getParameters().get('firstname');
        
    String refAppSoql = 'select id,Applicant__r.Id,Applicant__r.Name,Suburb__c,Territory_Name__c from Global_Search__c where Applicant__r.Id != null';
    
    system.debug('firstName: '+firstName+' soql: '+refAppSoql);
    
    if (!firstName.equals(''))
    {
        refAppSoql += ' and Applicant__r.Name LIKE \''+String.escapeSingleQuotes(firstName)+'%\'';
    }
    showTable=true;
    showTableSelected=false;
    gSearch = Database.query(refAppSoql + ' order by Applicant__r.Name ASC limit 10');
    showTable = (gSearch.size()>0 ? true : false);
}

public void hideSearchList()
{
    showTable=false;
    showTableSelected=true;
}

public void hideSearchListForProducts()
{
    showProductTable=false;
    showProductTableSelected=true;
}

public void checkCriteria()
{
    criteriaCalculator();
    update account;
}

public void checkCriteriaAndSubmitCreditMatrix()
{   
    checkCriteria();
    
    //Attach the Credit Matrix in Opportunity
    Datetime todaysDate = Datetime.now();
    String dateOutput = todaysDate.format('ddMMMyyyy');
    
    if(account.AgreementId_for_Current_Enquiry__c!=null)
    {    
        List<Opportunity> approvalOppList = [select id,AccountId,Account.Product_Category_Selected__c,Account.Product_Name_for_Agreement__c,Account.Product_COGS_for_Agreement__c,
                                            Account.Product_Term_for_Agreement__c,Account.Rent4Keeps_Payment_C__c,Account.CM_Scheduled_Amount__c,CM_Scheduled_Amount_Comments__c,
                                            Account.Name,Account.Customer_No__c,Name,Contract_No__c,Credit_Guideline__c,Credit_Guideline__r.Name,Account.Territory_Number__r.State_Master_State__c,
                                            Account.Territory_Number__c,Account.Territory_Number__r.Company_Territory__c,Account.Territory_Number__r.Short_Name__c,Approval_Status__c, 
                                            Account.Rep_Responsible_For_Converting_Lead__r.Name,Account.Rep_Responsible_For_Converting_Lead__c,Rep_Name__r.Name,Rep_Name__c,Account.Product_RRP_for_Agreement__c,
                                            Rep_Name__r.Not_Eligible_for_Auto_Approval__c,CM_Reason_to_go_forward__c,Answers_To_Credit_Officer_Comments__c,CM_Dishonours__c,CM_Payment_Frequency__c,
                                            CM_Gambling__c,CM_Collection_And_Consolidation__c,CM_Overdrawn__c,CM_Jobseeker__c,CM_Debt_vs_Income_Ratio_Greater_Than_50__c,Resubmit__c,Account.Product_Delivery_Fee_For_Agreement__c,
                                            CM_OutstandingDefRental_Comp_Comments__c,CM_OutstandingDefNonRental_Comp_Comments__c,CM_Equifax_Score_Comments__c,CM_Bankruptcy_Part_9_Agreements_Comments__c,
                                            CM_Missed_from_last_6_FN_pymts_Comments__c,AF_CA_Final_Comments__c,AF_CA_Credit_Officer_Name__c,Credit_Guideline__r.Line_Manager_Full_Name__c,Payment_Frequency__c                                            
                                            from Opportunity where id = :account.AgreementId_for_Current_Enquiry__c LIMIT 1];
        if(approvalOppList.size() > 0){ 
            approvalOpp = approvalOppList[0];
            lineManagerName = 'RAM';
            attachCreditMatrixPDF(approvalOpp.Id, 'RAM', approvalStatus);
        }  
    }
    
    showApprovalScreen = true;
    List<EmployeeAssignment__c> employeeAssignments = [SELECT Id,Employees__c,Territories__c,Employees__r.Name,Employees__r.Mobile__c,Employees__r.Status__c FROM EmployeeAssignment__c WHERE Status__c = 'Active' AND Territories__c =: account.Territory_Number__c];

    this.repNames = new SelectOption[]{};
    this.repNames.add(new SelectOption('','--Select--'));
    
    for(EmployeeAssignment__c ea: employeeAssignments) 
    {
        if(ea.Employees__c != null && ea.Employees__r.Status__c == 'Active')
        {
            this.repNames.add(new SelectOption(ea.Employees__c,ea.Employees__r.Name));
            
            if(existingRepSelectedId <> null && String.valueOf(ea.Employees__c).substring(0,15) == existingRepSelectedId)
            {
                repName = existingRepSelectedId;
            }
        }
    }
    
    showAnswersToCreditOfficerComments = false; //hide the showAnswersToCreditOfficerComments initially
    String currentEnquiryId = Account.AgreementId_for_Current_Enquiry__c; //get the current Enquiry Id
    if(currentEnquiryId  != null)
    {    
        //query the opportunity using current enquiry Id
        Opportunity[] oppList = [SELECT Name,Id,Approval_Status__c,Answers_To_Credit_Officer_Comments__c FROM Opportunity WHERE Id =: currentEnquiryId];
        System.debug(oppList.size());
        System.debug(oppList[0].Id);
        System.debug(oppList[0].Approval_Status__c);
        currentApprovalStatus = oppList[0].Approval_Status__c;
        //check for empty list        
        if(oppList.size() > 0){
            //check the approval status
            if(oppList[0].Approval_Status__c != null && oppList[0].Approval_Status__c.equals('Re-Submit')){
                    //set boolean to true
                    showAnswersToCreditOfficerComments = true;
                    System.debug(showAnswersToCreditOfficerComments);
            } 
        }      
    } 

    expenseDetailsMissing = (Account.Rent_Mortgage_Board_Details__c == null || Account.Rent_Mortgage_Board_Details__c.trim() == '' || Account.Rent_Mortgage_Board_Details__c.trim() == 'None' || Account.Loan_Payment_Details__c == null || Account.Loan_Payment_Details__c.trim() == '' || Account.Loan_Payment_Details__c.trim() == 'None' || Account.Credit_Card_Details__c == null || Account.Credit_Card_Details__c.trim() == '' || Account.Credit_Card_Details__c.trim() == 'None' || Account.Insurance_Details__c == null || Account.Insurance_Details__c.trim() == '' || Account.Insurance_Details__c.trim() == 'None' || Account.Food_Details__c == null || Account.Food_Details__c.trim() == '' || Account.Food_Details__c.trim() == 'None' || Account.Utilities_Details__c == null || Account.Utilities_Details__c.trim() == '' || Account.Utilities_Details__c.trim() == 'None' || Account.Car_Lease_Loan_Payment_Details__c == null || Account.Car_Lease_Loan_Payment_Details__c.trim() == '' || Account.Car_Lease_Loan_Payment_Details__c.trim() == 'None' || Account.Mobile_Expenses_Details__c == null || Account.Mobile_Expenses_Details__c.trim() == '' || Account.Mobile_Expenses_Details__c.trim() == 'None' || Account.Clothing_Details__c == null || Account.Clothing_Details__c.trim() == '' || Account.Clothing_Details__c.trim() == 'None' || Account.Tobacco_Alcohol_Details__c == null || Account.Tobacco_Alcohol_Details__c.trim() == '' || Account.Tobacco_Alcohol_Details__c.trim() == 'None' || Account.Other_Details__c == null || Account.Other_Details__c.trim() == '' || Account.Other_Details__c.trim() == 'None') ? true : false;
    maritalStatusMissing = (Account.Marital_Status__pc == null || Account.Marital_Status__pc.trim() == '') ? true : false;
    employerNameMissing = (Account.Employment_Income__c <> null && Account.Employment_Income__c != 0 && (Account.Employer_Name__c == null || Account.Employer_Name__c.trim() == '')) ? true : false;
    employmentDateMissing = (Account.Employment_Income__c <> null && Account.Employment_Income__c != 0 && employmentStartDate == null) ? true : false;
    serviceabilityCommentsMissing = (Account.Serviceability_Comments__c == null || Account.Serviceability_Comments__c.trim() == '') ? true : false;
    incomeVerificationMissing = (Account.Income_Verification_Type__c == null || Account.Income_Verification_Type__c.trim() == '') ? true : false;
    expenseVerificationMissing = (Account.Expense_Verification_Type__c == null || Account.Expense_Verification_Type__c.trim() == '') ? true : false;
    addressVerificationMissing = (Account.Address_Verification_Type__c == null || Account.Address_Verification_Type__c.trim() == '') ? true : false;
    lengthOfStayMissing = (account.Length_of_Stay_in_Current_Address__c == null) ? true : false;
    roMissing = ((Account.Why_consumer_lease__c == null || Account.Why_consumer_lease__c.trim() == '' || Account.Benefit_of_Consumer_Lease_with_R4K__c == null || Account.Benefit_of_Consumer_Lease_with_R4K__c.trim() == '' || Account.Benefit_of_Consumer_Lease_with_R4K__c == '--None--' || Account.Product_Interested_In__c == null || Account.Product_Interested_In__c.trim() == '' || Account.Product_Interested_In__c == '--None--' || Account.Product_Description__c == null || Account.Product_Description__c.trim() == '' || Account.Product_Description__c == 'None' || Account.Product_Description__c == '--None--' || Account.Loan_Purpose__c == null || Account.Loan_Purpose__c.trim() == '' || Account.Requirements_and_Objectives__c == null || Account.Requirements_and_Objectives__c.trim() == '' || Account.Requirements_and_Objectives__c.trim() == 'None' || (Account.Benefit_of_Consumer_Lease_with_R4K__c == 'Other' && (Account.Specify_Other_Benefits_of_Consumer_Lease__c == null || Account.Specify_Other_Benefits_of_Consumer_Lease__c.trim() == '')) || (Account.Product_Interested_In__c == 'Phones' && (Account.Why_not_phone_plan__c == null || Account.Why_not_phone_plan__c.trim() == ''))) ? true : false);
    /////////////////////////////////////////
    //return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
}

public void criteriaCalculator()
{    
    //showCriteria=true;
    totalIncome=0;
    totalExpense=0;

    creditMaxTermPassed  = true;
    
    //Get Scheduled Amount for COGS for different term
    if(account.Product_COGS_for_Agreement__c!=null)
    {
        Decimal rrp = 0;
        if(account.Product_RRP_for_Agreement__c!=null && account.Product_RRP_for_Agreement__c>0)
            rrp = account.Product_RRP_for_Agreement__c;
        else
            rrp = account.Product_COGS_for_Agreement__c;
        Decimal cost = account.Product_COGS_for_Agreement__c;
        Boolean isMobile= account.Product_Category_Selected__c!=null && account.Product_Category_Selected__c.contains('Phones') ? true : false;
        
        Decimal tav = 0;
        Decimal rrpTAVFactorOtherLow = 2.99;
        Decimal rrpTAVFactorOtherHigh = 3.45;
        Decimal rrpTAVFactorMobile = 3.45;
        Decimal capOnCogsFactor = 3.5;
        Decimal rrpCalculatedTAVOtherLow=0;
        Decimal rrpCalculatedTAVOtherHigh=0;
        Decimal rrpCalculatedTAVMobile=0;
        
        Decimal newAAF = (0.2 * cost) > 500 ? 500 : (0.2 * cost);
        
        system.debug('rrp: '+rrp+' cost: '+cost);
        rrpCalculatedTAVOtherLow = Math.ceil((rrp * rrpTAVFactorOtherLow) + newAAF);
        rrpCalculatedTAVOtherHigh = Math.ceil((rrp * rrpTAVFactorOtherHigh) + newAAF); 
        rrpCalculatedTAVMobile = Math.ceil((rrp * rrpTAVFactorMobile) + newAAF);  
        //capOnCogsCalculatedTAV = Math.ceil(3.5 * rrp);
        
        if(isMobile)
            rrpCalculatedTAVOtherLow = rrpCalculatedTAVMobile;
    
        Decimal tav6Months,tav9Months,tav12Months,tav18Months,tav24Months,tav30Months,tav36Months;
        Decimal minTAV6Months,minTAV9Months,minTAV12Months,minTAV18Months,minTAV24Months,minTAV30Months,minTAV36Months;
    
        tav6Months=((cost+99) *0.1615*13).setScale(2);
        //minTAV6Months = Math.min(tav6Months, rrpCalculatedTAVOtherLow);
        minTAV6Months = rrpCalculatedTAVOtherLow;
        for6months=(minTAV6Months/13).setScale(2);
            
        tav9Months=((cost+99)*0.12*20).setScale(2);
        //minTAV9Months = Math.min(tav9Months, rrpCalculatedTAVOtherLow);
        minTAV9Months = rrpCalculatedTAVOtherLow;
        for9months=(minTAV9Months/20).setScale(2);
            
        tav12Months=((cost+99)*0.1038*26).setScale(2);
        //minTAV12Months = Math.min(tav12Months, rrpCalculatedTAVOtherLow);
        minTAV12Months = rrpCalculatedTAVOtherLow;
        for12months=(minTAV12Months/26).setScale(2);

        tav18Months=((cost+99)*0.0949*39).setScale(2);
        //minTAV18Months = Math.min(tav18Months, rrpCalculatedTAVOtherLow);
        minTAV18Months = rrpCalculatedTAVOtherLow;
        for18months=(minTAV18Months/39).setScale(2);
        system.debug('minTAV18Months: '+minTAV18Months+' rrpCalculatedTAVOtherLow: '+rrpCalculatedTAVOtherLow+' tav18Months: '+tav18Months+' rentfor18months: '+for18months);
    
        tav24Months=((cost+99)*0.0865*52).setScale(2);
        //minTAV24Months = Math.min(tav24Months, rrpCalculatedTAVOtherHigh);
        minTAV24Months = rrpCalculatedTAVOtherHigh;
        for24months=(minTAV24Months/52).setScale(2);
    
        tav30Months=((cost+99)*0.0692*65).setScale(2);
        //minTAV30Months = Math.min(tav30Months, rrpCalculatedTAVOtherHigh);
        minTAV30Months = rrpCalculatedTAVOtherHigh;
        for30months=(minTAV30Months/65).setScale(2);
    
        tav36Months=((cost+99)*0.0577*78).setScale(2);
        //minTAV36Months = Math.min(tav36Months, rrpCalculatedTAVOtherHigh);
        minTAV36Months = rrpCalculatedTAVOtherHigh;
        for36months=(minTAV36Months/78).setScale(2);
    }
    //////////////////////////////////////////////////
    
    if(account.Rent_Mortgage_Board__c==null)
        account.Rent_Mortgage_Board__c=0;
    if(account.Food__c==null)
        account.Food__c=0;
    if(account.Clothing__c==null)
        account.Clothing__c=0;
    if(account.OtherOutgoings__c==null)
        account.OtherOutgoings__c=0;
    if(account.Loan_Payments__c==null)
        account.Loan_Payments__c=0;
    if(account.Car_Lease_Loan_Payment__c==null)
        account.Car_Lease_Loan_Payment__c=0;
    if(account.Credit_Card__c==null)
        account.Credit_Card__c=0;
    if(account.Insurance__c==null)
        account.Insurance__c=0;
    if(account.Utilities__c==null)
        account.Utilities__c=0;
    if(account.Centrepay_Outgoings__c==null)
        account.Centrepay_Outgoings__c=0;
    if(account.Tobacco_Alcohol__c==null)
        account.Tobacco_Alcohol__c=0;
    if(account.Mobile_Expenses__c==null)
        account.Mobile_Expenses__c=0;
    //if(account.Entertaiment__c==null)
        //account.Entertaiment__c=0;
    if(account.Other_Rental_Companies__c==null)
        account.Other_Rental_Companies__c=0;
    /*if(account.Other_Rental_2__c==null)
        account.Other_Rental_2__c=0;*/
    if(account.Rent4Keeps_Payment_C__c==null)
    {
        account.Rent4Keeps_Payment_C__c=0;
        if(account.Product_COGS_for_Agreement__c!=null)
            account.Rent4Keeps_Payment_C__c=for6months;
    }

    if(account.Employment_Income__c==null)
        account.Employment_Income__c=0;
    if(account.Centrelink_Benefit_Amount__c==null)
        account.Centrelink_Benefit_Amount__c=0;
    if(account.Centrelink_Benefit2_Amount__c==null)
        account.Centrelink_Benefit2_Amount__c=0;
    if(account.Centrelink_Benefit3_Amount__c==null)
        account.Centrelink_Benefit3_Amount__c=0;
    if(account.Other_Centrelink_Benefit_Amount__c==null)
        account.Other_Centrelink_Benefit_Amount__c=0;
    if(account.Other_Income_Amount__c==null)
        account.Other_Income_Amount__c=0;
    Decimal existingPayment = Account.Existing_R4K_Payment__c;
    if(existingPayment==null)
        existingPayment = 0;
    
    totalIncome=account.Employment_Income__c+account.Centrelink_Benefit_Amount__c+account.Centrelink_Benefit2_Amount__c+account.Centrelink_Benefit3_Amount__c+account.Other_Centrelink_Benefit_Amount__c+account.Other_Income_Amount__c;
    account.Highlevel_Income__c=totalIncome;
    
    totalExpense=account.Rent_Mortgage_Board__c+account.Food__c+account.Clothing__c+account.OtherOutgoings__c+account.Loan_Payments__c+account.Car_Lease_Loan_Payment__c+account.Credit_Card__c+account.Insurance__c
    +account.Utilities__c+account.Centrepay_Outgoings__c+account.Tobacco_Alcohol__c+account.Mobile_Expenses__c+account.Other_Rental_Companies__c
    +account.Rent4Keeps_Payment_C__c+existingPayment;
    account.Comfortable_Spending__c=totalExpense;
    
    if(totalIncome>0)
        account.Serviceability__c=((totalIncome-totalExpense)*100/totalIncome).setScale(2);
    else
        account.Serviceability__c=0;
 
    checkRisk();
}

public void checkCriteriaAndCreateAgreement()
{
    Decimal cost=0;
    String term='';
    Decimal rent=0;
    Decimal rrp = 0;
    Decimal deliveryFee = 0;
    Boolean isMobile= account.Product_Category_Selected__c!=null && account.Product_Category_Selected__c.contains('Phones') ? true : false;
    if(account.Product_COGS_for_Agreement__c!=null)
        cost=account.Product_COGS_for_Agreement__c;
    if(account.Product_RRP_for_Agreement__c!=null)
        rrp=account.Product_RRP_for_Agreement__c;
    if(account.Product_Term_for_Agreement__c!=null && account.Product_Term_for_Agreement__c!='')
        term=account.Product_Term_for_Agreement__c;
    if(account.Product_Delivery_Fee_For_Agreement__c!=null)
        deliveryFee=account.Product_Delivery_Fee_For_Agreement__c;

    Decimal tav = 0;
    Decimal rrpTAVFactor = 2.99;
    Decimal rrpCalculatedTAV=0;
    
    if(term=='24' || term=='30' || term=='36')
    {
        rrpTAVFactor = 3.45;
    }
    else if(isMobile && (term=='6' || term=='9' || term=='12' || term=='18'))
    {
        rrpTAVFactor = 3.45;
    }
    if(rrp==0)
    {
        rrp = cost;
    }
    
    Decimal newAAF = (0.2 * cost) > 500 ? 500 : (0.2 * cost);
    rrpCalculatedTAV = Math.ceil((rrp * rrpTAVFactor) + newAAF);
    Decimal minTAV = 0;
    
    if(Account.Territory_Number__r.State_Master_State__c == 'NZ')
    {
        rrpTAVFactor = 1.560683;
        Decimal nzCOGS = 0;
        if(term=='24'){
            newAAF = 90 + (2.1 * 52 * 2) + 15;
            nzCOGS = rrp + newAAF;
            //rrpCalculatedTAV = (nzCOGS * rrpTAVFactor).setScale(2);
            //rent = (rrpCalculatedTAV/52).setScale(2);
        }else if(term=='36'){
            rrpTAVFactor = 1.882015;
            newAAF = 90 + (2.1 * 52 * 3) + 15;
            nzCOGS = rrp + newAAF;
            //rrpCalculatedTAV = (nzCOGS * rrpTAVFactor).setScale(2);
            //rent = (rrpCalculatedTAV/78).setScale(2);
        }
        String rentalResult = Util.getRentalCalculation('NZ', nzCOGS, 0, term, CM_PaymentFrequency);
        System.debug('rentalResult : ' + rentalResult);
        Map<String, String> rentalResultMap = (Map<String, String>)JSON.deserialize(rentalResult, Map<String, String>.class);
        rrpCalculatedTAV = Decimal.valueOf(rentalResultMap.get('tav'));
        rent = Decimal.valueOf(rentalResultMap.get('rent'));
    }else
    {
        rrpTAVFactor = 3.95;
        if(term != null && term != ''){
            Decimal apr_CashPrice = deliveryFee + cost;
            Integer term_numeric = Integer.valueOf(term);                
            String feesResult = Util.getFees(apr_CashPrice,term_numeric);
            System.debug('feesResult : ' + feesResult);
            Map<String, String> feesResultMap = (Map<String, String>)JSON.deserialize(feesResult, Map<String, String>.class);
            Decimal aprFees = Decimal.valueOf(feesResultMap.get('totalFees'));
            String rentalResult = Util.getRentalCalculation('AU', apr_CashPrice, aprFees, term, CM_PaymentFrequency);
            System.debug('rentalResult : ' + rentalResult);
            Map<String, String> rentalResultMap = (Map<String, String>)JSON.deserialize(rentalResult, Map<String, String>.class);
            rrpCalculatedTAV = Decimal.valueOf(rentalResultMap.get('tav'));
            rent = Decimal.valueOf(rentalResultMap.get('rent'));
        }
    }
    system.debug('term: '+term+' rrp: '+rrp+' tav: '+tav+' rrpCalculatedTAV: '+rrpCalculatedTAV+' minTAV: '+minTAV);
    //account.Rent4Keeps_Payment_C__c=Math.ceil(rent);
    account.Rent4Keeps_Payment_C__c = (CM_PaymentFrequency == 'Weekly' ? (2 * rent).setScale(2) : (rent).setScale(2));
    oldCost = cost;
    oldTerm = term; 
    account.CM_Payment_Frequency__c = CM_PaymentFrequency;
    
    system.debug('prodCategory: '+account.CM_Product_Category__c+' account.AgreementId_for_Current_Enquiry__c: '+account.AgreementId_for_Current_Enquiry__c+' cogs: '+cost+' fnRent: '+rent+' term: '+term);
    
    if(account.AgreementId_for_Current_Enquiry__c==null || account.AgreementId_for_Current_Enquiry__c=='')
    {
        Opportunity opportunity = new Opportunity();
        opportunity.Name = account.FirstName + ' ' + account.LastName +' - '+account.Product_Name_for_Agreement__c;
        opportunity.AccountId = account.Id;
        opportunity.StageName = 'Goods Delivered';
        opportunity.Start_Date__c = Date.today();
        opportunity.CloseDate = Date.today();
        opportunity.Term_Months__c = account.Product_Term_for_Agreement__c;
        opportunity.Payment_Frequency__c = 'Fortnightly';
        opportunity.Is_Active__c = true;
        opportunity.Gift_To__c='TBC';
        opportunity.Hybrid_Application__c = isHybridApplication;

        String requirement='';
        String objectives='';
        String whyConsumerLease = '';
        String whyNotPhonePlan = '';
        String benefitsOfConsumerLease = '';
        String otherBenefitsOfConsumerLease = '';
        String productInterested = '';
        String promotionMedium='';
        if(account.Product_Name_for_Agreement__c!=null)
            requirement=account.Product_Name_for_Agreement__c;
        if(account.Product_Description__c!=null)
        {
            if(account.Product_Name_for_Agreement__c!=null)
                objectives=' and '+account.Product_Description__c;
            else
                objectives=account.Product_Description__c;
        }
        if(account.Why_consumer_lease__c != null){
            whyConsumerLease = account.Why_consumer_lease__c;
        }
        if(account.Benefit_of_Consumer_Lease_with_R4K__c != null){
            benefitsOfConsumerLease = account.Benefit_of_Consumer_Lease_with_R4K__c;
        }
        if(account.Specify_Other_Benefits_of_Consumer_Lease__c != null){
            otherBenefitsOfConsumerLease = account.Specify_Other_Benefits_of_Consumer_Lease__c;
        }
        if(account.Product_Interested_In__c !=null){
            productInterested=account.Product_Interested_In__c;
        }
        if(account.Why_not_phone_plan__c != null && account.Product_Interested_In__c == 'Phones'){
            whyNotPhonePlan = account.Why_not_phone_plan__c;
        }
        if(account.Big_Sale_Media__c != null && account.Big_Sale_Media__c != '--None--'){
            promotionMedium = account.Big_Sale_Media__c;
        }
        opportunity.Requirements_Objectives__c=requirement+objectives;
        opportunity.Why_consumer_lease__c = whyConsumerLease;
        opportunity.Requirements_and_Objectives__c = account.Requirements_and_Objectives__c;
        opportunity.Loan_Purpose__c = account.Loan_Purpose__c;
        opportunity.Benefit_of_Consumer_Lease_with_R4K__c = benefitsOfConsumerLease;
        opportunity.Specify_Other_Benefits_of_Consumer_Lease__c = otherBenefitsOfConsumerLease;
        opportunity.Why_not_phone_plan__c = whyNotPhonePlan;
        opportunity.Product_Interested_In__c = productInterested;
        opportunity.Product_Description__c=account.Product_Description__c;
        opportunity.Credit_Guideline__c = account.Credit_Guideline__c;
        opportunity.CM_Referees_Contacted_Comments__c = CM_RefereesContactedComments;
        opportunity.CM_No_of_Referees_Being_Family_Comments__c = CM_NoOfRefereesBeingFamilyComments;
        opportunity.CM_No_of_Refs_Family_Shared_Comments__c = CM_NoOfRefereesBeingFamilySharedComments;
        opportunity.CM_Maximum_Break_Even_Shortfall_Comments__c = CM_MaximumBreakEvenShortFallComments;
        opportunity.CM_Maximum_Remaining_Amount_Comments__c = CM_MaximumRemainingAmountComments;
        opportunity.CM_Maximum_TAV_Comments__c = CM_MaximumTAVComments;
        opportunity.CM_No_of_Active_Agreements_Comments__c = CM_NoOfActiveAgreementsComments;
        opportunity.CM_No_of_Mobile_Agreements_Comments__c = CM_NoOfMobileAgreementsComments;
        opportunity.CM_Part_9_Agreements_Comments__c = CM_Part9AgreementsComments;
        opportunity.CM_Term_Comments__c = CM_TermComments;
        opportunity.CM_Rem_Amount_Rental_Default_Comments__c = CM_RemAmountRentalDefaultComments;
        
        opportunity.Is_Credit_Contract__c = true;
        opportunity.RecordTypeId = Util.getRecordTypeInfosByDeveloperName('Opportunity').get('Credit_Contract').Id;
        opportunity.CM_Payment_Frequency__c = account.CM_Payment_Frequency__c;
        opportunity.CM_Scheduled_Amount_Comments__c = account.CM_Scheduled_Amount_Comments__c;
        opportunity.CM_Dishonours__c = account.CM_Dishonours__c;
        opportunity.CM_Gambling__c = account.CM_Gambling__c;
        opportunity.CM_Collection_And_Consolidation__c = account.CM_Collection_And_Consolidation__c;
        opportunity.CM_Overdrawn__c = account.CM_Overdrawn__c;
        opportunity.CM_Jobseeker__c = account.CM_Jobseeker__c;
        opportunity.CM_Debt_vs_Income_Ratio_Greater_Than_50__c = account.CM_Debt_vs_Income_Ratio_Greater_Than_50__c;
        opportunity.CM_OutstandingDefRental_Comp_Comments__c = account.CM_OutstandingDefRental_Comp_Comments__c;
        opportunity.CM_OutstandingDefNonRental_Comp_Comments__c = account.CM_OutstandingDefNonRental_Comp_Comments__c;
        opportunity.CM_Equifax_Score_Comments__c = account.CM_Equifax_Score_Comments__c;
        opportunity.CM_Bankruptcy_Part_9_Agreements_Comments__c = account.CM_Bankruptcy_Part_9_Agreements_Comments__c;
        opportunity.CM_Missed_from_last_6_FN_pymts_Comments__c = account.CM_Missed_from_last_6_FN_pymts_Comments__c;
        opportunity.CM_Serviceablilty_Comments__c = account.CM_Serviceablilty_Comments__c;

        List<BankStatement_Transaction__c> bankTransList = [SELECT Id,BankStatement_Generic_Category__r.Name,Transaction_Date__c 
                                                            FROM BankStatement_Transaction__c 
                                                            WHERE (BankStatement_Generic_Category__r.Name = 'Centrelink' OR BankStatement_Generic_Category__r.Name = 'Wages') AND 
                                                            BankStatement_Generic_Category__r.BankStatement_R4K_Category__r.Account__c = :account.Id AND
                                                            Credit_Amount__c > 0 AND Transaction_Date__c != null
                                                            ORDER BY Transaction_Date__c DESC];

        Date cpayLastReceivedDate;
        Date cpaySecondLastReceivedDate;
        Date empLastReceivedDate;
        Date empSecondLastReceivedDate;
        
        for(Integer t=0; t<bankTransList.size(); t++){
            if(bankTransList[t].BankStatement_Generic_Category__r.Name == 'Centrelink' && cpayLastReceivedDate == null){
                cpayLastReceivedDate = bankTransList[t].Transaction_Date__c;
            }else if(bankTransList[t].BankStatement_Generic_Category__r.Name == 'Centrelink' && cpayLastReceivedDate != null && cpaySecondLastReceivedDate == null && bankTransList[t].Transaction_Date__c.daysBetween(cpayLastReceivedDate) > 7){
                cpaySecondLastReceivedDate = bankTransList[t].Transaction_Date__c;
            }else if(bankTransList[t].BankStatement_Generic_Category__r.Name == 'Wages' && empLastReceivedDate == null){
                empLastReceivedDate = bankTransList[t].Transaction_Date__c;
            }else if(bankTransList[t].BankStatement_Generic_Category__r.Name == 'Wages' && empLastReceivedDate != null && empSecondLastReceivedDate == null && bankTransList[t].Transaction_Date__c.daysBetween(empLastReceivedDate) > 2){
                empSecondLastReceivedDate = bankTransList[t].Transaction_Date__c;
            }
        }

        System.debug('****cpayLastReceivedDate ' + cpayLastReceivedDate);
        System.debug('****cpaySecondLastReceivedDate ' + cpaySecondLastReceivedDate);
        System.debug('****empLastReceivedDate ' + empLastReceivedDate);
        System.debug('****empSecondLastReceivedDate ' + empSecondLastReceivedDate);

        if(cpayLastReceivedDate != null){
            cpaySecondLastReceivedDate = (cpaySecondLastReceivedDate == null ? cpayLastReceivedDate.addDays(-14) : cpaySecondLastReceivedDate);
            opportunity.Centrepay_Income_Frequency__c = cpaySecondLastReceivedDate.daysBetween(cpayLastReceivedDate);
            opportunity.Next_Centrepay_Income_Received_Date__c = cpayLastReceivedDate.addDays(Integer.valueOf(opportunity.Centrepay_Income_Frequency__c));
            System.debug('****opportunity.Centrepay_Income_Frequency__c ' + opportunity.Centrepay_Income_Frequency__c);
            System.debug('****opportunity.Next_Centrepay_Income_Received_Date__c ' + opportunity.Next_Centrepay_Income_Received_Date__c);
        }
        
        if(empLastReceivedDate != null && empSecondLastReceivedDate != null){
            opportunity.Employment_Income_Frequency__c = empSecondLastReceivedDate.daysBetween(empLastReceivedDate);
            opportunity.Next_Employment_Income_Received_Date__c = empLastReceivedDate.addDays(Integer.valueOf(opportunity.Employment_Income_Frequency__c));
            System.debug('****opportunity.Employment_Income_Frequency__c ' + opportunity.Employment_Income_Frequency__c);
            System.debug('****opportunity.Next_Employment_Income_Received_Date__c ' + opportunity.Next_Employment_Income_Received_Date__c);
        }
        opportunity.Avg_No_of_Days_for_Income_Depletion__c = account.Avg_No_of_Days_for_Income_Depletion__c;
        if(!Test.isRunningTest()){
            insert opportunity;            
        }
        account.AgreementId_for_Current_Enquiry__c=opportunity.Id; 
    }
    else
    {
        Opportunity opportunity = new Opportunity();
        opportunity.Id=account.AgreementId_for_Current_Enquiry__c;
        opportunity.Name = account.FirstName + ' ' + account.LastName+' - '+account.Product_Name_for_Agreement__c;
        opportunity.Hybrid_Application__c = isHybridApplication;
        system.debug('account.Product_Name_for_Agreement__c: '+account.Product_Name_for_Agreement__c);
        
        opportunity.Term_Months__c = account.Product_Term_for_Agreement__c;
        String requirement='';
        String objectives='';
        String whyConsumerLease = '';
        String whyNotPhonePlan = '';
        String benefitsOfConsumerLease = '';
        String otherBenefitsOfConsumerLease = '';
        String productInterested = '';
        String promotionMedium='';
        if(account.Product_Name_for_Agreement__c!=null)
            requirement=account.Product_Name_for_Agreement__c;
        if(account.Product_Description__c!=null)
        {
            if(account.Product_Name_for_Agreement__c!=null)
                objectives=' and '+account.Product_Description__c;
            else
                objectives=account.Product_Description__c;
        }
        if(account.Why_consumer_lease__c != null){
            whyConsumerLease = account.Why_consumer_lease__c;
        }
        if(account.Benefit_of_Consumer_Lease_with_R4K__c != null){
            benefitsOfConsumerLease = account.Benefit_of_Consumer_Lease_with_R4K__c;
        }
        if(account.Specify_Other_Benefits_of_Consumer_Lease__c != null){
            otherBenefitsOfConsumerLease = account.Specify_Other_Benefits_of_Consumer_Lease__c;
        }
        if(account.Product_Interested_In__c !=null){
            productInterested=account.Product_Interested_In__c;
        }
        if(account.Why_not_phone_plan__c != null && account.Product_Interested_In__c == 'Phones'){
            whyNotPhonePlan = account.Why_not_phone_plan__c;
        }
        if(account.Big_Sale_Media__c != null && account.Big_Sale_Media__c != '--None--'){
            promotionMedium = account.Big_Sale_Media__c;
        }
        opportunity.Requirements_Objectives__c=requirement+objectives;
        opportunity.Why_consumer_lease__c = whyConsumerLease;
        opportunity.Requirements_and_Objectives__c = account.Requirements_and_Objectives__c;
        opportunity.Loan_Purpose__c = account.Loan_Purpose__c;
        opportunity.Benefit_of_Consumer_Lease_with_R4K__c = benefitsOfConsumerLease;
        opportunity.Specify_Other_Benefits_of_Consumer_Lease__c = otherBenefitsOfConsumerLease;
        opportunity.Why_not_phone_plan__c = whyNotPhonePlan;
        opportunity.Product_Interested_In__c = productInterested;
        opportunity.Product_Description__c=account.Product_Description__c;
        opportunity.Credit_Guideline__c = account.Credit_Guideline__c;
        opportunity.CM_Referees_Contacted_Comments__c = CM_RefereesContactedComments;
        opportunity.CM_No_of_Referees_Being_Family_Comments__c = CM_NoOfRefereesBeingFamilyComments;
        opportunity.CM_No_of_Refs_Family_Shared_Comments__c = CM_NoOfRefereesBeingFamilySharedComments;
        opportunity.CM_Maximum_Break_Even_Shortfall_Comments__c = CM_MaximumBreakEvenShortFallComments;
        opportunity.CM_Maximum_Remaining_Amount_Comments__c = CM_MaximumRemainingAmountComments;
        opportunity.CM_Maximum_TAV_Comments__c = CM_MaximumTAVComments;
        opportunity.CM_No_of_Active_Agreements_Comments__c = CM_NoOfActiveAgreementsComments;
        opportunity.CM_No_of_Mobile_Agreements_Comments__c = CM_NoOfMobileAgreementsComments;
        opportunity.CM_Part_9_Agreements_Comments__c = CM_Part9AgreementsComments;
        opportunity.CM_Term_Comments__c = CM_TermComments;
        opportunity.CM_Rem_Amount_Rental_Default_Comments__c = CM_RemAmountRentalDefaultComments;
        
        opportunity.CM_Payment_Frequency__c = account.CM_Payment_Frequency__c;
        opportunity.CM_Scheduled_Amount_Comments__c = account.CM_Scheduled_Amount_Comments__c;
        opportunity.CM_Dishonours__c = account.CM_Dishonours__c;
        opportunity.CM_Gambling__c = account.CM_Gambling__c;
        opportunity.CM_Collection_And_Consolidation__c = account.CM_Collection_And_Consolidation__c;
        opportunity.CM_Overdrawn__c = account.CM_Overdrawn__c;
        opportunity.CM_Jobseeker__c = account.CM_Jobseeker__c;
        opportunity.CM_Debt_vs_Income_Ratio_Greater_Than_50__c = account.CM_Debt_vs_Income_Ratio_Greater_Than_50__c;
        opportunity.CM_OutstandingDefRental_Comp_Comments__c = account.CM_OutstandingDefRental_Comp_Comments__c;
        opportunity.CM_OutstandingDefNonRental_Comp_Comments__c = account.CM_OutstandingDefNonRental_Comp_Comments__c;
        opportunity.CM_Equifax_Score_Comments__c = account.CM_Equifax_Score_Comments__c;
        opportunity.CM_Bankruptcy_Part_9_Agreements_Comments__c = account.CM_Bankruptcy_Part_9_Agreements_Comments__c;
        opportunity.CM_Missed_from_last_6_FN_pymts_Comments__c = account.CM_Missed_from_last_6_FN_pymts_Comments__c;
        opportunity.CM_Serviceablilty_Comments__c = account.CM_Serviceablilty_Comments__c;
        opportunity.Avg_No_of_Days_for_Income_Depletion__c = account.Avg_No_of_Days_for_Income_Depletion__c;
        update opportunity;
    }
    
    ////////////////TRAK SIM///////////////
    /*
    if(account.Territory_Number__r.Has_Access_To_R4K_Trak__c)
    {
        createOrUpdateTrakAgreement();
    }
    */
    ////////////////TRAK SIM///////////////
    
    criteriaCalculator();
    update account;
    creditMatrixAction();
    GetAllReds();
    checkedCriteriaforCM=true;
}

public void creditMatrixAction()
{
    noOfActiveAgreements = 0;
    noOfMobileAgreements = 0;
    totalTAV = account.Total_Agreement_Amount_Active_Only__c;
    totalRemainingAmount = account.Remaining_Amount_Active_Agreements__c;   
    totalRemainingAmountDefaults = 0;
    
    Integer monthsBetweenTodayandLastCompletedAgmt=0;
    List<Opportunity> oppListForActive = new List<Opportunity>();
    List<Opportunity> oppListForCompleted=[select id,Name,Agreement_Completed_Date__c from Opportunity where AccountId=:account.Id and Agreement_Completed_Date__c<>null and StageName='Completed' AND RecordType.Name <> 'Trak SIM' order by Agreement_Completed_Date__c desc LIMIT 1];
    if(oppListForCompleted.size()>0)
    {
        Date lastCompletedDate = oppListForCompleted[0].Agreement_Completed_Date__c;
        Date todayDate = Date.today();
        Integer monthDiff = lastCompletedDate.monthsBetween(todayDate);
        if (todayDate.day() > lastCompletedDate.day()) monthDiff++;
        System.debug('monthDiff: '+monthDiff); 
        monthsBetweenTodayandLastCompletedAgmt=monthDiff;
    }
    system.debug('account.Active_Agreements__c: '+account.Active_Agreements__c+' currentAgmtId: '+account.AgreementId_for_Current_Enquiry__c);
    if(account.Active_Agreements__c>0 || (account.Active_Agreements__c==0 && oppListForCompleted.size()>0 && monthsBetweenTodayandLastCompletedAgmt<=3))
    {
        if(account.AgreementId_for_Current_Enquiry__c!=null && account.AgreementId_for_Current_Enquiry__c!='')
            oppListForActive=[select id,Name,Total_Paid_Amount__c,Scheduled_Amount__c,Total_cost_of_agreement_products__c,Total_COGS_Less_AAF__c,CreatedDate,Remaining_Amount__c, (SELECT Id,ProductCode FROM OpportunityLineItems) from Opportunity where AccountId=:account.Id and is_Active__c=true and id<>:account.AgreementId_for_Current_Enquiry__c AND RecordType.Name <> 'Trak SIM'];
        else
            oppListForActive=[select id,Name,Total_Paid_Amount__c,Scheduled_Amount__c,Total_cost_of_agreement_products__c,Total_COGS_Less_AAF__c,CreatedDate,Remaining_Amount__c, (SELECT Id,ProductCode FROM OpportunityLineItems) from Opportunity where AccountId=:account.Id and is_Active__c=true AND RecordType.Name <> 'Trak SIM'];
    }
    List<String> activeOppNameList = new List<String>();
    for(Opportunity oppp : oppListForActive)
    {
        totalRemainingAmountDefaults += (oppp.Remaining_Amount__c == null ? 0 : oppp.Remaining_Amount__c);
            
        for(OpportunityLineItem objOli : oppp.OpportunityLineItems)
        {
            if(!activeOppNameList.contains(oppp.Name))
            {
                activeOppNameList.add(oppp.Name);
                if(objOli.ProductCode == 'Phones')
                {
                    noOfMobileAgreements++;
                }
            }
        }
    }
    
    noOfActiveAgreements = (Integer)account.Active_Agreements__c;
    system.debug('noOfMobileAgreements: '+noOfMobileAgreements+' noOfActiveAgreements: '+noOfActiveAgreements+' totalTAV: '+totalTAV+' totalRemainingAmount: '+totalRemainingAmount);
    
    //Referee Count Logic
     List<Referee__c> totalRefList = new List<Referee__c>();
     Date enquiryDate = account.Enquiry_Date__c;
     String residentialStatus = account.Residential_Status__c;
     Integer daysBetweenEnquiryAndRefereeContacted=0;
     Integer refereeFamMemberCounter=0;
     Integer refereeFamMemberSharingCounter=0;
     refereesContacted = 0;
     
     totalRefList=[select id,Contacted__c,Contacted_On_Date__c,Relationship__c from Referee__C where Applicant__r.Id=:account.Id];
     
     if(totalRefList.size()>0)
     {
         for(Referee__c ref:totalRefList)
         {
             if(ref.Contacted__c=='Yes' && ref.Contacted_On_Date__c!=null && enquiryDate!=null)
             {
                 system.debug('enquiryDate: '+enquiryDate);
                 system.debug('ref.Contacted_On_Date__c: '+ref.Contacted_On_Date__c);
                 
                 daysBetweenEnquiryAndRefereeContacted=Math.abs(enquiryDate.daysBetween(ref.Contacted_On_Date__c));
                 
                 system.debug('daysBetweenEnquiryAndRefereeContacted: '+daysBetweenEnquiryAndRefereeContacted);
                 if(daysBetweenEnquiryAndRefereeContacted<=21)
                 {
                     if(ref.Relationship__c=='Family Member')
                     {
                         refereeFamMemberCounter++;
                         if(residentialStatus=='Boarding' || residentialStatus=='Living with parents')
                             refereeFamMemberSharingCounter++;
                     }
                     refereesContacted++;
                 }          
             }
         }
     }
     system.debug('residentialStatus: '+residentialStatus+' refereeFamMemberCounter: '+refereeFamMemberCounter+' refereeFamMemberSharingCounter: '+refereeFamMemberSharingCounter);
     refereesBeingFamMeber = refereeFamMemberCounter;
     refereesBeingFamMemberSharing = refereeFamMemberSharingCounter;
    ////////////////
    showTheCustomerIsNewOrExisting();
    creditMaxTermPassed  = true;
    
    oldCost = account.Product_COGS_for_Agreement__c;
    oldTerm = account.Product_Term_for_Agreement__c;

    Decimal cost=0;
    String term='';
    Decimal rent=0;
    Decimal rrp = 0;
    Decimal deliveryFee = 0;
    Boolean isMobile= account.Product_Category_Selected__c!=null && account.Product_Category_Selected__c.contains('Phones') ? true : false;
    if(account.Product_COGS_for_Agreement__c!=null)
        cost=account.Product_COGS_for_Agreement__c;
    if(account.Product_RRP_for_Agreement__c!=null)
        rrp=account.Product_RRP_for_Agreement__c;
    if(account.Product_Term_for_Agreement__c!=null && account.Product_Term_for_Agreement__c!='')
        term=account.Product_Term_for_Agreement__c;
    if(account.Product_Delivery_Fee_For_Agreement__c!=null)
        deliveryFee=account.Product_Delivery_Fee_For_Agreement__c;
    
    Decimal tav = 0;
    Decimal rrpTAVFactor = 2.99;
    Decimal rrpCalculatedTAV=0;
    
    if(term=='24' || term=='30' || term=='36')
    {
        rrpTAVFactor = 3.45;
    }
    else if(isMobile && (term=='6' || term=='9' || term=='12' || term=='18'))
    {
        rrpTAVFactor = 3.45;
    }
    if(rrp==0)
    {
        rrp = cost;
    }
    
    Decimal newAAF = (0.2 * cost) > 500 ? 500 : (0.2 * cost);
    rrpCalculatedTAV = Math.ceil((rrp * rrpTAVFactor) + newAAF);
    Decimal minTAV = 0;
    
    if(Account.Territory_Number__r.State_Master_State__c == 'NZ')
    {
        rrpTAVFactor = 1.560683;
        Decimal nzCOGS = 0;
        if(term=='24'){
            newAAF = 90 + (2.1 * 52 * 2) + 15;
            nzCOGS = rrp + newAAF;
            //rrpCalculatedTAV = (nzCOGS * rrpTAVFactor).setScale(2);
            //rent = (rrpCalculatedTAV/52).setScale(2);
        }else if(term=='36'){
            rrpTAVFactor = 1.882015;
            newAAF = 90 + (2.1 * 52 * 3) + 15;
            nzCOGS = rrp + newAAF;
            //rrpCalculatedTAV = (nzCOGS * rrpTAVFactor).setScale(2);
            //rent = (rrpCalculatedTAV/78).setScale(2);
        }
        String rentalResult = Util.getRentalCalculation('NZ', nzCOGS, 0, term, CM_PaymentFrequency);
        System.debug('rentalResult : ' + rentalResult);
        Map<String, String> rentalResultMap = (Map<String, String>)JSON.deserialize(rentalResult, Map<String, String>.class);
        rrpCalculatedTAV = Decimal.valueOf(rentalResultMap.get('tav'));
        rent = Decimal.valueOf(rentalResultMap.get('rent'));
    }else
    {
        rrpTAVFactor = 3.95;
        if(term != null && term != ''){
            Decimal apr_CashPrice = deliveryFee + cost;
            Integer term_numeric = Integer.valueOf(term);                
            String feesResult = Util.getFees(apr_CashPrice,term_numeric);
            System.debug('feesResult : ' + feesResult);
            Map<String, String> feesResultMap = (Map<String, String>)JSON.deserialize(feesResult, Map<String, String>.class);
            Decimal aprFees = Decimal.valueOf(feesResultMap.get('totalFees'));
            String rentalResult = Util.getRentalCalculation('AU', apr_CashPrice, aprFees, term, CM_PaymentFrequency);
            System.debug('rentalResult : ' + rentalResult);
            Map<String, String> rentalResultMap = (Map<String, String>)JSON.deserialize(rentalResult, Map<String, String>.class);
            rrpCalculatedTAV = Decimal.valueOf(rentalResultMap.get('tav'));
            rent = Decimal.valueOf(rentalResultMap.get('rent'));
        }
    }
    currentTAV = minTAV;
    
    system.debug('term: '+term+' rrp: '+rrp+' tav: '+tav+' rrpCalculatedTAV: '+rrpCalculatedTAV+' minTAV: '+minTAV);
}

//Check if any Paramter is red
public void GetAllReds()
{

}
////////////////////////

public void showTheCustomerIsNewOrExisting()
{       
    Integer monthsBetweenTodayandLastCompletedAgmt=0;
    Decimal totalCOGSForActive=0;
    Decimal totalPaidForActive=0;
    Decimal totalScheduledAmount=0;
    List<Opportunity> oppListForActive = new List<Opportunity>();
    List<Opportunity> oppListForCompleted=[select id,Name,Agreement_Completed_Date__c from Opportunity where AccountId=:account.Id and Agreement_Completed_Date__c<>null and StageName='Completed' AND RecordType.Name <> 'Trak SIM' order by Agreement_Completed_Date__c desc LIMIT 1];
    if(oppListForCompleted.size()>0)
    {
        Date lastCompletedDate = oppListForCompleted[0].Agreement_Completed_Date__c;
        Date todayDate = Date.today();
        Integer monthDiff = lastCompletedDate.monthsBetween(todayDate);
        if (todayDate.day() > lastCompletedDate.day()) monthDiff++;
        System.debug('monthDiff: '+monthDiff); 
        monthsBetweenTodayandLastCompletedAgmt=monthDiff;
    }
    if(account.Active_Agreements__c>0 || (account.Active_Agreements__c==0 && oppListForCompleted.size()>0 && monthsBetweenTodayandLastCompletedAgmt<=3))
    {
        newCustomer=false;
        oppListForActive=[select id,Name,Total_Paid_Amount__c,Scheduled_Amount__c,Total_cost_of_agreement_products__c,CreatedDate from Opportunity where AccountId=:account.Id and is_Active__c=true AND RecordType.Name <> 'Trak SIM'];
        
        //Logic to be changed for newCustomer
        if(oppListForActive.size()==1)
        {
            if(account.AgreementId_for_Current_Enquiry__c!=null && account.AgreementId_for_Current_Enquiry__c!='' && (oppListForCompleted.size()>0 && monthsBetweenTodayandLastCompletedAgmt<=3))
            {
                newCustomer=false;
                ignoreMissedPayment=true;
            }
            else if(account.AgreementId_for_Current_Enquiry__c!=null && account.AgreementId_for_Current_Enquiry__c!='' && String.valueOf(account.AgreementId_for_Current_Enquiry__c).substring(0,15) != String.valueOf(oppListForActive[0].Id).substring(0,15))
            {
                newCustomer=false;    
            }
            else if(account.AgreementId_for_Current_Enquiry__c!=null && account.AgreementId_for_Current_Enquiry__c!='')
                newCustomer=true;
                
            SYSTEM.DEBUG('account.AgreementId_for_Current_Enquiry__c: '+account.AgreementId_for_Current_Enquiry__c+ ' oppListForActive[0].Id: '+oppListForActive[0].Id);
        }else if(oppListForActive.size() == 0){
            ignoreMissedPayment=true;
        }
        ////////////////////////////////////
    }
    else
        newCustomer=true;
        
    System.debug('newCustomer: '+newCustomer);
}

public void checkCriteriaBeforeCreatingAgreement()
{
    Decimal cost=0;
    String term='';
    Decimal rent=0;
    Decimal rrp=0;
    Decimal deliveryFee = 0;
    Boolean isMobile = account.Product_Category_Selected__c!=null && account.Product_Category_Selected__c.contains('Phones') ? true : false;
    if(account.Product_COGS_for_Agreement__c!=null)
        cost=account.Product_COGS_for_Agreement__c;
    if(account.Product_Term_for_Agreement__c!=null && account.Product_Term_for_Agreement__c!='')
        term=account.Product_Term_for_Agreement__c;
    if(account.Product_RRP_for_Agreement__c!=null)
        rrp=account.Product_RRP_for_Agreement__c;
    if(account.Product_Delivery_Fee_For_Agreement__c!=null)
        deliveryFee=account.Product_Delivery_Fee_For_Agreement__c;
    
    Decimal tav = 0;
    Decimal rrpTAVFactor = 2.99;
    Decimal rrpCalculatedTAV=0;
    
    if(term=='24' || term=='30' || term=='36')
    {
        rrpTAVFactor = 3.45;
    }
    else if(isMobile && (term=='6' || term=='9' || term=='12' || term=='18'))
    {
        rrpTAVFactor = 3.45;
    }
    if(rrp==0)
    {
        rrp = cost;
    }
    
    Decimal newAAF = (0.2 * cost) > 500 ? 500 : (0.2 * cost);
    rrpCalculatedTAV = Math.ceil((rrp * rrpTAVFactor) + newAAF);
    Decimal minTAV = 0;
    
    if(Account.Territory_Number__r.State_Master_State__c == 'NZ')
    {
        rrpTAVFactor = 1.560683;
        Decimal nzCOGS = 0;
        if(term=='24'){
            newAAF = 90 + (2.1 * 52 * 2) + 15;
            nzCOGS = rrp + newAAF;
            //rrpCalculatedTAV = (nzCOGS * rrpTAVFactor).setScale(2);
            //rent = (rrpCalculatedTAV/52).setScale(2);
        }else if(term=='36'){
            rrpTAVFactor = 1.882015;
            newAAF = 90 + (2.1 * 52 * 3) + 15;
            nzCOGS = rrp + newAAF;
            //rrpCalculatedTAV = (nzCOGS * rrpTAVFactor).setScale(2);
            //rent = (rrpCalculatedTAV/78).setScale(2);
        }
        String rentalResult = Util.getRentalCalculation('NZ', nzCOGS, 0, term, CM_PaymentFrequency);
        System.debug('rentalResult : ' + rentalResult);
        Map<String, String> rentalResultMap = (Map<String, String>)JSON.deserialize(rentalResult, Map<String, String>.class);
        rrpCalculatedTAV = Decimal.valueOf(rentalResultMap.get('tav'));
        rent = Decimal.valueOf(rentalResultMap.get('rent'));
        system.debug('term: '+term+' rrp: '+rrp+' tav: '+tav+' rrpCalculatedTAV: '+rrpCalculatedTAV+' minTAV: '+minTAV + ' rent: ' + rent);
    }else
    {
        rrpTAVFactor = 3.95;
        if(term != null && term != ''){
            Decimal apr_CashPrice = deliveryFee + cost;
            Integer term_numeric = Integer.valueOf(term);                
            String feesResult = Util.getFees(apr_CashPrice,term_numeric);
            System.debug('feesResult : ' + feesResult);
            Map<String, String> feesResultMap = (Map<String, String>)JSON.deserialize(feesResult, Map<String, String>.class);
            Decimal aprFees = Decimal.valueOf(feesResultMap.get('totalFees'));
            String rentalResult = Util.getRentalCalculation('AU', apr_CashPrice, aprFees, term, CM_PaymentFrequency);
            System.debug('rentalResult : ' + rentalResult);
            Map<String, String> rentalResultMap = (Map<String, String>)JSON.deserialize(rentalResult, Map<String, String>.class);
            rrpCalculatedTAV = Decimal.valueOf(rentalResultMap.get('tav'));
            rent = Decimal.valueOf(rentalResultMap.get('rent'));
        }
    }
    system.debug('term: '+term+' rrp: '+rrp+' tav: '+tav+' rrpCalculatedTAV: '+rrpCalculatedTAV+' minTAV: '+minTAV);
        
    //account.Rent4Keeps_Payment_C__c=Math.ceil(rent);
    account.Rent4Keeps_Payment_C__c = (CM_PaymentFrequency == 'Weekly' ? (2 * rent).setScale(2) : (rent).setScale(2));
    oldCost = cost;
    oldTerm = term;
    account.CM_Payment_Frequency__c = CM_PaymentFrequency;
    system.debug('prodCategory: '+account.CM_Product_Category__c+' account.AgreementId_for_Current_Enquiry__c: '+account.AgreementId_for_Current_Enquiry__c+' cogs: '+cost+' fnRent: '+rent+' term: '+term);
    
    
    criteriaCalculator();
    system.debug('Newcustomer1: '+newCustomer);
    update account;
    creditMatrixAction();
    GetAllReds();
    system.debug('Newcustomer2: '+newCustomer);
    criteriaCheckedBeforeAgreementCreation=true;
    
    //below code added by Mohit/////
    //the if conditionals invert the booleans which hides the text boxes
    /////////////////////////
    if(showEquiFaxScore){
        showEquifaxScore = false;
    }
    if(showDefaultRental){
        showDefaultRental = false;
    }
     if(showDefaultNonRental){
        showDefaultNonRental = false;
    }
    /////////////////////////////
}

//Submit for ApprovalRequest
public void submitApprovalRequest() 
{
    try
    {
        if(account.AgreementId_for_Current_Enquiry__c!=null && account.AgreementId_for_Current_Enquiry__c!='')
        { 
            Opportunity opp = new Opportunity();
            opp.Id=account.AgreementId_for_Current_Enquiry__c;
            opp.Answers_To_Credit_Officer_Comments__c = answersToCreditOfficerComments;
            if(repName!='')
            {
                opp.Rep_Name__c=repName;
                //Add Mobile Details in Employee
                if(repMobile!=null && repMobile!='')
                {
                    Employee__c emp = new Employee__c();
                    emp.Id=repName;
                    emp.Mobile__c=repMobile;
                    update emp;
                }
                ////////////////////////////////
            }

            ////Related To CM

            //Existing or New
            showTheCustomerIsNewOrExisting();
            if(newCustomer)
                opp.CM_Customer_Type__c='New';
            else
                opp.CM_Customer_Type__c='Existing';
            ////////////////////

            //Crossed
            creditMatrixAction();
            GetAllReds();
            system.debug('redProductCategory: '+redProductCategory);
            if(redProductCategory!=null && redProductCategory)
                opp.CM_Product_Category_crossed__c=true;
            else
                opp.CM_Product_Category_crossed__c=false;
            if(redCOGS!=null && redCOGS)
                opp.CM_COGS_crossed__c=true;
            else
                opp.CM_COGS_crossed__c=false;
            if(redScheduledAmount!=null && redScheduledAmount)
                opp.CM_Scheduled_Amount_crossed__c=true;
            else
                opp.CM_Scheduled_Amount_crossed__c=false;
            if(redDefaultRental!=null && redDefaultRental)
                opp.CM_Equifax_Rental_Default_crossed__c=true;
            else
                opp.CM_Equifax_Rental_Default_crossed__c=false;
            if(redDefaultNonRental!=null && redDefaultNonRental)
                opp.CM_Equifax_Non_Rental_Default_crossed__c=true;
            else
                opp.CM_Equifax_Non_Rental_Default_crossed__c=false;
            if(redEquifaxScore!=null && redEquifaxScore)
                opp.CM_Equifax_Score_crossed__c=true;
            else
                opp.CM_Equifax_Score_crossed__c=false;
            if(redBankruptcy!=null && redBankruptcy)
                opp.CM_Bankruptcy_Part_9_Agreements_crossed__c=true;
            else
                opp.CM_Bankruptcy_Part_9_Agreements_crossed__c=false;
            if(redNoOfDaysMissed!=null && redNoOfDaysMissed)
                opp.CM_Days_Missed_Since_Last_Pmts_crossed__c=true;
            else
                opp.CM_Days_Missed_Since_Last_Pmts_crossed__c=false;
            if(redNoOfMissedPayments!=null && redNoOfMissedPayments)
                opp.CM_No_of_Missed_Pymts_Last_6_FN_crossed__c=true;
            else
                opp.CM_No_of_Missed_Pymts_Last_6_FN_crossed__c=false;
            if(redServiceability!=null && redServiceability)
                opp.CM_Serviceablilty_crossed__c=true;
            else
                opp.CM_Serviceablilty_crossed__c=false;
            ///////////////////  

            //CM Comments
            opp.CM_Product_Category_Comments__c=account.CM_Product_Category_Comments__c;
            opp.CM_COGS_Comments__c=account.CM_COGS_Comments__c;
            opp.CM_Scheduled_Amount_Comments__c=account.CM_Scheduled_Amount_Comments__c;
            opp.CM_OutstandingDefRental_Comp_Comments__c=account.CM_OutstandingDefRental_Comp_Comments__c;
            opp.CM_OutstandingDefNonRental_Comp_Comments__c =account.CM_OutstandingDefNonRental_Comp_Comments__c;
            opp.CM_Equifax_Score_Comments__c=account.CM_Equifax_Score_Comments__c;
            opp.CM_days_since_last_Payment_Comments__c=account.CM_days_since_last_Payment_Comments__c;
            opp.CM_Missed_from_last_6_FN_pymts_Comments__c=account.CM_Missed_from_last_6_FN_pymts_Comments__c;
            opp.CM_Serviceablilty_Comments__c=account.CM_Serviceablilty_Comments__c;
            opp.CM_Bankruptcy_Part_9_Agreements_Comments__c=account.CM_Bankruptcy_Part_9_Agreements_Comments__c;
            opp.CM_Reason_to_go_forward__c=account.CM_Reason_to_go_forward__c;
            opp.CM_Referees_Contacted_Comments__c = CM_RefereesContactedComments;
            opp.CM_No_of_Referees_Being_Family_Comments__c = CM_NoOfRefereesBeingFamilyComments;
            opp.CM_No_of_Refs_Family_Shared_Comments__c = CM_NoOfRefereesBeingFamilySharedComments;
            opp.CM_Maximum_Break_Even_Shortfall_Comments__c = CM_MaximumBreakEvenShortFallComments;
            opp.CM_Maximum_Remaining_Amount_Comments__c = CM_MaximumRemainingAmountComments;
            opp.CM_Maximum_TAV_Comments__c = CM_MaximumTAVComments;
            opp.CM_No_of_Active_Agreements_Comments__c = CM_NoOfActiveAgreementsComments;
            opp.CM_No_of_Mobile_Agreements_Comments__c = CM_NoOfMobileAgreementsComments;
            opp.CM_Part_9_Agreements_Comments__c = CM_Part9AgreementsComments;
            opp.CM_Term_Comments__c = CM_TermComments;
            opp.CM_Rem_Amount_Rental_Default_Comments__c = CM_RemAmountRentalDefaultComments;
            ////////////////  

            //CM Values
            opp.CM_Scheduled_Amount__c=account.CM_Scheduled_Amount__c;
            opp.CM_COGS__c=account.CM_COGS__c;
            opp.CM_Product_Category__c=account.CM_Product_Category__c;
            opp.CM_Serviceable__c=account.CM_Serviceable__c;
            opp.CM_No_of_Missed_Payments_Last_6_FN__c=account.CM_No_of_Missed_Payments_Last_6_FN__c;
            opp.CM_Combined_Dollar_Exposure__c=account.CM_Combined_Dollar_Exposure__c;
            opp.CM_No_of_Days_Missed_Since_Last_Payments__c=account.CM_No_of_Days_Missed_Since_Last_Payments__c;
            opp.CM_Equifax_Rental_Default__c=account.CM_Equifax_Rental_Default__c;
            opp.CM_Equifax_Non_Rental_Default__c=account.CM_Equifax_Non_Rental_Default__c;
            opp.CM_Serviceablilty_Percentage__c=account.Serviceability__c;
            opp.CM_Outstanding_Defaults_to_Non_Rental__c=account.Equifax_No_of_Unpaid_Default_NonRental__c;
            opp.CM_Outstanding_Defaults_to_Rental__c=account.Equifax_No_of_Unpaid_Default_Rental__c;
            opp.CM_Bankruptcy_Part_9_Agreements__c=account.Bankruptcy_Part_9_Agreements__c;
            ////////////////////
            ///////////////////////////////////////////

            //Update Consent URL Device Values 
            opp.Consent_URL_Latitude__c = account.Consent_URL_Latitude__c;
            opp.Consent_URL_Longitude__c = account.Consent_URL_Longitude__c;
            opp.Consent_URL_Address__c = account.Consent_URL_Address__c;
            opp.Consent_URL_Device_Info__c = account.Consent_URL_Device_Info__c;
            opp.Approval_Status__c = 'Pending';
            ///////////////////////////////////////

            ///////////////////////////////
            opp.AF_Audit_Notification_Task_ID__c = 'CAM3';
            ///////////////////////////////

            update opp;

            //account.Enquiry_Status__c='Applicant';
            update account;

            //Create a R4K AUDIT case
            List<Case> caseList=[select id from Case where Opportunity_Name__c=:account.AgreementId_for_Current_Enquiry__c and (Subject Like 'Credit Approval Request%' or Subject Like 'Compliance Review Request%' or Subject like '%Approval Request for -%')];
            if(caseList.size()>0)
                delete caseList;

            system.debug('showReasonForNotApprovable1: '+showReasonForNotApprovable);
            system.debug('redAny: '+redAny);

            approvalSent=true;
            approvalStatus = 'Pending';
            approvalOfficerName = '';

            List<Opportunity> opLst=[select id,Name,Account.Rep_Name__c,Rep_Name__c,Rep_Name__r.Name,Approval_Number__c,OwnerId from Opportunity where id=:account.AgreementId_for_Current_Enquiry__c];

            if((redAny!=null && redAny) || (showRepAutoEligibleMessage == null || showRepAutoEligibleMessage))
            {
                OrgWideEmailAddress[] owea = [select Id,displayName,Address from OrgWideEmailAddress where displayName = 'CreditApproval' limit 1];
                String agmtName = opLst[0].Name;
                String agmtId = opLst[0].Id;
                String emailSubject = 'Approval Request for - '+agmtName;
                String baseUrl = URL.getSalesforceBaseUrl().toExternalForm() ;
                String lineManagerName = account.Credit_Guideline__r.Line_Manager_Full_Name__c;
                String lineManagerEmail = account.Credit_Guideline__r.Line_Manager__c;
                String repName = opLst[0].Rep_Name__r.Name;
                String orgWideId = owea[0].Id;
                String orgWideEmail = owea[0].Address;
                String emailBody = 'Dear '+lineManagerName+'<br/><br/>'+repName
                    +' has requested an Approval for '+agmtName+'<br/>'
                    + 'Please click the link below to view <a href="'+baseUrl+'/apex/RAMApprovalPage?oppId='+agmtId+'">Credit Matrix Console</a>.<br/>'
                    +'Based on the information provided by '+repName+', you can; <br/>'
                    +'&nbsp;&nbsp;&nbsp;1. Approve or <br/> &nbsp;&nbsp;&nbsp;2. Decline <br/> &nbsp;&nbsp;&nbsp;3. Re-Submit <br/><br/> Thank You <br/> R4K ERP';
                system.debug('baseUrl: '+baseUrl);
                List<String> emailToLst = new List<String>();
                List<String> emailBccLst = new List<String>();
                emailToLst.add(lineManagerEmail);
                emailBccLst.add(orgWideEmail);
                CommunicationUtil.sendEmailAndAttach(emailToLst,emailBccLst,null,null,emailSubject,emailBody,null,null,orgWideId);
            }else
            {
                approvalApproved=true;
                approvalStatus = 'Approved';
                approvalOfficerName = 'CAM';
                approvalNumber=opLst[0].Approval_Number__c;
                
                Opportunity approveOpp = new Opportunity();
                approveOpp.Id = Account.AgreementId_for_Current_Enquiry__c;
                approveOpp.Approval_Status__c = 'Approved';
                approveOpp.Approval_DateTime__c = DateTime.now();
                approveOpp.AF_CA_Credit_Officer_Name__c='CAM';
                approveOpp.AF_CA_CC_Processed_Date__c=Date.today();
                update approveOpp;  
            }

            List<Attachment> attsToUpdate=new List<Attachment>();

            PageReference pg = new PageReference('/apex/IncomeExpensePDFPage?id=' + Account.Id);
            Blob body;
            try {
            body = pg.getContentAsPDF();  
            } catch (VisualforceException e) {
                body = Blob.valueOf('Some Text');
            }
            Attachment incomeAttachment = new Attachment();
            incomeAttachment.ParentId = Account.AgreementId_for_Current_Enquiry__c;
            incomeAttachment.Name = 'Income_Expense_' + (opLst.size() > 0 ? opLst[0].Name : 'null') + '_' + DateTime.now().format('ddMMMyyyy') + '.pdf';
            incomeAttachment.Body = body;
            attsToUpdate.add(incomeAttachment);

            List<Attachment> attachmentsForOpp=[select id,Name,Body,contentType,ParentId from Attachment where parentId=:account.Id and (Name like 'BankStatement%' or Name like 'myGov%' or Name like 'Equifax_%' or Name LIKE 'Photo Id%' or Name LIKE 'Other File%' or Name LIKE 'Proof of Income-%') and createdDate = LAST_N_DAYS:21];
            if(attachmentsForOpp.size()>0)
            {
                for(Attachment at:attachmentsForOpp)
                {
                    Attachment attN = new Attachment();
                    attN.ParentId=account.AgreementId_for_Current_Enquiry__c;
                    attN.Name = at.Name;
                    attN.Body = at.Body;
                    attN.contentType = at.contentType;
                    attsToUpdate.add(attN);
                }
            }
            if(attsToUpdate.size()>0)
            {
                insert attsToUpdate;
                Opportunity oppUp = new Opportunity();
                oppUp.Id=account.AgreementId_for_Current_Enquiry__c;
                
                for(Attachment att : attsToUpdate)
                {
                    if(att.Name.contains('BankStatement'))
                        oppUp.Is_Bank_Statement_Attached__c=true;
                    else if(att.Name.contains('myGov') || (att.Name.contains('Proof of Income-') && account.Territory_Number__r.State_Master_State__c == 'NZ'))
                        oppUp.Is_Income_Statement_Attached__c=true;
                    else if(att.Name.contains('Equifax'))
                        oppUp.Is_Veda_Attached__c=true;
                    else if(att.Name.contains('Photo Id'))
                        oppUp.Is_Photo_Id_Attached__c=true;
                }
                
                if(Account.Equifax_SMS_Consent_Received__c)
                {
                    oppUp.Equifax_SMS_Consent_Received__c = true;
                }
                
                update oppUp;
            }
            if(attachmentsForOpp.size()>0)
                delete attachmentsForOpp;

            lineManagerName = 'RAM';
            attachCreditMatrixPDF(account.AgreementId_for_Current_Enquiry__c, 'RAM', approvalStatus);  
        }
        else
        {
            errorMessage=true;
        }

        if(showRepAutoEligibleMessage)
        {
            showRepAutoEligibleMessage = false;
        }
    }catch(Exception ex)
    {
        ErrorLog.addErrorLog('CAMProcessController','submitApprovalRequest',Account.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    } 
}


public void selectRepName()
{
    showRepAutoEligibleMessage = false;
    
    if(repName != null && repName.trim() != '')
    {
        List<Employee__c> employees = [select id,Name,Mobile__c,Not_Eligible_for_Auto_Approval__c from Employee__c where id=:repName LIMIT 1];
        
        if(employees.size() > 0)
        {
            repMobile = employees[0].Mobile__c;
            
            if(employees[0].Not_Eligible_for_Auto_Approval__c)
            {
                showRepAutoEligibleMessage= true;
                redAny = true;
                selectedRepName = employees[0].Name;
            }
            repEmployee = employees[0];
        }   
    }else
    {
        repMobile = null;
        selectedRepName = null;
    }   
}

public void sendRefereeSMSNew()
{
    String refId = ApexPages.currentPage().getParameters().get('refId');
    
    if(refId!=null && refId!='')
    {
        List<Referee__c> refs = [select id, name,Referee_Name__r.FirstName,Applicant__r.FirstName,Referee_Name__r.MobilePhone,SMS_Referee_Mobile__c,Referee_Name__c,Applicant__c,Applicant__r.OwnerId,Referee_Contact_Link__c from Referee__c where id=:refId LIMIT 1];
        if(refs.size()>0)
        {
            //Generate short link
            String randomNumber=SecretUtil.generateRandomNumber();
            String finalURL = '';
            String finalUrl2 = onlineRefereeURL+'/RefereeContactForm?rf='+refs[0].Id+'&n='+randomNumber;
            ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
            if(!Test.isRunningTest())
            {
                finalURL = sl.shortLinkGenerator(finalUrl2);
            }
            
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

public Pagereference sendAddRefereeLinkToApplicant(){
    try{
        //Generate short link
        String randomNumber=SecretUtil.generateRandomNumber();
        String finalURL = onlineURL + '/AddRefereePage?param=ref&id='+account.Id+'&n='+randomNumber;
        ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
        if(!Test.isRunningTest()){
            finalURL = sl.shortLinkGenerator(finalURL);
        }
        String smsTemplateForRef = 'Hi '+account.FirstName+', please use the below link to add referees.\n' + finalURL;
        CommunicationUtil.sendSMS(account.SMS_Mobile__c,smsTemplateForRef,'AddReferee','Account',account.Id,account.OwnerId,false,null);
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('CAMProcessController','sendAddRefereeLinkToApplicant',Account.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return new PageReference('/apex/CAMProcess?formType='+formType+'&sectionType='+sectionType+'&id='+acctId).setRedirect(true);
    }
}

public void initSummaryPage()
{
    actualArrearsOriginal = 0;
    actualArrears = 0;
    actualArrearsAfterVariation = 0;
    isVariation=false;
    
    List<Opportunity> oppsToCheckVariation = [select id,name,Next_Payment_Due_Date_After_Varying__c,Actual_Arrears_Original__c,Actual_Arrears__c,Actual_Arrears_After_Variation__c from Opportunity where AccountId =:account.Id and StageName in ('Goods Delivered')];
    
    if(oppsToCheckVariation.size() > 0)
    {
        for(Opportunity opp : oppsToCheckVariation)
        {
            if(opp.Next_Payment_Due_Date_After_Varying__c != null)
            {
                isVariation = true;
            }
            
            actualArrearsOriginal += (opp.Actual_Arrears_Original__c == null ? 0 : opp.Actual_Arrears_Original__c);
            actualArrears += (opp.Actual_Arrears__c == null ? 0 : opp.Actual_Arrears__c);
            actualArrearsAfterVariation += (opp.Actual_Arrears_After_Variation__c == null ? 0 : opp.Actual_Arrears_After_Variation__c);
        }
    }
    
    System.debug('*******UserInfo.getDefaultCurrency ' + UserInfo.getDefaultCurrency());
    if(Account.CurrencyIsoCode == 'NZD' && UserInfo.getDefaultCurrency() != 'NZD')
    {
        List<CurrencyType> currencyTable = [SELECT Id, IsoCode, ConversionRate FROM CurrencyType WHERE IsoCode = 'NZD' LIMIT 1];
        if(currencyTable.size() > 0)
        {
            actualArrearsOriginal = actualArrearsOriginal * currencyTable[0].ConversionRate;
            actualArrears = actualArrears * currencyTable[0].ConversionRate;
            actualArrearsAfterVariation = actualArrearsAfterVariation * currencyTable[0].ConversionRate; 
        }
    }
    
    Boolean isWrittenOff=false;
    Boolean isSCI=false;
    Boolean isDefaulted=false;
    appStatusType='';
    List<Opportunity> opps = [select id,StageName,SCI_listed_on__c,Defaulted_on_Veda_Date__c from Opportunity where AccountId =:account.Id];
    if(opps.size()>0)
    {
        for(Opportunity opp : opps)
        {
            if(opp.SCI_listed_on__c!=null)
                isSCI=true;
            if(opp.Defaulted_on_Veda_Date__c!=null)
                isDefaulted=true;
            if(opp.StageName=='Written Off / Bad Debt')
                isWrittenOff=true;
        }
    }
    if(isSCI)
        appStatusType='sci';
    else if(isDefaulted && isWrittenOff)
        appStatusType='defaultAndWrittenOff';
    else if(isDefaulted)
        appStatusType='defaulted';
    else if(isWrittenOff)
        appStatusType='writtenOff';
        
        
    lastCollectionActivities = [SELECT Id FROM Collection_Activity__c WHERE Applicant__c =: account.Id];
}

public void getBankStatementCategories()
{
    rentCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Rent'];
    loanCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Loan'];
    creditcardCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Credit Card'];
    insuranceCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Insurance'];
    householdCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Household'];
    utilitiesCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Utilities'];
    travelCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Car/Petrol/Maintenance/Travel'];
    mobileCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Mobile'];
    clothingCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Clothing'];
    alcoholCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Tobacco/Alcohol/Entertainment'];
    otherexpenseCatTransactions = [select id,name,Credit_Amount__c,Debit_Amount__c,Fortnightly_Amount__c,Total_Amount__c,Transaction_Count__c,(select id,Name,Transaction_Date__c,Description__c,Credit_Amount__c,Debit_Amount__c,Total_Amount__c from BankStatement_Transactions__r order by Transaction_Date__c desc) from BankStatement_Generic_Category__c where BankStatement_R4K_Category__r.Account__c=:account.Id and BankStatement_R4K_Category__r.Name='Other Expense'];
    
    /*List<BankStatement_R4K_Category__c> bankR4KCategories = [select id,name,Total_Amount__c from BankStatement_R4K_Category__c where Account__c=:account.Id and CreatedDate=Last_N_days:21];
    if(bankR4KCategories.size()>0)
    {    
        for(BankStatement_R4K_Category__c br: bankR4KCategories)
        {
            if(br.Total_Amount__c!=null && Math.abs(br.Total_Amount__c)>0)
            {
            if(br.Name=='Rent')
                rentCatId = br.Id;
            else if(br.Name=='Loan')
                loanCatId = br.Id;
            else if(br.Name=='Credit Card')
                creditcardCatId = br.Id;
            else if(br.Name=='Insurance')
                insuranceCatId = br.Id;
            else if(br.Name=='Household')
                householdCatId = br.Id;
            else if(br.Name=='Utilities')
                utilitiesCatId = br.Id;
            else if(br.Name=='Car/Petrol/Maintenance/Travel')
                travelCatId = br.Id;
            else if(br.Name=='Mobile')
                mobileCatId = br.Id;
            else if(br.Name=='Clothing')
                clothingCatId = br.Id;
            else if(br.Name=='Tobacco/Alcohol/Entertainment')
                alcoholCatId = br.Id;
            else if(br.Name=='Other Expense')
                otherexpenseCatId = br.Id;
            }
        }
    }*/
}

public void changeEnquiryStatusToDN(){
    try
    {
        System.debug('****'+account.Id);
        System.debug('****'+enquiryStatus);
        System.debug('****'+enquiryNotes);
        System.debug('****'+reasonWhyApplicationDidNotGoAhead);
        
        Account acct = new Account();
        acct.Id = account.Id;
        acct.Enquiry_Status__c = enquiryStatus;
        acct.Enquiry_Notes__c = enquiryNotes;
        acct.Reason_why_application_did_not_go_ahead__c = reasonWhyApplicationDidNotGoAhead;
        update acct; 
    }catch(Exception ex){
        ErrorLog.addErrorLog('CAMProcessController','changeEnquiryStatusToDN',account.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public void checkRisk(){
    try{
        hasRent4KeepsRecordAccess = false;
        creditDishonoursPercent = (account.Credit_Guideline__r.Dishonours__c == null ? 0 : account.Credit_Guideline__r.Dishonours__c);
        creditDishonoursThresPercent = (account.Credit_Guideline__r.Dishonours_Greater_than_threshold__c == null ? 0 : account.Credit_Guideline__r.Dishonours_Greater_than_threshold__c);
        creditGamblingPercent = (account.Credit_Guideline__r.Gambling__c == null ? 0 : account.Credit_Guideline__r.Gambling__c);
        creditCollectionConsolidationPercent = (account.Credit_Guideline__r.Collection_And_Consolidation__c == null ? 0 : account.Credit_Guideline__r.Collection_And_Consolidation__c);
        creditOverdrawnPercent = (account.Credit_Guideline__r.Overdrawn__c == null ? 0 : account.Credit_Guideline__r.Overdrawn__c);
        creditRentalDefaultPercent = (account.Credit_Guideline__r.Rental_Defaults__c == null ? 0 : account.Credit_Guideline__r.Rental_Defaults__c);
        creditNonRentalDefaultPercent = (account.Credit_Guideline__r.Non_Rental_Defaults__c == null ? 0 : account.Credit_Guideline__r.Non_Rental_Defaults__c);
        creditBankruptcyPercent = (account.Credit_Guideline__r.Bankruptcy_And_Part_10_Agreements__c == null ? 0 : account.Credit_Guideline__r.Bankruptcy_And_Part_10_Agreements__c);
        creditBankruptcyDiscPercent = (account.Credit_Guideline__r.Bankruptcy_Part_10_Agmts_Discharged__c == null ? 0 : account.Credit_Guideline__r.Bankruptcy_Part_10_Agmts_Discharged__c);
        creditPart9Percent = 0;//(account.Credit_Guideline__r.Part_9_Agreements__c == null ? 0 : account.Credit_Guideline__r.Part_9_Agreements__c);
        creditMissedPaymentsPercent = (account.Credit_Guideline__r.No_of_Payments_Missed_Last_6_Payments__c == null ? 0 : account.Credit_Guideline__r.No_of_Payments_Missed_Last_6_Payments__c);
        creditEquifax200Percent = (account.Credit_Guideline__r.Equifax_Score_Less_than_200__c == null ? 0 : account.Credit_Guideline__r.Equifax_Score_Less_than_200__c);
        creditEquifax400Percent = (account.Credit_Guideline__r.Equifax_Score_Less_than_400__c == null ? 0 : account.Credit_Guideline__r.Equifax_Score_Less_than_400__c);
        creditEquifax600Percent = (account.Credit_Guideline__r.Equifax_Score_Less_than_600__c == null ? 0 : account.Credit_Guideline__r.Equifax_Score_Less_than_600__c);
        creditJobseekerThresPercent = (account.Credit_Guideline__r.Jobseeker_less_than_threshold__c == null ? 0 : account.Credit_Guideline__r.Jobseeker_less_than_threshold__c);
        creditJobseekerPercent = (account.Credit_Guideline__r.Jobseeker__c == null ? 0 : account.Credit_Guideline__r.Jobseeker__c);
        creditDebtRatioPercent = (account.Credit_Guideline__r.Debt_vs_Income_ratio_Greater_Than_50__c == null ? 0 : account.Credit_Guideline__r.Debt_vs_Income_ratio_Greater_Than_50__c);
        
        cmDishonoursPercent = 0;
        cmGambilngPercent = 0;
        cmCollectionPercent = 0;
        cmOverdrawnPercent = 0;
        cmNonRentalDefaultPercent = 0;
        cmRentalDefaultPercent = 0;
        cmBankruptcyPercent = 0;
        cmEquifaxPercent = 0;
        cmJobseekerPercent = 0;
        cmDebtRatioPercent = 0;
        cmMissedPaymentsPercent = 0;
        debtIncomePercent = 0;
        isJobseeker = false;
        maxRiskPercent = account.Credit_Guideline__r.Max_Income_Available__c;
        eligiblePercent = maxRiskPercent;
        
        account.Number_Of_Dishonours__c = 0;
        account.Gambling_Expenditure__c = 0;
        account.Collection_and_Consolidation__c = 0;
        account.Overdrawn__c = 0;
        
        List<BankStatement_Generic_Category__c> bankGenCategList = [SELECT Id,Debit_Amount__c,Transaction_Count__c,Name 
                                                                    FROM BankStatement_Generic_Category__c WHERE 
                                                                    Name in ('Dishonours','Gambling','Debt Collection','Debt Consolidation','Overdrawn') AND 
                                                                    BankStatement_R4K_Category__r.Account__c = :account.Id AND CreatedDate = LAST_N_DAYS:30];
        
        for(BankStatement_Generic_Category__c bankGenCateg : bankGenCategList){
            if(bankGenCateg.Name == 'Dishonours'){
                account.Number_Of_Dishonours__c += bankGenCateg.Transaction_Count__c;
            }else if(bankGenCateg.Name == 'Gambling'){
                account.Gambling_Expenditure__c += bankGenCateg.Debit_Amount__c;
            }else if(bankGenCateg.Name == 'Debt Collection' || bankGenCateg.Name == 'Debt Consolidation'){
                account.Collection_and_Consolidation__c += bankGenCateg.Debit_Amount__c;
            }else if(bankGenCateg.Name == 'Overdrawn'){
                account.Overdrawn__c += bankGenCateg.Debit_Amount__c;
            }
        }
        
        if(account.Number_Of_Dishonours__c != null && account.Number_Of_Dishonours__c > 6){
            maxRiskPercent = (maxRiskPercent - creditDishonoursThresPercent);
            redDishonours = true;
            cmDishonoursPercent = creditDishonoursThresPercent;
        }else if(account.Number_Of_Dishonours__c != null && account.Number_Of_Dishonours__c > 0){
            maxRiskPercent = (maxRiskPercent - creditDishonoursPercent);
            redDishonours = true;
            cmDishonoursPercent = creditDishonoursPercent;
        }
        
        if(account.Gambling_Expenditure__c != null && account.Gambling_Expenditure__c > 0){
            maxRiskPercent = (maxRiskPercent - creditGamblingPercent);
            redGambling = true;
            cmGambilngPercent = creditGamblingPercent;
        }
        if(account.Collection_and_Consolidation__c != null && account.Collection_and_Consolidation__c > 0){
            maxRiskPercent = (maxRiskPercent - creditCollectionConsolidationPercent);
            redCollectionConsolidation = true;
            cmCollectionPercent = creditCollectionConsolidationPercent;
        }
        if(account.Overdrawn__c != null && account.Overdrawn__c > 0){
            maxRiskPercent = (maxRiskPercent - creditOverdrawnPercent);
            redOverdrawn = true;
            cmOverdrawnPercent = creditOverdrawnPercent;
        }
        if(account.Equifax_No_of_Unpaid_Default_NonRental__c != null && account.Equifax_No_of_Unpaid_Default_NonRental__c > 0){
            maxRiskPercent = (maxRiskPercent - creditNonRentalDefaultPercent);
            redNonRentalDefault = true;
            cmNonRentalDefaultPercent = creditNonRentalDefaultPercent;
        }
        if(account.Equifax_No_of_Unpaid_Default_Rental__c != null && account.Equifax_No_of_Unpaid_Default_Rental__c > 0){
            maxRiskPercent = (maxRiskPercent - creditRentalDefaultPercent);
            redRentalDefault = true;
            cmRentalDefaultPercent = creditRentalDefaultPercent;
        }
        if(account.Bankruptcy_Part_9_Agreements__c != null && account.Bankruptcy_Part_9_Agreements__c == 'Yes'){
            //creditBankruptcyPercent = (account.Bankruptcy_Status__c != null && account.Bankruptcy_Status__c == 'Discharged' ? creditBankruptcyDiscPercent : creditBankruptcyPercent);
            maxRiskPercent = (maxRiskPercent - creditBankruptcyPercent);
            redBankruptcy = true;
            cmBankruptcyPercent = creditBankruptcyPercent;
        }
        if(account.Score_of_Equifax__c != null && account.Score_of_Equifax__c < 200){
            maxRiskPercent = (maxRiskPercent - creditEquifax200Percent);
            redEquifaxScore = true;
            cmEquifaxPercent += creditEquifax200Percent;
        }
        if(account.Score_of_Equifax__c != null && account.Score_of_Equifax__c < 400){
            maxRiskPercent = (maxRiskPercent - creditEquifax400Percent);
            redEquifaxScore = true;
            cmEquifaxPercent += creditEquifax400Percent;
        }
        if(account.Score_of_Equifax__c != null && account.Score_of_Equifax__c < 600){
            maxRiskPercent = (maxRiskPercent - creditEquifax600Percent);
            redEquifaxScore = true;
            cmEquifaxPercent += creditEquifax600Percent;
        }
        
        if(account.Centrelink_Benefit__c == 'Newstart Allowance / JobSeeker' || account.Centrelink_Benefit2__c == 'Newstart Allowance / JobSeeker' || account.Centrelink_Benefit3__c == 'Newstart Allowance / JobSeeker'){
            isJobseeker = true;
        }
        if(isJobseeker && totalIncomeAmt <= 500){
            maxRiskPercent = (maxRiskPercent - creditJobseekerThresPercent);
            redJobseeker = true;
            cmJobseekerPercent = creditJobseekerThresPercent;
        }else if(isJobseeker && totalIncomeAmt > 500){
            maxRiskPercent = (maxRiskPercent - creditJobseekerPercent);
            redJobseeker = true;
            cmJobseekerPercent = creditJobseekerPercent;
        }
        
        debtIncomePercent = 0;
        if(totalIncomeAmt > 0){
            debtIncomePercent = (((account.Credit_Card__c != null ? account.Credit_Card__c : 0) + (account.Loan_Payments__c != null ? account.Loan_Payments__c : 0)) / totalIncomeAmt) * 100;
            debtIncomePercent = debtIncomePercent.setScale(2);
            if(debtIncomePercent > 50){
                maxRiskPercent = (maxRiskPercent - creditDebtRatioPercent);
                redDebtRatio = true;
                cmDebtRatioPercent = creditDebtRatioPercent;
            }
        }

        if(account.Rent4Keeps_Account__c != null){
            List<UserRecordAccess> rent4KeepsRecordAccess = [SELECT RecordId FROM UserRecordAccess WHERE UserId=:UserInfo.getUserId() AND HasReadAccess = true ANd RecordId =: account.Rent4Keeps_Account__c LIMIT 1];
            if(rent4KeepsRecordAccess.size() > 0){
                hasRent4KeepsRecordAccess = true;
            }
        }
        
        //Missed from last 6 payments
        List<Payment__c> payments =[select id,Name,CreatedDate,Total_Paid__c,ApplicantLookup__r.Payment_Frequncy_Least_Value__c from Payment__c where ApplicantLookup__c=:account.Id and Total_Paid__c>0 order by CreatedDate desc LIMIT 7];
        if(payments.size()>1)
        {
            Date prevDate;
            Date nextDate;
            Integer daysBetweenPrevAndNextDate=0;
            Integer fortnightCounter=0;
            Integer weeklyCounter=0;
            Integer i=0;
            Decimal paymentFrequency=14;
            
            if(payments[0].ApplicantLookup__r.Payment_Frequncy_Least_Value__c!=null && payments[0].ApplicantLookup__r.Payment_Frequncy_Least_Value__c!=0)
                paymentFrequency=payments[0].ApplicantLookup__r.Payment_Frequncy_Least_Value__c;
            else
            {
                List<AggregateResult> minPaymentFrequencyForCompleted=[select min(Payment_Frequency_Number__c) minPF from Opportunity where AccountId=:account.Id and (StageName='Goods Delivered' OR StageName='Written Off / Bad Debt') AND RecordType.Name <> 'Trak SIM'];
                if(minPaymentFrequencyForCompleted.size()>0)
                    paymentFrequency = (Decimal)minPaymentFrequencyForCompleted[0].get('minPF');
                system.debug('pfCompleted: '+paymentFrequency);
            }
            system.debug('paymentFrequency2: '+paymentFrequency);
                
            for(Payment__c pay:payments)
            {
                prevDate= Date.newinstance(pay.CreatedDate.year(), pay.CreatedDate.month(), pay.CreatedDate.day());
                if(i>0)
                {
                    
                    daysBetweenPrevAndNextDate=prevDate.daysBetween(nextDate);
                    system.debug('prevDate: '+prevDate+' nextDate: '+nextDate+' daysBetweenPrevAndNextDate: '+daysBetweenPrevAndNextDate);
                    
                    //if(daysBetweenPrevAndNextDate!=14 && daysBetweenPrevAndNextDate!=7 && i!=payments.size()-1)
                    //    fortnightCounter++;
                    
                    //5 days buffer 12 for weekly and 19 for fortnight
                    if(daysBetweenPrevAndNextDate>12)
                        weeklyCounter++;
                    if(daysBetweenPrevAndNextDate>19)
                        fortnightCounter++;
                }
                
                nextDate= Date.newinstance(pay.CreatedDate.year(), pay.CreatedDate.month(), pay.CreatedDate.day());
                i++;
            }
            system.debug('weeklyCounter: '+weeklyCounter+' fortnightCounter: '+fortnightCounter+' paymentFrequency: '+paymentFrequency);
            
            if(paymentFrequency==14)
            {
                system.debug('pfloop1: ');
                account.CM_No_of_Missed_Payments_Last_6_FN__c=fortnightCounter;
            }
            else
            {
                system.debug('pfloop2: ');
                if(weeklyCounter==payments.size()-1)
                    account.CM_No_of_Missed_Payments_Last_6_FN__c=fortnightCounter;
                else
                    account.CM_No_of_Missed_Payments_Last_6_FN__c=weeklyCounter;
            }
        }
        else
            account.CM_No_of_Missed_Payments_Last_6_FN__c=0;
        ///////////////////////////////////////////////////////////// 
        
        if(account.Rent4Keeps_Account__c != null && (account.Active_Agreements__c > 0 || account.WrittenOff_s_Count__c > 0)){
            //Missed from last 6 payments
            List<Payment__c> r4k_payments =[select id,Name,CreatedDate,Total_Paid__c,ApplicantLookup__r.Payment_Frequncy_Least_Value__c from Payment__c where ApplicantLookup__c=:account.Rent4Keeps_Account__c and Total_Paid__c>0 order by CreatedDate desc LIMIT 7];
            if(r4k_payments.size()>1)
            {
                Date r4k_prevDate;
                Date r4k_nextDate;
                Integer r4k_daysBetweenPrevAndNextDate=0;
                Integer r4k_fortnightCounter=0;
                Integer r4k_weeklyCounter=0;
                Integer r4k_i=0;
                Decimal r4k_paymentFrequency=14;
                
                if(r4k_payments[0].ApplicantLookup__r.Payment_Frequncy_Least_Value__c!=null && r4k_payments[0].ApplicantLookup__r.Payment_Frequncy_Least_Value__c!=0)
                    r4k_paymentFrequency=r4k_payments[0].ApplicantLookup__r.Payment_Frequncy_Least_Value__c;
                else
                {
                    List<AggregateResult> r4k_minPaymentFrequencyForCompleted=[select min(Payment_Frequency_Number__c) minPF from Opportunity where AccountId=:account.Rent4Keeps_Account__c and (StageName='Goods Delivered' OR StageName='Written Off / Bad Debt') AND RecordType.Name <> 'Trak SIM'];
                    if(r4k_minPaymentFrequencyForCompleted.size()>0)
                        r4k_paymentFrequency = (Decimal)r4k_minPaymentFrequencyForCompleted[0].get('minPF');
                    system.debug('pfCompleted: '+r4k_paymentFrequency);
                }
                system.debug('paymentFrequency2: '+r4k_paymentFrequency);
                    
                for(Payment__c pay:r4k_payments)
                {
                    r4k_prevDate= Date.newinstance(pay.CreatedDate.year(), pay.CreatedDate.month(), pay.CreatedDate.day());
                    if(r4k_i>0)
                    {
                        
                        r4k_daysBetweenPrevAndNextDate=r4k_prevDate.daysBetween(r4k_nextDate);
                        system.debug('prevDate: '+r4k_prevDate+' nextDate: '+r4k_nextDate+' daysBetweenPrevAndNextDate: '+r4k_daysBetweenPrevAndNextDate);
                        
                        //if(daysBetweenPrevAndNextDate!=14 && daysBetweenPrevAndNextDate!=7 && i!=payments.size()-1)
                        //    fortnightCounter++;
                        
                        //5 days buffer 12 for weekly and 19 for fortnight
                        if(r4k_daysBetweenPrevAndNextDate>12)
                            r4k_weeklyCounter++;
                        if(r4k_daysBetweenPrevAndNextDate>19)
                            r4k_fortnightCounter++;
                    }
                    
                    r4k_nextDate= Date.newinstance(pay.CreatedDate.year(), pay.CreatedDate.month(), pay.CreatedDate.day());
                    r4k_i++;
                }
                system.debug('weeklyCounter: '+r4k_weeklyCounter+' fortnightCounter: '+r4k_fortnightCounter+' paymentFrequency: '+r4k_paymentFrequency);
                
                if(r4k_paymentFrequency==14)
                {
                    system.debug('pfloop1: ');
                    account.CM_No_of_Missed_Payments_Last_6_FN__c += r4k_fortnightCounter;
                }
                else
                {
                    system.debug('pfloop2: ');
                    if(r4k_weeklyCounter==payments.size()-1)
                        account.CM_No_of_Missed_Payments_Last_6_FN__c += r4k_fortnightCounter;
                    else
                        account.CM_No_of_Missed_Payments_Last_6_FN__c += r4k_weeklyCounter;
                }
            }
        }
        
        if(account.CM_No_of_Missed_Payments_Last_6_FN__c > 0){
            maxRiskPercent = (maxRiskPercent - creditMissedPaymentsPercent);
            redNoOfMissedPayments = true;
            cmMissedPaymentsPercent += creditMissedPaymentsPercent;
        }
        
        eligiblePercent = (maxRiskPercent > 0 ? maxRiskPercent : 0);
        if(account.Serviceability__c < eligiblePercent){
            eligiblePercent = account.Serviceability__c;
        }
        maxFnAmt = (eligiblePercent > 0 ? ((eligiblePercent / 100) * totalIncomeAmt) : 0).setScale(2);
        System.debug('****maxRiskPercent ' + maxRiskPercent);
        System.debug('****maxFnAmt ' + maxFnAmt);
        
        account.CM_Scheduled_Amount__c = maxFnAmt;
        if(account.Equifax_No_of_Unpaid_Default_Rental__c==null || account.Equifax_No_of_Unpaid_Default_Rental__c==0){
            vedaRentalDefault='Yes';
        }else{
            vedaRentalDefault='No';
        } 
        if(account.Equifax_No_of_Unpaid_Default_NonRental__c==null || account.Equifax_No_of_Unpaid_Default_NonRental__c==0){
            vedaNonRentalDefault='Yes';
        }else{
            vedaNonRentalDefault='No';    
        }
        if(eligiblePercent > 0){
            account.CM_Serviceable__c='Yes';
        }else{
            account.CM_Serviceable__c='No';
            redServiceability = true;
        }
        
        if(account.Rent4Keeps_Payment_C__c!=null && account.CM_Scheduled_Amount__c!=null && account.Rent4Keeps_Payment_C__c>account.CM_Scheduled_Amount__c){
            redAny=true;
            redScheduledAmount=true;
        }else{
            redScheduledAmount=false;
        }
        
        if(!redScheduledAmount){
            redAny = false;
            redDishonours = false;
            redGambling = false;
            redCollectionConsolidation = false;
            redOverdrawn = false;
            redNonRentalDefault = false;
            redRentalDefault = false;
            redBankruptcy = false;
            redEquifaxScore = false;
            redJobseeker = false;
            redDebtRatio = false;
            redServiceability = false;
            redNoOfMissedPayments = false;
        }
            
        account.CM_Equifax_Non_Rental_Default__c = vedaNonRentalDefault;
        account.CM_Equifax_Rental_Default__c = vedaRentalDefault;
        account.CM_Combined_Dollar_Exposure__c = 0;
        account.CM_No_of_Days_Missed_Since_Last_Payments__c=0;
        
        System.debug('account.Id ' + account.Id);
        System.debug('account.Rent4Keeps_Payment_C__c ' + account.Rent4Keeps_Payment_C__c);
        account.Avg_No_of_Days_for_Income_Depletion__c = AccountUtil.getAverageDaysToDepleteTheIncome(account.Id, (account.Rent4Keeps_Payment_C__c != null ? account.Rent4Keeps_Payment_C__c : 0));
        System.debug('account.Avg_No_of_Days_for_Income_Depletion__c ' + account.Avg_No_of_Days_for_Income_Depletion__c);
    }catch(Exception ex){
        ErrorLog.addErrorLog('CAMProcessController','checkRisk',account.Id,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public PageReference approveApproval()
{
    Opportunity oppToUp = new Opportunity();
    oppToUp.Id = approvalOpp.Id;
    oppToUp.AF_CA_CC_Processed_Date__c = Date.today();  
    oppToUp.Approval_Status__c = 'Approved'; 
    oppToUp.Approval_DateTime__c = DateTime.now();
    oppToUp.AF_CA_Credit_Officer_Name__c = lineManagerName;
    oppToUp.AF_CA_Final_Comments__c = lineManagerComments;
    update oppToUp;
    
    approvalStatus = 'Approved';
    
    attachCreditMatrixPDF(approvalOpp.Id, 'approval', approvalStatus);  
    
    List<Case> caseList=[select id from Case where Opportunity_Name__c=:approvalOpp.Id and (Subject Like 'Credit Approval Request%' or Subject Like 'Compliance Review Request%' or Subject like '%Approval Request for -%')];
    if(caseList.size()>0)
    {
        Case cas = new Case();
        cas.Id=caseList[0].Id;
        cas.Status='Closed';
        update cas;
        
        system.debug('cas.Id: '+cas.Id+' cas.Status: '+cas.Status);
    }

    return new PageReference('/apex/AuditCompletePage?id='+approvalOpp.Id+'&param=a');
}

public PageReference declineApproval()
{
    Opportunity oppToUp = new Opportunity();
    oppToUp.Id = approvalOpp.Id;
    oppToUp.AF_CA_CC_Processed_Date__c = Date.today();
    oppToUp.Approval_Status__c = 'Declined';
    oppToUp.AF_CA_Credit_Officer_Name__c = lineManagerName;
    oppToUp.AF_CA_Final_Comments__c = lineManagerComments;
    update oppToUp;
    
    approvalStatus = 'Declined';
    
    attachCreditMatrixPDF(approvalOpp.Id, 'approval', approvalStatus);  

    List<Case> caseList=[select id from Case where Opportunity_Name__c=:approvalOpp.Id and (Subject Like 'Credit Approval Request%' or Subject Like 'Compliance Review Request%' or Subject like '%Approval Request for -%')];
    if(caseList.size()>0)
    {
        Case cas = new Case();
        cas.Id=caseList[0].Id;
        cas.Status='Closed';
        update cas;
        
        system.debug('cas.Id: '+cas.Id+' cas.Status: '+cas.Status);
    }
        
    return new PageReference('/apex/AuditCompletePage?id='+approvalOpp.Id+'&param=d');
}

public PageReference resubmitApproval()
{
    Opportunity oppToUp = new Opportunity();
    oppToUp.Id = approvalOpp.Id;
    oppToUp.AF_CA_CC_Processed_Date__c = Date.today();
    oppToUp.Approval_Status__c = 'Re-Submit';
    oppToUp.Resubmit__c = (approvalOpp.Resubmit__c == null ? 1 : (approvalOpp.Resubmit__c + 1));
    oppToUp.AF_CA_Credit_Officer_Name__c = lineManagerName;
    oppToUp.AF_CA_Final_Comments__c = lineManagerComments;
    update oppToUp;
    
    approvalStatus = 'Re-Submit';
    
    attachCreditMatrixPDF(approvalOpp.Id, 'approval', approvalStatus);  

    List<Case> caseList=[select id from Case where Opportunity_Name__c=:approvalOpp.Id and (Subject Like 'Credit Approval Request%' or Subject Like 'Compliance Review Request%' or Subject like '%Approval Request for -%')];
    if(caseList.size()>0)
    {
        Case cas = new Case();
        cas.Id=caseList[0].Id;
        cas.Status='Closed';
        update cas;
        
        system.debug('cas.Id: '+cas.Id+' cas.Status: '+cas.Status);
    }
       
    return new PageReference('/apex/AuditCompletePage?id='+approvalOpp.Id+'&param=r');
}

public void attachCreditMatrixPDF(String recordId, String pdfType, String recordApprovalStatus)
{
    List<Opportunity> recordList = [select id,AccountId,Account.Product_Category_Selected__c,Account.Product_Name_for_Agreement__c,Account.Product_COGS_for_Agreement__c,
                                            Account.Product_Term_for_Agreement__c,Account.Rent4Keeps_Payment_C__c,Account.CM_Scheduled_Amount__c,CM_Scheduled_Amount_Comments__c,
                                            Account.Name,Account.Customer_No__c,Name,Contract_No__c,Credit_Guideline__c,Credit_Guideline__r.Name,Account.Territory_Number__r.State_Master_State__c,
                                            Account.Territory_Number__c,Account.Territory_Number__r.Company_Territory__c,Account.Territory_Number__r.Short_Name__c,Approval_Status__c, 
                                            Account.Rep_Responsible_For_Converting_Lead__r.Name,Account.Rep_Responsible_For_Converting_Lead__c,Rep_Name__r.Name,Rep_Name__c,
                                            Rep_Name__r.Not_Eligible_for_Auto_Approval__c,CM_Reason_to_go_forward__c,Answers_To_Credit_Officer_Comments__c,CM_Dishonours__c,
                                            CM_Gambling__c,CM_Collection_And_Consolidation__c,CM_Overdrawn__c,CM_Jobseeker__c,CM_Debt_vs_Income_Ratio_Greater_Than_50__c,Resubmit__c,
                                            CM_OutstandingDefRental_Comp_Comments__c,CM_OutstandingDefNonRental_Comp_Comments__c,CM_Equifax_Score_Comments__c,CM_Bankruptcy_Part_9_Agreements_Comments__c,
                                            CM_Missed_from_last_6_FN_pymts_Comments__c,AF_CA_Final_Comments__c,AF_CA_Credit_Officer_Name__c,Credit_Guideline__r.Line_Manager_Full_Name__c                                           
                                            from Opportunity where id=:recordId LIMIT 1];
    if(recordList.size() > 0){
        approvalOpp = recordList[0];
        List<Attachment> creditMatrixList = [SELECT Id,Name,Body FROM Attachment WHERE (Name LIKE 'Credit_Matrix_%' OR Name LIKE 'RAM_%') AND ParentId =: recordList[0].Id];
        if(creditMatrixList.size() > 0)
        {
            delete creditMatrixList;
        }
        
        //Attach the Credit Matrix in Opportunity
        Datetime todaysDate = Datetime.now();
        String dateOutput = todaysDate.format('ddMMMyyyy');
        
        PageReference pdf;
        
        if(pdfType == 'approval'){
            pdf = new PageReference('/apex/RAMApprovalPDFPage?oppId='+recordList[0].Id+'&approvalStatus='+recordApprovalStatus);
        }else{
            pdf = new PageReference('/apex/RAMApprovalPDFPage?oppId='+recordList[0].Id+'&approvalStatus='+recordApprovalStatus);
        }
        
        Blob creditMatrixBody;
        try {
         creditMatrixBody = pdf.getContentAsPDF();  
        } catch (VisualforceException e) {
            creditMatrixBody = Blob.valueOf('Some Text');
        }
        
        Attachment creditMatrixAttach = new Attachment();
        creditMatrixAttach.ParentId = recordList[0].Id;
        creditMatrixAttach.name = 'RAM_'+recordList[0].Name+'_'+dateOutput+'.pdf';
        creditMatrixAttach.body=creditMatrixBody;
        insert creditMatrixAttach; 
    }
}

public String oppId{get;set;}
public Decimal maxRiskPercent{get;set;}
public Decimal eligiblePercent{get;set;}
public Decimal debtIncomePercent{get;set;}
public Decimal maxFnAmt{get;set;}
public Boolean isJobseeker{get;set;}
public List<String> territoryNamesWithRecordAccess{get;set;}
public Boolean hasRent4KeepsRecordAccess{get;set;}

public String lineManagerName{get;set;}
public String lineManagerComments{get;set;}

public Decimal creditDishonours6Percent{get;set;}
public Decimal creditEquifax200Percent{get;set;}
public Decimal creditEquifax400Percent{get;set;}
public Decimal creditEquifax600Percent{get;set;}
public Decimal creditJobseekerThresPercent{get;set;}
public Decimal creditJobseekerPercent{get;set;}
public Decimal creditDebtRatioPercent{get;set;}
public Decimal creditDishonoursPercent{get;set;}
public Decimal creditDishonoursThresPercent{get;set;}
public Decimal creditGamblingPercent{get;set;}
public Decimal creditCollectionConsolidationPercent{get;set;}
public Decimal creditOverdrawnPercent{get;set;}
public Decimal creditRentalDefaultPercent{get;set;}
public Decimal creditNonRentalDefaultPercent{get;set;}
public Decimal creditBankruptcyPercent{get;set;}
public Decimal creditBankruptcyDiscPercent{get;set;}
public Decimal creditPart9Percent{get;set;}
public Decimal creditMissedPaymentsPercent{get;set;}

public Decimal cmDishonoursPercent{get;set;}
public Decimal cmGambilngPercent{get;set;}
public Decimal cmCollectionPercent{get;set;}
public Decimal cmOverdrawnPercent{get;set;}
public Decimal cmNonRentalDefaultPercent{get;set;}
public Decimal cmRentalDefaultPercent{get;set;}
public Decimal cmBankruptcyPercent{get;set;}
public Decimal cmEquifaxPercent{get;set;}
public Decimal cmJobseekerPercent{get;set;}
public Decimal cmDebtRatioPercent{get;set;}
public Decimal cmMissedPaymentsPercent{get;set;}

public Boolean redDishonours{get;set;}
public Boolean redGambling{get;set;}
public Boolean redCollectionConsolidation{get;set;}
public Boolean redOverdrawn{get;set;}
public Boolean redNonRentalDefault{get;set;}
public Boolean redRentalDefault{get;set;}
public Boolean redJobseeker{get;set;}
public Boolean redDebtRatio{get;set;}

public List<Collection_Activity__c> lastCollectionActivities{get;set;}
public Decimal actualArrearsOriginal{get;set;}
public Decimal actualArrears{get;set;}
public Decimal actualArrearsAfterVariation{get;set;}
public String appStatusType{get;set;}
public Boolean isVariation{get;set;}

public Decimal totalRemainingAmountDefaults{get;set;}
public Boolean showReasonForNotApprovable{get;set;}
public String repMobile{get;set;}
public String repName{get;set;}
public Employee__c repEmployee{get;set;}
public Map<String,Employee__c> employeeMap{get;set;}
public String answersToCreditOfficerComments{get;set;}
public Boolean showAnswersToCreditOfficerComments{get;set;}
public Boolean approvalSent {get;set;}
public Boolean approvalSentToLineManager {get;set;}
public Boolean errorMessage {get;set;}
public Boolean approvalApproved {get;set;}
public String approvalNumber {get;set;}
public String approvalOfficerName{get;set;}
public String approvalStatus{get;set;}
public String currentApprovalStatus{get;set;}
public Boolean showRepAutoEligibleMessage{get;set;}
public Boolean showApprovalScreen{get;set;}
public String selectedRepName{get;set;}
public SelectOption[] repNames { 
    public get;
    private set;
}
public class TestException extends Exception {} 
public class AttachmentWrapper
{
    public String id {get;set;}
    public String name {get;set;}
    public String url {get;set;}
    public String type {get;set;}
}

public Boolean resetHybridLinkId{get;set;}
public Boolean resetHybridLinkBank{get;set;}
public Boolean resetHybridLinkMygov{get;set;}

public Boolean resetLinkId{get;set;}
public Boolean resetLinkBank{get;set;}
public Boolean resetLinkMygov{get;set;}
public Boolean resetLinkBasic{get;set;}
public Boolean resetLinkIncome{get;set;}
public Boolean resetLinkExpense{get;set;}
public Boolean resetLinkReferees{get;set;}
public Boolean resetLinkRO{get;set;}
public Boolean resetLinkEquifax{get;set;}

public Boolean sendMOGOBankSMS{get;set;}
public Boolean sendMOGOMyGovSMS{get;set;}
}