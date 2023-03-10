<div class="bg-info" markdown="1">
**This page is under development.**
</div>

<div class="bg-success" markdown="1">

### Introduction and Background

During this phase of the lifecycle process, the payer determines if there is grounds for suspecting that a patient may have a risk-adjustable condition that has not yet been documented during the current clinical evaluation period. Quality measures have clear rules governing when the patient is included in/excluded from the measure denominator and numerator; not so for risk adjustment. Payers often must statistically infer the likelihood that a patient might have an undocumented CC. This statistical process is called CC suspecting and is generally done in two ways:
- Historic conditions (also known as persisting conditions) are those which were documented during some past clinical evaluation periods, but have not yet been documented in the current period; and
- Suspected conditions, which are identified through the use of statistical modeling.

Alternatively, the payer may receive a medical claim that confirms the presence of a previously unsuspected risk adjusted condition. Since this most often happens when a condition has been diagnosed for the first time, these are referred to as net-new conditions. 

During the gap generation phase, the payer combines all relevant data streams and determines which CC gaps exist for the patient and what their status is. An open gap is one where the payer is soliciting information from the provider that the patient either has the condition, or that the gap is invalid. A closed gap is one where the payer has the necessary evidence that the gap is valid for the current clinical evaluation period. But because the CC suspecting process is probabilistic there will always be a certain percentage of invalid gaps that the provider indicates are not clinically appropriate for the patient. *There is also a fourth pending gap state that will be discussed later on, during the Gap Resolution phase. *(TODO: review/revise this sensence)*

Many risk adjustment models are constructed in such a way as to differentiate between different degrees of severity in the disease process. For example, the Medicare Advantage model divides diabetes into three condition categories, which in order from least to most severe are: CC 19 (diabetes without complications); CC 18 (diabetes with chronic complications); and CC 17 (diabetes with acute complications.) During the clinical evaluation period a patient may diagnosed with diabetes several times, with individual diagnoses rolling up to different CCs. To avoid paying twice for the same underlying condition, a hierarchy is applied to the CCs so that only the most severe form is counted for risk adjustment purposes; applying these hierarchies turns a Condition Category (CC) into a Hierarchical Condition Category (HCC). In the previous example, CC 17 supersedes CCs 18 and 19, and CC 18 supersedes CC 19.

There are many potential uses for CC gap information. For example, a provider may seek to take action on open gaps, or they may want confirmation of their previous gap closure or gap invalidation actions from the payer, or they may want to calculate their gap closure performance under the terms of a value-based payment arrangement. In general, the payer will not know in advance which of these purposes the data will be used for, so the approach that has been taken in this implementation guide (IG) is for the payer to provide as much CC gap data as possible, with flags on the data so that the provider may filter the CC gaps on the receiving end. This makes it possible for the IG to support as broad a range of applications as possible. Data filtering is the responsibility of the recipient.

To summarize: the suspectType of a CC gap may be historic, suspected, or net-new; its evidenceStatus may be open-gap, closed-gap, pending, or invalid; and its hierarchicalStatus may be applied-superseded, applied-not-superseded, not-applied, or not-applicable (e.g., if the model is non-hierarchical.) These three flags are used to facilitate data filtering by the requester.

Once the CC gaps have been identified and their filtering flags are set, the next task is to put them into a FHIR MeasureReport. This IG provides three approaches to do this.

- The [Assisted] approach is intended for situations in which the payer wants to cause minimal impact on existing risk adjustment operations. In many payers, lists of CC gaps are produced by manual processes and/or SAS datasets. This approach provides a means for ingesting preexisting gap lists and mapping them to FHIR resource elements.
- In the [Generated] approach FHIR resource inputs are consumed directly and used to generate a risk adjustment MeasureReport.
- The [Evaluated] approach anticipates the use of Digital Condition Categories (dCCs.) In this approach, a dCC evaluates whether an CC gap is open or closed per the ICD-10-CM coding guidelines, with the output of the dCC providing the input to the MeasureReport.

