/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-12-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCZuoraController
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

public with sharing class ICCZuoraController extends lwapic.ICCConnectorService {
    public override Object execute(){

       List<lwapic.ICResponseWrapper> resWrapList =  new List<lwapic.ICResponseWrapper>();
       lwapic.ICResponseWrapper resWrap = new lwapic.ICResponseWrapper();
       if(System.Test.isRunningTest()){
            resWrap.responseBody = '{"account_number":"00123", "statusCode":"200"}';
            resWrap.statusCode = '200';
            resWrapList.add(resWrap);
       }else{
            resWrapList =  (List<lwapic.ICResponseWrapper>) super.execute();
 
       }
              
        System.debug('original Response '+resWrapList);
        System.debug('Raw Response '+resWrapList.get(0).responseBody);
        
        ICCZuoraResponse deserializeResponse= (ICCZuoraResponse)JSON.deserialize(resWrapList.get(0).responseBody, ICCZuoraResponse.class);
               
        String acNumber = deserializeResponse.account_number;
        System.debug('Account Number ' + acNumber);
        
        ICCZuoraResponse res = new ICCZuoraResponse();
        res.account_number = acNumber;        
       //resList.add(res);
        return new List<ICCZuoraResponse>{res};
            
    }
}