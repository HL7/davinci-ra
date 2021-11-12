{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Measure.status` element
1. A `Measure.identifier` element which is the identifier of a Risk Adjustment Model
1. A `Measure.version` element which is the version of the Risk Adjustment Model


**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**

1. A `name` element
1. A `title` element
