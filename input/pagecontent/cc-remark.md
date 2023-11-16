<div class="bg-success" markdown="1">
This page is being updated based on ballot reconciliations. 

Note that Annotation is being renamed to Condition Category Remark. The Annotation extension has been updated to the [Condition Category Remark] extension. 
</div>


Systems may choose to display the [Risk Adjustment Coding Gap Report] to a Provider at the time of a patient's care. When this happens, a Provider (using the Remediation Client role) may choose to annotate the report to let the Payer know they took some actions in regard to the coding gap(s) when they saw the patient.  

Note: Annotation is not intended to change the status of a Coding Category gap. The Remediation process using the Task Resource should be used instead. Note that both Annotation and Task can be generated at the time the Provider sees the patient if that is appropriate.

{% include img-portrait.html img="report-annotation-overview.png" caption="Figure 2.5-1 Report Annotation Overview"%}

### The Annotation Extension
For annotation, there is an extension, called [Annotation]. This extension was added to the [Risk Adjustment Coding Gap Report] within the `MeasureReport.group` element. This allows for an annotation to specifically reference a Condition Category code. Also note the annotation is a Complex extension and can repeat. Within the annotation extension are several fields, all of which are optional:
- `annotator` indicates who provided the annotation. It can link to a US Core Organization, a US Core Practitioner or a US Core PractitionerRole which allows you to reference both a Practitioner and an Organization
- `annotated` when the annotation was made
- `text` a free text annotation
- `code` a coded annotation to indicate the specific action taken. The code list which is extensible includes acknowledged, assessed and not present, assessed and present, and deferred
- relatedData that could be either an identifier to a reference to a Resource
    - the `relatedDataIentifier` can be used to link to a claim or document that the provider is sending via another method or transaction
    - the `relatedData` provides the option to reference a Resource

The Provider's system SHALL NOT change any other part of the original Risk Adjustment Coding Gap Report and can only add the [Annotation] to the appropriate `MeasureReport.group`(s).  If a provider wants to share data with the Payer in order to change a gap status, they should use the [Remediation] process.  

Once an [Annotation] is added to a [Risk Adjustment Coding Gap Report], it can be posted to the Payer's Reporting Server.

{% include img-portrait.html img="report-annotation-workflow.png" caption="Figure 2.5-2 Report Annotation Workflow"%}

#### Provider Handling of the Annotations

The Provider may choose to send the Annotation only to the Payer a light weight approach rather than sending the entire MeasureReport resource with the added Annotation using the [PATCH](https://www.hl7.org/fhir/http.html#patch) operation.

### Payer Handling of the Annotations
This implementation guide does not direct any action be taken by the Payer upon receipt of an annotated [Risk Adjustment Coding Gap Report].

After a Payer generates a subsequent [Risk Adjustment Coding Gap Report], in their role as a Remediation Server they can choose to include the annotations as they see fit. This might include adding the annotations only if received from the same Provider all the way up to including all annotations they have received. The Payer is not required to include any annotations on subsequently generated [Risk Adjustment Coding Gap Report].



{% include link-list.md %}


