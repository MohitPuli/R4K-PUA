/*
 * Generic utility methods.
 *
 * @Author: System Partners
 */
public class Util {
    
    /*
     * utility method to get a list of record type developer name and record type pairs.
     */
    public static Map<String, RecordType> getRecordTypeInfosByDeveloperName(String objectType) {
        Map<String, RecordType> result = new Map<String, RecordType>();

        if(objectType == null || objectType == '')
            return result;

        List<RecordType> recordTypes = 
            [select  Id,
                     Name, 
                     DeveloperName, 
                     NamespacePrefix, 
                     Description, 
                     BusinessProcessId, 
                     SobjectType, 
                     IsActive, 
                     IsPersonType, 
                     CreatedById, 
                     CreatedDate, 
                     LastModifiedById, 
                     LastModifiedDate, 
                     SystemModstamp 
            from     RecordType            
            where    SobjectType= :objectType];
      
        for(RecordType recordType :recordTypes)
            result.put(recordType.DeveloperName, recordType);
        
        return result;
    }
    
    public static Boolean isOutOfBusinessHours(String stateMasterState, Time terBotStartTime, Time terBotFinishTime)
    {
        Decimal gmtVal = 10;//daylight saving 10-VIC, 9.5-SA, 12-NZ //After Oct 11-VIC, 10.5-SA, 13-NZ
        Datetime currentTimeGMTVal = Datetime.now();
        Time currentLocalTime = currentTimeGMTVal.timeGMT().addHours(10);
        Datetime currentLocalDatetime = currentTimeGMTVal.addHours(10);
        if(stateMasterState=='SA')
        {
            currentLocalTime = currentTimeGMTVal.timeGMT().addHours(9).addMinutes(30);
            currentLocalDatetime = currentTimeGMTVal.addHours(9).addMinutes(30);
        }
        else if(stateMasterState=='NZ')
        {
            currentLocalTime = currentTimeGMTVal.timeGMT().addHours(12);
            currentLocalDatetime = currentTimeGMTVal.addHours(12);
        }
        String currentDay = currentTimeGMTVal.format('EEEE');
        Integer currentLocalHour = currentLocalTime.hour();
        Integer currentLocalMinute = currentLocalTime.minute();
        Boolean isOutOfBusinessHours = false;
        Boolean isValidTimeToCall = false;
        system.debug('currentLocalTime: '+currentLocalTime+' currentLocalHour: '+currentLocalHour+' currentLocalDatetime: '+currentLocalDatetime);
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
        }
        isOutOfBusinessHours = (isValidTimeToCall==false || currentDay=='Saturday' || currentDay=='Sunday') ? true : false;
        return isOutOfBusinessHours;
    }
    
    public static Datetime getStateTimeZoneDatetime(String state, Datetime dateTimeVal)
    {
        Integer gmtVal = 10;//daylight saving 10-VIC, 9.5-SA, 12-NZ 8-WA //After Oct 11-VIC, 10.5-SA, 13-NZ 8-WA
        Datetime currentTimeGMTVal = dateTimeVal;
        System.debug(currentTimeGMTVal);
        System.debug(state);
        Integer month = currentTimeGMTVal.Month();
        if(month==10 || month==11 || month==12 || month==1 || month==2 || month==3)
            gmtVal = 11;
        Datetime currentLocalDatetime = currentTimeGMTVal.addHours(gmtVal);
        if(state=='SA')
        {
            if(gmtVal==10)
                currentLocalDatetime = currentTimeGMTVal.addHours(9).addMinutes(30);
            else
                currentLocalDatetime = currentTimeGMTVal.addHours(10).addMinutes(30);
        }
        else if(state=='NZ')
        {
            if(gmtVal==10)
                currentLocalDatetime = currentTimeGMTVal.addHours(12);
            else
                currentLocalDatetime = currentTimeGMTVal.addHours(13);
        }
        else if(state=='WA')
        {
            currentLocalDatetime = currentTimeGMTVal.addHours(8);
        }
        else if(state=='NT')
        {
            if(gmtVal==10)
                currentLocalDatetime = currentTimeGMTVal.addHours(9).addMinutes(30);
            else
                currentLocalDatetime = currentTimeGMTVal.addHours(10).addMinutes(30);
        }
        System.debug(gmtVal);
        System.debug(currentLocalDatetime);
        return currentLocalDatetime;
    }
    
    public static Datetime getStateTimeZoneDatetimeToAddInput(String state, Datetime dateTimeVal)
    {
        Integer gmtVal = 10;//daylight saving 10-VIC, 9.5-SA, 12-NZ 8-WA //After Oct 11-VIC, 10.5-SA, 13-NZ 8-WA
        Datetime currentTimeGMTVal = dateTimeVal;
        System.debug(currentTimeGMTVal);
        System.debug(state);
        Integer month = currentTimeGMTVal.Month();
        if(month==10 || month==11 || month==12 || month==1 || month==2 || month==3)
            gmtVal = 11;
        Datetime currentLocalDatetime = currentTimeGMTVal.addHours(gmtVal);
        if(state=='SA')
        {
            if(gmtVal==10)
                currentLocalDatetime = currentTimeGMTVal.addHours(-9).addMinutes(-30);
            else
                currentLocalDatetime = currentTimeGMTVal.addHours(-10).addMinutes(-30);
        }
        else if(state=='NZ')
        {
            if(gmtVal==10)
                currentLocalDatetime = currentTimeGMTVal.addHours(-12);
            else
                currentLocalDatetime = currentTimeGMTVal.addHours(-13);
        }
        else if(state=='WA')
        {
            currentLocalDatetime = currentTimeGMTVal.addHours(-8);
        }
        else if(state=='NT')
        {
            if(gmtVal==10)
                currentLocalDatetime = currentTimeGMTVal.addHours(-9).addMinutes(-30);
            else
                currentLocalDatetime = currentTimeGMTVal.addHours(-10).addMinutes(-30);
        }
        System.debug(gmtVal);
        System.debug(currentLocalDatetime);
        return currentLocalDatetime;
    }
    
    public static String getObjectApiNameFromId(Id recordId) {
    if (recordId != null) {
        String keyPrefix = String.valueOf(recordId).substring(0, 3);
        Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
        for (Schema.SObjectType objectType : globalDescribe.values()) {
            Schema.DescribeSObjectResult dsr = objectType.getDescribe();
            if (keyPrefix.equalsIgnoreCase(dsr.getKeyPrefix())) {
                return dsr.getName();
            }
        }
    }
    return null;
}

