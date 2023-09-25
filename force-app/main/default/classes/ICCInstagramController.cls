/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCInstagramController
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

public with sharing class ICCInstagramController extends lwapic.ICCConnectorService {
    public override Object execute(){

       List<lwapic.ICResponseWrapper> resWrapList =  (List<lwapic.ICResponseWrapper>) super.execute();
              
        System.debug('original Response '+resWrapList);
        System.debug('Raw Response '+resWrapList.get(0).responseBody);
        
        ICCInstagramResponse deserializeResponse= (ICCInstagramResponse)JSON.deserialize(resWrapList.get(0).responseBody, ICCInstagramResponse.class);
               
        String containerID = deserializeResponse.id;
        System.debug('containerID ' + containerID);
        
        ICCInstagramResponse res = new ICCInstagramResponse();
        res.id = containerID;        
       //resList.add(res);
        return new List<ICCInstagramResponse>{res};
            
    }
}