
{% assign id = {{page.id}} %}

<div markdown="1" class="bg-info">
<b>The Da Vinci Risk Adjustment Implementation Guide is under development</b>
</div>

Note: all Conformance Requirements are restricted to resources in the system that are being reported on.

Conformance Requirement 1:  

The $report operation SHALL be able to query:
  - All Risk Adjustment MeasureReport resources; AND
  - All resources referenced by the evaluatedResource element of all Risk Adjustment MeasureReport resources  

Conformance Requirement 2:  

The $report operation SHALL be able to resolve whether the subject being processed (whether a Patient/[reference] or the member of a Group/[reference]) is valid for any patient  

Conformance Requirement 3:  

The $report operation SHALL include the following OUT Parameters:
  - IF the subject being processed is of type patient (whether a Patient/[reference] or the member of a Group/[reference]) and is not valid for any patient:  
  the Parameters.parameter element SHALL include an OperationOutcome resource that includes the subject (reference) being processed; OR  
  - Otherwise, if the subject being processed is of type group (Group/[reference]) and is not valid for any group:  
  the Parameters.parameter element SHALL include an OperationOutcome resource that includes the subject (reference) being processed; OR
  - Otherwise, if no MeasureReport resources match the set of IN Parameters being processed:  
  the Bundle.entry SHALL include a Patient resource matching the subject of type patient that is being processed (whether a Patient/[reference] or the member of a Group/[reference]); OR
  - Otherwise, one or more MeasureReport resources match the set of IN Parameters being processed:  
  the Bundle.entry SHALL include all matching MeasureReport resources and all resources referenced by the evaluatedResource element of all matching MeasureReport resources
  

{% include link-list.md %}