public static String getRentalCalculation(String country, Decimal loanAmt, Decimal fees, String term, String paymentFrequency)
{
    Decimal factor = 1.550943;
    Decimal rent=0;
    Decimal tav = 0;
    Decimal slots = 0;
    if(country=='NZ')
    {
        if(term=='24'){
            slots = 52;
            if(paymentFrequency=='Fortnightly')
            {
                factor = 1.550943;
                rent=((loanAmt * factor)/52).setScale(2, RoundingMode.HALF_UP);
                tav = rent*slots;
            }
            else if(paymentFrequency=='Weekly')
            {
                factor = 1.546767;
                rent=((loanAmt * factor)/104).setScale(2, RoundingMode.HALF_UP);
                tav = rent*slots*2;
            }
        }
        else if(term=='36')
        {
            slots = 78;
            if(paymentFrequency=='Fortnightly')
            {
                factor = 1.873100;
                rent=((loanAmt * factor)/78).setScale(2, RoundingMode.HALF_UP);
                tav = rent*slots;
            }
            else if(paymentFrequency=='Weekly')
            {
                factor = 1.869269;
                rent=((loanAmt * factor)/156).setScale(2, RoundingMode.HALF_UP);
                tav = rent*slots*2;
            }
        }
        
        String result='{\"tav\":'+tav+',\"rent\":'+rent+'}';
        return result;
    }
    else
    {
        return calculateAPR(loanAmt, fees, Decimal.valueOf(term),paymentFrequency);
    }
    return null;
}