To support a transition strategy for dCC and to simplify adoption of this IG, all three of these approaches may be used in parallel. For example, a payer organization might use dCCs for evaluating diabetes, heart disease, heart failure, and COPD, with all other CC evaluated through Risk Adjustment Coder (e.g., Certified Risk Adjustment Coder (CRC)). This means that some means must be provided for generating a single combined MeasureReport containing CC gaps from different input streams: the diabetes CC gaps might come from dCCs, while other CC gaps might come from SAS datasets or the like. In future state as dCCs become available, a MeasureReport may result from the merger of the Assisted, 
Generated, and Evaluated data streams. In this way a MeasureReport will contain a holistic view of a patient’s CC gaps, no matter where those gaps originated.

Once all Measure Reports have been created, a query can be run for one or more [Risk Adjustment Coding Gap Report] for a single patient or group of patients. This query can be run by either the provider to pull the report to their system, or it can be run by the payer and pushed/posted to the provider’s system.  

### Actors

The actors involved in coding gap report generation are defined as Data Producer and Data Consumer. 
- Data Producer: Payer acts as Data Producer that receives the query request for retrieving the Risk Adjustment Coding Gap MeasureReport resources. 
- Data Consumer: Either Provider or Payer acts as Data Consumer requesting risk adjustment coding gap reports using a FHIR query on the MeasureReport resources.

In the example shown in Figure 2.2-1, a Payer acts both as Data Producer and Data Consumer in this scenario. The Payer (acting as the Data Consumer) queries the [Risk Adjustment Coding Gap Report] on their server based on the search parameters provided, then the Payer posts the searchset Bundle to the Provider.

{% include img-portrait.html img="actors-post.png" caption="Figure 2.2-1 Report Generation Actors - Example 1"%}

As shown in Figure 2.2-2, the Provider acts as the Data Consumer queries the [Risk Adjustment Coding Gap Report] on the Payer server with search parameters, the Payer acts as Data Producer returns the [Risk Adjustment Coding Gap Report] and evaluated Resources to the Provider.

{% include img-portrait.html img="actors-request.png" caption="Figure 2.2-2 Report Generation Actors - Example 2"%}
</div><!-- new-content -->

### Risk Adjustment Coding Gap MeasureReport

The [Risk Adjustment Coding Gap Report] is used to represent coding gap report for a single patient and a version specific risk adjustment model. The required `MeasureReport.subject` references [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html) and the required `MeasureReport.measure` element references the [Risk Adjustment Model Measure]. The [Risk Adjustment Model Measure] profile specifies risk adjustment model information, which requires both a model identifier and a version. If the Server's risk adjustment engine runs multiple risk adjustment models including different versions of the same model, then there will be multiple risk adjustment coding gap reports for a patient. For example, if a risk adjustment engine runs reports using CMS-HCC V25, CMS-HCC V24, and Rx-HCC V5, then there will be three separate risk adjustment coding gap reports for the patient, each for a version specific risk adjustment model.

The [MeasureReport] resource has zero to many `group` elements. Each `group` element contains information for a Condition Category (CC), therefore, each MeasureReport may contain multiple Condition Category (CC) codes. The `group.code` is used to represent the actual code for a Condition Category (CC), such as HCC 18 (Diabetes with No Complication). The [Risk Adjustment Coding Gap Report] profile added several extensions to the MeasureReport resource’s `group` element to provide additional information about a Condition Category (CC), which includes:
 - the suspect type for a Condition Category (CC) coding gap that is either historic, suspected, or unsuspected;
 - the evidence status of a Condition Category (CC) coding gap that is either closed-gap, open-gap, or pending;
 - the evidence status date indicating when the evidence status was changed to either closed-gap, open-gap, or pending; and
 - the hierarchical status indicating whether hierarchies were applied to a Condition Category (CC), and if applied, whether the Condition Category (CC) is superseded. The status can be either applied-superseded, applied-not-superseded, not-applied, or not-applicable.

In addition, the [Risk Adjustment Coding Gap Report] provides capability of sharing supporting evidence for a Condition Category (CC) through the use of the `MeasureReport.evaluatedResource` element. This supporting evidence may include resources for data such as encounters, lab results, medications, and procedures, and the `evaluatedResource` shall reference the appropriate US Core profile. The extension [ra-groupReference](StructureDefinition-ra-groupReference.html) added to the `evaluatedResource` element enables tying a specific supporting evidence to a Condition Category (CC). This is accomplished by setting the extension’s `valueString` to be the same value of the `MeasureGroup.group.id` of the Condition Category (CC) to establish the association between a supporting evidence and one or more Condition Categories.  

