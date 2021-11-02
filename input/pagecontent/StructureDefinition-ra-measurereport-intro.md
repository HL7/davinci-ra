{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `MeasureReport.status` element
1. A `MeasureReport.type` element hard coded to "individual"
1. A `MeasureReport.measure` element references a Risk Adjustment model measure
1. A `MeasureReport.subject` element references a US Core Patient Profile
1. A `MeasureReport.period` element for the clinical evaluation period for which the risk adjustment coding gap report was generated.

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):
1. Zero to many `MeasureReport.group` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.code` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-suspectType` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-evidenceStatus` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-evidenceStatusDate` element
1. Each `MeasureReport.group` *should* have a `MeasureReport.group.ra-hiearchicalStatus` element
1. Each `MeasureReport.group` *should* have zero to many `MeasureReport.evalautedResource` element

### Examples

{% include link-list.md %}
