
If subject is a patient and the patient is not found on the Server, or if subject is a Group and the group is not found on the Server, then the $report returns a `Parameters.parameter` with an [OperationOutcome](https://www.hl7.org/fhir/operationOutcome.html).
If subject is a Group, the group is valid but one or more patients within the Group can not be found on the Server, then the $report returns a separate `Parameters.parameter` with an OperationOutcome for each of the invalid patients.
For example, if a Group has 10 patients and two of the patients cannot be found on the Server, then the $report returns a Parameters resource containing 10 `parameter` elements (two `parameter` elements containing OperationOutcome for the two invalid patients and eight `parameter` elements containing [Risk Adjustment Coding Gap Report Bundle](StructureDefinition-ra-measurereport-bundle.html) for the eight valid patients).

#### Examples:

Request:

* Request Risk Adjustment Coding Gap Reports over a clinical evaluation period from 2021-01-01 to 2021-09-30 for patient01.

~~~
GET [base]/Measure/$ra.cc-gaps?periodStart=2021-01-01&periodEnd=2021-09-30&subject=Patient/01
~~~

Request:

* Request Risk Adjustment Coding Gap Reports over a clinical evaluation period from 2021-01-01 to 2021-09-30 for group01.


~~~
GET [base]/Measure/$ra.cc-gaps?periodStart=2021-01-01&periodEnd=2021-09-30&subject=Group/01
~~~

 <br />
