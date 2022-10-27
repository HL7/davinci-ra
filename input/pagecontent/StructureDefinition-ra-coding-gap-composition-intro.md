
{% assign id = {{page.id}} %}
<div class="bg-info" markdown="1">
This profile builds on [Composition](https://www.hl7.org/fhir/composition.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Composition.meta.lastUpated`
1. A `Composition.identifier`
1. A `Composition.status`
1. A `Composition.type` with a fixed LOINC code (pending new LOINC code. LOINC submission ID:6482)
1. A `Composition` contains a `subject` that is a [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html)
1. A `Composition` contains one to many `Composition.section:ra_original_detected_issue_section` 
1. A `Composition` contains one to many `Composition.section:ra_clinical_evaluation_detected_issue_section` 
1. A `Composition.section:ra_original_detected_issue_section`, if present, 
    1. contains one `Composition.section.code` that is a Condition Category code
    1. contains one `Composition.section.focus` which references [Risk Adjustment Coding Gap Report] profile
    1. contains one `Composition.section.entry` which references [Risk Adjustment Coding Gap Original DetectedIssue] profile
1. A `Composition.section:ra_clinical_evaluation_detected_issue_section`, if present,
    1. contains one `Composition.section.code` that is a Condition Category code
    1. contains one `Composition.section.focus` which references [Risk Adjustment Coding Gap Report] profile
    1. contains one `Composition.section.entry` which references [Risk Adjustment Coding Gap Clinical Evaluation DetectedIssue] profile

</div>


{% include link-list.md %}
