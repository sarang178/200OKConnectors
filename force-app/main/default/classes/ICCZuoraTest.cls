/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCZuoraTest
* @description    Additional information about this class should be added here
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Sarang Sawane
* @modifiedBy     Sarang Sawane
* @maintainedBy   Sarang Sawane
* @version        1.0
* @created        2023-09-12
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
private class ICCZuoraTest {
    
    @isTest
    static void testICCZuora() {
        
        lwapic__Integration_Channel__c icChannel = new lwapic__Integration_Channel__c( ); 
        icChannel.lwapic__Channel_Name__c = 'test_channel_zuora';
        icChannel.lwapic__Request_Header__c = 'Content-Type=application/json';
        icChannel.lwapic__Service_Name__c = 'Zuora';
        icChannel.lwapic__Query_Params__c = '';
        icChannel.lwapic__Method__c = 'POST';
        icChannel.lwapic__Request_Paylaod__c = '{"name": "test account","bill_to": {"first_name": "Amy","last_name": "Lawrence","address": {"country": "USA","state": "CA"}},"currency": "USD"}';
        
        INSERT icChannel;
        
        ICCZuoraRequest request = new ICCZuoraRequest();        
        List<ICCZuoraRequest> requestList = new List<ICCZuoraRequest>();
        
        request.channelName = icChannel.lwapic__Channel_Name__c;
        request.runChannelInAsync = FALSE;
        request.acName = 'test account';
        request.billingCurrency = '';
        requestList.add(request);

        Test.setMock(HttpCalloutMock.class, new ICCResponseGenerator());
        
        Test.startTest(); 
        
        List<ICCZuoraResponse> responseList = ICCZuoraConnector.execute(requestList);
        
        Test.stopTest();
        
        
    }
}