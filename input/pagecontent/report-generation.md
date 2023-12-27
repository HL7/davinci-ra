### Introduction and Background

During this phase of the lifecycle process, the Payer determines if there is grounds for suspecting that a patient may have a risk-adjustable condition that has not yet been documented during the current clinical evaluation period. Quality measures have clear rules governing when the patient is included in/excluded from the measure denominator and numerator; not so for risk adjustment. Payers often must statistically infer the likelihood that a patient might have an undocumented Condition Category (CC). This statistical process is called Condition Category (CC) suspecting and is generally done in two ways:
- Historic conditions (also known as persisting conditions) are those which were documented during some past clinical evaluation periods, but have not yet been documented in the current period; and
- Suspected conditions, which are identified through the use of statistical modeling.

Alternatively, the Payer may receive a medical claim that confirms the presence of a previously unsuspected risk adjusted condition. Since this most often happens when a condition has been diagnosed for the first time, these are referred to as net-new conditions. 

During the gap generation phase, the Payer combines all relevant data streams and determines which CC gaps exist for the patient and what their status is. An open gap is one where the Payer is soliciting information from the Provider that the patient either has the condition, or that the gap is invalid. A closed gap is one where the Payer has the necessary evidence that the gap is valid for the current clinical evaluation period. But because the CC suspecting process is probabilistic there will always be a certain percentage of invalid gaps that the Provider indicates are not clinically appropriate for the patient. Additionally, the gaps state of pending may be used when a payer receives a gap closure request and is working on confirming that closure; the pending state is discussed further in the Remediation section.

Many risk adjustment models are constructed in such a way as to differentiate between different degrees of severity in the disease process. For example, the Medicare Advantage model divides diabetes into three condition categories, which in order from least to most severe are: CC 19 (diabetes without complications); CC 18 (diabetes with chronic complications); and CC 17 (diabetes with acute complications.) During the clinical evaluation period a patient may be diagnosed with diabetes several times, with individual diagnoses rolling up to different Condition Categories (CCs). To avoid paying twice for the same underlying condition, a hierarchy is applied to the CCs so that only the most severe form is counted for risk adjustment purposes; applying these hierarchies turns a CC into a Hierarchical Condition Category (HCC). In the previous example, CC 17 supersedes CCs 18 and 19, and CC 18 supersedes CC 19.

There are many potential uses for CC gap information. For example, a provider may seek to take action on open gaps, or they may want confirmation of their previous gap closure or gap invalidation actions from the payer, or they may want to calculate their gap closure performance under the terms of a value-based payment arrangement. In general, the Payer will not know in advance which of these purposes the data will be used for, so the approach that has been taken in this implementation guide (IG) is for the Payer to provide as much CC gap data as possible, with flags on the data so that the Provider may filter the CC gaps on the receiving end. This makes it possible for the IG to support as broad a range of applications as possible. Data filtering is the responsibility of the recipient.

To summarize: the suspectType of a CC gap may be historic, suspected, or net-new; its evidenceStatus may be open-gap, closed-gap, pending, or invalid; and its hierarchicalStatus may be applied-superseded, applied-not-superseded, not-applied, or not-applicable (e.g., if the model is non-hierarchical.) These three flags are used to facilitate data filtering by the requester.

Once the CC gaps have been identified and their filtering flags are set, the next task is to put them into a FHIR MeasureReport. This IG provides three approaches to do this.

- The [Assisted] approach is intended for situations in which the Payer wants to cause minimal impact on existing risk adjustment operations. For many Payers, lists of CC gaps are produced by manual processes and/or SAS datasets. This approach provides a means for ingesting preexisting gap lists and mapping them to FHIR resource elements.
- In the [Generated] approach FHIR resource inputs are consumed directly and used to generate a risk adjustment MeasureReport.
- The [Evaluated] approach anticipates the use of Digital Condition Categories (dCCs.) In this approach, a dCC evaluates whether a CC gap is open or closed per the ICD-10-CM coding guidelines, with the output of the dCC providing the input to the MeasureReport.

