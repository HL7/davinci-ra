
{% assign id = {{page.id}} %}

<div class="note-to-balloters" markdown="1">
The $report operation specified in STU1 is renamed to $ra.coding-gaps in this ballot. The return of this operation is changed from Risk Adjustment Coding Gap Report Bundle to [Risk Adjustment Coding Gap Bundle].
</div>

Note: all Conformance Requirements are restricted to resources in the system that are being reported on.

<b>Conformance Requirement 1:</b>

The <span class="bg-success" markdown="1">$ra.coding-gaps</span><!-- new-content --> operation <b>SHALL</b> be able to query:
  - All [Risk Adjustment Coding Gap MeasureReport] resources; <b>AND</b>
  - All resources referenced by the `evaluatedResource` element of all [Risk Adjustment Coding Gap MeasureReport] resources.  

<b>Conformance Requirement 2:</b>  

The $report operation <b>SHALL</b> be able to resolve:
- Whether the `subject` being processed is a valid patient when `subject` is a Patient/[reference]; <b>AND</b>
- Whether any patient in the `subject` being processed is valid when `subject` is a Group/[reference].

<b>Conformance Requirement 3:</b>  

The <span class="bg-success" markdown="1">$ra.coding-gaps</span><!-- new-content --> operation <b>SHALL</b> include the following <span class="bg-success" markdown="1">as output</span><!-- new-content -->:
- If the `subject` being processed is a Patient/[reference] and the patient is not valid, then the `Parameters.parameter` element SHALL include an [OperationOutcome](https://www.hl7.org/fhir/operationOutcome.html) resource that includes the `subject` (Patient/[reference]) being processed; <b>OR</b>
- If the `subject` being processed is a Group/[reference] and the group itself is not valid or none of the patients in the group is valid, then the `Parameters.parameter` element SHALL include an [OperationOutcome](https://www.hl7.org/fhir/operationOutcome.html) resource that includes the `subject` (Group/[reference]) being processed; <b>OR</b>
- If the patient is valid and no MeasureReport resources match the set of input (IN) parameters being processed, then the `Bundle.entry` SHALL include a [US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html) resource matching the subject (Patient/[reference]) (note: an OperationOutcome will NOT be returned because <span class="bg-success" markdown="1">$ra.coding-gaps</span><!-- new-content --> is to return existing MeasureReports and none exist in this scenario); <b>OR</b>
- If the patient is valid and one or more MeasureReport resources match the set of input (IN) parameters being processed, then the `Bundle.entry` SHALL include all matching MeasureReport resources and all resources referenced by the `evalautedResource` element of all matching MeasureReport resources.

{% include link-list.md %}