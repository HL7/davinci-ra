
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

{% include img-portrait.html img="risk-adjustment-workflow.png" caption = "Figure 2.1-1 The diagram below shows the entire Risk Adjustment Coding Gap workflow.  This includes the report generation, remediation steps by both the provider and risk adjustment coder and finally the gap resolution by the payer.  Each of these steps are detailed on separate tabs below this tab" %}


</div><!-- new-content -->

{% include link-list.md %}
