/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-10-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public with sharing class AccountContactHandler {

    // Retrieve all accounts to display in a component
    @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccounts() {
        return [SELECT Id, Name FROM Account];
    }

    // Update contacts related to the selected account
    @AuraEnabled
    public static Integer updateContacts(Id accId) {
        Integer updatedCount = 0;

        if(accId != null) {
            List<Contact> contactsToUpdate = new List<Contact>();

            // Query Contacts related to the given Account which do not have a Phone or MobilePhone value and DoNotCall is false.
            for(Contact eachContact : [SELECT Id, AccountId, Phone, MobilePhone, DoNotCall FROM Contact WHERE AccountId = :accId AND (Phone = null OR MobilePhone = null) AND DoNotCall = false]){
                
                // Set the DoNotCall flag to true for the fetched Contacts.
                eachContact.DoNotCall = true;
                contactsToUpdate.add(eachContact);            
            }
    
            // Only issue an update if there are Contacts to update.
            if (!contactsToUpdate.isEmpty()) {
                update contactsToUpdate;
                updatedCount = contactsToUpdate.size();
            }

        } else {
            System.debug('No accId provided. Exiting the method without querying contacts.');
        }

        return updatedCount;
    }
}
