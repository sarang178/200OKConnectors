/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCServiceNowTest
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
@isTest
private class ICCServiceNowTest {
    
    @isTest
    static void testICCServiceNow() {
        
        lwapic__Integration_Channel__c icChannel = new lwapic__Integration_Channel__c( ); 
        icChannel.lwapic__Channel_Name__c = 'test_channel_servicenow';
        icChannel.lwapic__Request_Header__c = 'Content-Type=application/json';
        icChannel.lwapic__Service_Name__c = 'ServiceNow';
        icChannel.lwapic__Query_Params__c = '';
        icChannel.lwapic__Method__c = 'POST';
        
        INSERT icChannel;
        
        ICCServiceNowRequest request = new ICCServiceNowRequest();        
        List<ICCServiceNowRequest> requestList = new List<ICCServiceNowRequest>();
        
        request.channelName = icChannel.lwapic__Channel_Name__c;
        request.runChannelInAsync = FALSE;
        request.shortDescription = 'Test Incident';
        requestList.add(request);

        Test.setMock(HttpCalloutMock.class, new ICCResponseGenerator());
        
        Test.startTest();         
        List<ICCServiceNowResponse> responseList = ICCServiceNowConnector.execute(requestList);
  
        //List<HttpResponse> res = ICCServiceNowConnector.execute(requestList);        
        Test.stopTest();
        Assert.areEqual(1, responseList.size());
        
        String actualValue = responseList[0].task_effective_number;
        String expectedValue = '12345';
        Assert.areEqual(expectedValue, actualValue, 'Incorrect task_effective_number');
        
        
        
    }
}