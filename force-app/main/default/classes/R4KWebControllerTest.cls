@isTest(SeeAllData=true)
public class R4KWebControllerTest
{

public static Lead lead1;

public static void createTestData(){
    lead1 = new Lead(
            FirstName = 'Mohit',
            LastName = 'Puli',
            Email = 'mohit@rent4keeps.com.au',
            MobilePhone = '0449004490',
            Street = '32 Fountain Drive',
            City = 'Narre Warren',
            State = 'VIC',
            PostalCode = '3805',
            Country = 'AU',
            Lead_Medium__c = 'Web',
            Reason_For_Enquiry__c = 'Complaint',
            did_your_hear__c = 'Website',
            Desired_Product__c = 'Macbook Pro',
            contact_desc__c = 'Test',
            Not_Spam__c = 'yes',
            OTP_Code__c = '1234',
            Opt_In_Info_From_Rent4keeps__c = true,
            Form_Type__c = 'APPLY NOW',
        Desired_Product_Ids__c = 'HDV70E1');
    insert lead1;
}

@isTest
public static void addLeadTest(){
    ApexPages.currentPage().getParameters().put('formType','apply');
    R4KWebController rwc = new R4KWebController();
    rwc.initR4KWeb();
    rwc.fname = 'Mohit';
    rwc.lname = 'Puli';
    rwc.mobile = '0449004490';
    rwc.email = 'mohit@rent4keeps.com.au';
    rwc.street = '35A Railway Road';
    rwc.suburb = 'Blackburn';
    rwc.state = 'VIC';
    rwc.postcode = '3130';
    rwc.country = 'AU';
    rwc.reasonForEnquiry = 'Complaint';
    rwc.addLead();
}

@isTest    
public static void authenticateOtpTest(){
    createTestData();
    ApexPages.currentPage().getParameters().put('ld',lead1.Id);
    ApexPages.currentPage().getParameters().put('formType','otp');
    ApexPages.currentPage().getParameters().put('otpCode','1234');
    R4KWebController rwc = new R4KWebController();
    rwc.initR4KWeb();
    rwc.authenticateOTPCode();
}

@isTest    
public static void initR4KProduct(){
    List<Product_Inventory__c> prodList = [SELECT Id FROM Product_Inventory__c WHERE Invoice_Cost_Inc_GST__c > 0 AND Disabled__c = false LIMIT 1];
    if(prodList.size() > 0){
        ApexPages.currentPage().getParameters().put('prodId',prodList[0].Id);
        R4KWebController rwc = new R4KWebController();
        rwc.fname = 'Mohit';
        rwc.lname = 'Puli';
        rwc.mobile = '0449004490';
        rwc.email = 'mohit@rent4keeps.com.au';
        rwc.street = '35A Railway Road';
        rwc.suburb = 'Blackburn';
        rwc.state = 'VIC';
        rwc.postcode = '3130';
        rwc.country = 'AU';
        rwc.initR4KProduct();
        R4KWebController.checkDelivery('3130','Blackburn',prodList[0].Id,true,true);
        //rwc.proceedToOrder();
        rwc.proceedToPayment();
    }
}


@isTest    
public static void redirectToTMDTest(){
Test.startTest();
createTestData();
R4KWebController rwc = new R4KWebController();
rwc.postcode='3130';
rwc.redirectToTMD();

rwc.postcode=null;
rwc.redirectToTMD();
Test.stopTest();
}
    
@isTest    
public static void testBuyNowHNC(){
Test.startTest();
createTestData();    
List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'HNC' AND Product_Inventory__r.ProductCode__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
    if(vicWarehouses.size() > 0){
        lead1.Desired_Product_Ids__c = vicWarehouses[0].Product_Inventory__r.ProductCode__c;
        update lead1;
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
        ApexPages.currentPage().getParameters().put('prodId',vicWarehouses[0].Product_Inventory__c);
        ApexPages.currentPage().getParameters().put('ld',lead1.Id);
        R4KWebController rwc = new R4KWebController();
        rwc.redirectToProducts();
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__c);
        rwc.initR4KProduct();
        rwc.postcode = '3805';
        rwc.suburb = 'Narre Warren';
        rwc.quantity = 1;
        R4KWebController.checkDelivery('3805','Narre Warren',vicWarehouses[0].Product_Inventory__c,true,true);
        rwc.proceedToCart();
        rwc.proceedToDelivery();
        rwc.proceedToPayment();
    }
Test.stopTest();
} 
    
    @isTest    
