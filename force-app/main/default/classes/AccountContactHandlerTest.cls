@isTest
private class AccountContactHandlerTest {

    @testSetup
    static void setupTestData() {
        Account testAcc = new Account(Name = 'Test Account');
        insert testAcc;

        List<Contact> testContacts = new List<Contact>{
            new Contact(FirstName = 'Test1', LastName = 'Contact', AccountId = testAcc.Id),
            new Contact(FirstName = 'Test2', LastName = 'Contact', AccountId = testAcc.Id, Phone = '1234567890'),
            new Contact(FirstName = 'Test2', LastName = 'Contact', AccountId = testAcc.Id, MobilePhone = '1234567890'),
            new Contact(FirstName = 'Test4', LastName = 'Contact4', AccountId = testAcc.Id, DoNotCall = true)
        };
        insert testContacts;
    }

    @isTest static void testGetAllAccounts() {
        Test.startTest();
        List<Account> allAccounts = AccountContactHandler.getAllAccounts();
        Test.stopTest();        
    }

    @isTest static void testUpdateContacts() {
        Account testAcc = [SELECT Id FROM Account LIMIT 1];

        Test.startTest();
        Integer updatedCount = AccountContactHandler.updateContacts(testAcc.Id);
        Test.stopTest();

        System.assertEquals(3, updatedCount, 'Expected 3 contacts to be updated.');

    }

    @isTest static void testUpdateContactsNoAccId() {
        Test.startTest();
        Integer updatedCount = AccountContactHandler.updateContacts(null);
        Test.stopTest();

        System.assertEquals(0, updatedCount, 'Expected zero contacts to be updated when no Account ID is provided.');
    }
}
