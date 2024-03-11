
{% assign id = {{page.id}} %}

<div class="note-to-balloters" markdown="1">

**The $ra.evaluate-measure is DRAFT and open for review.**


This operation executes digital condition category (dCC) measures specified in Clinical Quality Language (CQL) against the patient data to produce a [Risk Adjustment Coding Gap Report Bundle]. Patient data, dCC measures, and CQL libraries are pre-populated on FHIR server. 


Conformance Requirement 1:
<br>
- If the operation is invoked at the instance level, the parameters `measureId`, `measureIdentifier`, and `measureUrl` is not allowed
- If the operation is invoked at the type level, one of the `measureId`, `measureIdentifier`, and `measureUrl` parameters is required



{% include link-list.md %}
