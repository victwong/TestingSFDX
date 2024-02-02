import { LightningElement, wire } from 'lwc';
import contactInfo from '@salesforce/apex/businessCard.getContact';
export default class WireApexProperty extends LightningElement {
    @wire(contactInfo, { contactId: '0031R00002OV1uAQAT'})
    wiredProject({ error, data }) {
        if (data) {
            this.record = data;
            console.log(JSON.stringify(this.record));
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }
}