public static String calculateAPR(Decimal principal,Decimal feeAndCharges,Decimal term,String paymentFrequency) {
Decimal apr = 0.05; // Initial APR
Decimal applicationFee = 99;
Decimal deliveryFee = 80;
Decimal adminFee = 5 * term;
Decimal fees = feeAndCharges==null ? 0 : feeAndCharges;
Integer payments = paymentFrequency == 'Weekly' ? (term == 13 ? 56 : term==18 ? 78 : term==24 ? 104 :156) : (term == 13 ? 28 : term==18 ? 39 : term==24 ? 52 :78);
Integer yearlySlot = paymentFrequency == 'Weekly' ? 52 : 26;
Decimal mavFNWeeklyValue = 0.47/yearlySlot; 
Decimal startingBalanceIncludingGST = principal + fees;
Decimal startingBalanceLessGST = principal + (fees) / 1.1;

Decimal pmtLessGST = Util.PMT(Double.valueOf(apr / yearlySlot), payments, Double.valueOf(startingBalanceLessGST),0,0);
Decimal tav1 = pmtLessGST * payments;

Decimal maxSchedulePayment;
Decimal maxTav;


if(startingBalanceIncludingGST > 2000 && startingBalanceIncludingGST < 5000 && term <= 24) {
    maxSchedulePayment = Util.PMT(Double.valueOf(mavFNWeeklyValue), payments, Double.valueOf(principal),0,0) + 400.00/payments;
    maxTav = maxSchedulePayment * payments;
}
else
{
    maxSchedulePayment = Util.PMT(Double.valueOf(mavFNWeeklyValue) , payments, Double.valueOf(principal),0,0);
    maxTav = maxSchedulePayment * payments;
}
system.debug('startingBalanceIncludingGST: '+startingBalanceIncludingGST+' startingBalanceLessGST: '+startingBalanceLessGST+' pmtLessGST: '+pmtLessGST +' tav1: '+tav1+' maxTav: '+maxTav+' maxSchedulePayment: '+maxSchedulePayment +' absDiff: '+Math.abs(maxTav - tav1)+' payments: '+payments+' yearlySlot: '+yearlySlot+' fees: '+fees);

Integer count =0;
while ((tav1+50)<maxTav) {
//console.log(count+' apr: '+apr +' tav1: '+tav1);
apr = apr+ 0.01;

pmtLessGST = Util.PMT(Double.valueOf(apr / yearlySlot), payments, Double.valueOf(startingBalanceLessGST),0,0);
tav1 = pmtLessGST * payments;
count++;
}

count=0;
Boolean getPrecisionValue=false;
while ((tav1+1)<maxTav) { 

apr = apr+ 0.001; // Increment APR

pmtLessGST = Util.PMT(Double.valueOf(apr / yearlySlot), payments, Double.valueOf(startingBalanceLessGST),0,0);
tav1 = pmtLessGST * payments;

system.debug(count+' apr: '+apr +' tav1: '+tav1);
if(tav1>maxTav)
{
    apr = apr- 0.001;
    pmtLessGST = Util.PMT(Double.valueOf(apr / yearlySlot), payments, Double.valueOf(startingBalanceLessGST),0,0);
    tav1 = pmtLessGST * payments;
    system.debug(count+' apr: '+apr +' tav1: '+tav1);
    getPrecisionValue = true;
    break;
}
count++;
}

if(getPrecisionValue)
{
    count=0;
    while ((tav1+0.1)<maxTav) { 
    apr = apr+ 0.0001; 
    
    pmtLessGST = Util.PMT(Double.valueOf(apr / yearlySlot), payments, Double.valueOf(startingBalanceLessGST),0,0);
    tav1 = pmtLessGST * payments;
    
    system.debug(count+' apr: '+apr +' tav1: '+tav1);
    count++;
    }
}

Decimal finalAPR = apr>0.47 ? 0.47 : apr;
Decimal scheduledPayment = Util.PMT(Double.valueOf(finalAPR / yearlySlot), payments, Double.valueOf(startingBalanceIncludingGST),0,0);
Decimal finalTav = scheduledPayment * payments;
system.debug('finalAPR: '+finalAPR +' scheduledPayment: '+scheduledPayment+' finalTav: '+finalTav);
return ('{\"apr\":'+finalAPR.setScale(4)+',\"tav\":'+finalTav.setScale(2)+',\"rent\":'+scheduledPayment.setScale(2)+'}');

}

public static Decimal PMT(Double rate, Integer nper, Double pv, Integer fv, Integer type) {
fv = 0;
type = 0;
Decimal pmt = rate * (pv * Math.pow(1 + rate, nper) + fv) / (1 + rate * type) / (Math.pow(1 + rate, nper) - 1);
return pmt;
}

public static String getFees(Decimal cashPrice,Decimal termInMonths) {
    Decimal applicationFee = cashPrice > 300 ? 99 : 0;
    Decimal adminFee = cashPrice > 700 ? 5 * termInMonths + 80 : cashPrice > 500 ? 5 * termInMonths : 0;
    Decimal deliveryFee = 0;
    Decimal totalFees = applicationFee + adminFee + deliveryFee;
    
    return ('{\"applicationFee\":'+applicationFee.setScale(2)+',\"adminFee\":'+adminFee.setScale(2)+',\"deliveryFee\":'+deliveryFee.setScale(2)+',\"totalFees\":'+totalFees.setScale(2)+'}'); 
}

