
{% assign id = {{page.id}} %}

This profile builds on [Bundle](https://www.hl7.org/fhir/bundle.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Bundle.type` with a fixed code "collection"
1. A `Bundle` contains one to many `Bundle.entry`

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support])**:
1. Zero to many `Bundle.entry` that contains a MeasureReport using the [Risk Adjustment Coding Gap Report Profile] for a Risk Adjustment Model;
1. Zero to one `Bundle.entry` that contains a [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html)

All Risk Adjustment Coding Gap Reports in a bundle must be for the same patient.
If a patient does not have Risk Adjustment Coding Gap Reports, a patient entry is returned to indicate the patient is valid but there are no reports.

<!--
### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present). -->

<!-- **Each {{site.data.structuredefinitions.[id].type}} must have:** -->

<!--1. -->

<!--

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support](guidance.html#must-support)):

1. The beneficiary

-->

<!-- ### Examples-->


{% include link-list.md %}
