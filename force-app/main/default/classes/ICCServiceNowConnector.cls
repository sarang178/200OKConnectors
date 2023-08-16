/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCServiceNowConnector
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



public with sharing class ICCServiceNowConnector {
@invocableMethod(label='200OK Get ServiceNow Connector' description='Get Incidents record from ServiceNow' category='200OK Connectors')
public static List<ICCServiceNowResponse> execute(List<ICCServiceNowRequest> paramList){

    if(paramList.isEmpty()){
        //throw new ICCustomException('Please configure the connector properly.');
        system.debug('Paramlist is empty');
    }

    ICCServiceNowRequest param = paramList.get(0);

    lwapic.ICCConnectorService connectorService = new ICCServiceNowController();
    connectorService.setChannelName(param.channelName);
    connectorService.setIsAsync(param.runChannelInAsync);
   List<ICCServiceNowResponse> resList = (List<ICCServiceNowResponse>) connectorService.execute();
   return resList;

}
  
}