public static String getComparisonRates(Double cashPrice, Double termInYrs, List<ComparisonRate__c> crs)
{
    Decimal CR24M=0, CR36M=0, Distance=0, CRAmount=0, CRTerm=0;
    Double exponent = 2.0;
    Map<Decimal,ComparisonRate__c> mapCR = new Map<Decimal,ComparisonRate__c>();
    
    if(crs==null || crs.size()==0)
        crs = [select Name, Term__c, CR_24_months__c,CR_36_months__c from ComparisonRate__c];
    if(crs.size()>0)
    {
        Integer count=0;
        for(ComparisonRate__c cr: crs)
        {
            Double amount = cashPrice - Double.valueOf(cr.Name);
            Double term =  termInYrs - Double.valueOf(cr.Term__c);
            Decimal currentCRDistance = Math.sqrt(Math.pow(amount,exponent) + Math.pow(term,exponent));
            Distance = count==0 ? currentCRDistance : Math.min(Distance,currentCRDistance);
            mapCR.put(currentCRDistance,cr);
            count++;
        }
        
        CR24M = mapCR.get(Distance).CR_24_months__c;
        CR36M = mapCR.get(Distance).CR_36_months__c;
        CRAmount = Decimal.valueOf(mapCR.get(Distance).Name);
        CRTerm = mapCR.get(Distance).Term__c;
    }
    
    return ('{\"Distance\":'+Distance.setScale(2)+',\"CRAmount\":'+CRAmount.setScale(2)+',\"CRTerm\":'+CRTerm.setScale(2)+',\"CR24M\":'+CR24M.setScale(2)+',\"CR36M\":'+CR36M.setScale(2)+'}'); 
}

public static Decimal getOnlineTransactionFeePercent(Decimal cashPrice)
{
    Decimal percentSurcharge=0;
    Decimal webEstablishmentFee = 0.44;
    Decimal webTransactionFee = 0.014;
    
    Decimal finalPrice = (cashPrice + 0.44) * (1+webTransactionFee);
    percentSurcharge = (finalPrice - cashPrice)*100/cashPrice;
    
    return percentSurcharge.setScale(2);
}

public static Account createApplicant(Lead ld, String empId, String enquiryStatus,String personAccountRecordTypeId,String creditGuidelinesId, String twilioPersonName)
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
    }
    else if(enquiryStatus=='DNP - Did Not Proceed')
    {
        String currentDateStr = Datetime.now().format('dd-MM-yyyy');
        accountToUp.Reason_why_application_did_not_go_ahead__c = 'Applicant Withdrew the application using Engagement Bot by Rene'+' on '+currentDateStr;
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
    accountToUp.Customer_No__c = currentCustomerNo;
    update accountToUp;
    }
    //////////////////
    return accountToUp;
}

public static String generateSHA256String(String strValue)
{
    Blob strBlob = Blob.valueOf(strValue);
    Blob strsha256Blob = Crypto.generateDigest('SHA-256', strBlob);
    String strSha256String = EncodingUtil.convertToHex(strsha256Blob);
    return strSha256String;
}

public static String GetUserIPAddress() {
    string ReturnValue = '';

    ReturnValue = ApexPages.currentPage().getHeaders().get('True-Client-IP');
    system.debug('USER IP ADDRESS 2: ' + ReturnValue);
            
    if (ReturnValue == '' || ReturnValue==null) {
        ReturnValue = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
    } 
            
    system.debug('USER IP ADDRESS: ' + ReturnValue);
        
    return ReturnValue;
        
}

public static Integer getTimeDifferenceBetweenUsers(String timeZone1, String timeZone2) {
    // Retrieve TimeZone details for both users
    TimeZone tz1 = TimeZone.getTimeZone(timeZone1);
    TimeZone tz2 = TimeZone.getTimeZone(timeZone2);

    // Calculate the difference in milliseconds
    Integer differenceInMillis = tz1.getOffset(DateTime.now()) - tz2.getOffset(DateTime.now());

    // Convert to minutes
    Integer minutesDifference = (Integer)Math.ceil(differenceInMillis / (1000 * 60));

    System.debug('##minutesDifference ' + minutesDifference);
    return minutesDifference;
}

}