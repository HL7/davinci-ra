
{% assign id = {{page.id}} %}
<div class="bg-info" markdown="1">
This profile builds on [DetectedIssue](https://www.hl7.org/fhir/detectedissue.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A Modifier Extension `codingGapType` and its `value` is a fixed code `payer-generated`
1. A `DetectedIssue.code` with a fixed code `CODINGGAP`
1. A `DetectedIssue.patient` references a [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html)
1. A `DetectedIssue.implicated` that references a [Risk Adjustment Coding Gap MeasureReport]
1. Contains one to many `DetectedIssue.evidence` which are original evidence for a coding gap
</div>


{% include link-list.md %}