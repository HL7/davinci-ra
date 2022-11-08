<div class="bg-info" markdown="1">
Content that was on the published version 1.0.0 Guidance page was moved to this page. This page yet needs to be updated for STU2 ballot.
</div>
<div class="bg-success" markdown="1">
### Gap Generation Overview

During this phase of the lifecycle process, the payer determines if there is grounds for suspecting that a patient may have a risk-adjustable condition that has not yet been documented during the current clinical evaluation period. Quality measures have clear rules governing when the patient is included in/excluded from the measure denominator and numerator; not so for risk adjustment. Payers often must statistically infer the likelihood that a patient might have an undocumented CC. This statistical process is called CC suspecting and is generally done in two ways:
- Historic conditions (also known as persisting conditions) are those which were documented during some past clinical evaluation periods, but have not yet been documented in the current period; and
- Suspected conditions, which are identified through the use of statistical modeling.

Alternatively, the payer may receive a medical claim that confirms the presence of a previously unsuspected risk adjusted condition. Since this most often happens when a condition has been diagnosed for the first time, these are referred to as net-new conditions. 

During the gap generation phase, the payer combines all relevant data streams and determines which CC gaps exist for the patient and what their status is. An open gap is one where the payer is soliciting information from the provider that the patient either has the condition, or that the gap is invalid. A closed gap is one where the payer has the necessary evidence that the gap is valid for the current clinical evaluation period. But because the CC suspecting process is probabilistic there will always be a certain percentage of invalid gaps that the provider indicates are not clinically appropriate for the patient. There is also a fourth pending gap state that will be discussed later on, during the Gap Resolution phase.

Many risk adjustment models are constructed in such a way as to differentiate between different degrees of severity in the disease process. For example, the Medicare Advantage model divides diabetes into three condition categories, which in order from least to most severe are: CC 19 (diabetes without complications); CC 18 (diabetes with chronic complications); and CC 17 (diabetes with acute complications.) During the clinical evaluation period a patient may diagnosed with diabetes several times, with individual diagnoses rolling up to different CCs. To avoid paying twice for the same underlying condition, a hierarchy is applied to the CCs so that only the most severe form is counted for risk adjustment purposes; applying these hierarchies turns a Condition Category (CC) into a Hierarchical Condition Category (HCC). In the previous example, CC 17 supersedes CCs 18 and 19, and CC 18 supersedes CC 19.

There are many potential uses for CC gap information. For example, a provider may seek to take action on open gaps, or they may want confirmation of their previous gap closure or gap invalidation actions from the payer, or they may want to calculate their gap closure performance under the terms of a value-based payment arrangement. In general, the payer will not know in advance which of these purposes the data will be used for, so the approach that has been taken in this implementation guide is for the payer to provide as much CC gap data as possible, with flags on the data so that the provider may filter the CC gaps on the receiving end. This makes it possible for the IG to support as broad a range of applications as possible. Data filtering is the responsibility of the recipient.

To summarize: the suspectType of a CC gap may be historic, suspected, or net-new; its evidenceStatus may be open-gap, closed-gap, pending, or invalid; and its hierarchicalStatus may be applied-superseded, applied-not-superseded, not-applied, or not-applicable (e.g., if the model is non-hierarchical.) These three flags are used to facilitate data filtering by the requester.

Once the CC gaps have been identified and their filtering flags are set, the next task is to bundle them into a MeasureReport. The Risk Adjustment IG provides three approaches to do this.

- The Assisted approach is intended for situations in which the payer wants to cause minimal impact on existing risk adjustment operations. In many payers, lists of CC gaps are produced by manual processes and/or SAS datasets. This approach provides a means for ingesting preexisting gap lists and mapping them to FHIR resource elements.
- In the Generated approach FHIR resource inputs are consumed directly and used to generate a risk adjustment MeasureReport.
- The Evaluated approach anticipates the use of Digital Condition Categories (dCCs.) In this approach, a dCC evaluates whether an CC gap is open or closed per the ICD-10-CM coding guidelines, with the output of the dCC providing the input to the MeasureReport.

