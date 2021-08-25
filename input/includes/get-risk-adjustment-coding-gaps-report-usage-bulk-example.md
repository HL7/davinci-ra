
#### Examples
{:.no_toc}

**Scenario:**

The Client would like to request Risk Adjustment Coding Gaps Report on many patients. They have created a FHIR Group Resource using the Risk Adjustment Patient Group Profile with the id of gr345. Because they expect the creation of the reports to take a while and many FHIR bundles will be returned and be processed, they would like to make the request in an asynchronous manner returning NDJSON that will be easier for them to process.

The request below asks for Group id of 123 to be run asynchronously with FHIR+ndjson as the output format. The header portions should be entered in the API client header section. For example, in the [Postman](https://www.postman.com/) tool, enter “Prefer” in Key and “respond-async” in Value as an entry in the Headers tab.

**GET Risk Adjustment Coding Gap Report Using Bulk Data**

Run $report operation in an asynchronous mode:
```
GET [base]/Measure/$report?subject=group/gr345&periodStart=2021-01-01&periodEnd=2021-12-31

```
