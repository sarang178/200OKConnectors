/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCServiceNowResponse
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

public with sharing class ICCServiceNowResponse {
    // response from service now
    @AuraEnabled @InvocableVariable public Result result;
    @AuraEnabled @InvocableVariable public String statusCode;
    @AuraEnabled @InvocableVariable public String task_effective_number;

   public class Result {
       @AuraEnabled @InvocableVariable public String task_effective_number;      
    }       
}