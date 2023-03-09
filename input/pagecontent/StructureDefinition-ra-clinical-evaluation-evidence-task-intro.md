{% assign id = {{include.id}} %}

<div class="bg-success" markdown="1">

### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present).

**Each {{site.data.structuredefinitions.[id].type}} must have:**

1. A `Task.status` element with a code from the [Coding Gap Task Status ValueSet](ValueSet-coding-gap-task-status.html)
1. A `Task.intent` element with a fixed code 
1. A `Task.focus` element that references a [Risk Adjustment Coding Gap Report]
1. A `Task.authoredOn` element
1. A `Task.reasonCode` element with a code from the [Coding Gap Task Reason ValueSet](ValueSet-coding-gap-task-reason.html)
1. A `Task.input` element with value of `MeasureReport.group.id` from the [Risk Adjustment Coding Gap Report] referenced by `Task.focus` if `reasonCode` other than creation
1. A `Task.input` element references [Risk Adjustment SearchSet Bundle]

**Each {{site.data.structuredefinitions.[id].type}} *should* have ([Must Support]):**

1. A `Task.contained` references [Risk Adjustment SearchSet Bundle]
1. A `Task.lastModified`


**Additional Profile specific implementation guidance:**
1. See the [Task State Machine](StructureDefinition-ra-clinical-evaluation-evidence-task.html#task-state-machine) for risk adjustment remediation

</div><!-- new-content -->

{% include link-list.md %}