### Example Coding Gap Report

Figure 2-2 is an example risk adjustment coding gap report. The <span class="bg-success" markdown="1">Data Consumer</span><!-- new-content --> queries for the [Risk Adjustment Coding Gap Report]s for patient Eve Everywoman (`subject`) and for a clinical evaluation period from January 1, 2021 to December 31, 2021 (`periodStart` and `periodEnd`). The <span class="bg-success" markdown="1">Data Producer</span><!-- new-content --> receives the request and finds a matching risk adjustment coding gap report for Eve Everywoman that has a clinical evaluation period of January 1, 2021 to September 30, 2021, which overlaps the `periodStart` and `periodEnd` dates provided in the <span class="bg-success" markdown="1">query - see [Report Query]</span><!-- new-content -->. This report was <span class="bg-success" markdown="1">generated</span><!-- new-content --> on October 18th, 2021 using the risk adjustment model CMS-HCC V24. As shown in this example report, Eve Everywoman has five Hierarchical Condition Categories (HCCs). Three of the HCCs are historic diagnoses and two are suspected diagnoses. For example, one of the historic diagnoses is HCC 18 (Diabetes with no Complications). The status of this coding gap is shown as closed and the evidence status date is April 1, 2021. The supporting evidence field shows the clinical data that was used to close the coding gap HCC 18.

{% include img-portrait.html img="report-risk-adjustment.png" caption="Figure 2.2-3 Example Risk Adjustment Coding Gap Report" %}

### Resources and Profiles

The following resources and their profiles specified in this IG are used to support sharing <span class="bg-success" markdown="1">Risk Adjustment Coding Gap MeasureReport between Data Producer and Data Consumer</span><!-- new-content -->:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Group|Patient Group Profile|[Patient Group]|
|MeasureReport|Risk Adjustment Coding Gap MeasureReport|[Risk Adjustment Coding Gap Report]
|Measure|Risk Adjustment Model Measure|[Risk Adjustment Model Measure]|
{: .grid}

Figure 2.2-4 provides a graphical view of how these resources are related to the example report above. The main resource is the [Risk Adjustment Coding Gap Report] profile. This coding gap report references a [Risk Adjustment Model Measure], which indicates CMS-HCC V24 is the risk adjustment model this report is based on. The coding gap report also references the Patient ([US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html)) as well as the Organization ([US Core Organization](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-organization.html)) that generated the report. The graph shows three groups within a [Risk Adjustment Coding Gap Report] using three example HCCs from Figure 2.2-3 to illustrate each `group` corresponds to an HCC including its attributes. <span class="bg-success" markdown="1">Note that the Risk Adjustment Coding Gap Report Bundle in this graph is a searchset Bundle returned by FHIR query.</span><!-- new-content --> 

{% include img-portrait.html img="report-risk-adjustment-resource-graph.png" caption="Figure 2.2-4 Resource Graph for Risk Adjustment Coding Gap Report"%}

<div class="bg-success" markdown="1">

### Approaches for Generating Risk Adjustment Coding Gap Report

This IG describes three approaches to generate a [Risk Adjustment Coding Gap Report].  The approaches provide an adoption strategy that allows consumers of this IG to access this IG in a way that matches their current FHIR maturity state, including generating a [Risk Adjustment Coding Gap Report] in a way that requires little to no FHIR maturity, and then transition to greater FHIR maturity approaches as the FHIR maturity state of their processes increases. As mentioned above, the Payer can use one or more of these processes as fits their need or stage as they transition their processes.

#### The Assisted Approach

This approach requires little to no FHIR maturity in order to generate the FHIR MeasureReport.  The Payer uses their existing processes, such as SQL, SAS, and object-oriented languages, to generate a comma-separated values (CSV) file with tuples of patient and risk adjustment data. The Payer then uses a non-FHIR RESTful API to create the [Risk Adjustment Coding Gap Report] using the CSV file as input. A REST server then POST the generated MeasureReports to the FHIR server. Note that using this approach means that no evaluated resources will be created or referenced by the Risk Adjustment Coding Gap Report.

