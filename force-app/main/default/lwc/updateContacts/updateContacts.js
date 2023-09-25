import { LightningElement, wire, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAllAccounts from '@salesforce/apex/AccountContactHandler.getAllAccounts';
import updateContacts from '@salesforce/apex/AccountContactHandler.updateContacts';

export default class SelectAccountAndUpdate extends LightningElement {
    @track accounts = [];
    selectedAccountId;
    isButtonDisabled = true;
    columns = [
        { label: 'Account Name', fieldName: 'Name' }
    ];

    // Wire method to get all accounts and set the 'accounts' property
    @wire(getAllAccounts)
    wiredAccounts({ error, data }) {
        data ? (this.accounts = data) : (this.error = error);
    }

    // Handle the selection of a row (account) in the datatable
    handleRowSelection(event) {
        const selectedRows = event.detail.selectedRows;
        this.selectedAccountId = selectedRows.length > 0 ? selectedRows[0].Id : null;
        this.isButtonDisabled = this.selectedAccountId ? false : true;
    }
    
    // Async method to handle the update of contacts related to the selected account
    handleUpdateContacts() {
        updateContacts({ accId: this.selectedAccountId })
        .then(result => {
            this.dispatchEvent( 
                new ShowToastEvent({
                    title : result>0 ? 'Success' : 'No changes',
                    message: result>0 ? result + ' contacts updated successfully' : 'No contacts needed updating',
                    variant: result>0 ? 'success' : 'info'
                })
            );
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating contacts',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        });
    }
}
