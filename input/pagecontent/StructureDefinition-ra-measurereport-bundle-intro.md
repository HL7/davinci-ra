
{% assign id = {{page.id}} %}

This profile builds on [Bundle](https://www.hl7.org/fhir/bundle.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Bundle.type` with a fixed code "collection"
1. A `Bundle` contains one to many `Bundle.entry`
1. A `Bundle` contains one `Bundle.entry` that is a [US Core Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html)

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support])**:
1. Zero to many `Bundle.entry` that contains a MeasureReport using the [Risk Adjustment Coding Gap Report Profile] for a particular Risk Adjustment Model

All Risk Adjustment Coding Gap Reports in a Risk Adjustment Coding Gap Report Bundle SHALL be for the same patient.

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