The table below defines a standardized CSV header that could be used for the Assisted approach. (*TODO: table with draft content and needs more work*)

|Header Element|Description|Mapping|Example Value|
|---|---|---|
|periodStart|start of the clinical evaluation period|`MeasureReport.period.start`|1/1/2021|
|periodEnd|end of clinical evaluation period|`MeasureReport.period.end`|9/30/2021|
|modelId|risk adjustment model identifier|(MeasureReport.measure) `Measure.identifier`|https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01|
|modelVersion|risk adjustment model version|(MeasureReport.measure) `Measure.version`|24|
|patientId|patient identifier|(MeasureReport.subject) `Patient.identifier`|ra-patient01|
|ccCode|Condition Category Code|`MeasureGroup.group.code`|18|
|suspectType|coding gap suspect type|`MeasureReport.group.suspectType`|historic|
|evidenceStatus|coding gap evidence status|`MeasureReport.group.evidenceStatus`|open-gap|
|evidenceStatusDate|coding gap evidence status date|`MeasureReport.group.evidenceStatusDate`|4/1/2021|
|hierarchicalStatus|coding gap hierarchical status|`MeasureReport.group.hierarchicalStatus`|applied-not-superseded|
{: .grid}

#### The Generated Approach

Mostly a non-FHIR approach. The Payer generates FHIR [Risk Adjustment Coding Gap Report] and evaluated resources based on data from *traditional* risk adjustment coding gap reports. These *traditional* reports are generated by their existing processes using patient data and risk adjustment data produced by risk adjustment engines. A REST server then POST generated MeasureReports to the FHIR server.

#### The Evaluated Approach

An FHIR approach. This de novo approach uses the [$ra.evaluate-measure] operation and requires [digital Condition Categories (dCCs)](dcc.html). The FHIR server is pre-populated with patient data and dCCs. Payer runs the [$ra.evaluate-measure] operation against their FHIR server, CQL is executed against the patient and risk adjustment data to produce [Risk Adjustment Coding Gap Report] which references the evaluated resources used by CQL logics evaluation.

</div><!-- new-content -->

### Usage

*TODO: Needs review examples in example buttons*

#### Request Risk Adjustment Coding Gap MeasureReport

<div class="bg-success" markdown="1">

`GET [base]/MeasureReport/?subject=Patient/ra-patient02&period=ge2021-01-01&period=le2021-12-31&_include=MeasureReport:evaluated-resource`
</div><!-- new-content -->

{% include examplebutton.html example="get-risk-adjustment-coding-gap-report-usage-example" b_title ="Click Here To See Example GET Risk Adjustment Coding Gap Report" %}

#### Bulk data request for Risk Adjustment Coding Gap MeasureReports  

If <span class="bg-success" markdown="1">Data Consumer</span><!-- new-content --> is requesting Risk Adjustment Coding Gap MeasureReports for many patients, they may consider using the FHIR [Asynchronous Request Patterns] for the Bulk Data exchange operation.

<div class="bg-success" markdown="1">

`GET [base]/MeasureReport/?subject=Group/ra-group123&period=ge2021-01-01&period=le2021-12-31&_include=MeasureReport:evaluated-resource`
</div><!-- new-content -->

{% include examplebutton.html example="get-risk-adjustment-coding-gaps-report-usage-bulk-example" b_title = "Click Here To See Example GET Risk Adjustment Coding Gap Report Using Bulk Data" %}

Headers:
* `Prefer respond-async`
* `Accept application/fhir+json`

Note that both Prefer and Accept are required. **Prefer** specifies the response is immediate or asynchronous, which SHALL be set to *respond-async*. **Accept** specifies the format of the optional OperationOutcome response to the kick-off request. Any of the Serialization Format Representations are supported. See the base FHIR specification [Asynchronous Request Patterns] for details.

Query Parameters:
* `_outputFormat (string, optional, defaults to application/fhir+ndjson)`

Currently, only *application/fhir+ndjson* is supported.

#### Post Risk Adjustment Coding Gap Report

`POST [base]/bundle`

{% include examplebutton.html example="post-risk-adjustment-coding-gap-report-usage-example" b_title = "Click Here To See Example POST Risk Adjustment Coding Gap Report" %}


{% include link-list.md %}