public static void testBuyNowHNC2(){
Test.startTest();
createTestData();    
List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'HNC' AND Product_Inventory__r.ProductCode__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
    if(vicWarehouses.size() > 0){
        lead1.Desired_Product_Ids__c = vicWarehouses[0].Product_Inventory__r.ProductCode__c;
        update lead1;
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
        ApexPages.currentPage().getParameters().put('prodId',vicWarehouses[0].Product_Inventory__c);
        //ApexPages.currentPage().getParameters().put('ld',lead1.Id);
        R4KWebController rwc = new R4KWebController();
        rwc.redirectToProducts();
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__c);
        rwc.initR4KProduct();
        rwc.postcode = '7000';
        rwc.suburb = 'GLEBE';
        rwc.quantity = 1;
        R4KWebController.checkDelivery('7000','GLEBE',vicWarehouses[0].Product_Inventory__c,true,true);
        rwc.proceedToCart();
        rwc.proceedToDelivery();
        rwc.proceedToPayment();
    }
Test.stopTest();
} 
    
        @isTest    
public static void testBuyNowHNC3(){
Test.startTest();
createTestData();    
List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'HNC' AND Product_Inventory__r.ProductCode__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
    if(vicWarehouses.size() > 0){
        lead1.Desired_Product_Ids__c = vicWarehouses[0].Product_Inventory__r.ProductCode__c;
        update lead1;
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
        ApexPages.currentPage().getParameters().put('prodId',vicWarehouses[0].Product_Inventory__c);
        //ApexPages.currentPage().getParameters().put('ld',lead1.Id);
        R4KWebController rwc = new R4KWebController();
        rwc.redirectToProducts();
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__c);
        rwc.initR4KProduct();
        rwc.postcode = '7000';
        rwc.suburb = 'GLEBE';
        rwc.quantity = 1;
        R4KWebController.checkDelivery('7000','GLEBE',vicWarehouses[0].Product_Inventory__c,true,true);
        //rwc.proceedToCart();
        //rwc.proceedToDelivery();
        //rwc.proceedToPayment();
    }
Test.stopTest();
} 
    
    @isTest    
public static void testBuyNowAOL(){
Test.startTest();
createTestData();    
List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'AOL' AND Product_Inventory__r.ProductCode__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
    if(vicWarehouses.size() > 0){
        lead1.Desired_Product_Ids__c = vicWarehouses[0].Product_Inventory__r.ProductCode__c;
        update lead1;
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
        ApexPages.currentPage().getParameters().put('prodId',vicWarehouses[0].Product_Inventory__c);
        //ApexPages.currentPage().getParameters().put('ld',lead1.Id);
        R4KWebController rwc = new R4KWebController();
        rwc.redirectToProducts();
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__c);
        rwc.initR4KProduct();
        rwc.postcode = '3805';
        rwc.suburb = 'Narre Warren';
        rwc.quantity = 1;
        R4KWebController.checkDelivery('3805','Narre Warren',vicWarehouses[0].Product_Inventory__c,true,true);
        rwc.proceedToCart();
        rwc.proceedToDelivery();
        rwc.proceedToPayment();
    }
Test.stopTest();
} 
    
        @isTest    
public static void testBuyNowAOL2(){
Test.startTest();
createTestData();    
List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'AOL' AND Product_Inventory__r.ProductCode__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
    if(vicWarehouses.size() > 0){
        lead1.Desired_Product_Ids__c = vicWarehouses[0].Product_Inventory__r.ProductCode__c;
        update lead1;
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
        ApexPages.currentPage().getParameters().put('prodId',vicWarehouses[0].Product_Inventory__c);
        ApexPages.currentPage().getParameters().put('ld',lead1.Id);
        R4KWebController rwc = new R4KWebController();
        rwc.redirectToProducts();
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__c);
        rwc.initR4KProduct();
        rwc.postcode = '7000';
        rwc.suburb = 'GLEBE';
        rwc.quantity = 1;
        R4KWebController.checkDelivery('7000','GLEBE',vicWarehouses[0].Product_Inventory__c,true,true);
        rwc.proceedToCart();
        rwc.proceedToDelivery();
        rwc.proceedToPayment();
    }
Test.stopTest();
} 
    
           @isTest    