To support a transition strategy for dCC and to simplify adoption of this IG, all three of these approaches may be used in parallel. For example, a payer organization might use dCCs for evaluating diabetes, heart disease, heart failure, and COPD, with all the other CCs evaluated through Risk Adjustment Coder (e.g., Certified Risk Adjustment Coder (CRC)). This means that some means must be provided for generating a single combined MeasureReport containing CC gaps from different input streams: the diabetes CC gaps might come from dCCs, while other CC gaps might come from SAS datasets or the like. In future state as dCCs become available, a MeasureReport may result from the merger of the Assisted, Generated, and Evaluated data streams. In this way a MeasureReport will contain a holistic view of a patient’s CC gaps, no matter where those gaps originated.

Once all MeasureReports have been created, a query can be run for one or more [Risk Adjustment Coding Gap Report]s for a single patient or group of patients. This query can be run by either the Provider to pull the report to their system, or it can be run by the Payer and pushed/posted to the Provider’s system.  

### Actors

The Actors involved in coding gap report generation are defined as the Payer and the Provider:
- The Payer acts as the Reporting Server that receives the query request for retrieving the [Risk Adjustment Coding Gap Report] resources. 
- Either the Provider or Payer acting as the Reporting Client, can request [Risk Adjustment Coding Gap Report] using a FHIR query on the MeasureReport resource.

In the example shown in Figure 2.2-1, a Payer plays the role both as Reporting Server and Reporting Client in this scenario. The Payer (acting as the Reporting Client) queries the [Risk Adjustment Coding Gap Report] on their Reporting Server based on the search parameters provided. Then the Payer POSTs the searchset Bundle to the Provider.

{% include img-portrait.html img="actors-post.png" caption="Figure 2.2-1 Report Generation Actors - Example 1"%}

As shown in Figure 2.2-2, the Provider playing the role of the Reporting Client queries the [Risk Adjustment Coding Gap Report] on the Payer's Reporting Server with search parameters.  The Payer's Reporting Server returns the [Risk Adjustment Coding Gap Report] and the evaluated Resources to the Provider.

{% include img-portrait.html img="actors-request.png" caption="Figure 2.2-2 Report Generation Actors - Example 2"%}


### Risk Adjustment Coding Gap MeasureReport

The [Risk Adjustment Coding Gap Report] is used to represent a coding gap report for a single patient and a version specific risk adjustment model. The required `MeasureReport.subject` references [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html) and the required `MeasureReport.measure` element references the [Risk Adjustment Model Measure]. The [Risk Adjustment Model Measure] profile specifies risk adjustment model information, which requires both a model identifier and a version. If the Server's risk adjustment engine runs multiple risk adjustment models including different versions of the same model, then there will be multiple [Risk Adjustment Coding Gap Report]s for a patient. For example, if a risk adjustment engine runs reports using CMS-HCC V25, CMS-HCC V24, and Rx-HCC V5, then there will be three separate [Risk Adjustment Coding Gap Report]s for the patient, each for a version specific risk adjustment model.

The [MeasureReport] resource has zero to many `group` elements. Each `group` element contains information for a Condition Category (CC), therefore, each MeasureReport may contain multiple Condition Category (CC) codes. The `group.code` is used to represent the actual code for a Condition Category (CC), such as HCC 18 (Diabetes with No Complication). The [Risk Adjustment Coding Gap Report] profile adds several extensions to the MeasureReport resource’s `group` element to provide additional information about a Condition Category (CC), including:
 - the suspect type for a Condition Category (CC) coding gap that is either historic, suspected, or unsuspected;
 - the evidence status of a Condition Category (CC) coding gap that is either closed-gap, open-gap, or pending;
 - the evidence status date indicating when the evidence status was changed to either closed-gap, open-gap, or pending; and
 - the hierarchical status indicating whether hierarchies were applied to a Condition Category (CC), and if applied, whether the Condition Category (CC) is superseded. The status can be either applied-superseded, applied-not-superseded, not-applied, or not-applicable.

