
{% assign id = {{page.id}} %}
<div class="bg-info" markdown="1">

This profile builds on [Bundle](https://www.hl7.org/fhir/bundle.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Bundle.type` with a fixed code "document"
1. A `Bundle.meta.lastUpdated` 
1. A `Bundle.identifier` 
1. A `Bundle` contains one to many `Bundle.entry`
1. A `Bundle` contains one `Bundle.entry` that contains a [Risk Adjustment Coding Gap Composition](StructureDefinition-ra-coding-gap-composition.html) resource

**Each {{site.data.structuredefinitions.[id].type}} *should* have:**

1. A `Bundle` contains zero to many `Bundle.entry` which contains a [Risk Adjustment Coding Gap MeasureReport](StructureDefinition-ra-measurereport.html) resource
</div>

{% include link-list.md %}
