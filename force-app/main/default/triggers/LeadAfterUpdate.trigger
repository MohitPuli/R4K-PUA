trigger LeadAfterUpdate on Lead (after update) {
    for (Lead ld : Trigger.new)
    {
        if(ld.Run_Trigger__c && !trigger.oldMap.get(ld.id).Run_Trigger__c && ld.Lead_Medium__c == 'Web' && !ld.IsConverted)
        {
            System.debug('****run trigger');
            List<String> leads = new List<String>();
            LeadHelper ld1 = new LeadHelper(ld.Id,ld.PostalCode,ld.form_type__c,ld.Email,ld.Country,ld.LastName,ld.CRN__c,ld.MobilePhone);
            leads.add(JSON.serialize(ld1));

            if(ld.Country.contains('New Zealand') || ld.Country.contains('NZ') || ld.Form_Type__c == 'RENT4KEEPS ENQUIRY'){
                LeadAssignmentController.assignLeadOwner(leads);
            }else{
                R4KLeadController.assignLeadOwner(ld.Id);
            }
        }else if(!ld.IsConverted && ((ld.Lead_Medium__c == 'Smart IVR' || ld.Lead_Medium__c == 'Direct Call') && ld.Identity_Confirmed_By_Customer__c && !trigger.oldMap.get(ld.id).Identity_Confirmed_By_Customer__c))
        {
            System.debug('****match and convert');
            LeadAssignmentController.matchAndConvert(ld.Id,null,null,null,false);
        }else if(!ld.IsConverted && ld.Probable_Account__c != null && ld.Identity_Confirmed_By_Customer__c && ((ld.Lead_Medium__c == 'Smart IVR' || ld.Lead_Medium__c == 'Direct Call') && ld.Reason_for_Enquiry__c != null && (ld.Reason_for_Enquiry__c == 'Service Enquiry / Issue' || ld.Reason_for_Enquiry__c == 'Existing Account Enquiry' || ld.Reason_for_Enquiry__c == 'Compliant' || ld.Reason_for_Enquiry__c == 'Other' || ld.Reason_for_Enquiry__c == 'Make Payment') && ld.Reason_for_Enquiry__c != trigger.oldMap.get(ld.id).Reason_for_Enquiry__c))
        {
            System.debug('****match and convert');
            LeadAssignmentController.matchAndConvert(ld.Id,null,null,null,false);
        }else if(ld.IsConverted && ld.Probable_Account__c != null && ld.Identity_Confirmed_By_Customer__c && ((ld.Lead_Medium__c == 'Smart IVR' || ld.Lead_Medium__c == 'Direct Call') && ld.Reason_for_Enquiry__c != null && (ld.Reason_for_Enquiry__c == 'Service Enquiry / Issue' || ld.Reason_for_Enquiry__c == 'Existing Account Enquiry' || ld.Reason_for_Enquiry__c == 'Compliant' || ld.Reason_for_Enquiry__c == 'Other' || ld.Reason_for_Enquiry__c == 'Make Payment') && ld.Reason_for_Enquiry__c != trigger.oldMap.get(ld.id).Reason_for_Enquiry__c))
        {
            System.debug('****create case');
            LeadAssignmentController.createCase(ld.Id,ld.Probable_Account__c,ld.Reason_For_Enquiry__c,ld.Lead_Medium__c == 'Smart IVR' || ld.Lead_Medium__c == 'Direct Call' ? 'Phone' : 'Web');
        }
    }
}