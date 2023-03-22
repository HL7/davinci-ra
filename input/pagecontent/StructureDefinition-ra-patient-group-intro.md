{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

<div class="bg-success" markdown="1"><!-- new content -->
The following data-elements must always be present (Mandatory) or must be supported [(Must Support)](general-guidance.html#must-support). The [Formal Views](StructureDefinition-ra-patient-group.html#profile) below provides the formal summary, definitions, and terminology requirements.
</div>

**Each {{site.data.structuredefinitions.[id].type}} must have:**


1. A 'Group.type' element
1. An 'Group.actual' element
1. One or more `Group.member` element(s) and each `member` SHALL reference a [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html) resource
