/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-12-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCZuoraConnector
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



public with sharing class ICCZuoraConnector {
    @invocableMethod(label='200OK Get Zuora Connector' description='GET/POST Incidents record from Zuora' category='200OK Connectors')
    public static List<ICCZuoraResponse> execute(List<ICCZuoraRequest> paramList){

    if(paramList.isEmpty()){
        //throw new ICCustomException('Please configure the connector properly.');
        system.debug('Paramlist is empty');
    }

    ICCZuoraRequest param = paramList.get(0);
    Map<String,Object> paramReqMap = new Map<String,Object>{
        'name' => param.acName,
        'currency' => param.billingCurrency
    };

    lwapic.ICCConnectorService connectorService = new ICCZuoraController();
    connectorService.setChannelName(param.channelName);
    connectorService.setRequestPayload(JSON.serialize(paramReqMap));
    connectorService.setIsAsync(param.runChannelInAsync);
        
   	List<ICCZuoraResponse> resList = (List<ICCZuoraResponse>) connectorService.execute();
   
    return resList;

	}
  
}