public static void testBuyNowAOL3(){
Test.startTest();
createTestData();    
List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'AOL' AND Product_Inventory__r.ProductCode__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
    if(vicWarehouses.size() > 0){
        lead1.Desired_Product_Ids__c = vicWarehouses[0].Product_Inventory__r.ProductCode__c;
        update lead1;
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
        ApexPages.currentPage().getParameters().put('prodId',vicWarehouses[0].Product_Inventory__c);
        //ApexPages.currentPage().getParameters().put('ld',lead1.Id);
        R4KWebController rwc = new R4KWebController();
        rwc.redirectToProducts();
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__c);
        rwc.initR4KProduct();
        rwc.postcode = '7000';
        rwc.suburb = 'GLEBE';
        rwc.quantity = 1;
        R4KWebController.checkDelivery('7000','GLEBE',vicWarehouses[0].Product_Inventory__c,true,true);
        //rwc.proceedToCart();
        //rwc.proceedToDelivery();
        //rwc.proceedToPayment();
    }
Test.stopTest();
} 
    
               @isTest    
public static void testBuyNowAOL4(){
Test.startTest();
createTestData();    
List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'AOL' AND Product_Inventory__r.ProductCode__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
    if(vicWarehouses.size() > 0){
        lead1.Desired_Product_Ids__c = vicWarehouses[0].Product_Inventory__r.ProductCode__c;
        update lead1;
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
        ApexPages.currentPage().getParameters().put('prodId',vicWarehouses[0].Product_Inventory__c);
        //ApexPages.currentPage().getParameters().put('ld',lead1.Id);
        R4KWebController rwc = new R4KWebController();
        rwc.redirectToProducts();
        ApexPages.currentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__c);
        rwc.initR4KProduct();
        rwc.postcode = '2084';
        rwc.suburb = 'Cottage Point';
        rwc.quantity = 1;
        R4KWebController.checkDelivery('2084','Cottage Point',vicWarehouses[0].Product_Inventory__c,true,true);
        //rwc.proceedToCart();
        //rwc.proceedToDelivery();
        //rwc.proceedToPayment();
    }
