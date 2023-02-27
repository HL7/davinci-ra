<div class="new-content" markdown="1">
All sections on this page are new content.
</div><!-- new-content -->

### Querying for MeasureReports and their Evaluated Resources

Once MeasureReports have been created, they can be retrieved using a simple RESTful query.  The query uses the _include parameter to also retrieve in the searchset bundle, the resources attached to the report in .evaluatedResources

An example workflow of a Client queries for risk adjustment coding gap reports for a single patient is shown below in Figure 3-1.

{% include img-portrait.html img="risk-adjustment-coding-gap-report-single-patient.png" caption = "Figure 3-1 Report Operation Workflow for a Single Patient" %}


#### For a single patient

`GET [base]/MeasureReport/?subject=Patient/ra-patient02&period=ge2021-01-01&period=le2021-12-31&_include=MeasureReport:evaluated-resource`

#### For a group of patients
`GET [base]/MeasureReport/?subject=Group/ra-group123&period=ge2021-01-01&period=le2021-12-31&_include=MeasureReport:evaluated-resource`

This can also be used in an asynchronous pattern using [Bulk]