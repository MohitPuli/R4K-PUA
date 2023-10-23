trigger Lead_AfterInsertUpdate on Lead (after insert) {
    Boolean flag = system.isBatch() || system.isFuture();
    
    if(!flag){
        Lead leadObj= trigger.new[0];
        if(stoprecurssion.runonce()){
            List<String> leads = new List<String>();
            LeadHelper ld1 = new LeadHelper(leadObj.Id,leadObj.PostalCode,leadObj.form_type__c,leadObj.Email,leadObj.Country,leadObj.LastName,leadObj.CRN__c,leadObj.MobilePhone); 
            leads.add(JSON.serialize(ld1));
            
            if(leadObj!=null && ((leadObj.Country!=null && (leadObj.Country.contains('New Zealand') || leadObj.Country.contains('NZ'))) || leadObj.Form_Type__c == 'RENT4KEEPS ENQUIRY')){
                LeadAssignmentController.assignLeadOwner(leads);
            }else{
                R4KLeadController.assignLeadOwner(leadObj.Id);
            }
        }
    }
    
}