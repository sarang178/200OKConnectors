/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCInstagramConnector
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



public with sharing class ICCInstagramConnector {
    @invocableMethod(label='200OK Get Instagram Connector' description='Publish instagram post' category='200OK Connectors')
    public static List<ICCInstagramResponse> execute(List<ICCInstagramRequest> paramList){

    if(paramList.isEmpty()){
        //throw new ICCustomException('Please configure the connector properly.');
        system.debug('Paramlist is empty');
    }


    ICCInstagramRequest param = paramList.get(0);

        
    String baseUrl = URL.getSalesforceBaseUrl().toExternalForm();
    String fileUrl = baseUrl + '/sfc/servlet.shepherd/version/renditionDownload?rendition=ORIGINAL_Jpg&versionId='+ param.contentVersionIds;
    String finalUrl = fileUrl.replace('[', '').replace(']', '');
   // https://enterprise-inspiration-5707-dev-ed.scratch.file.force.com/sfc/servlet.shepherd/version/renditionDownload?rendition=ORIGINAL_Jpg&versionId=0689D000001ilj6


    System.debug('Image urls=>'+finalUrl);
    Map<String,Object> paramReqMap = new Map<String,Object>{
        'image_url' => 'https://images.crunchbase.com/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/fltth4gecilbmjf6ghwi',
        'caption' => param.caption,
        'access_token' => param.accessToken
    };

    lwapic.ICCConnectorService connectorService = new ICCInstagramController();
    connectorService.setChannelName(param.channelName);
    connectorService.setRequestPayload(JSON.serialize(paramReqMap));
    connectorService.setIsAsync(param.runChannelInAsync);
        
   	List<ICCInstagramResponse> resList = (List<ICCInstagramResponse>) connectorService.execute();
   
    return resList;

	}
  
}