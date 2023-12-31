/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCServiceNowRequest
* @description    Additional information about this class should be added here
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Sarang Sawane
* @modifiedBy     Sarang Sawane
* @maintainedBy   Sarang Sawane
* @version        1.0
* @created        2023-08-14
* @modified       
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* vX.X            Developer Name
* YYYY-MM-DD      Explanation of the change.  Multiple lines can be used to explain the change, but
*                 each line should be indented till left aligned with the previous description text.
*
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
**/

public with sharing class ICCServiceNowRequest {
    
   //Initialize variable and the values will get from flow.
   
   @AuraEnabled @InvocableVariable (label='Channel Name' description='Channel Name' required=TRUE)
   public String channelName = '';

   @AuraEnabled @InvocableVariable (label='Run Channel in Async' description='Runs The Channel in Async')
   public Boolean runChannelInAsync = FALSE;

   @AuraEnabled @InvocableVariable (label='Short Description' description='Short description about incident')
   public String shortDescription = '';  
}