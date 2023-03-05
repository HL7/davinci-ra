<div class="new-content" markdown="1">
All sections on this page are new content.
</div><!-- new-content -->

### Annotating a Report
Systems may choose to display the Risk Adjustment Gap Report to a provider at the time of a patient's care.  When this happens, a provider can choose to annotate the report to let the payer know they took some action in regard to the Risk Adjustment gap when they saw the patient.  

Note: Annotation is not intended to change the status of an HCC gap.  The Remediation process using the Task Resource should be used instead.  Note that both and Annotation and Task can be generated at the time the provider sees the patient if that is appropriate

{% include img-portrait.html img="report-annotation-overview.png" caption="Figure 2.5-1 Report Annotation Overview"%}

#### The Annotation Extension
For annotation, there is an extension, called [Annotation extension].  This extension was added to the [Risk Adjustment Coding Gap Report] within the .group element.  This allows for an annotation to specifically reference a Condition Category code.  Also note the annotation is a Complex extension and can repeat.  Within the annotation extension are several fields, all of which are optional:
    - annotator which indicates who provided the annotation.  It can link to a US Core Organization, a US Core Practitioner or a US Core PractitionerRole which allows you to reference both a Practitioner and an Organization
    - when the annotation was made
    - text about the annotation
    - a code to indicate the specific action taken
    - an identifier that can be used to link to a claim or document that the provider is sending out of band

The provider's system should NOT change any other part of the original Risk Adjustment Gap Report, they only add the [Annotation extension] to the appropriate .group(s).  If a provider wants to share data with the payer in order to change a gap status, they should use the [Remediation] process.  The the Risk Adjustment Gap Report is posted back to the payer's system.

{% include img-portrait.html img="report-annotation-workflow.png" caption="Figure 2.5-2 Report Annotation Workflow"%}

#### Payer Handling of the Annotations
This Implementation Guide does not direct any action be taken by the payer upon receipt of an annotated Risk Adjustment Gap Report.

When a payer generates a subsequent [Risk Adjustment Coding Gap Report], they can choose to include the annotations as they see fit.  This might include adding the annotations only if received from the same provider/office up to including all annotations they have received.  The payer is not required to include any annotations on subsequently generated [Risk Adjustment Coding Gap Report].



{% include link-list.md %}


