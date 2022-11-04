
<div class="bg-info" markdown="1">
**This page is under development.**
</div>

### Introduction

The Da Vinci Project member organizations have identified the need of standardizing how risk adjustment coding gaps are communicated between payers and providers. This release of the implementation guide specifies standardized risk adjustment coding gap reports and defines an operation for a Client to query the coding gap reports from a Server for one or more patients. Standardizing the reporting structure helps lessen the burden on the providers in processing the reports so they can more easily address the patients’ care needs. This standardized structure also supports the payer sharing information that they have but the providers may not, such as data from other providers’ claims, lab results, filled prescriptions, etc.

### Preconditions and Assumptions

- A contract for medical services exists between the Server and the Client requesting the risk adjustment coding gap reports.
- Risk adjustment coding gap reports are pre-generated on the Server by a backend system such as a risk adjustment engine for risk adjustment model(s).
- It is the responsibility of the Server to ensure that the data used in the report is present in a structured and retrievable form.
- The Server and the Client have agreed upon a process to identify specific patient(s) and exchange the Patient resource's logical id or the Patient Group resource's logical id.
- Although the exact mechanisms for securing these exchanges are not specified as part of this implementation guide:
    - Exchanges are limited to mutually agreed upon (i.e., between the Server and Client) patient lists or population.
    - Security and privacy should follow [Security and Privacy](https://build.fhir.org/ig/HL7/davinci-ehrx/security.html#security-and-privacy) guidance specified in the Da Vinci Health Record Exchange (HRex) Implementation Guide.   
    - Systems should use standard authentication and authorization approaches. The [SMART App Launch] and [SMART backend services] authentication/authorization approach are recommended models.

### Attribution

Member attribution establishes associations between providers and payers. The process of establishing and exchanging patient lists for risk adjustment coding gap report is not in the scope of this implementation guide. One possible way of exchanging Member Attribution Lists between providers and payers is described in the [Da Vinci - Risk Based Contracts Member Attribution (ATR) List IG].

### Must Support
Certain elements in the profiles defined in this implementation guide are marked as Must Support. This flag is used to indicate that the element plays a critical role in defining and sharing risk adjustment coding gaps, and implementations SHALL understand and process the element.

This implementation guide uses US Core profiles where appropriate, therefore, the implications of the Must Support flag for US Core profiles must also be considered.

For more information, see the definition of [Must Support](http://hl7.org/fhir/R4/conformance-rules.html#mustSupport) in the base FHIR specification.

### Dependencies

This implementation guide relies on the following specifications:
- [FHIR R4](http://hl7.org/fhir/R4/)
- [US Core STU3.1.1](http://hl7.org/fhir/us/core/STU3.1.1)
<div class="bg-success" markdown="1">
### Overview of the Risk Adjustment workflow

The Risk Adjustment Condition Category workflow consists of three major phases
- [Risk Adjustment Coding Gap Report Generation]
- [Risk Adjustment Coding Gap Remediation]
- [Risk Adjustment Coding Gap Resolution]

In the [Risk Adjustment Coding Gap Report Generation] phase, this IG documents three ways to create a MeasureReport; some with possible evaluated resources. 
   - [Generated] where the payer's software generated a FHIR MeasureReport format not using FHIR operations.  The payer can choose to also reference and create evaluated resources.  Note that these Resources should be conformant with US Core if the resource is profiled there.
   - [Assisted] where the payer uses a non-FHIR RESTful API with a CSV file containing the data to populate the MeasureReport.  This method will not contain evaluatedResources
   - [Evaluated] which is where the payer has defined their Condition Categories using CQL and FHIR.  These are called Digital Condition Categories (dCC).  They can then run the [$evaluateMeasure] operation against their FHIR server to generate the MeasureReport which points to the evaluated resources used by the CQL.

Once a MeasureReport is created, it can then be incorporated into a Risk Adjustment Condition Category Gap Report using the [$cc-gaps] operation.

The [$cc-gaps] operation produces a document bundle, [Risk Adjustment Coding Gap Bundle] which contains a [Risk Adjustment Coding Gap Composition].  The composition resource guides what should be included in the report and that would be:
    - [Risk Adjustment Coding Gap MeasureReport]
    - [Risk Adjustment Coding Gap Original DetectedIssue]
    - and potentially US Core resources to support the MeasureReport and DetectedIssue

The receiver of this document bundle, typically a provider, then has the option of remediating the report by adding [Risk Adjustment Coding Gap Clinical Evaluation DetectedIssue].  This would be used when the provider has evidence to close a gap or invalidate a gap.  The gap could be invalidated because the patient never had a condition that put them in the Condition Category, the condition is inactive, or because the patient has an active condition but the Condition Category given does not accurately describe it.  The provider could also add a Condition Category that is not on the report but that they have evidence showing it would apply to an appropriate Risk Adjustment Conditon Category code.  

The provider uses [$cc-remediate] to update the report report with this new information and sends the bundle to the Risk Adjustment Coder for the payer.  The coder can review the evidence and update the DetectedIssue appropriately.  This might include accepting he evidence to close or update the gap, adding their own new Condition Category Detected Issues, or returning to the provider for more information.  Each time changes are made, the Risk Adjustment Coder runs the [$cc-remediate] to update the report.  The report can then be sent back to the provider or on to the payer once the remediation cycle has completed.

When the Payer recieves the updated report, they can run the [$cc-resolve] to finalize the report with the changes made in the [Risk Adjustment Coding Gap Clinical Evaluation DetectedIssue].  The evidence in this report can also be posted on the Payers server (or non-FHIR software) so that the next time, the [$cc-gaps] is run, the report considers the evidence from this resolved report.


{% include img-portrait.html img="risk-adjustment-workflow.png" caption = "Figure 2.1-1 The diagram below shows the entire Risk Adjustment Coding Gap workflow.  This includes the report generation, remediation steps by both the provider and risk adjustment coder and finally the gap resolution by the payer.  Each of these steps are detailed on separate tabs below this tab" %}


</div><!-- new-content -->

{% include link-list.md %}
