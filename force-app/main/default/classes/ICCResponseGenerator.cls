/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICCResponseGenerator
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
// Inner mock class that implements HttpCalloutMock
@IsTest
global class ICCResponseGenerator implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"result":{"task_effective_number":"12345","description":"Mocked Test Description"}, "statusCode": "200", "task_effective_number": "12345"}');
        res.setStatusCode(200);  // HTTP Status OK
        return res;
    }
}