To support a transition strategy for dCC and to simplify adoption of this IG, all three of these processes may be used in parallel. For example, a payer organization might use dCCs for evaluating diabetes, heart disease, heart failure, and COPD, with all other CC evaluated through certified CC coders. This means that some means must be provided for generating a single combined MeasureReport containing CC gaps from different input streams: the diabetes CC gaps might come from dCCs, while other CC gaps might come from SAS datasets or the like. In future state as dCCs become available, a MeasureReport may result from the merger of the assisted, generated, and evaluated data streams. In this way a MeasureReport will contain a holistic view of a patient’s CC gaps, no matter where those gaps originated.

Once all Measure Reports have been created, this IG defines an operation, [$ra.coding-gaps] which will create a Risk Adjustment Coding Bundle for a single patient or group of patients.  This operation can be run by either the provider to pull the report to their system.  Or it can be run by the payer and pushed/posted to the provider’s system.  The Risk Adjustment Coding Bundle is a document consisting of the [Risk Adjustment Coding Gap Report] and a [Risk Adjustment Coding Gap Original DetectedIssue] for each CC on the report.  This document can be updated/remediated in the next step of the process, [Risk Adjustment Coding Gap Remediation]

### Actors
The actors involved in generating and exchanging risk adjustment coding gap reports are defined as the Provider and the Payer for ease of understanding in this IG.  These roles may be played by other entities in your scenario.
- <b>Providers</b> are the actors requesting risk adjustment coding gap reports using the $ra.coding-gaps operation.
- <b>Payors</b> are the actors receiving the request for retrieving the risk adjustment coding gap reports using the $ra.coding-gaps operation.

In the example shown in Figure 2.2-1, a payer acts both as Client and Server in this scenario. The payer (acting as the Client) calls the [$ra.coding-gaps] operation on their Server to query matching Risk Adjustment Coding Gap Reports based on the parameters provided in the operation, then the payer posts the reports to providers.

As shown in Figure 2.2-2, the Provider calls the [$ra.coding-gaps] operation that is defined in this IG and based on the parameters provided in the operation  returns the Risk Adjustment  to the Client.

{% include img-portrait.html img="actors-post.png" caption = "Figure 2.2-1 Risk Adjustment Coding Gap Reporting Actors - Example 1" %}

{% include img-portrait.html img="actors-request.png" caption = "Figure 2.2-2 Risk Adjustment Coding Gap Reporting Actors - Example 2" %}


### $ra.coding-gaps Operation and Risk Adjustment Coding Gap Report

The risk adjustment coding gap reports are generated in one of three ways described below. The [Risk Adjustment Coding Gap MeasureReport], a profile of the [MeasureReport] resource, provides a standardized representation to construct these reports. The [$ra.coding-gaps] operation defined in this implementation guide can be used by a Client to request risk adjustment coding gap reports of applicable risk adjustment models for one or more patients (a Group) from the Server.


#### Risk Adjustment Coding Gap Report
Before the operation is run to generate the Risk Adjustment Coding Gap Bundle, the MeasureReports for the patient(s) must be created.  There are three methods to accomplish this.  As mentioned above, the payer can use one or more of these processes as fits their need or stage as they transition their processes.

##### The Assisted Approach
This method is described here, [Assisted].  The payer's risk adjustment system can create a .csv file that is used as input to a RESTful operation to create the Risk Adjustment Coding Gap Report.  Note that using this approach means that no evaluated resources will be created or referenced by the Risk Adjustment Coding Gap Report.

##### The Generated Approach
This approach has the payer's back end systems creating a FHIR MeasureReport following the [Risk Adjustment Coding Gap Report] profile.  If desired, the payer's system can also created the resources pointed to in the evaluatedResources element.

##### The Evaluated Approach
This approach introduces a new concept to Risk Adjustment, showing that CC's can be represented by using CQL and the FHIR Resources to generate the report directly from FHIR using the [$ra.evaluate-measure] operation.  You can find more information on this process in the [Specifying dCC] section


