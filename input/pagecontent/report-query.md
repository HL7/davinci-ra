
This section describes querying for MeasureReports and their evaluated resources. Once MeasureReports have been created, they can be retrieved using a simple RESTful query. The query uses the **_include** parameter to also retrieve in the searchset Bundle, the resources attached to the report in `MeasureReport.evaluatedResource`.

An example workflow of Payer or Provider using the Reporting Client to query for [Risk Adjustment Coding Gap Report] for a single patient is shown below in Figure 2.3-1.

{% include img-portrait.html img="risk-adjustment-coding-gap-report-single-patient.png" caption = "Figure 2.3-1 Report Query Workflow for a Single Patient" %}


### Example Queries for a single patient

`GET [base]/MeasureReport?patient=Patient/ra-patient01&period=ge2021-01-01&period=le2021-12-31&category=ra`

`GET [base]/MeasureReport?patient=Patient/ra-patient01&period=ge2021-01-01&period=le2021-12-31&category=ra&_include=MeasureReport:evaluated-resource`

### Example Queries for a group of patients

`GET [base]/MeasureReport?subject=Group/ra-group123&period=ge2021-01-01&period=le2021-12-31&category=ra`

`GET [base]/MeasureReport?subject=Group/ra-group123&period=ge2021-01-01&period=le2021-12-31&category=ra&_include=MeasureReport:evaluated-resource`

This can also be used in an asynchronous pattern using [Bulk](report-generation.html#bulk-data-request-for-risk-adjustment-coding-gap-measurereports).



{% include link-list.md %}