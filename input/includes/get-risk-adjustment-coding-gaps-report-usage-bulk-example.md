
#### Examples
{:.no_toc}

**Scenario:**

The Client would like to request risk adjustment coding gap reports on many patients. They have created a FHIR Group resource using the Risk Adjustment [Patient Group] profile with the id of ra-group123. Because they expect the creation of the reports to take a while and many FHIR bundles will be returned and be processed, they would like to make the request in an asynchronous manner returning NDJSON that will be easier for them to process.

The request below asks for Group id of ra-group123 to be run asynchronously with FHIR+ndjson as the output format. The header portions should be entered in the API client header section. For example, in the [Postman](https://www.postman.com/) tool, enter “Prefer” in Key and “respond-async” in Value as an entry in the Headers tab.

**GET Risk Adjustment Coding Gap Report Using Bulk Data**

Run $report operation in an asynchronous mode:
```
GET [base]/MeasureReport/?subject=Group/ra-group123&period=ge2021-01-01&period=le2021-12-31_include=MeasureReport:evaluated-resource

```
{% include link-list.md %}