The [Risk Adjustment Coding Gap MeasureReport] is used to represent coding gap report for a single patient and a version specific risk adjustment model. The required `MeasureReport.subject` references [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html) and the required `MeasureReport.measure` element references the [Risk Adjustment Model Measure]. The [Risk Adjustment Model Measure] profile specifies risk adjustment model information, which requires both a model identifier and a version. If the Server's risk adjustment engine runs multiple risk adjustment models including different versions of the same model, then there will be multiple risk adjustment coding gap reports for a patient. For example, if a risk adjustment engine runs reports using CMS-HCC V25, CMS-HCC V24, and Rx-HCC V5, then there will be three separate risk adjustment coding gap reports for the patient, each for a version specific risk adjustment model.

The [MeasureReport] resource has zero to many `group` elements. Each `group` element contains information for a Condition Category (CC), therefore, each MeasureReport may contain multiple Condition Category (CC) codes. The `group.code` is used to represent the actual code for a Condition Category (CC), such as HCC 18 (Diabetes with No Complication). The [Risk Adjustment Coding Gap MeasureReport] profile added several extensions to the MeasureReport resource’s `group` element to provide additional information about a Condition Category (CC), which includes:
 - the suspect type for a Condition Category (CC) coding gap that is either historic, suspected, or unsuspected;
 - the evidence status of a Condition Category (CC) coding gap that is either closed-gap, open-gap, or pending;
 - the evidence status date indicating when the evidence status was changed to either closed-gap, open-gap, or pending; and
 - the hierarchical status indicating whether hierarchies were applied to a Condition Category (CC), and if applied, whether the Condition Category (CC) is superseded. The status can be either applied-superseded, applied-not-superseded, not-applied, or not-applicable.

In addition, the [Risk Adjustment Coding Gap MeasureReport] provides capability of sharing supporting evidence for a Condition Category (CC) through the use of the `MeasureReport.evaluatedResource` element. This supporting evidence may include resources for data such as encounters, lab results, medications, and procedures, and the `evaluatedResource` shall reference the appropriate US Core profile. The extension [ra-groupReference](StructureDefinition-ra-groupReference.html) added to the `evaluatedResource` element enables tying a specific supporting evidence to a Condition Category (CC). This is accomplished by setting the extension’s `valueString` to be the same value of the `MeasureGroup.group.id` of the Condition Category (CC) to establish the association between a supporting evidence and one or more Condition Categories.  

#### $ra.coding-gaps Operation
The [$ra.coding-gaps] operation requires three input (IN) parameters: `subject`, `periodStart`, and `periodEnd`. The `subject` parameter references either a single patient or a group of patients (as specified in the [Patient Group] profile). The term clinical evaluation period refers to the time period during which the risk adjusting encounters could be conducted and documented with expectations of submissions for risk adjustment purposes. The `periodStart` and `periodEnd` parameters are the start and end dates of the clinical evaluation period.

If the `subject` is valid, the dates provided in `periodStart` and `periodEnd` will then be evaluated for any overlaps against the clinical evaluation period (`MeasureReport.period.start` and `MeasureReport.period.end`) of risk adjustment coding gap reports available on the Server for that patient. The [$ra.coding-gaps] operation returns a [Risk Adjustment Coding Gap Report Bundle] if matching risk adjustment coding gap reports were found for a patient. This bundle is a FHIR collection bundle, which must contain a patient ([US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html)) entry and zero or more entries of risk adjustment coding gap reports ([Risk Adjustment Coding Gap MeasureReport]). All risk adjustment coding gap reports contained in a [Risk Adjustment Coding Gap Report Bundle] must be for the same patient.

