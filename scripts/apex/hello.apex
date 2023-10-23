List<SelectOption> termOptions = new List<SelectOption>();
List<SelectOption> frequencyOptions = new List<SelectOption>();

List<Schema.PicklistEntry> termEntries = Cart_Item__c.Term__c.getDescribe().getPicklistValues();
for(Schema.PicklistEntry termEntry : termEntries){
    termOptions.add(new SelectOption(termEntry.getValue(), termEntry.getLabel()));
}

List<Schema.PicklistEntry> freqEntries = Cart_Item__c.Frequency__c.getDescribe().getPicklistValues();
for(Schema.PicklistEntry freqEntry : freqEntries){
    frequencyOptions.add(new SelectOption(freqEntry.getValue(), freqEntry.getLabel()));
}

System.debug(termOptions);
System.debug(frequencyOptions);

R4KOnlineApplicationController.sendAcknowledgementAndCreditGuide('0011s00001r6qAC');

R4KLeadController.ProbableAccountWrapper paWrap = R4KLeadController.findProbableAccount('00Q1s000005BdUh', null);
System.debug('##probAccts ' + paWrap);

Lead ld = new Lead();
ld.FirstName = 'MO';
ld.LastName = 'RE';
ld.Not_Spam__c = 'yes';
ld.Lead_Medium__c = 'Direct';
ld.MobilePhone = '0449066375';
ld.PostalCode = '3977';
ld.Country = 'AU';
insert ld;

public static DateTime convertToStateTime(String state, DateTime userDateTime) {
    String state = 'WA';
    Datetime userDateTime = Datetime.now();

    // Get user's time zone details
    TimeZone tz = UserInfo.getTimeZone();
    System.debug(tz.getDisplayName());

    Integer userOffsetMinutes = tz.getOffset(userDateTime) / (1000 * 60);  // Convert ms to minutes
    System.debug(userOffsetMinutes);

    // Calculate state's offset in minutes
    Integer stateOffsetMinutes;
    switch on state {
        when 'VIC','NSW','ACT','TAS'{
            stateOffsetMinutes = (userDateTime.month() >= 10 && userDateTime.month() <= 4) ? 660 : 600; // 11 or 10 hours in minutes
            
        }when 'QLD'{
            stateOffsetMinutes = 600; // 10 hours in minutes
            
        }when 'NT'{
            stateOffsetMinutes = 570; // 9.5 hours in minutes
            
        }when 'SA'{
            stateOffsetMinutes = (userDateTime.month() >= 10 && userDateTime.month() <= 4) ? 630 : 570; // 10.5 or 9.5 hours in minutes
            
        }when 'WA'{
            stateOffsetMinutes = 480; // 8 hours in minutes
            
        }
    }

    // Convert the date-time
    DateTime convertedDateTime = userDateTime.addMinutes(stateOffsetMinutes - userOffsetMinutes);
    System.debug(convertedDateTime);
    return convertedDateTime;
}

