
{% assign id = {{page.id}} %}

<div class="bg-info" markdown="1">

The $davinci-ra.remediate operation allows Provider or Certified Coder to update the Risk Adjustment Coding Gap Bundle received from Payer through their clinical evaluation review. 

<b>Conformance Requirement 1:</b>

- In addition to the requried parameters, the $davinci-ra.remediate operation <b>SHALL</b> include either measureId, measureIdentifier, or measureUrl input parameter. 


If subject is a patient and the patient is not found on the Server, or if subject is a Group and the group is not found on the Server, then the $ra-remediate returns a `Parameters.parameter` with an [OperationOutcome](https://www.hl7.org/fhir/operationOutcome.html).
If subject is a Group, the group is valid but one or more patients within the Group can not be found on the Server, then the $ra-remediate returns a separate `Parameters.parameter` with an OperationOutcome for each of the invalid patients.
For example, if a Group has 10 patients and two of the patients cannot be found on the Server, then the $report returns a Parameters resource containing 10 `parameter` elements (two `parameter` elements containing OperationOutcome for the two invalid patients and eight `parameter` elements containing [Risk Adjustment Coding Gap Report Bundle](StructureDefinition-ra-measurereport-bundle.html) for the eight valid patients).
</div>
{% include link-list.md %}
