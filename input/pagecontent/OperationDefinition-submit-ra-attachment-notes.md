The following rules apply when using `$submit-ra-attachment`:

* The operation only accepts POST transactions - any other HTTP method will result in an HTTP error
* The `serviceDateStart` and `serviceStartEnd` parameters **SHALL** be present and precise to the day.
* For the `attachment` parameter, Servers **SHALL** support `DocumentReference` resource type and **SHOULD** support other types.
* The `DocumentReference` resources can represent the referenced content using either an address where the document can be retrieved using `DocumentReference.attachment.url` or the content as inline base64 encoded data using `DocumentReference.attachment.data`. The server system is not required to support both an address and inline base64 encoded data, but **SHALL** support at least one of these elements.
* These capabilities **SHOULD** be discoverable and documented by the server (for example, in the CapabilityStatement for FHIR Servers).
* When processing messages, a server may return one of several status codes:
  * **200 OK**: Indicates that the server has accepted the clinical attachments.
  * **4xx**: Indicates some error in the submission. The client **SHOULD** interpret a 4xx response to indicate that there is no point resubmitting the unaltered operation,
  * **5xx**: Indicates some system error. The client **SHOULD** interpret a 5xx response to indicate an unexpected error occurred on the part of the server, with the implication that it may be appropriate to resubmit the original operation.
  * The server **MAY** return an OperationOutcome with additional information, and **SHOULD** do so if the response code is 400 or greater. For example, if the payer has no knowledge of the claim or prior authorization, the OperationOurtcome can alert submitter to check whether they sent it to the wrong payer.


 <br />