The $ra.coding-gaps operation will always return one [Parameters](https://www.hl7.org/fhir/parameters.html) whether the `subject` is a single patient or a group of patients. Risk Adjustment Coding Gap Report Bundle for a patient is in a `Parameters.parameter` element. A Risk Adjustment Coding Gap Report Bundle contains the Risk Adjustment Coding Gap Reports for the same patient. For example, if a Group has 10 valid patients, then a Parameters will contain 10 `Parameters.parameter` elements, with each `Parameters.parameter` for a unique patient. Detailed documentation and conformance statements are listed on the page for [$ra.coding-gaps].

--start here add [Risk Adjustement Coding Gap Original DetectedIssue]

An example workflow of a Client calls the [$ra.coding-gaps] operation to request risk adjustment coding gap reports for a single patient is shown below in Figure 3-1.

{% include img-portrait.html img="risk-adjustment-coding-gap-report-single-patient.png" caption = "Figure 3-1 Report Operation Workflow for a Single Patient" %}

### Example Risk Adjustment Coding Gaps Report

Figure 3-2 is an example risk adjustment coding gap report. The Client calls the [$ra.coding-gaps] operation for patient Eve Everywoman (`subject`) and for a clinical evaluation period from January 1, 2021 to December 31, 2021 (`periodStart` and `periodEnd`). The Server receives the request and finds a matching risk adjustment coding gap report for Eve Everywoman that has a clinical evaluation period of January 1, 2021 to September 30, 2021, which overlaps the `periodStart` and `periodEnd` dates provided in the [$ra.coding-gaps] operation. This report was created by a backend risk adjustment engine on October 18th, 2021 using the risk adjustment model CMS-HCC V24. As shown in this example report, Eve Everywoman has five Hierarchical Condition Categories (HCCs). Three of the HCCs are historic diagnoses and two are suspected diagnoses. For example, one of the historic diagnoses is HCC 18 (Diabetes with no Complications). The status of this coding gap is shown as closed and the evidence status date is April 1, 2021. The supporting evidence field shows the clinical data that was used to close the coding gap HCC 18.

{% include img-portrait.html img="report-risk-adjustment.png" caption = "Figure 3-2 Example Risk Adjustment Coding Gap Report" %}

### Resources and Profiles

The following resources and their profiles specified in this implementation guide are used to support sharing risk adjustment coding gap reports from Server to Client:

|Resource Type|Profile Name|Link to Profile|
|---|---|---|
|Bundle|Risk Adjustment Coding Gap Report Bundle|[Risk Adjustment Coding Gap Report Bundle]|
|Group|Patient Group Profile|[Patient Group]|
|MeasureReport|Risk Adjustment Coding Gap MeasureReport|[Risk Adjustment Coding Gap MeasureReport]|
|Measure|Risk Adjustment Model Measure|[Risk Adjustment Model Measure]|

Figure 3-3 provides a graphical view of how these resources are related to the example report above. The main resource is the [Risk Adjustment Coding Gap MeasureReport] profile. This coding gap report references a [Risk Adjustment Model Measure], which indicates CMS-HCC V24 is the risk adjustment model this report is based on. The coding gap report also references the Patient ([US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html)) as well as the Organization ([US Core Organization](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-organization.html)) that generated the report. The graph shows three groups within a [Risk Adjustment Coding Gap MeasureReport] using three example HCCs from Figure 3-2 to illustrate each `group` corresponds to an HCC including its attributes.

{% include img-portrait.html img="report-risk-adjustment-resource-graph.png" caption = "Figure 3-3 Resource Graph for Risk Adjustment Coding Gap Report" %}

### Usage

#### Request Risk Adjustment Coding Gap MeasureReport

`GET [base]/MeasureReport/$ra.coding-gaps`

{% include examplebutton.html example="get-risk-adjustment-coding-gap-report-usage-example" b_title = "Click Here To See Example GET Risk Adjustment Coding Gap Report" %}


#### Bulk data request for Risk Adjustment Coding Gap MeasureReports  

If Clients are requesting risk adjustment coding gap reports for many patients, they may consider using the FHIR [Asynchronous Request Patterns] for the Bulk Data exchange operation.

`GET [base]/MeasureReport/$ra.coding-gaps`

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

</div>

{% include link-list.md %}
