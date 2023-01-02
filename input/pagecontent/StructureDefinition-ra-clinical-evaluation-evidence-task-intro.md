{% assign id = {{include.id}} %}

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Task.status` element
1. A `Task.intent` element
1. A `Task.focus` element that references a [Risk Adjustment Coding Gap MeasureReport]
1. A `Task.authoredOn` element
1. A `Task.reasonCode` element

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**

1. A `Task.statusReason` element
1. A `Task.lastModified` element

**Additional Profile specific implementation guidance:**
1. 


{% include link-list.md %}
