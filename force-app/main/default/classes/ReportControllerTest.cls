@isTest(SeeAllData = true)
private class ReportControllerTest {
    
    public static testMethod void testLeadMerging() 
    { 
        Test.startTest();
        Apexpages.currentPage().getParameters().put('leadCount','2');
        ReportController rc = new ReportController();
        rc.initAppsInProgress();
        if(rc.leadWrapperList.size() > 1)
        {
            rc.leadWrapperList[0].isSelected = true;
            rc.leadWrapperList[1].isSelected = true;
            rc.getSelectedLeads();
            rc.selectedLeadWrapperList[0].isSelected = true;
            rc.selectedLeadWrapperList[0].isMasterRecord = true;
            rc.selectedLeadWrapperList[1].isSelected = true;
            rc.selectedLeadWrapperList[1].isMasterRecord = false;
            rc.mergeLeads();
        }
        Test.stopTest();
    }
    /*   
    @isTest
    static void initPromoTest(){
        ReportController rc = new ReportController();
        rc.initPromotion();
    }
    
    @isTest
    static void initPromoTest2(){
        ReportController rc = new ReportController();
        rc.initPromotion2();
    }
    @isTest
    static void initPromoTest4(){
        ReportController rc = new ReportController();
        rc.initPromotion3();
    }
    
    @isTest
    static void initPromoTestCSV(){
        ReportController rc = new ReportController();
        rc.sendPromotionCSV();
    }
    
    @isTest
    static void initPromoTest3(){
        ReportController rc = new ReportController();
        rc.getPromosToSend();
        if(rc.oppWrapList.size() > 0){
            rc.oppWrapList[0].isSelected = true;
        }
        rc.sendPromotionSMS();
    }

    @isTest
    static void initPromoBudgetSaver(){
        ReportController rc = new ReportController();
        rc.initBudgetSaver2();
    }

    @isTest
    static void initIncomeExpenseSummary(){
        List<Account> acctList = [SELECT Id FROM Account WHERE BankStatement_Completion_Datetime__c = LAST_N_DAYS:30 
                                    AND Last_Active_Agreement_Date_Rollup__c = LAST_N_DAYS:30 AND Company_Territory__c = true LIMIT 1];
        if(acctList.size() > 0)
        {
            Apexpages.currentPage().getParameters().put('id',acctList[0].Id);
            ReportController rc = new ReportController();
            rc.initIncomeExpenseSummary();
        }
    }
    
    @isTest
    static void initCheckRecordAccess(){
        ReportController rc = new ReportController();
        rc.checkRecordAccess();
    }
    */   
}