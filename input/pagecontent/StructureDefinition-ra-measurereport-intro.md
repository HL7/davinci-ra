{% assign id = {{include.id}} %}

(The Da Vinci Risk Adjustment Implementation Guide is under development)

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `MeasureReport.status` element
1. A `MeasureReport.type` element hard coded to "individual"
1. A `MeasureReport.period` element for the clinical evaluation period for which the risk adjustment coding gap report was generated.

Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):



### Examples

{% include link-list.md %}