In addition, the [Risk Adjustment Coding Gap Report] provides the capability of sharing supporting evidence for a Condition Category (CC) through the use of the `MeasureReport.evaluatedResource` element. This supporting evidence may include resources for data such as encounters, lab results, medications, and procedures, and the `evaluatedResource` shall reference the appropriate US Core profile. The extension [ra-groupReference](StructureDefinition-ra-groupReference.html) added to the `evaluatedResource` element enables tying a specific supporting evidence to a Condition Category (CC). This is accomplished by setting the extension’s `valueString` to be the same value of the `MeasureGroup.group.id` of the Condition Category (CC) to establish the association between the supporting evidence and one or more Condition Categories.  

### Example Coding Gap Report

Figure 2-2 is an example [Risk Adjustment Coding Gap Report]. The <span class="bg-success" markdown="1">Provider</span><!-- new-content --> queries for the [Risk Adjustment Coding Gap Report]s for patient Eve Everywoman (`subject`) and for a clinical evaluation period from January 1, 2021 to December 31, 2021 (`periodStart` and `periodEnd`). The <span class="bg-success" markdown="1">Payer</span><!-- new-content --> receives the request and finds a matching risk adjustment coding gap report for Eve Everywoman that has a clinical evaluation period of January 1, 2021 to September 30, 2021, which overlaps the `periodStart` and `periodEnd` dates provided in the <span class="bg-success" markdown="1">query - see [Report Query]</span><!-- new-content -->. This report was <span class="bg-success" markdown="1">generated</span><!-- new-content --> on October 18th, 2021 using the risk adjustment model CMS-HCC V24. As shown in this example report, Eve Everywoman has five Hierarchical Condition Categories (HCCs). Three of the HCCs are historic diagnoses and two are suspected diagnoses. For example, one of the historic diagnoses is HCC 18 (Diabetes with no Complications). The status of this coding gap is shown as closed and the evidence status date is April 1, 2021. The supporting evidence field shows the clinical data that was used to close the coding gap HCC 18.

{% include img-portrait.html img="report-risk-adjustment.png" caption="Figure 2.2-3 Example Risk Adjustment Coding Gap Report" %}

### Resources and Profiles

The following resources and their profiles specified in this IG are used to support sharing <span class="bg-success" markdown="1">[Risk Adjustment Coding Gap Report]s between the Payer and the Provider</span><!-- new-content -->:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Group|Patient Group Profile|[Patient Group]|
|MeasureReport|Risk Adjustment Coding Gap MeasureReport|[Risk Adjustment Coding Gap Report]
|Measure|Risk Adjustment Model Measure|[Risk Adjustment Model Measure]|
{: .grid}

Figure 2.2-4 provides a graphical view of how these resources are related to the example report above. The main resource is the [Risk Adjustment Coding Gap Report] profile. This coding gap report references a [Risk Adjustment Model Measure], which indicates CMS-HCC V24 is the risk adjustment model this report is based on. The coding gap report also references the Patient ([US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html)) as well as the Organization ([US Core Organization](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-organization.html)) that generated the report. The graph shows three groups within a [Risk Adjustment Coding Gap Report] using three example HCCs from Figure 2.2-3 to illustrate how each `group` corresponds to an HCC including its attributes. <span class="bg-success" markdown="1">Note that the Bundle in this graph is a searchset Bundle returned by FHIR query with the Risk Adjustment Coding Gap Reports.</span><!-- new-content --> 

{% include img-portrait.html img="report-risk-adjustment-resource-graph.png" caption="Figure 2.2-4 Resource Graph for Risk Adjustment Coding Gap Report"%}



### Approaches for Generating Risk Adjustment Coding Gap Report

This IG describes three approaches to generate a [Risk Adjustment Coding Gap Report].  The approaches provide an adoption strategy that allows consumers of this IG to choose an implementation that matches their current state of FHIR maturity, including an option for generating a [Risk Adjustment Coding Gap Report] that requires little to no FHIR maturity and then transition to more mature approaches as their FHIR maturity grows. As mentioned above, the Payer can use one or more of these processes as fits their need or stage as they transition their processes.