Test.stopTest();
} 

    @isTest
    static void testGetProductInventories(){
        List<Product_Warehouse__c> hncWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                            FROM Product_Warehouse__c WHERE 
                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                            Product_Inventory__r.Provider__c = 'HNC'
                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1];
        List<Product_Warehouse__c> aolWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                            FROM Product_Warehouse__c WHERE 
                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                            Product_Inventory__r.Provider__c = 'AOL'
                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1];
        List<Product_Warehouse__c> hobWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                            FROM Product_Warehouse__c WHERE 
                            InStock__c = true AND 
                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                            Product_Inventory__r.Provider__c = 'HOB'
                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1];
        R4KWebController rc = new R4KWebController();
        rc.getProductInventories();
        if(hncWarehouses.size() > 0){
            Apexpages.currentPage().getParameters().put('pid',hncWarehouses[0].Product_Inventory__c);
            Apexpages.currentPage().getParameters().put('pcode','3805');
            Apexpages.currentPage().getParameters().put('suburb','Narre Warren');
            rc.getProductInventories();
            rc.checkServiceability();
            Apexpages.currentPage().getParameters().put('pid',hncWarehouses[0].Product_Inventory__c);
            Apexpages.currentPage().getParameters().put('pcode','38050');
            Apexpages.currentPage().getParameters().put('suburb','Narre Warren');
            rc.getProductInventories();
            rc.checkServiceability();
        }
        if(aolWarehouses.size() > 0){
            Apexpages.currentPage().getParameters().put('pid',aolWarehouses[0].Product_Inventory__c);
            Apexpages.currentPage().getParameters().put('pcode','3805');
            Apexpages.currentPage().getParameters().put('suburb','Narre Warren');
            rc.getProductInventories();
            rc.checkServiceability();
        }
        if(hobWarehouses.size() > 0){
            Apexpages.currentPage().getParameters().put('pid',hobWarehouses[0].Product_Inventory__c);
            Apexpages.currentPage().getParameters().put('pcode','3805');
            Apexpages.currentPage().getParameters().put('suburb','Narre Warren');
            rc.getProductInventories();
            rc.checkServiceability();
            List<Postcode__c> postcodeList = [SELECT Id,Name FROM Postcode__c WHERE Providers__c includes ('HOB') LIMIT 1];
            if(postcodeList.size() > 0){
                Apexpages.currentPage().getParameters().put('pid',hobWarehouses[0].Product_Inventory__c);
                Apexpages.currentPage().getParameters().put('pcode',postcodeList[0].Name);
                Apexpages.currentPage().getParameters().put('suburb','Narre Warren');
                rc.getProductInventories();
                rc.checkServiceability();
            }
        }
    }
    
    public static testMethod void testBuyNowPayment() 
    {  
        Test.startTest();
        List<Product_Warehouse__c> vicWarehouses = [SELECT Id,Name,Available_Stock__c,Stock_Pending_To_Order_To_Supplier__c,Stock_Available_To_Order__c,InStock__c,Warehouse_Location__c,Product_Inventory__c,Product_Inventory__r.Barcode__c,Product_Inventory__r.DeviceModel__c,Product_Inventory__r.ProductCode__c,Product_Inventory__r.Product_Master__c,Product_Inventory__r.Product_Master__r.Name,Product_Inventory__r.Product_Master__r.ProductImageId__c,Product_Inventory__r.Product_Master__r.Is_Serviceable_By_HNC_Everywhere__c,
                                            Product_Inventory__r.ProductImageId__c,Product_Inventory__r.ProductList__c,Product_Inventory__r.ProductName__c,Product_Inventory__r.Provider__c,Product_Inventory__r.RRP__c,Product_Inventory__r.Delivery_Cost__c,Product_Inventory__r.Regional_Delivery_Cost__c,Product_Inventory__r.No_of_Carton__c,Product_Inventory__r.Invoice_Cost_Inc_GST__c,Product_Inventory__r.Transfer_Fee_Not_Applicable__c,
                                            Product_Inventory__r.Stock_URL__c,Product_Inventory__r.IsPromo__c,Product_Inventory__r.Market_Price__c,Product_Inventory__r.Cash_Price__c 
                                            FROM Product_Warehouse__c WHERE 
                                            Warehouse_Location__c = 'VIC' AND InStock__c = true AND 
                                            Stock_Available_To_Order__c > 0 AND Product_Inventory__r.Disabled__c = false AND 
                                            Product_Inventory__r.Provider__c = 'AOL' AND Product_Inventory__r.ProductCode__c != null AND
                                            Product_Inventory__r.Product_Master__c != null
                                            ORDER BY Stock_Available_To_Order__c DESC LIMIT 1]; 
        if(vicWarehouses.size() > 0){
        	ApexPages.CurrentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.ProductCode__c);
            R4KWebController rwc = new R4KWebController();
            rwc.redirectToProducts();
            ApexPages.CurrentPage().getParameters().put('pid',vicWarehouses[0].Product_Inventory__r.Id);
            ApexPages.CurrentPage().getParameters().put('formType','product');
            rwc.initR4KProduct();
            rwc.fname = 'Mohit';
            rwc.lname = 'Puli';
            rwc.mobile = '0449004490';
            rwc.street = '35A Railway Road';
            rwc.suburb = 'Blackburn';
            rwc.state = 'VIC';
            rwc.postcode = '3130';
            rwc.country = 'AU';
            rwc.addBuyNowLead();
            List<Lead> ldList = [SELECT Id, ReferenceNo__c FROM Lead WHERE MobilePhone = '0449004490' ORDER BY CreatedDate DESC LIMIT 1];
            if(ldList.size() > 0){
                ApexPages.CurrentPage().getParameters().put('formType','basic');
                ApexPages.CurrentPage().getParameters().put('ld',ldList[0].Id);
                rwc.initR4KProduct();
                rwc.fname = 'Mohit';
            	rwc.lname = 'Puli';
                rwc.email = 'mohit@r4k.com.au';
                rwc.proceedToApplyNow();
                rwc.proceedToCart();
                ApexPages.CurrentPage().getParameters().put('formType','cart');
                rwc.initR4KProduct();
                rwc.proceedToDelivery();
                ApexPages.CurrentPage().getParameters().put('formType','delivery');
                rwc.initR4KProduct();
                rwc.proceedToPayment();
                ApexPages.CurrentPage().getParameters().put('PaymentReference',ldList[0].ReferenceNo__c);
                ApexPages.CurrentPage().getParameters().put('ResultCode','Approved');
                ApexPages.CurrentPage().getParameters().put('ResultText','Approved');
                ApexPages.CurrentPage().getParameters().put('TransactionID',ldList[0].ReferenceNo__c);
                ApexPages.CurrentPage().getParameters().put('PaymentAmount',String.valueOf(rwc.totalPayableAmt));
                rwc.paymentProcessedForRetailPurchase();
                ApexPages.CurrentPage().getParameters().put('formType','apply');
                rwc.initR4KWeb();
            }
        }
        Test.stopTest();
    }

}