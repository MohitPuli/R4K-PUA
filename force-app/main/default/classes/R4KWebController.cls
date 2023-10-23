public class R4KWebController
{
public String fname {get;set;}
public String lname {get;set;}
public String email {get;set;}
public String mobile {get;set;}
public String street {get;set;} 
public String suburb {get;set;} 
public String state {get;set;} 
public String postcode {get;set;} 
public Decimal latitude {get;set;} 
public Decimal longitude {get;set;} 
public String country {get;set;} 
public String productName {get;set;}
public String crn {get;set;} 
public String reasonForEnquiry {get;set;} 
public String howDidYouHear {get;set;}
public String natureOfEnquiry {get;set;}  
public String formType {get;set;} 
public String webURL {get;set;} 
public String onlineURL {get;set;} 
public Lead lead {get;set;}

public String acctId {get;set;}
public String ldId {get;set;}
public String pid {get;set;}
public String pname {get;set;}

public String prodId {get;set;}
public Product_Inventory__c product {get;set;}
public Product_Warehouse__c productWarehouse {get;set;}
public List<Product_Inventory__c> products {get;set;}
public List<Cart_Item__c> cartItems {get;set;}
public Decimal buyNowAmt {get;set;} 
public Decimal weeklyAmt {get;set;} 

public Boolean submissionError{get;set;}
public Boolean fnameMissing{get;set;}
public Boolean lnameMissing{get;set;}
public Boolean emailMissing{get;set;}
public Boolean mobileMissing{get;set;}
public Boolean streetMissing{get;set;}
public Boolean suburbMissing{get;set;}
public Boolean stateMissing{get;set;}
public Boolean postcodeMissing{get;set;}
public Boolean reasonForEnquiryMissing{get;set;}
public Boolean optIn{get;set;}
public String webCountry{get;set;}

public String userAgent{get;set;}
public String gcid{get;set;}
public String searchEngine{get;set;}
public String deviceInfo{get;set;}
public String campaign{get;set;}
public String gaMedium{get;set;}
public Integer noOfPagesVisited{get;set;}
public Integer noOfUniquePagesVisited{get;set;}
public Decimal timeSpentOnWeb{get;set;}
public String gaKeyword{get;set;}
public String pagesVisited{get;set;}
public String ipAddress{get;set;}

public Decimal quantity{get;set;}
public String deliveryCost{get;set;}
public Decimal deliveryCostAmt{get;set;}
public Decimal totalRRP{get;set;}
public Decimal totalDeliveryCost{get;set;}
public Decimal totalPayableAmt{get;set;}
public Territory__c retailTerritory{get;set;}
public Boolean firstProduct{get;set;}
public String quantityMessage{get;set;}
public Integer productsDeliverableCount{get;set;}
public Decimal transactionFee{get;set;}
public Decimal transactionFeePercent{get;set;}

public String paymentReference{get;set;}
public Boolean paymentSuccess{get;set;}
public String paymentResultText{get;set;}

public R4KWebController(){
    //webURL =  '/apex'; //SiteEndpoint__c.getValues('R4KWeb').URL__c; //'/apex';
    //onlineURL = '/apex'; //SiteEndpoint__c.getValues('Online').URL__c; //'/apex';
    webURL =  SiteEndpoint__c.getValues('R4KWeb').URL__c; //'/apex';
    onlineURL = SiteEndpoint__c.getValues('Online').URL__c; //'/apex';
}
        
public void initR4KWeb(){
    try{
        formType = ApexPages.CurrentPage().getParameters().get('formType'); 
        ldId = Apexpages.currentPage().getParameters().get('ld');
        pid = Apexpages.currentPage().getParameters().get('pid');
        pname = Apexpages.currentPage().getParameters().get('pname');
        webCountry = (Apexpages.currentPage().getParameters().get('c') == null || Apexpages.currentPage().getParameters().get('c') == '' ? 'AU' : Apexpages.currentPage().getParameters().get('c'));
        optIn = false;
        if(pname!=null && pname!=''){
            productName = pname.replaceAll(',','\n');
        }
        if(ldId!=null && ldId!=''){
            List<Lead> ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,
                                Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Hybrid_Link__c,
                                OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                                OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Customer_No__c,Account__r.Name,Account__r.SMS_Mobile__c,Photo_Id_Front__c,Photo_Id_Back__c,Application_Logs__c,
                                Hybrid_Link_Device_Info__c,Photo_Id_Details__c,OCR_Text__c,OCR_Back_Text__c,OCR_Address__c,Territory_Number__r.Applicant_Customer_Prefix__c,Territory_State__c,Automation_Outcome__c from Lead where id=:ldId Limit 1];
            if(ldLst.size()>0){
                System.debug('****');
                lead = ldLst[0];
                if(formType == 'apply'){
                    List<Cart_Item__c> cartItems = [SELECT Id,Product_Inventory__c,Lead__c,Total_Price__c,Delivery_Fee__c,Quantity__c,UnitPrice__c,
                                                    Product_Inventory__r.ProductName__c,Product_Warehouse__c,Product_Inventory__r.ProductCode__c 
                                                    FROM Cart_Item__c WHERE Lead__c =: ldId AND Product_Inventory__c != null]; 
                    fname = lead.FirstName;
                    lname = (lead.LastName != null && lead.LastName != 'Buy Now' && lead.LastName != 'Credit Contract' ? lead.LastName : null);
                    email = lead.Email;
                    mobile = lead.MobilePhone;
                    street = lead.Street;
                    suburb = lead.City;
                    state = lead.State;
                    postcode = lead.PostalCode;
                    latitude = lead.Latitude;
                    longitude = lead.Longitude;   
                    reasonForEnquiry = 'New Product';
                    productName = '';
                    for(Cart_Item__c ci : cartItems){
                        productName += ci.Product_Inventory__r.ProductName__c;
                        productName += '\n';
                    }
                    productName = productName.trim(); 
                }
            }
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','initR4KWeb','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public Boolean isValidMobile(String mobileNumber){
    Pattern mobilePattern = Pattern.compile('^(04|05)[0-9]{8}$');
    Matcher matcher = mobilePattern.matcher(mobileNumber);    
    return matcher.matches();
}

public Boolean isValidEmail(String emailAddress){
    //Pattern emailPattern = Pattern.compile('(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])');
    Pattern emailPattern = Pattern.compile('^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$');
    Matcher matcher = emailPattern.matcher(emailAddress);
    return matcher.matches();
}

public PageReference addLead(){
    try{
        fnameMissing = false;
        lnameMissing = false;
        emailMissing = false;
        mobileMissing = false;
        streetMissing = false;
        suburbMissing = false;
        stateMissing = false;
        reasonForEnquiryMissing = false;
        postcodeMissing = false;
        submissionError = false;
        Boolean companyLead = false;
        String leadMedium = 'Web';
        
        if(fname == null || fname == '' || fname.trim() == ''){
            fnameMissing = true;
        }
        if(lname == null || lname == '' || lname.trim() == ''){
            lnameMissing = true;
        }
        if(email == null || email == '' || email.trim() == '' || !isValidEmail(email.trim())){
            emailMissing = true;
        }
        if(mobile == null || mobile == '' || mobile.trim() == '' || !isValidMobile(mobile.trim())){
            mobileMissing = true;
        }
        if(street == null || street == '' || street.trim() == ''){
            streetMissing = true;
        }
        if(suburb == null || suburb == '' || suburb.trim() == ''){
            suburbMissing = true;
        }
        if(state == null || state == '' || state.trim() == ''){
            stateMissing = true;
        }
        if(postcode == null || postcode == '' || postcode.length() != 4){
            postcodeMissing = true;
        }
        if(reasonForEnquiry == null || reasonForEnquiry == ''){
            reasonForEnquiryMissing = true;
        }
        
        if((formType == 'apply' || formType == 'callback') && (fnameMissing || lnameMissing || emailMissing || mobileMissing || streetMissing || suburbMissing || stateMissing || postcodeMissing)){
            submissionError = true;
            return null;    
        }else if((formType == 'r4k' || formType == 'rent4keeps' || formType == 'contact') && (fnameMissing || lnameMissing || emailMissing || mobileMissing || postcodeMissing || reasonForEnquiryMissing)){
            submissionError = true;
            return null;    
        }
        country = ((country == null || country == '' || country == 'Australia') ? 'AU' : country);
        
        if(searchEngine != null && (searchEngine.containsIgnoreCase('facebook') || searchEngine.containsIgnoreCase('instagram'))){
            leadMedium = 'Facebook';
            FBIntegration fb = new FBIntegration();
            ipAddress = ipAddress!=null && ipAddress!='' && ipAddress!='undefined' ? ipAddress : null;
            fb.postMetaEvents('Apply Now Button', 'https://r4k.com.au/products ', 'website', email, mobile, fname, lname, suburb, postcode, 'AU', userAgent,ipAddress, false);
        }
        
        List<PostCode__c> postcodes = new List<PostCode__c>();
        if(formType == 'rent4keeps'){
            if(country == 'NZ'){
                postcodes = [select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c = 'NZ' AND Territory__r.Is_Credit_Contract__c = false AND Territory__r.Company_Territory__c = false];
            }else{
                postcodes = [select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c != 'NZ' AND Territory__r.Is_Credit_Contract__c = false AND Territory__r.Company_Territory__c = false];
            }
        }else{
            if(country == 'NZ'){
                postcodes = [select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c = 'NZ' AND Territory__r.Is_Credit_Contract__c = true AND Territory__r.Company_Territory__c = false];
            }else{
                postcodes = [select id,Owner.Id,Territory__r.id,Territory__r.Owner.Id,Territory__r.State_Master_State__c from PostCode__c 
                                where Name=:postcode and Territory__r.State_Master_State__c != 'NZ' AND Territory__r.Is_Credit_Contract__c = true AND Territory__r.Company_Territory__c = false];
            }
        }
        Boolean sendOTPSMS = false;
        if(postcodes.size() == 0){
            companyLead = true;
        }
        
        Lead ld = new Lead();
        ld.FirstName = fname;
        ld.LastName = lname;
        ld.Email = email;
        ld.MobilePhone = mobile;
        ld.Street = street;
        ld.City = suburb;
        ld.State = state;
        ld.PostalCode = postcode;
        ld.Country = country;
        ld.Longitude = longitude;
        ld.Latitude = latitude;
        ld.Lead_Medium__c = leadMedium;
        ld.did_your_hear__c = howDidYouHear;
        ld.Desired_Product__c = productName;
        ld.contact_desc__c = natureOfEnquiry;
        ld.crn__c = crn;
        ld.Not_Spam__c = 'yes';
        ld.Opt_In_Info_From_Rent4keeps__c = optIn;
        ld.Reason_For_Enquiry__c = (ld.Form_Type__c == 'APPLY NOW' ? 'New Product' : reasonForEnquiry);
        ld.Form_Type__c = (formType == 'apply' ? 'APPLY NOW' : (formType == 'r4k' ? 'R4K ENQUIRY' : (formType == 'rent4keeps' ? 'RENT4KEEPS ENQUIRY' : (formType == 'contact' ? 'CONTACT R4K' : (formType == 'callback' ? 'Callback' : null)))));
        if(ld.Form_Type__c == 'Callback'){
            sendOTPSMS = false;
        }else if(ld.Form_Type__c == 'CONTACT R4K'){
            if(companyLead){
                sendOTPSMS = true;
            }else if(ld.Reason_For_Enquiry__c == 'New Product'){
                sendOTPSMS = true;
            }
        }else if(ld.Form_Type__c == 'RENT4KEEPS ENQUIRY'){
            if(companyLead){
                sendOTPSMS = true;
            }
        }else if(ld.Form_Type__c == 'R4K ENQUIRY'){
            if(companyLead){
                sendOTPSMS = true;
            }
        }else if(ld.Form_Type__c == 'APPLY NOW'){
            sendOTPSMS = true;
        }
        if(sendOTPSMS){
            String randomNumber = SecretUtil.generateRandomNumber();
            ld.OTP_Code__c = randomNumber;
        }
        
        if(ldId != null && ldId != ''){
            //update existing lead
            ld.Id = ldId;
            update ld;
        }else{
            //insert new lead
            ld.GCLID__c = gcid;
            ld.GA_Search_Engine__c = searchEngine;
            ld.GA_Device_Info__c = deviceInfo;
            ld.GA_Campaign__c = campaign;
            ld.GA_Medium__c = gaMedium;
            ld.No_Of_Pages_Visited__c = noOfPagesVisited;
            ld.No_Of_Unique_Pages_Visited__c = noOfUniquePagesVisited;
            ld.Time_Spent_On_Website__c = (timeSpentOnWeb != null ? Math.ceil(timeSpentOnWeb) : timeSpentOnWeb);
            ld.GA_Keyword__c = gaKeyword;
            ld.Pages_Visited__c = pagesVisited;
            insert ld;
        }
        
        if(sendOTPSMS){
            String smsMobile = ((ld.Country == 'NZ' || ld.Country == 'New Zealand' ? '64' : '61') + (mobile.startsWith('0') ? mobile.substring(1) : mobile));
            String smsTemplate = 'Please enter the R4K 5-digit code ' + ld.OTP_Code__c + ' so that you can proceed with your application. Do not share this with others.';
            List <smagicinteract__smsmagic__c> smsObjectList = new List <smagicinteract__smsmagic__c>();
            String senderId = (ld.Form_Type__c == 'RENT4KEEPS ENQUIRY' ? 'rent4keeps' : 'r4k');
            if(smsMobile != null && smsMobile != ''){
                smagicinteract__smsMagic__c smsObject = new smagicinteract__smsMagic__c();
                smsObject.smagicinteract__SenderId__c = senderId;
                smsObject.smagicinteract__Name__c = 'CustomerAuthCode'; // records name
                smsObject.smagicinteract__Lead__c = ld.Id;
                //smsObject.OwnerId = opportunity.Account.OwnerId;
                smsObject.smagicinteract__ObjectType__c = 'Lead'; // record type
                smsObject.smagicinteract__disableSMSOnTrigger__c = 0; // this field either be 0 or 1, if you specify the value as 1 then sms will not get send but entry of sms will get create under SMS History object
                smsObject.smagicinteract__external_field__c = smagicinteract.ApexAPI.generateUniqueKey();
                smsObject.smagicinteract__PhoneNumber__c = smsMobile;
                smsObject.smagicinteract__SMSText__c = smsTemplate;
                smsObjectList.add(smsObject);
                String response = smagicinteract.ApexAPI.pushSMSCallout(smsObjectList);
                Database.insert(smsObjectList,false);
            }
            system.debug('smsObjectList: '+smsObjectList.size());
            if(smsObjectList.size()>0 && smsObjectList[0].Id != null){
                smagicinteract__smsmagic__c obj = new smagicinteract__smsmagic__c();
                obj.Id= smsObjectList[0].Id;
                obj.smagicinteract__SMSText__c = smsObjectList[0].smagicinteract__SMSText__c!=null ? smsObjectList[0].smagicinteract__SMSText__c.replace(ld.OTP_Code__c,'****') : null;
                update obj;
            }
        }
        
        System.debug('****sendOTPSMS ' + sendOTPSMS);
        System.debug('****companyLead ' + companyLead);
        System.debug('****country ' + country);
        System.debug('****formType ' + ld.Form_Type__c);
        
        if(sendOTPSMS){
            return new PageReference(webURL + '/R4KApplyNow?formType=otp&ld='+ld.Id).setRedirect(true);
        }else{
            return new PageReference(webURL + '/R4KApplyNow?formType=rep&ld='+ld.Id).setRedirect(true);
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','addLead-'+formType,'',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference authenticateOTPCode(){
    try
    {
        List<Lead> ldLst = [select id,name, FirstName, LastName, MobilePhone,Email,crn__c,Territory_Number__c, PostalCode,Street,City,Country,State,Territory_Number__r.State_Master_State__c,Account__r.Hybrid_Link_Status__c,
                            Reason_for_Enquiry__c,did_your_hear__c,Desired_Product__c,IsConverted,Account__c,Hybrid_Link_Allocation_Datetime__c,Hybrid_Link_Opened_Datetime__c,Referring_Customer__c,Account__r.Next_Online_Step_Param__c,Hybrid_Link__c,Form_Type__c,
                            OwnerId,Territory_Number__r.Name,Territory_Number__r.Lead_Phone__c,Territory_Number__r.Account_Enquiry_Mobile__c,Latitude,Longitude,Lead_Medium__c,Enquiry_Notes__c,Description,Hybrid_Link_Address__c,Hybrid_Link_Latitude__c,Hybrid_Link_Longitude__c,
                            OTP_Code__c,OTP_Code_Auth_Datetime__c,Birthdate__c,Account__r.State_Master_State__c,Applicant_Status__c,Account__r.Customer_No__c,Account__r.Name,Account__r.SMS_Mobile__c,Photo_Id_Front__c,Photo_Id_Back__c,Application_Logs__c,
                            Hybrid_Link_Device_Info__c,Photo_Id_Details__c,OCR_Text__c,OCR_Back_Text__c,OCR_Address__c,Territory_Number__r.Applicant_Customer_Prefix__c,Territory_State__c,Automation_Outcome__c,Territory_Number__r.Company_Territory__c from Lead where id=:ldId Limit 1];
        if(ldLst.size()>0)
        {
            System.debug('****');
            lead = ldLst[0];
        }
        
        String otpCode = Apexpages.currentPage().getParameters().get('otpCode');
        system.debug('otpCode: '+otpCode);

        String randomNumber=SecretUtil.generateRandomNumber();
        if(lead!=null && otpCode!=null && lead.OTP_Code__c==otpCode)
        {
            Lead ldUp = new Lead();
            ldUp.Id = lead.Id;
            ldUp.OTP_Code_Auth_Datetime__c = Datetime.now();
            update ldUp;
            
            String finalURL = onlineURL+'/R4KCreditGuide?ld='+ldId+'&redo=yes&n='+randomNumber;
            if(lead.Form_Type__c == 'RENT4KEEPS ENQUIRY' || lead.Form_Type__c == 'R4K ENQUIRY'){
                finalURL = (onlineURL + '/R4KAccountEnquiry?ld=' + ldId + '&param=smp&n=' + randomNumber);
            } 
            return new PageReference(finalURL).setRedirect(true);
        }else
        {
            return new PageReference(webURL + '/R4KApplyNow?formType=otperror&ld='+ldId+'&n='+randomNumber).setRedirect(true);
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','authenticateOTPCode',ldId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference redirectToProducts(){
    try{
        pid = ApexPages.CurrentPage().getParameters().get('pid');
        String gid = ApexPages.CurrentPage().getParameters().get('gid');
        products = new List<Product_Inventory__c>();
        String randomNumber=SecretUtil.generateRandomNumber();
        if(pid != null && pid != ''){
            List<String> prodIds = pid.split(',');
            System.debug('prodIds ' + prodIds);
            for(String ppid : prodIds){
                System.debug('ppid ' + ppid);
                List<Product_Inventory__c> prodList = [SELECT ID,Name,DeviceModel__c,Image_URL__c,Invoice_Cost__c,Invoice_Cost_Inc_GST__c,
                                                Manufacturer_Name__c,Market_Price__c,Delivery_Cost__c,Model_No__c,Product_Image__c,
                                                Product_Master__c,Product_Type__c,ProductCode__c,ProductDescription__c,ProductImageId__c,
                                                ProductList__c,ProductName__c,Provider__c,Regional_Delivery_Cost__c,RRP__c,Stock_URL__c,
                                                Transfer_Fee_Not_Applicable__c,Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,Cash_Price__c
                                                FROM Product_Inventory__c WHERE Model_No__c = :ppid ORDER BY Cash_Price__c ASC LIMIT 1];
                if(prodList.size() == 0){
                    prodList = [SELECT ID,Name,DeviceModel__c,Image_URL__c,Invoice_Cost__c,Invoice_Cost_Inc_GST__c,
                                                        Manufacturer_Name__c,Market_Price__c,Delivery_Cost__c,Model_No__c,Product_Image__c,
                                                        Product_Master__c,Product_Type__c,ProductCode__c,ProductDescription__c,ProductImageId__c,
                                                        ProductList__c,ProductName__c,Provider__c,Regional_Delivery_Cost__c,RRP__c,Stock_URL__c,
                                                        Transfer_Fee_Not_Applicable__c,Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,Cash_Price__c
                                                        FROM Product_Inventory__c WHERE ProductCode__c = :ppid ORDER BY Cash_Price__c ASC LIMIT 1];
                }
                if(prodList.size() > 0){
                    products.addAll(prodList);
                }
            }
            pid = '';
            for(Integer p=0; p<products.size(); p++){
                pid += (products[p].Id + (p != (products.size() - 1) ? ',' : ''));
            }
            
            if(products.size() > 0){
                gid = (gid == null || gid.trim() == '' || gid.trim() == 'null' ? '' : gid);
                if(gid != null && gid != ''){
                    return new PageReference(webURL + '/R4KRetailPurchasePage?formType=product&pid='+pid+'&gid='+gid+'&n='+randomNumber).setRedirect(true);
                }else{
                return new PageReference(webURL + '/R4KRetailPurchasePage?formType=product&pid='+pid+'&n='+randomNumber).setRedirect(true);
                }
            }else{
                return new PageReference(webURL + '/R4KRetailErrorPage').setRedirect(true);
            }
        }
        return null;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','redirectToProducts',pid,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void initR4KProduct()
{
    try{
        formType = ApexPages.CurrentPage().getParameters().get('formType');
        prodId = ApexPages.CurrentPage().getParameters().get('prodId');
        ldId = ApexPages.CurrentPage().getParameters().get('ld');
        pid = ApexPages.CurrentPage().getParameters().get('pid');
        cartItems = new List<Cart_Item__c>();
        totalPayableAmt = 0;
        deliveryCost = 'Not Deliverable';
        buyNowAmt = 0;
        weeklyAmt = 0;
        deliveryCostAmt = 0;
        productsDeliverableCount = 0;
        productWrappers = new List<ProductWrapper>();
        
        if(ldId != null && ldId != ''){
            lead = [SELECT Id,FirstName,LastName,Email,MobilePhone,Street,City,State,PostalCode,ReferenceNo__c,OwnerId,
                    Territory_Number__c,Territory_Number__r.Ezidebit_Instant_URL__c,Form_Type__c,Latitude,Longitude,SMS_Mobile__c 
                    FROM Lead WHERE Id =: ldId LIMIT 1];
            fname = lead.FirstName;
            lname = (lead.LastName != null && lead.LastName != 'Buy Now' && lead.LastName != 'Credit Contract' ? lead.LastName : null);
            email = lead.Email;
            mobile = lead.MobilePhone;
            street = lead.Street;
            suburb = lead.City;
            state = lead.State;
            postcode = lead.PostalCode;
            latitude = lead.Latitude;
            longitude = lead.Longitude;
        }

        if(formType == 'product'){
            street = null;
            suburb = null;
            state = null;
            postcode = null;
            List<String> prodIds = new List<String>();
            Set<String> prodIdSet = new Set<String>();
            Map<String,Integer> productQuantityMap = new Map<String,Integer>();
            if(pid != null && pid != ''){
                prodIds = pid.split(',');
            }else if(ldId != null && ldId != ''){
                lead = [SELECT Id,FirstName,LastName,Email,MobilePhone,Street,City,State,PostalCode,ReferenceNo__c,
                    Territory_Number__c,Territory_Number__r.Ezidebit_Instant_URL__c,Form_Type__c,SMS_Mobile__c,OwnerId 
                    FROM Lead WHERE Id =: ldId LIMIT 1];
                cartItems = [SELECT Id,Product_Inventory__c,Lead__c,Total_Price__c,Delivery_Fee__c,Quantity__c,UnitPrice__c,
                        Product_Inventory__r.ProductName__c,Product_Warehouse__c,Product_Inventory__r.ProductCode__c,Transaction_Fee_Percent__c  
                        FROM Cart_Item__c WHERE Lead__c =: ldId AND Product_Inventory__c != null ORDER BY CreatedDate DESC LIMIT 1];
                for(Integer c=0; c<cartItems.size(); c++){
                    prodIds.add(cartItems[c].Product_Inventory__c);
                    productQuantityMap.put(cartItems[c].Product_Inventory__r.ProductCode__c,Integer.valueOf(cartItems[c].Quantity__c == null ? 1 : cartItems[c].Quantity__c));
                }
            }
            prodIdSet.addAll(prodIds);
            products = [SELECT ID,Name,DeviceModel__c,Image_URL__c,Invoice_Cost__c,Invoice_Cost_Inc_GST__c,
                                                        Manufacturer_Name__c,Market_Price__c,Delivery_Cost__c,Model_No__c,Product_Image__c,
                                                        Product_Master__c,Product_Type__c,ProductCode__c,ProductDescription__c,ProductImageId__c,
                                                        ProductList__c,ProductName__c,Provider__c,Regional_Delivery_Cost__c,RRP__c,Stock_URL__c,
                                                        Transfer_Fee_Not_Applicable__c,Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,Cash_Price__c
                                                        FROM Product_Inventory__c WHERE Id IN :prodIdSet ORDER BY Cash_Price__c ASC];
            for(Integer p=0; p<products.size(); p++){
                ProductWrapper pw = new ProductWrapper();
                pw.inventory = products[p];
                pw.quantity = (productQuantityMap.containsKey(products[p].ProductCode__c) ? productQuantityMap.get(products[p].ProductCode__c) : 1);
                productWrappers.add(pw);
                buyNowAmt += (products[p].Cash_Price__c == null ? 0 : products[p].Cash_Price__c);
            }
        }else if(ldId != null && ldId != ''){
            if(formType == 'basic'){
                cartItems = [SELECT Id,Product_Inventory__c,Lead__c,Total_Price__c,Delivery_Fee__c,Quantity__c,UnitPrice__c,
                        Product_Inventory__r.ProductName__c,Product_Warehouse__c,Product_Inventory__r.ProductCode__c,Transaction_Fee_Percent__c  
                        FROM Cart_Item__c WHERE Lead__c =: ldId AND Product_Inventory__c != null ORDER BY CreatedDate DESC LIMIT 1];
                List<Cart_Item__c> updatedCartItems = new List<Cart_Item__c>();
                List<String> prodIds = new List<String>();
                Map<String,Product_Inventory__c> productInventoryMap = new Map<String,Product_Inventory__c>();
                for(Integer c=0; c<cartItems.size(); c++){
                    prodIds.add(cartItems[c].Product_Inventory__c);
                }
                products = [SELECT ID,Name,DeviceModel__c,Image_URL__c,Invoice_Cost__c,Invoice_Cost_Inc_GST__c,
                                                        Manufacturer_Name__c,Market_Price__c,Delivery_Cost__c,Model_No__c,Product_Image__c,
                                                        Product_Master__c,Product_Type__c,ProductCode__c,ProductDescription__c,ProductImageId__c,
                                                        ProductList__c,ProductName__c,Provider__c,Regional_Delivery_Cost__c,RRP__c,Stock_URL__c,
                                                        Transfer_Fee_Not_Applicable__c,Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,Cash_Price__c
                                                        FROM Product_Inventory__c WHERE Id IN :prodIds ORDER BY Cash_Price__c ASC];
                for(Integer p=0; p<products.size(); p++){
                    productInventoryMap.put(products[p].ProductCode__c,products[p]);
                }
                for(Integer c=0; c<cartItems.size(); c++){
                    Cart_Item__c ci = new Cart_Item__c();
                    ci.Id = cartItems[c].Id;
                    ci.Product_Warehouse__c = null;

                    ProductWrapper wrap = new ProductWrapper();
                    wrap.inventory = (productInventoryMap.containsKey(cartItems[c].Product_Inventory__r.ProductCode__c) ? productInventoryMap.get(cartItems[c].Product_Inventory__r.ProductCode__c) : null);
                    wrap.quantity = Integer.valueOf(cartItems[c].Quantity__c);
                    System.debug('****postcode: ' + postcode);
                    System.debug('****suburb: ' + suburb);
                    System.debug('****wrap.inventory.Id: ' + wrap.inventory.Id);
                    ProductDeliveryResponse pdr = R4KWebController.checkDelivery(postcode, suburb, wrap.inventory.Id, true, false);
                    System.debug('****pdr: ' + pdr);
                    if(pdr.warehouses == null || pdr.warehouses.size() == 0){
                        wrap.deliveryMessage = pdr.errorMsg;
                        wrap.deliveryCost = 'Not Deliverable';
                    }else if(pdr.warehouses.size() > 0){
                        ci.Product_Warehouse__c = pdr.warehouses[0].warehouse.Id;
                        ci.Delivery_Fee__c = pdr.deliveryFee;
                        ProductWarehouse warehouseWrappper = pdr.warehouses[0];
                        wrap.deliveryMessage = 'Available';
                        wrap.deliveryCost = '$' + String.valueOf(pdr.deliveryFee);
                        deliveryCostAmt += pdr.deliveryFee;
                        if(wrap.quantity > warehouseWrappper.warehouse.Stock_Available_To_Order__c){
                            wrap.quantity = Integer.valueOf(warehouseWrappper.warehouse.Stock_Available_To_Order__c);
                            wrap.quantityMessage = ('Only ' + wrap.quantity + ' in stock.');
                        }
                        ci.Quantity__c = wrap.quantity;
                        buyNowAmt += ((wrap.inventory.Cash_Price__c * wrap.quantity) + pdr.deliveryFee);
                        productsDeliverableCount++;
                    }
                    productWrappers.add(wrap);
                    updatedCartItems.add(ci);
                }
                update updatedCartItems;

                weeklyAmt = getWeeklyRent(buyNowAmt, 24, 'Weekly');
            }else if(formType == 'cart' || formType == 'delivery'){
                List<Cart_Item__c> cItems = [SELECT Id,Product_Inventory__c,Lead__c,Total_Price__c,Delivery_Fee__c,Quantity__c,UnitPrice__c,
                        Product_Inventory__r.ProductName__c,Product_Warehouse__c,Product_Inventory__r.ProductCode__c,Transaction_Fee_Percent__c  
                        FROM Cart_Item__c WHERE Lead__c =: ldId];
                totalPayableAmt = 0;
                transactionFeePercent = 0;
                transactionFee = 0;
                for(Integer c=0; c<cItems.size(); c++){
                    if(cItems[c].Product_Warehouse__c != null){
                        totalPayableAmt += (cItems[c].Total_Price__c == null ? 0 : cItems[c].Total_Price__c);
                        cartItems.add(cItems[c]);
                    }
                    if(cItems[c].Transaction_Fee_Percent__c != null){
                        totalPayableAmt += cItems[c].Total_Price__c;
                        transactionFee = cItems[c].Total_Price__c;
                        transactionFeePercent = cItems[c].Transaction_Fee_Percent__c;
                    }
                }
                totalPayableAmt = totalPayableAmt.setScale(2);
            }
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','initR4KProduct','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}

public Decimal getWeeklyRent(Decimal cashPrice, Integer term, String frequency){
    String feesResult = Util.getFees(cashPrice,term);
    System.debug('feesResult : ' + feesResult);
    Map<String, String> feesResultMap = (Map<String, String>)JSON.deserialize(feesResult, Map<String, String>.class);
    Decimal aprFees = Decimal.valueOf(feesResultMap.get('totalFees'));
    String rentalResult = Util.getRentalCalculation('AU', cashPrice, aprFees, String.valueOf(term), frequency);
    System.debug('rentalResult : ' + rentalResult);
    Map<String, String> rentalResultMap = (Map<String, String>)JSON.deserialize(rentalResult, Map<String, String>.class);
    Decimal rent = Decimal.valueOf(rentalResultMap.get('rent'));
    return rent;
}

public Pagereference addBuyNowLead(){
    try{
        String randomNumber=SecretUtil.generateRandomNumber();
        String buyOption = ApexPages.CurrentPage().getParameters().get('buyOption');
        List<Cart_Item__c> cartItems = new List<Cart_Item__c>();
        
        String leadMedium = 'Web';
        if(searchEngine != null && (searchEngine.containsIgnoreCase('facebook') || searchEngine.containsIgnoreCase('instagram'))){
            leadMedium = 'Facebook';
        }

        Lead ld = new Lead();
        //ld.FirstName = (buyOption == 'buynow' ? '' : '');
        ld.LastName = (buyOption == 'buynow' ? 'Buy Now' : 'Credit Contract');
        ld.Country = 'AU';
        ld.Not_Spam__c = 'yes';
        ld.Form_Type__c = (buyOption == 'buynow' ? 'Buy Now' : 'Credit Contract');
        ld.Lead_Medium__c = leadMedium;
        ld.Desired_Product__c = '';
        for(Integer p=0; p<productWrappers.size(); p++){
            ld.Desired_Product__c += (productWrappers[p].inventory.ProductName__c + '\n');
        }
        ld.Desired_Product__c = ld.Desired_Product__c.trim();
        ld.contact_desc__c = ld.Desired_Product__c;
        ld.MobilePhone = mobile;
        ld.Street = street;
        ld.City = suburb;
        ld.State = state;
        ld.PostalCode = postcode;
        ld.Longitude = longitude;
        ld.Latitude = latitude;
        if(ldId != null && ldId != ''){
            ld.Id = ldId; 
            update ld;
            
            List<Cart_Item__c> oldCartItems = [SELECT Id FROM Cart_Item__c WHERE Lead__c =: ldId];
            delete oldCartItems;
        }else{
            ld.GCLID__c = gcid;
            ld.GA_Search_Engine__c = searchEngine;
            ld.GA_Device_Info__c = deviceInfo;
            ld.GA_Campaign__c = campaign;
            ld.GA_Medium__c = gaMedium;
            ld.No_Of_Pages_Visited__c = noOfPagesVisited;
            ld.No_Of_Unique_Pages_Visited__c = noOfUniquePagesVisited;
            ld.Time_Spent_On_Website__c = (timeSpentOnWeb != null ? Math.ceil(timeSpentOnWeb) : timeSpentOnWeb);
            ld.GA_Keyword__c = gaKeyword;
            ld.Pages_Visited__c = pagesVisited;
            if(ld.Form_Type__c == 'Buy Now'){
                Territory__c r4kLicensing = [SELECT Id, OwnerId FROM Territory__c WHERE Name = '1000' LIMIT 1];
                ld.Territory_Number__c = r4kLicensing.Id;
                ld.OwnerId = r4kLicensing.OwnerId;
            }
            insert ld;
            /*
            if(ld.Form_Type__c == 'Credit Contract'){
                String rNumber = SecretUtil.generateRandomNumber();
                ld.Hybrid_Link__c = onlineURL+'/R4KOnlineFormAcknowledgementPage?ld='+ld.Id+'&n='+rNumber;
                update ld;
            }
            */
        }
        ldId = ld.Id;

        //Find if there is an old unconverted lead and pass the old lead Id
        //excluding buy now leads
        if(ld.Form_Type__c != 'Buy Now'){
            String alternateMobilePhone = ld.MobilePhone;
            if(ld.MobilePhone != null && ld.MobilePhone.length() == 9 && !ld.MobilePhone.startsWith('0')){
                alternateMobilePhone = ('0' + ld.MobilePhone);
            }
        
            List<Lead> matchingLeads = [SELECT Id,FirstName,LastName,Name,MobilePhone,OwnerId,Owner.Name,Territory_Number__c,Territory_Short_Name__c,Reason_for_Enquiry__c,Street,City,
                                        State,PostalCode,Lead_Medium__c,Email,CreatedDate,did_your_hear__c,contact_desc__c,Call_Time_Charged_minutes__c,Phone_Recording__c,Desired_Product__c,Territory_State__c,CRN__c,Incoming_Count__c,Outgoing_Count__c,
                                        TwilioCallSid__c,TwilioRecordingSid__c,Automation_Outcome__c,Last_Automated_Bot_Message__c,Next_Automated_Bot_Message__c,Automated_Bot_Message_Tracking__c,Bot_Call_Datetime__c,Next_Bot_Call_Datetime__c
                                        FROM Lead WHERE 
                                        (MobilePhone =: ld.MobilePhone OR MobilePhone =: alternateMobilePhone) AND
                                        IsConverted = false AND Id <>: ldId AND 
                                        Form_Type__c != 'Buy Now' AND 
                                        Territory_Number__r.Name = '1000'
                                        ORDER BY CreatedDate ASC LIMIT 1];
            ldId = (matchingLeads.size() > 0 ? matchingLeads[0].Id : ldId);
        }

        //add cart items
        for(ProductWrapper wrap : productWrappers){
            Cart_Item__c ci = new Cart_Item__c();
            ci.Product_Inventory__c = wrap.inventory.Id;
            ci.Quantity__c = wrap.quantity;
            ci.UnitPrice__c = wrap.inventory.Cash_Price__c;
            ci.Lead__c = ldId;
            cartItems.add(ci);        
        }
        insert cartItems;

        return new Pagereference(webURL + '/R4KRetailPurchasePage?formType=basic&ld='+ldId+'&n='+randomNumber).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','addBuyNowLead','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public Pagereference proceedToApplyNow(){
    try{
        fnameMissing = (fname == null || fname.trim() == '' ? true : false);
        lnameMissing = (lname == null || lname.trim() == '' ? true : false);
        emailMissing = (email == null || email.trim() == '' ? true : false);
        
        if(fnameMissing || lnameMissing || emailMissing){
            return null;    
        }
        
        if(searchEngine != null && (searchEngine.containsIgnoreCase('facebook') || searchEngine.containsIgnoreCase('instagram'))){
            FBIntegration fb = new FBIntegration();
            ipAddress = ipAddress!=null && ipAddress!='' && ipAddress!='undefined' ? ipAddress : null;
            fb.postMetaEvents('Apply Now Button', 'https://r4k.com.au/products ', 'website', email, mobile, fname, lname, suburb, postcode, 'AU', userAgent, ipAddress, false);
        }

        String randomNumber=SecretUtil.generateRandomNumber();
        
        Lead ld = new Lead();
        ld.Id = ldId;
        ld.FirstName = fname;
        ld.LastName = lname;
        ld.Email = email;
        
        Boolean sendHybridLink = (lead.Form_Type__c == 'Credit Contract' ? true : false);
        if(sendHybridLink){
            /*
            Boolean companyLead = true;
            String rNumber = SecretUtil.generateRandomNumber();
            String companyHybridShortLink = onlineURL+'/R4KOnlineFormAcknowledgementPage?ld='+ldId+'&n='+rNumber;
            String franchiseHybridShortLink = onlineURL+'/R4KHybridFormAcknowledgementPage?ld='+ldId+'&n='+rNumber;
            if(!Test.isRunningTest()){
                ShortLinkGeneratorUtil sl = new ShortLinkGeneratorUtil();
                companyHybridShortLink = sl.shortLinkGenerator(companyHybridShortLink);
                franchiseHybridShortLink = sl.shortLinkGenerator(franchiseHybridShortLink);
            }
            ld.Hybrid_Link__c = companyHybridShortLink;
            */
            
            ld.OTP_Code__c = SecretUtil.generateRandomNumber();
            String smsTemplateForCust = 'Please enter the R4K 5-digit code ' + ld.OTP_Code__c + ' so that you can proceed with your application. Do not share this with others.';
            CommunicationUtil.sendSMS(lead.SMS_Mobile__c, smsTemplateForCust, 'CustomerAuthCode', 'Lead', ldId, lead.ownerId, false, null);
            
            //smsTemplateForCust = 'Hi '+ fname + ', thank you for contacting R4K. To purchase a product with us, tap this ' + ld.Hybrid_Link__c + ' and complete the form. We\'ll process your Instalment application and be in touch as early as today! Thanks Rene from R4K.';
            //CommunicationUtil.sendSMS(lead.SMS_Mobile__c, smsTemplateForCust, 'Lead-Customer', 'Lead', ldId, lead.ownerId, false, null);
        }
        
        update ld;
        
        List<Cart_Item__c> transactionFees = [SELECT Id FROM Cart_Item__c WHERE Transaction_Fee_Percent__c != null AND Lead__c =: ldId];
        delete transactionFees;
        
        //return new Pagereference(webURL + '/R4KApplyNow?formType=apply&ld='+ldId+'&n='+randomNumber).setRedirect(true);
        return new Pagereference(webURL + '/R4KApplyNow?formType=otp&ld='+ldId+'&n='+randomNumber).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','proceedToApplyNow','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference proceedToCart()
{
    try{
        fnameMissing = (fname == null || fname.trim() == '' ? true : false);
        lnameMissing = (lname == null || lname.trim() == '' ? true : false);
        emailMissing = (email == null || email.trim() == '' ? true : false);

        if(fnameMissing || lnameMissing || emailMissing){
            return null;    
        }
        
        if(searchEngine != null && (searchEngine.containsIgnoreCase('facebook') || searchEngine.containsIgnoreCase('instagram'))){
            FBIntegration fb = new FBIntegration();
            ipAddress = ipAddress!=null && ipAddress!='' && ipAddress!='undefined' ? ipAddress : null;
            fb.postMetaEvents('Apply Now Button', 'https://r4k.com.au/products ', 'website', email, mobile, fname, lname, suburb, postcode, 'AU', userAgent, ipAddress, false);
        }
        
        String randomNumber=SecretUtil.generateRandomNumber();

        Lead ld = new Lead();
        ld.Id = ldId;
        ld.FirstName = fname;
        ld.LastName = lname;
        ld.Email = email;
        update ld;

        List<Cart_Item__c> transactionFees = [SELECT Id FROM Cart_Item__c WHERE Transaction_Fee_Percent__c != null AND Lead__c =: ldId];
        delete transactionFees;

        Cart_Item__c ci = new Cart_Item__c();
        ci.Quantity__c = 1;
        ci.Lead__c = ld.Id;
        ci.Transaction_Fee_Percent__c = Util.getOnlineTransactionFeePercent(buyNowAmt).setScale(2);
        ci.UnitPrice__c = ((buyNowAmt * Util.getOnlineTransactionFeePercent(buyNowAmt)) / 100).setScale(2);
        insert ci;

        return new PageReference(webURL + '/R4KRetailPurchasePage?formType=cart&ld='+ldId+'&n='+randomNumber).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','proceedToCart','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference proceedToDelivery()
{
    try{
        String randomNumber=SecretUtil.generateRandomNumber();
        return new PageReference(webURL + '/R4KRetailPurchasePage?formType=delivery&ld='+ldId+'&n='+randomNumber).setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','proceedToDelivery','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference proceedToPayment()
{
    try{
        String randomNumber=SecretUtil.generateRandomNumber();
        fnameMissing = (fname == null || fname.trim() == '' ? true : false);
        lnameMissing = (lname == null || lname.trim() == '' ? true : false);
        emailMissing = (email == null || email.trim() == '' ? true : false);
        mobileMissing = (mobile == null || mobile.trim() == '' ? true : false);
        streetMissing = (street == null || street.trim() == '' ? true : false);
        suburbMissing = (suburb == null || suburb.trim() == '' ? true : false);
        stateMissing = (state == null || state.trim() == '' ? true : false);
        postcodeMissing = (postcode == null || postcode.trim() == '' || postcode.length() != 4 ? true : false);

        if(fnameMissing || lnameMissing || emailMissing || mobileMissing || streetMissing || suburbMissing || stateMissing || postcodeMissing){
            return null;    
        }

        if(postcode != lead.PostalCode || suburb != lead.City){
            return new PageReference(webURL + '/R4KRetailPurchasePage?formType=product&ld='+ldId+'&n='+randomNumber).setRedirect(true);
        }

        Lead ld = new Lead();
        ld.Id = ldId;
        ld.FirstName = fname;
        ld.LastName = lname;
        ld.Email = email;
        ld.MobilePhone = mobile;
        ld.Street = street;
        ld.City = suburb;
        ld.State = state;
        ld.PostalCode = postcode;
        ld.Country = country;
        ld.Longitude = longitude;
        ld.Latitude = latitude;
        update ld;
        return new PageReference(lead.Territory_Number__r.Ezidebit_Instant_URL__c + '?Type=I&FirstName='+fname+'&LastName='+lname+'&PaymentAmount=' + totalPayableAmt + '&PaymentReference=' + lead.ReferenceNo__c + '&RedirectURL=' + webURL + '/R4KRetailSuccessPage').setRedirect(true);
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','proceedToPayment','',String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public PageReference redirectToTMD()
{
    if(postcode == null || postcode == '' || postcode.length() != 4 || (postcode!=null && !postcode.isNumeric()))
    {
        postcodeMissing=true;
        return null;
    }
    else
    {
        List<Postcode__c> postcodes = [select id, Territory__c,Territory__r.TMD_Link__c from Postcode__c where name=:postcode and Territory__r.Is_Credit_Contract__c=true LIMIT 1];
        String link;
        if(postcodes.size()>0)
            link = postcodes[0].Territory__r.TMD_Link__c;
        else 
        {
            postcode = '3130';
            postcodes = [select id, Territory__c,Territory__r.TMD_Link__c from Postcode__c where name=:postcode and Territory__r.Is_Credit_Contract__c=true LIMIT 1];
            if(postcodes.size()>0)
            link = postcodes[0].Territory__r.TMD_Link__c;
        }   
        return new PageReference(link).setRedirect(true);
    }
}

public void getProductInventories(){
    pid = Apexpages.currentPage().getParameters().get('pid');
    warehouseOptions = new List<SelectOption>();
    if(pid != null && pid != ''){
        product = [SELECT Id,Name,Barcode__c,DeviceModel__c,ProductCode__c,Product_Master__c,Product_Master__r.Name,Product_Master__r.ProductImageId__c,Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                            ProductImageId__c,ProductList__c,ProductName__c,Provider__c,RRP__c,Delivery_Cost__c,Regional_Delivery_Cost__c,No_of_Carton__c,Invoice_Cost_Inc_GST__c,Transfer_Fee_Not_Applicable__c,
                            Stock_URL__c,IsPromo__c,Market_Price__c,Cash_Price__c,Secondary_Supplier__c 
                            FROM Product_Inventory__c WHERE Id = :pid LIMIT 1];
        deliveryCost = '0';
        transferCost = 0;
    }else{
        List<Product_Inventory__c> allProductInventories = [SELECT Id,Name,Barcode__c,DeviceModel__c,ProductCode__c,Product_Master__c,Product_Master__r.Name,Product_Master__r.ProductImageId__c,Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                            ProductImageId__c,ProductList__c,ProductName__c,Provider__c,RRP__c,Delivery_Cost__c,Regional_Delivery_Cost__c,No_of_Carton__c,Invoice_Cost_Inc_GST__c,Transfer_Fee_Not_Applicable__c,Secondary_Supplier__c,
                            Stock_URL__c,IsPromo__c,Market_Price__c,Cash_Price__c 
                            FROM Product_Inventory__c WHERE Disabled__c = false];
    
        allProductInventories1 = new List<Product_Inventory__c>();
        allProductInventories2 = new List<Product_Inventory__c>();
        allProductInventories3 = new List<Product_Inventory__c>();
        allProductInventories4 = new List<Product_Inventory__c>();
        allProductInventories5 = new List<Product_Inventory__c>();
        for(Integer p=0; p<allProductInventories.size(); p++){
            if(p < 1000){
                allProductInventories1.add(allProductInventories[p]);
            }else if(p < 2000){
                allProductInventories2.add(allProductInventories[p]);
            }else if(p < 3000){
                allProductInventories3.add(allProductInventories[p]);
            }else if(p < 4000){
                allProductInventories4.add(allProductInventories[p]);
            }else if(p < 5000){
                allProductInventories5.add(allProductInventories[p]);
            }
        } 
    }
}

public void checkServiceability(){
    String postcode = Apexpages.currentPage().getParameters().get('pcode');
    String suburb = Apexpages.currentPage().getParameters().get('suburb');
    warehouseOptions = new List<SelectOption>();
    deliveryMessage = 'Something went wrong. Please try again.';
    deliveryCost = '0';
    transferCost = 0;
    deliveryCostInput = 0;
    ProductDeliveryResponse pdr = R4KWebController.checkDelivery(postcode, suburb, pid, true, true);
    System.debug('****pdr: ' + pdr);
    if(pdr.warehouses == null || pdr.warehouses.size() == 0){
        deliveryMessage = pdr.errorMsg;
        deliveryCost = '0';
        transferCost = 0;
        warehouseSelected = null;
    }else if(pdr.warehouses.size() > 0){
        String warehouseOption;
        for(Integer w=0; w<pdr.warehouses.size(); w++){
            warehouseOption = (pdr.warehouses[w].warehouse.Warehouse_Location__c + ' - Transfer Fee $' + pdr.warehouses[w].transferFee + ' - Available Stock : ' + Integer.valueOf(pdr.warehouses[w].warehouse.Stock_Available_To_Order__c));
            if(w == 0){
                warehouseSelected = warehouseOption;
            }
            warehouseOptions.add(new SelectOption(warehouseOption, warehouseOption));
        }
        if(product.Provider__c == 'AOL' || product.Provider__c == 'HNC'){
            deliveryCost = String.valueOf(pdr.deliveryFee);
            transferCost = pdr.warehouses[0].transferFee;
        }else{
            deliveryCostInput = pdr.deliveryFee;
        }
    }
}

public static ProductDeliveryResponse checkDelivery(String postcode, String suburb, String prodId, Boolean includeTransfers, Boolean includeTransfersWithFee){
    try{
        Product_Inventory__c selectedProduct = [SELECT Id,Name,Barcode__c,DeviceModel__c,ProductCode__c,Product_Master__c,Product_Master__r.Name,Product_Master__r.ProductImageId__c,Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                                ProductImageId__c,ProductList__c,ProductName__c,Provider__c,RRP__c,Delivery_Cost__c,Regional_Delivery_Cost__c,No_of_Carton__c,Invoice_Cost_Inc_GST__c,Transfer_Fee_Not_Applicable__c,
                                                Stock_URL__c,IsPromo__c,Market_Price__c,Cash_Price__c 
                                                FROM Product_Inventory__c WHERE Id = :prodId LIMIT 1];
        Boolean hncServiceable = false;
        Boolean aolServiceable = false;
        Boolean otherServiceable = false;
        String customerDeliveryState;
        String hncDeliveryRegion;
        Map<String,Decimal> transferCostMap = new Map<String,Decimal>();
        List<String> transferWarehouses = new List<String>{'ALL'};
        transferCostMap.put('ALL',0);
        ProductDeliveryResponse pdr = new ProductDeliveryResponse();
        pdr.deliveryFee = 0;
        List<ProductWarehouse> warehouses = new List<ProductWarehouse>();

        if(selectedProduct.Provider__c == 'HNC'){
            if(postcode != null && postcode != ''){
                List<Postcode__c> postcodeList = [SELECT Id,HNC_Delivery_Region__c,Territory__c,Territory__r.Street_State__c 
                                                FROM Postcode__c WHERE Name =: postcode AND Territory__r.Is_Credit_Contract__c = true AND
                                                Territory__r.State_Master_State__c != 'NZ' LIMIT 1];
                if(postcodeList.size() > 0){
                    customerDeliveryState = postcodeList[0].Territory__r.Street_State__c;
                    hncDeliveryRegion = (postcodeList[0].HNC_Delivery_Region__c == null ? 'Country' : postcodeList[0].HNC_Delivery_Region__c);
                    hncServiceable = (postcodeList[0].HNC_Delivery_Region__c != null && postcodeList[0].HNC_Delivery_Region__c != 'No Service' ? true : false);
                    pdr.deliveryFee = (hncDeliveryRegion == 'Country' ? (selectedProduct.Regional_Delivery_Cost__c == null ? 0 : selectedProduct.Regional_Delivery_Cost__c) : (selectedProduct.Delivery_Cost__c == null ? 0 : selectedProduct.Delivery_Cost__c));
                    List<HNC_Warehouse_Transfer__c> hncTransfers = [SELECT Id,Name,To_NSW__c,To_NSW_Cost__c,To_NT__c,To_NT_Cost__c,To_QLD__c,To_QLD_Cost__c,
                                                                To_SA__c,To_SA_Cost__c,To_TAS__c,To_TAS_Cost__c,To_VIC__c,To_VIC_Cost__c,To_WA__c,To_WA_Cost__c 
                                                                FROM HNC_Warehouse_Transfer__c];
                                                            
                    for(HNC_Warehouse_Transfer__c hwt : hncTransfers){
                        if(customerDeliveryState == 'NSW' && hwt.To_NSW__c){
                            transferCostMap.put(hwt.Name,hwt.To_NSW_Cost__c);
                            transferWarehouses.add(hwt.Name);
                        }else if(customerDeliveryState == 'NT' && hwt.To_NT__c){
                            transferCostMap.put(hwt.Name,hwt.To_NT_Cost__c);
                            transferWarehouses.add(hwt.Name);
                        }else if(customerDeliveryState == 'QLD' && hwt.To_QLD__c){
                            transferCostMap.put(hwt.Name,hwt.To_QLD_Cost__c);
                            transferWarehouses.add(hwt.Name);
                        }else if(customerDeliveryState == 'SA' && hwt.To_SA__c){
                            transferCostMap.put(hwt.Name,hwt.To_SA_Cost__c);
                            transferWarehouses.add(hwt.Name);
                        }else if(customerDeliveryState == 'TAS' && hwt.To_TAS__c){
                            transferCostMap.put(hwt.Name,hwt.To_TAS_Cost__c);
                            transferWarehouses.add(hwt.Name);
                        }else if(customerDeliveryState == 'VIC' && hwt.To_VIC__c){
                            transferCostMap.put(hwt.Name,hwt.To_VIC_Cost__c);
                            transferWarehouses.add(hwt.Name);
                        }else if(customerDeliveryState == 'WA' && hwt.To_WA__c){
                            transferCostMap.put(hwt.Name,hwt.To_WA_Cost__c);
                            transferWarehouses.add(hwt.Name);
                        }
                    }
                }
            }
        }else if(selectedProduct.Provider__c == 'AOL'){
            if(postcode != null && postcode != '' && suburb != null && suburb != ''){
                List<Postcode__c> postcodeList = [SELECT Id,HNC_Delivery_Region__c,Territory__c,Territory__r.Street_State__c 
                                                    FROM Postcode__c WHERE Name =: postcode AND Territory__r.Is_Credit_Contract__c = true AND 
                                                    Territory__r.State_Master_State__c != 'NZ' LIMIT 1];
                if(postcodeList.size() > 0){
                    customerDeliveryState = postcodeList[0].Territory__r.Street_State__c;
                    hncDeliveryRegion = (postcodeList[0].HNC_Delivery_Region__c == null ? 'Country' : postcodeList[0].HNC_Delivery_Region__c);
                    pdr.deliveryFee = (hncDeliveryRegion == 'Country' ? (selectedProduct.Regional_Delivery_Cost__c == null ? 0 : selectedProduct.Regional_Delivery_Cost__c) : (selectedProduct.Delivery_Cost__c == null ? 0 : selectedProduct.Delivery_Cost__c));
                    List<Suburb__c> aolSuburbs = [SELECT Id FROM Suburb__c WHERE Postcode__c = :postcodeList[0].Id AND Name = :suburb AND AOL_Delivery__c = true LIMIT 1];
                    aolServiceable = (aolSuburbs.size() > 0 ? true : false);
                    
                    if(customerDeliveryState == 'TAS'){
                        transferCostMap.put('VIC',0);
                        transferWarehouses.add('VIC');
                    }else if(customerDeliveryState == 'NT'){
                        transferCostMap.put('NT',0);
                        transferWarehouses.add('WA');
                    }
                }
            }
        }else if(selectedProduct.Provider__c == 'HOB' || selectedProduct.Provider__c == 'NEG' || selectedProduct.Provider__c == 'PEN' || selectedProduct.Provider__c == 'OTH'){
            List<Postcode__c> postcodeList = [SELECT Id,HNC_Delivery_Region__c,Territory__c,Territory__r.Street_State__c,Providers__c 
                                            FROM Postcode__c WHERE Name =: postcode AND Territory__r.Is_Credit_Contract__c = true AND 
                                            Territory__r.State_Master_State__c != 'NZ' LIMIT 1];
            
            if(postcodeList.size() > 0){
                customerDeliveryState = postcodeList[0].Territory__r.Street_State__c;
                hncDeliveryRegion = (postcodeList[0].HNC_Delivery_Region__c == null ? 'Country' : postcodeList[0].HNC_Delivery_Region__c);
                otherServiceable = (selectedProduct.Provider__c == 'OTH' || (postcodeList[0].Providers__c != null && postcodeList[0].Providers__c.containsIgnoreCase(selectedProduct.Provider__c)) ? true : false);
                pdr.deliveryFee = (hncDeliveryRegion == 'Country' ? (selectedProduct.Regional_Delivery_Cost__c == null ? 0 : selectedProduct.Regional_Delivery_Cost__c) : (selectedProduct.Delivery_Cost__c == null ? 0 : selectedProduct.Delivery_Cost__c));
            }    
        }
        System.debug('****aolServiceable : ' + aolServiceable);
        System.debug('****hncServiceable : ' + hncServiceable);
        System.debug('****customerDeliveryState : ' + customerDeliveryState);
        System.debug('****transferWarehouses : ' + transferWarehouses);
        
        if(aolServiceable || hncServiceable || otherServiceable){
            List<Product_Warehouse__c> sameStateWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                            FROM Product_Warehouse__c WHERE 
                            Warehouse_Location__c =: customerDeliveryState AND InStock__c = true AND 
                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                            Product_Inventory__c =: selectedProduct.Id
                            ORDER BY Stock_Available_To_Order__c DESC];
            
            for(Integer p=0; p<sameStateWarehouses.size(); p++){
                ProductWarehouse pw = new ProductWarehouse();
                pw.warehouse = sameStateWarehouses[p];
                pw.transferFee = 0;
                warehouses.add(pw);
            }
            if(includeTransfers){
                List<Product_Warehouse__c> otherStateWarehouses = new List<Product_Warehouse__c>();
                if(selectedProduct.Provider__c == 'HNC'){
                    otherStateWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                    Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                    Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                    FROM Product_Warehouse__c WHERE 
                                    (Warehouse_Location__c IN: transferWarehouses OR Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c = true OR Product_Inventory__r.IsPromo__c = true) AND InStock__c = true AND 
                                    Warehouse_Location__c !=: customerDeliveryState AND
                                    Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                    Product_Inventory__c =: selectedProduct.Id
                                    ORDER BY Stock_Available_To_Order__c DESC];
                }else{
                    otherStateWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                    Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                    Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                    FROM Product_Warehouse__c WHERE 
                                    Warehouse_Location__c IN: transferWarehouses AND InStock__c = true AND 
                                    Warehouse_Location__c !=: customerDeliveryState AND
                                    Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                    Product_Inventory__c =: selectedProduct.Id
                                    ORDER BY Stock_Available_To_Order__c DESC];    
                }
                for(Integer p=0; p<otherStateWarehouses.size(); p++){
                    if(includeTransfersWithFee || (!includeTransfersWithFee && !transferCostMap.containsKey(otherStateWarehouses[p].Warehouse_Location__c) || (transferCostMap.containsKey(otherStateWarehouses[p].Warehouse_Location__c) && transferCostMap.get(otherStateWarehouses[p].Warehouse_Location__c) == 0))){
                        ProductWarehouse pw = new ProductWarehouse();
                        pw.warehouse = otherStateWarehouses[p];
                        pw.transferFee = (transferCostMap.containsKey(otherStateWarehouses[p].Warehouse_Location__c) ? transferCostMap.get(otherStateWarehouses[p].Warehouse_Location__c) : 0);
                        warehouses.add(pw);
                    }
                }
            }
            if(warehouses.size() > 0){
                warehouses.sort();
                pdr.warehouses = warehouses;
            }else{
                pdr.errorMsg = 'Could not find a warehouse with stock that delivers to this postcode.';
            }
        }else{
            pdr.errorMsg = 'Product is not serviceable in this postcode and suburb.';
        }
        return pdr;
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','checkDelivery',postcode + '-' + suburb + '-' + prodId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
        return null;
    }
}

public void paymentProcessedForRetailPurchase()
{
    List<Collection_Activity__c> cas = new List<Collection_Activity__c>();
    List<Account> acctTR4KList = new List<Account>();
    String PaymentReference = apexpages.currentpage().getparameters().get('PaymentReference'); 
    String ScheduledAmount = apexpages.currentpage().getparameters().get('ScheduledAmount'); 
    String PaymentAmountStr = apexpages.currentpage().getparameters().get('PaymentAmount'); 
    String TransactionFeeCustomer = apexpages.currentpage().getparameters().get('TransactionFeeCustomer'); 
    String ResultText = apexpages.currentpage().getparameters().get('ResultText'); 
    String ResultCode = apexpages.currentpage().getparameters().get('ResultCode'); 
    String NameOnCard = apexpages.currentpage().getparameters().get('NameOnCard'); 
    String BankReceiptID = apexpages.currentpage().getparameters().get('BankReceiptID'); 
    String MobilePhoneNumber = apexpages.currentpage().getparameters().get('MobilePhoneNumber'); 
    String EmailAddress = apexpages.currentpage().getparameters().get('EmailAddress'); 
    String BillerID = apexpages.currentpage().getparameters().get('BillerID'); 
    String TransactionID = apexpages.currentpage().getparameters().get('TransactionID'); 
    
    Decimal PaymentAmount=  PaymentAmountStr !=null ? Decimal.valueOf(PaymentAmountStr): 0;
    Boolean success = ResultText=='Approved' ? true : false;
    paymentSuccess = success;
    
    List<Lead> ldList = [SELECT Id,FirstName,LastName,Email,MobilePhone,Street,City,State,PostalCode,ReferenceNo__c,
                        Territory_Number__c,Territory_Number__r.Ezidebit_Instant_URL__c,Form_Type__c,Latitude,Longitude 
                        FROM Lead WHERE ReferenceNo__c =: paymentReference LIMIT 1];
    if(ldList.size() > 0){
        lead = ldList[0];
    }
    
    createRetailPurchase(PaymentReference,success,TransactionID,PaymentAmount,ResultText);
}
    

public void createRetailPurchase(String PaymentReference, Boolean success, String transactionId, Decimal paymentAmount,String failedReason)
{
    try
    {
    Id personAccountRetailPurchaseRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Retail Purchase').getRecordTypeId();
    Id oppRetailPurchaseRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Retail Purchase').getRecordTypeId();
    List<OpportunityLineItem> itemsToAdd = new List<OpportunityLineItem>();
    
    List<Lead> leads = [select id,FirstName,LastName,Name,MobilePhone,Email,Reason_for_Enquiry__c,Enquiry_Notes__c,Street,City,State,PostalCode,Desired_Product__c,did_your_hear__c,Latitude,Longitude,
            OwnerId,Territory_Number__c,Territory_Number__r.State_Master_State__c,Territory_Number__r.Applicant_Customer_Prefix__c,ReferenceNo__c,Account__c
            from Lead where ReferenceNo__c=:PaymentReference];
    List<Cart_Item__c> carts = [select id,Lead__c,UnitPrice__c,Delivery_Fee__c,Total_Price__c,Transaction_Fee_Percent__c,Product_Inventory__c,
            Product_Inventory__r.ProductName__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Family,Quantity__c,Product_Inventory__r.Provider__c,
            Product_Warehouse__c
            from Cart_Item__c where Lead__r.ReferenceNo__c=:PaymentReference and Quantity__c>0 and (Product_Warehouse__c<>null or Transaction_Fee_Percent__c<>null)];
    
    if(leads.size()>0)
    {
        Lead ld = leads[0];
        R4KOnlineApplicationController ro = new R4KOnlineApplicationController();
        List<String> territoryIdsWithRecordAccess = ro.getTerritoriesWithAccess(ld.OwnerId);
        String accountId = ld.Account__c;
        if(ld.Account__c==null)
        {
            //Convert to new or existing Applicant
            List<Account> accts = [select id from Account where Territory_Number__c IN: territoryIdsWithRecordAccess and PersonMobilePhone=:ld.MobilePhone and PersonEmail=:ld.Email and RecordTypeId=:personAccountRetailPurchaseRecordTypeId LIMIT 1];
            Account createdAcct = new Account();
            if(accts.size()>0)
            {
            //If Account found -> update the details and convert to existing Account
            createdAcct.Id = accts[0].Id;
            createdAcct.Enquiry_Date__c = Date.today();
            createdAcct.Enquiry_Datetime__c = Datetime.now();
            update createdAcct;
            system.debug('##Converting Lead to probable applicant');
            //////////////////////////////////////////////////
        
            }
            else
            {
                createdAcct = Util.createApplicant(ld, null, 'Retail Purchase',personAccountRetailPurchaseRecordTypeId,null,null);
                system.debug('##Converting Lead to new retail purchase applicant');
            }
            
            NewEnquirySectionController nes = new NewEnquirySectionController();
            nes.doConvertFunc(ld.Id,createdAcct);
            nes.calculateCallTime(createdAcct.Id,ld.Id); 
            accountId = createdAcct.Id;
        }
        ///////////////////////////////////
        
        //Add Retail Purchase Agreement
        String todayDate = Datetime.now().format('ddMMMyyyy');
                            
        Opportunity opportunity = new Opportunity();
        opportunity.Name = ld.FirstName + ' ' + ld.LastName +' - Retail Purchase - '+todayDate;
        opportunity.AccountId = accountId;
        opportunity.RecordTypeId= oppRetailPurchaseRecordTypeId;
        opportunity.StageName = 'Goods Delivered';
        opportunity.Start_Date__c = Date.today();
        opportunity.CloseDate = Date.today();
        opportunity.Term_Months__c = '13';
        opportunity.Payment_Frequency__c = 'Fortnightly';
        opportunity.Is_Active__c = true;
        opportunity.Product_Description__c=ld.Desired_Product__c;
        opportunity.Reason_for_Dishonour__c = failedReason!=null ? failedReason:null;
        opportunity.Ezidebit_Payment_Status_Date__c = Date.today();
        opportunity.Ezidebit_Ref_No__c = ld.ReferenceNo__c;
        opportunity.Is_Credit_Contract__c = true;
        insert opportunity;
        ////////////////////////////////////
        
        //Add OpportunityLineItems
        if(carts.size()>0)
        {
            for(Cart_Item__c cart : carts)
            {
                List<PriceBookEntry> pbes;
                if(cart.Product_Warehouse__c<>null)
                    pbes = [select id from PriceBookEntry where CurrencyIsoCode='AUD' and Product2.Id=:cart.Product_Inventory__r.Product_Master__c Limit 1];
                else if(cart.Transaction_Fee_Percent__c<>null)
                    pbes = [select id from PriceBookEntry where CurrencyIsoCode='AUD' and Name='Online Transaction Fee' Limit 1];
                OpportunityLineItem item = new OpportunityLineItem();
                item.OpportunityId=opportunity.Id;
                item.PriceBookEntryId=pbes[0].Id;
                if(cart.Product_Inventory__c!=null)
                {
                    item.Description=cart.Product_Inventory__r.ProductName__c;
                    item.Supplier__c=cart.Product_Inventory__r.Provider__c;
                    item.Product_Inventory__c = cart.Product_Inventory__c;
                    item.Product_Warehouse__c = cart.Product_Warehouse__c;
                }
                else if(cart.Transaction_Fee_Percent__c<>null)
                    item.Description='Online Transaction Fee - '+cart.Transaction_Fee_Percent__c+'%';
                item.Cost_of_Goods__c=cart.UnitPrice__c;
                item.Delivery_Installation_Cost__c = cart.Delivery_Fee__c;
                item.UnitPrice=cart.Total_Price__c;
                item.Quantity__c=cart.Quantity__c;
                item.Total_Agreement_Value_For_Rent__c=cart.Total_Price__c;
                if(cart.Product_Inventory__r.Product_Master__r.Family == 'Phones'){
                    item.IMIE_Number__c = 'TBC';
                }
                itemsToAdd.add(item);
            }
            if(itemsToAdd.size()>0)
                insert itemsToAdd;
        }
        ////////////////////////////////////
        
        //If success Add Payment
        if(success)
        {
            List<Opportunity> opps = [select id,Contract_No__c,Amount from Opportunity where id=:opportunity.Id LIMIT 1];
            if(opps.size()>0)
            {
                Payment_File__c paymentFile = new Payment_File__c();
                paymentFile.File_Name__c = 'RetailPurchase_'+ld.LastName+'_'+todayDate;
                paymentFile.File_Upload_Date__c = DateTime.now();
                paymentFile.RecordTypeId = Util.getRecordTypeInfosByDeveloperName('Payment_File__c').get('Ezidebit').Id;
                paymentFile.OwnerId=ld.OwnerId;
                paymentFile.TransactionId__c=transactionId;
                insert paymentFile;
                
                Payment__c payment = new Payment__c(Payment_File__c = paymentFile.Id);
                payment.RecordTypeId           = PaymentUtil.RECORDTYPE_ID_EZIDEBIT;
                payment.Payment_Date__c        = Date.today();
                payment.Ezidebit_Ref_No__c     = ld.ReferenceNo__c;
                payment.Customer_Account_No__c = opps[0].Contract_No__c;
                payment.Schedule_Amount__c     = paymentAmount;
                payment.Deducted_Amount__c     = paymentAmount;
                payment.Amount_Deposited__c    = paymentAmount;
                payment.Actual_Amount__c       = paymentAmount;
                payment.Client_Fees__c         = 0;
                payment.Fee_Amount__c          = 0;
                payment.Setup_Fee__c           = 0;
                payment.Is_Credit_Contract__c  = true;
                payment.ApplicantLookup__c  = accountId;
                payment.Agreement__c  = opps[0].Id;
                payment.Customer_Name__c=ld.Name;
                payment.Payment_Type__c = 'Ezidebit';
                insert payment;
                
                system.debug('##successfulPayment...');
                
                
                if(paymentAmount==opps[0].Amount)
                {
                    //Now send the invoice to the customer 
                    ////////////////////////////////////////////////////
                    R4KWebController.sendRetailInvoice(opps[0].Id);
                    //Send SMS and EMAIL to the customer
                    ///////////////////////////////////////
                }
                
            }
        }
        ////////////////////////////////////
    
    }
    }
    catch(Exception ex)
    {
        system.debug('Exception: '+ex);
        ErrorLog.addErrorLog('R4KWebController','createRetailPurchase',PaymentReference,String.valueOf(ex) + ' ##success: '+success+' transactionId: '+transactionId+' failedReason: '+failedReason +' paymentAmount: '+paymentAmount,String.valueOf(ex.getLineNumber()));
    }
}

@future(callout=true)
public static void sendRetailInvoice(String retailOppId){
    try{
        List<Opportunity> retailOppList = [SELECT Id,Name,AccountId,Account.Name,Account.PersonEmail,Account.PersonMobilePhone,Account.SMS_Mobile__c,
                                            Retail_Purchase_Territory__c,Account.PersonContactId,OwnerId,Contract_No__c
                                            FROM Opportunity WHERE Id = :retailOppId LIMIT 1];
        SendMailController sm = new SendMailController();
        sm.sendRetailOrderRequest(retailOppId);
        if(retailOppList.size() > 0){
            List<Attachment> taxInvoiceAttachments = new List<Attachment>();
            List<Messaging.Emailfileattachment> emailFileAttachments = new List<Messaging.Emailfileattachment>();
            Messaging.reserveSingleEmailCapacity(10);
            List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

            PageReference customerPDF = new PageReference('/apex/R4KInvoice?oppId='+retailOppId+'&formType=buynowcustomer');
            Blob pdfBlob;
            String pdfname;
            Attachment attach;
            try {
                pdfBlob = customerPDF.getContentAsPDF();
            } catch (Exception Ex) {
                pdfBlob = Blob.valueOf('Test');
            }
            pdfname = 'Customer TaxInvoice_' + retailOppList[0].Contract_No__c + '_' + DateTime.now().format('ddMMMyyyy') + '.pdf';

            attach = new Attachment();
            attach.Name = pdfname;
            attach.ParentId = retailOppId;
            attach.body = pdfBlob;
            taxInvoiceAttachments.add(attach);

            Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
            efa.setFileName(pdfname);
            efa.setBody(pdfBlob);
            emailFileAttachments.add(efa);

            OrgWideEmailAddress owa = [select id, Address, DisplayName from OrgWideEmailAddress where DisplayName='Rent4Keeps Noreply' LIMIT 1];
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('Your R4K Order - ' + retailOppList[0].Contract_No__c);
            email.setHtmlBody('<p>Hi ' + retailOppList[0].Account.Name + ',</p>' + '<p>We have received your payment. Your order is being processed and will be on its way to you soon.</p><p>Please see attached Tax Invoice.</p><br/><p>Regards<br/>R4K</p>');
            email.setToAddresses(new String[] {retailOppList[0].Account.PersonEmail});
            email.setTargetObjectId(retailOppList[0].Account.PersonContactId);
            email.setWhatId(retailOppList[0].Id);
            email.setSaveAsActivity(true);
            email.setUseSignature(false);
            email.setTreatTargetObjectAsRecipient(false);
            email.setFileAttachments(emailFileAttachments);
            email.setOrgWideEmailAddressId(owa.Id);
            emails.add(email);

            PageReference licenseePDF = new PageReference('/apex/R4KInvoice?oppId='+retailOppId+'&formType=buynowlicensee');
            try {
                pdfBlob = licenseePDF.getContentAsPDF();
            } catch (Exception ex) {
                pdfBlob = Blob.valueOf('Test');
            }
            pdfname = 'Licensee TaxInvoice_' + retailOppList[0].Contract_No__c + '_' + DateTime.now().format('ddMMMyyyy') + '.pdf';

            attach = new Attachment();
            attach.Name = pdfname;
            attach.ParentId = retailOppId;
            attach.body = pdfBlob;
            taxInvoiceAttachments.add(attach);

            Messaging.sendEmail(emails);
            String smsTemplateForCust = ('Hi ' + retailOppList[0].Account.Name + ', we have received your payment. Your order is being processed and will be on its way to you soon.');
            CommunicationUtil.sendSMS(retailOppList[0].Account.SMS_Mobile__c,smsTemplateForCust,'RetailPurchase','Opportunity',retailOppId,retailOppList[0].OwnerId,false,null);
            insert taxInvoiceAttachments;
        }
    }catch(Exception ex){
        ErrorLog.addErrorLog('R4KWebController','sendRetailInvoice',retailOppId,String.valueOf(ex),String.valueOf(ex.getLineNumber()));
    }
}


public class ProductDeliveryResponse{
    public String errorMsg{get;set;}
    public List<ProductWarehouse> warehouses{get;set;}
    public Decimal deliveryFee{get;set;}
}

public class ProductWarehouse implements Comparable{
    public Product_Warehouse__c warehouse{get;set;}
    public Decimal transferFee{get;set;}
    
    public Integer compareTo(Object objToCompare) {
        ProductWarehouse productWarehouseToCompare = (ProductWarehouse)objToCompare;

        if (this.transferFee == productWarehouseToCompare.transferFee) {
            return 0;
        } else if (this.transferFee > productWarehouseToCompare.transferFee) {
            return 1;
        } else {
            return -1;
        }
    }
}

public transient List<Product_Inventory__c> allProductInventories1{get;set;}
public transient List<Product_Inventory__c> allProductInventories2{get;set;}
public transient List<Product_Inventory__c> allProductInventories3{get;set;}
public transient List<Product_Inventory__c> allProductInventories4{get;set;}
public transient List<Product_Inventory__c> allProductInventories5{get;set;}
public String deliveryMessage{get;set;}
public List<SelectOption> warehouseOptions{get;set;}
public String warehouseSelected{get;set;}
public Decimal transferCost{get;set;}
public Decimal deliveryCostInput{get;set;}

public class ProductWrapper{
    public Product_Inventory__c inventory{get;set;}
    public Product_Warehouse__c warehouse{get;set;}
    public Integer quantity{get;set;}
    public String deliveryMessage{get;set;}
    public String deliveryCost{get;set;}
    public String quantityMessage{get;set;}
}
public List<ProductWrapper> productWrappers{get;set;} 

}