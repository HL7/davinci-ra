{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

<div class="bg-success" markdown="1"><!-- new content -->
The following data-elements must always be present (Mandatory) or must be supported [(Must Support)](general-guidance.html#must-support). The [Formal Views](StructureDefinition-ra-model-measure.html#profile) below provides the formal summary, definitions, and terminology requirements.
</div>

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Measure.status` element
1. A `Measure.identifier` element which is the identifier of a Risk Adjustment Model
1. A `Measure.version` element which is the version of the Risk Adjustment Model


**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**

1. A `Measure.name` element
1. A `Measure.title` element
