{% assign id = {{include.id}} %}

<div class="bg-success" markdown="1">

### Mandatory Data Elements and Terminology

The following data-elements must always be present (Mandatory) or must be supported [(Must Support)](general-guidance.html#must-support). The [Formal Views](StructureDefinition-ra-clinical-evaluation-evidence-task.html#profile) below provides the formal summary, definitions, and terminology requirements.

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Task.status` element with a code from the [Coding Gap Task Status ValueSet](ValueSet-coding-gap-task-status.html)
1. An `Task.intent` element with a fixed code "order"
1. A `Task.focus` element that references a [Risk Adjustment Coding Gap Report]
1. An `Task.authoredOn` element
1. A `Task.reasonCode` element with a code from the [Coding Gap Task Reason ValueSet](ValueSet-coding-gap-task-reason.html)
1. An `Task.input` element, its value being a `MeasureReport.group.id` from the [Risk Adjustment Coding Gap Report] referenced by `Task.focus` if reasonCode other than creation
1. An `Task.input` element, its value references [Risk Adjustment SearchSet Bundle]

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**

1. A `Task.contained` element (that contains the [Risk Adjustment SearchSet Bundle] resource)
1. A `Task.lastModified` element


**Additional Profile specific implementation guidance:**
1. See the [Task State Machine](StructureDefinition-ra-clinical-evaluation-evidence-task.html#task-state-machine) for risk adjustment remediation

</div><!-- new-content -->

{% include link-list.md %}
