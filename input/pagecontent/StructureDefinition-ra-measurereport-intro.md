{% assign id = {{include.id}} %}

<div class="new-content" markdown="1">
New Extensions: Annotation and ConfidenceScale
</div>

### Mandatory Data Elements and Terminology

<div class="bg-success" markdown="1"><!-- new content -->
The following data-elements must always be present (Mandatory) or must be supported [(Must Support)](general-guidance.html#must-support). The [Formal Views](StructureDefinition-ra-measurereport.html#profile) below provides the formal summary, definitions, and terminology requirements.
</div>

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `MeasureReport.status` element
1. A `MeasureReport.type` element hard coded to "individual"
1. A `MeasureReport.measure` element references a [Risk Adjustment Model Measure]
1. A `MeasureReport.subject` element references a [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html) profile
1. A `MeasureReport.period` element for the clinical evaluation period for which the risk adjustment coding gap report was generated.

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**

1. Zero to many `MeasureReport.group` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.code` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.suspectType` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.evidenceStatus` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.evidenceStatusDate` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.hierarchicalStatus` element
1. Each `MeasureReport.group` *should* have zero to many `MeasureReport.evalautedResource` element

<div class="bg-success" markdown="1"><!-- new content -->

**Each {{site.data.structuredefinitions.[id].type}} *may* have ([Must Support]):**
1. Each `MeasureReport.group` *may* have zero to one `MeasureReport.group.confidenceScale` element
1. Each `MeasureReport.group` *may* have zero to many `MeasureReport.group.annotation` element
</div>

**Additional Profile specific implementation guidance:**
1. `evaluatedResource` SHALL reference resources using USCore profiles where applicable

The Clinical Data Collection Deadline element, `clinicalDataCollectionDeadline`, was added as an extension to MeasureReport. We are seeking comment from implementers if they intend to use this element when communicating risk adjustment coding gap reports from payers to providers.
{:.stu-note}

{% include link-list.md %}
