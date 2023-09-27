/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCServiceNowController
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

public with sharing class ICCServiceNowController extends lwapic.ICCConnectorService {
    // The method executes the method 'execute' and returns response.
    public override Object execute(){
        List<lwapic.ICResponseWrapper> resWrapList = new List<lwapic.ICResponseWrapper>();
        lwapic.ICResponseWrapper resWrap = new lwapic.ICResponseWrapper();
        if(System.Test.isRunningTest()){
            //Create a dumy response
           resWrap.responseBody = '{"result":{"task_effective_number":"12345","description":"Mocked Test Description"}, "statusCode": "200", "task_effective_number": "12345"}';
           resWrap.statusCode = '200';  // HTTP Status OK
           resWrapList.add(resWrap);
        }else{
            resWrapList =  (List<lwapic.ICResponseWrapper>) super.execute();
        }
     
        // typecast the response
        ICCServiceNowResponse deserializeResponse= (ICCServiceNowResponse)JSON.deserialize(resWrapList.get(0).responseBody, ICCServiceNowResponse.class);
        //Assign incident number to a variable      
        String incNumber = deserializeResponse.result.task_effective_number;
        
        ICCServiceNowResponse res = new ICCServiceNowResponse();
        res.task_effective_number = incNumber;        
       //return response
        return new List<ICCServiceNowResponse>{res};
            
    }
}