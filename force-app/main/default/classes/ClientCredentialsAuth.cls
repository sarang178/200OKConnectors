/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ClientCredentialsAuth
* @description    Additional information about this class should be added here
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Sarang Sawane
* @modifiedBy     Sarang Sawane
* @maintainedBy   Sarang Sawane
* @version        1.0
* @created        2023-08-25
* @modified       
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* vX.X            Developer Name
* YYYY-MM-DD      Explanation of the change.  Multiple lines can be used to explain the change, but
*                 each line should be indented till left aligned with the previous description text.
*
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
**/


public class ClientCredentialsAuth extends Auth.AuthProviderPluginClass {
    //The values for below variables coming from mdt and assigned to below variables. Given values are optional.
    private String metadataApiName = 'ZuoraOauth__mdt';
    private String callbackUrl; //REPLACE YOUR CALL BACKURL, YOU CAN FIND IT IN THE AUTH. PROVIDER CONFIG, SALESFORCE CONFIGURATION SECTION';
    private string tokenEndpoint = 'https://rest.apisandbox.zuora.com/oauth/token';
    private string clientId ;
    private string clientSecret;
    private String tokenType = 'Bearer';
    private String authProviderName = 'Zuora_OAuth';
  
    public  String getCustomMetadataType() {
        return metadataApiName;
    }

   //This covers the Steps 1 to 5 of Authorisation grant flow
    public PageReference initiate(Map<string, string> authProviderConfiguration, String stateToPropagate) {
       
        //State is needed for the flow to function
        //https://salesforce.stackexchange.com/questions/224231/salesforce-no-oauth-state-state-not-valid
        callbackUrl+= + '?state=' + stateToPropagate;

        return new PageReference(callbackUrl);
    }
 
    //From Step 6 , Pass in the client id and secret to get the access token
    public Auth.AuthProviderTokenResponse handleCallback(Map<string,string> authProviderConfiguration, Auth.AuthProviderCallbackState state) {
        try {
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint(tokenEndpoint);
        request.setHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8');
        request.setMethod('POST');

        String body = 'client_id='+clientId;
        body+='&client_secret='+clientSecret;
        body+='&grant_type=client_credentials';

        request.setBody(body);

        HttpResponse response = http.send(request);
        ResponseWrapper responseWrapper = (ResponseWrapper) JSON.deserialize(response.getBody(), ResponseWrapper.class);
               
        return new Auth.AuthProviderTokenResponse(authProviderName, responseWrapper.access_token, null, state.queryParameters.get('state'));
            
        } catch (Exception e) {
            System.debug(e.getMessage());
            throw e;
        }       
    }

  
    public override Auth.OAuthRefreshResult refresh(Map<String,String> authProviderConfiguration, String refreshToken) {
        //custom refresh flow
       try {
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint(tokenEndpoint);
        request.setHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8');
        request.setMethod('POST');

        String body = 'client_id='+clientId;
        body+='&client_secret='+clientSecret;
        body+='&grant_type=client_credentials';

        request.setBody(body);

        HttpResponse response = http.send(request);
        ResponseWrapper responseWrapper = (ResponseWrapper) JSON.deserialize(response.getBody(), ResponseWrapper.class);
       
        return new Auth.OAuthRefreshResult(responseWrapper.access_token, tokenType);
       } catch(Exception e) {
        // Log the exception for debugging or administrative purposes
        System.debug(e.getMessage());
        throw e;  // rethrowing the exception to let calling function know about the error
        }

    }

   //Return fake user, client credentials auth flow is not for a user
    public Auth.UserData getUserInfo(Map<string,string> authProviderConfiguration, Auth.AuthProviderTokenResponse response) {
       
        return new Auth.UserData('fakeId', 'first', 'last', 'full', 'email', 'link', null, null, null, null, null);
    }
  
    public class ResponseWrapper {
        public String access_token;
        public String token_type;
        public String expires_in;
    }
}