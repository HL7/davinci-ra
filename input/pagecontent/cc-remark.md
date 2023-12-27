<div class="bg-success" markdown="1">
This page is being updated based on ballot reconciliations. 

Note that Annotation is being renamed to Condition Category Remark. The Annotation extension has been updated to the [Condition Category Remark] extension. 
</div>

Systems may choose to display the [Risk Adjustment Coding Gap Report] to a Provider at the time of a patient's care. When this happens, a Provider (using the Reporting Client role) may choose to add a remark to the report letting the Payer know they took some actions in regard to the coding gap(s) when they saw the patient.  

Note: The [Condition Category Remark] extension is not intended to change the status of a Coding Category gap. To change the status, follow the [Submit Data to Payer] section of this guidance.  Note that both an Annotation and [Submit Data to Payer] can be generated at the time the Provider sees the patient if that is appropriate.

{% include img-portrait.html img="report-annotation-overview.png" caption="Figure 2.5-1 Report Annotation Overview"%}

### The Coding Gap Extension
For adding a remark, there is an extension, called [Condition Category Remark]. This extension is added to the [Risk Adjustment Coding Gap Report] within the `MeasureReport.group` element. This allows for a remark to specifically reference a Condition Category code. Also note the remark is a Complex extension and can repeat. Within the [Condition Category Remark] extension are several fields, all of which are optional:
- `annotator` indicates who provided the annotation. It can link to a US Core Organization, a US Core Practitioner or a US Core PractitionerRole which allows you to reference both a Practitioner and an Organization
- `annotatedDatetime` when the annotation was made
- `text` a free text annotation
- `code` a coded annotation to indicate the specific action taken. The code list which is extensible includes acknowledged, assessed and not present, assessed and present, and deferred
- relatedData that could be either an identifier to a reference to a Resource
    - the `relatedDataIentifier` can be used to link to a claim or document that the provider is sending via another method or transaction

The Provider's system SHALL NOT change any other part of the original Risk Adjustment Coding Gap Report and can only add the [Condition Category Remark] to the appropriate `MeasureReport.group`(s).  If a provider wants to share data with the Payer in order to change a gap status, they should use the [Submit Data to Payer] process.  

Once an [Condition Category Remark] is added to a [Risk Adjustment Coding Gap Report], it can be posted to the Payer's Reporting Server.

{% include img-portrait.html img="report-annotation-workflow.png" caption="Figure 2.5-2 Report Condition Category Remark Workflow"%}

#### Provider Handling of the Condition Category Remark

The Provider may choose to send the Condition Category Remark only to the Payer using a light weight approach rather than sending the entire MeasureReport resource.   They can use [PATCH](https://www.hl7.org/fhir/http.html#patch) operation.

### Payer Handling of the Condition Category Remark
This implementation guide does not direct any action be taken by the Payer upon receipt of a [Risk Adjustment Coding Gap Report] with added Condition Category remark(s).

After a Payer generates a subsequent [Risk Adjustment Coding Gap Report], in their role as Reporting Server they can choose to include the Condition Category remarks as they see fit. This might include adding the remarks only if received from the same Provider and can include any remarks all the way up to including all Condition Category remarks received from any provider. The Payer is not required to include any Condition Category remorks on subsequently generated [Risk Adjustment Coding Gap Report].



{% include link-list.md %}