#### The Assisted Approach

This approach requires little to no FHIR maturity to generate the [Risk Adjustment Coding Gap Report].  The Payer uses their existing processes, such as SQL, SAS, and object-oriented languages, to create a comma-separated value (CSV) file with tuples of patient and risk adjustment data. The Payer then uses a non-FHIR RESTful API to create the [Risk Adjustment Coding Gap Report] using the CSV file as input. Note that using this approach means that no evaluated resources will be created or referenced by the [Risk Adjustment Coding Gap Report].

The table below defines a standardized CSV header that could be used for the Assisted approach.

|Header Element|Description|Mapping|Example Value|
|---|---|---|
|periodStart|Start of the clinical evaluation period|`MeasureReport.period.start`|1/1/2021|
|periodEnd|End of clinical evaluation period|`MeasureReport.period.end`|9/30/2021|
|modelId|Risk adjustment model identifier|`Measure.identifier` (MeasureReport.measure)|https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01|
|modelVersion|Risk adjustment model version|`Measure.version` (MeasureReport.measure)|24|
|patientId|Patient identifier|`Patient.identifier` (MeasureReport.subject)|ra-patient01|
|ccCode|Condition Category Code|`MeasureGroup.group.code`|18|
|suspectType|Coding gap suspect type|`MeasureReport.group.suspectType`|historic|
|evidenceStatus|Coding gap evidence status|`MeasureReport.group.evidenceStatus`|open-gap|
|evidenceStatusDate|Coding gap evidence status date|`MeasureReport.group.evidenceStatusDate`|4/1/2021|
|hierarchicalStatus|Coding gap hierarchical status|`MeasureReport.group.hierarchicalStatus`|applied-not-superseded|
{: .grid}

{% include examplebutton.html example="get-risk-adjustment-assisted-csv-example" b_title ="Click Here To See Example Assisted CSV" %}

#### The Generated Approach

This approach requires an implementation that adheres to the requirements of this IG to generate the [Risk Adjustment Coding Gap Report]. The Payer constructs the FHIR [Risk Adjustment Coding Gap Report] and the evaluated resources based on data from *traditional* risk adjustment coding gap reports. These *traditional* reports are created by their existing processes using patient and risk adjustment data produced by risk adjustment engines.

#### The Evaluated Approach

This de novo approach requires an implementation that includes the [$ra.evaluate-measure] operation and requires [digital Condition Categories (dCCs)](dcc.html). The FHIR server is pre-populated with patient data and dCCs. The Payer then runs the [$ra.evaluate-measure] operation to produce a [Risk Adjustment Coding Gap Report].  During the [$ra.evaluate-measure] operation, CQL is executed against the patient and risk adjustment data.  The resources used by CQL logic evaluation are tracked and included in the final [Risk Adjustment Coding Gap Report].

### Usage

#### Request Risk Adjustment Coding Gap MeasureReport


`GET [base]/MeasureReport/?subject=Patient/ra-patient02&period=ge2021-01-01&period=le2021-12-31&_profile=http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport&_include=MeasureReport:evaluated-resource`


{% include examplebutton.html example="get-risk-adjustment-coding-gap-report-usage-example" b_title ="Click Here To See Example GET Risk Adjustment Coding Gap Report" %}

#### Bulk Data Request for Risk Adjustment Coding Gap MeasureReports  

If requesting [Risk Adjustment Coding Gap Report] for many patients, <span class="bg-success" markdown="1">the Reporting Client</span><!-- new-content --> may consider using the FHIR [Asynchronous Request Patterns] for the Bulk Data exchange operation.


`GET [base]/MeasureReport/?subject=Group/ra-group123&period=ge2021-01-01&period=le2021-12-31&_profile=http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport&_include=MeasureReport:evaluated-resource`

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
