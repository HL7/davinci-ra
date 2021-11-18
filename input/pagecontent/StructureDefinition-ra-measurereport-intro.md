{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `MeasureReport.status` element
1. A `MeasureReport.type` element hard coded to "individual"
1. A `MeasureReport.measure` element references a Risk Adjustment model measure
1. A `MeasureReport.subject` element references a [USCore Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html) profile
1. A `MeasureReport.period` element for the clinical evaluation period for which the risk adjustment coding gap report was generated.

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**

1. Zero to many `MeasureReport.group` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.code` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-suspectType` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-evidenceStatus` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-evidenceStatusDate` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-hierarchicalStatus` element
1. Each `MeasureReport.group` *should* have zero to many `MeasureReport.evalautedResource` element

**Additional Profile specific implementation guidance:**
1. `evaluatedResource` SHALL reference resources using USCore profiles where applicable
1. All resources referenced by `evaluatedResource` SHALL be returned in the bundle by [$report](OperationDefinition-report.html) operation

*The element Clinical Data Collection Deadline was added as an extension to MeasureReport, "ra-clinicalDataCollectionDeadline" We are asking for comment from implementers if they intend to use this element when generating Risk Adjustments Gap Reports
{:.stu-note}

{% include link-list.md %}
