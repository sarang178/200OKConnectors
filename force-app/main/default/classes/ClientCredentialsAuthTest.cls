/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-11-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class ClientCredentialsAuthTest {
    @TestSetup
    static void setupTestData(){
        
    }

    @IsTest
    static void testInitiate() {
        
        Test.startTest();
        ClientCredentialsAuth clientAuth = new ClientCredentialsAuth();
        clientAuth.initiate(authProviderConfiguration, stateToPropagate);
        Test.stopTest();
    }

    @IsTest
    static void testHandleCallback() {
        
        Test.startTest();
        ClientCredentialsAuth clientAuth = new ClientCredentialsAuth();
        clientAuth.handleCallback(authProviderConfiguration, state);
        Test.stopTest();
    }

    @IsTest
    static void testRefresh() {
        
        Test.startTest();
        ClientCredentialsAuth clientAuth = new ClientCredentialsAuth();
        clientAuth.refresh(authProviderConfiguration, refreshToken);
        Test.stopTest();
    }

    @IsTest
    static void testMethodName() {
        
        Test.startTest();
        ClientCredentialsAuth clientAuth = new ClientCredentialsAuth();
        clientAuth.getUserInfo(authProviderConfiguration, response);
        Test.stopTest();
    }
}
