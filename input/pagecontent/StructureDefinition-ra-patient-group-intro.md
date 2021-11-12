{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. One or more `member` element(s) and each `member` SHALL reference a [USCore Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html) resource
