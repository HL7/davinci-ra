
{% assign id = {{page.id}} %}

<div class="new-content" markdown="1">
New Profile: Risk Adjustment SearchSet Bundle
</div><!-- new-content -->

This profile builds on [Bundle](https://www.hl7.org/fhir/bundle.html).

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Bundle.type` with a fixed code "searchset"

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**
1. A `Bundle` contains one to many `Bundle.entry`, and each `entry` SHALL contain exactly one `fullUrl` and exactly one `resource`


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
