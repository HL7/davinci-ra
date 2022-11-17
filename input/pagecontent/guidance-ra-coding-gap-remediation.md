
<div class="bg-info" markdown="1">
**This page is under development.**
</div>

### Introduction

Once the MeasureReport has been constructed it is sent to the intended recipient and filtered to ensure that only germane HCC gaps are made available to providers. The provider (or a software program acting on behalf of the provider) determines whether the gap is currently valid, and whether the requested encounter data evidence exists to close the gap. Three courses of action are available to the provider (or a software program acting on behalf of the provider):
1.	They can request the gap be closed by submitting a claim or other valid form of encounter data.
2.	They can request the gap be invalidated (e.g., the patient never had the condition described by the gap; the patient formerly had the condition, but it is no longer active; the gap inaccurately describes the patient’s condition, such as when the HCC gap is for suspected heart disease when in reality the patient has heart failure.) Gap invalidation requests require the provider to submit valid encounter data to the payer for verification purposes.
3.	The provider may take no action, and simply wait to see what develops (e.g., monitoring the patient for late effects of acute conditions such as heart attack or stroke.)
If the provider requests an HCC gap closure or invalidation, the FHIR gap data is passed to a certified HCC coder for review. The certified coder role may reside within the payer, or the payer may contract with a third party to perform this role; either way, the certified coder must review the submission to determine whether the ICD-10-CM guidelines have been met for this gap. It may be that the submission is incomplete in some respect, such as lack of a valid provider signature or attestation or clinical data that does not meet the coding guidelines. In this event, the certified HCC coder may return a query to the provider requesting that the missing data be supplied, and the provider is given the opportunity to make the requested correction.
The certified HCC coder also has another responsibility, to document any missing risk adjustable conditions that are found in the encounter data supplied by the provider. For example, the certified HCC coder may discover evidence of RxHCCs in the medical record, and these should also be documented even if these conditions were unsuspected by the payer and no corresponding RxHCC gap exists. In that event the certified HCC coder may request that the payer create a net-new HCC gap to document the submitted encounter data evidence.
Assuming that the data is valid and complete, the HCC gap data now passes back to the payer for the final phase of processing.

{% include img-portrait.html img="three-stages-remediation.png" caption = "Figure 2-: " %}


### Actors

During the remediation step, provider and risk adjustment coder review the [Risk Adjustment Coding Gap Bundle] received from the payer. If there are gaps that need to be closed or invalidated, they post the [Clinical Evaluation DetectedIssue] resources with supporting evidence to the server and call [$ra.remediate-coding-gaps] operation.

### $ra.remediate-coding-gaps Operation

The [$ra.resolve-coding-gaps] operation occurs on the provider and risk adjustment coder side. It requires three input (IN) parameters: `subject`, `periodStart`, and `periodEnd`. This operation also requires one of the `measureId`, `measureIdentifier`, `measureUrl` parameters. The `subject` parameter references either a single patient or a group of patients (as specified in the [Patient Group] profile). The term clinical evaluation period refers to the time period during which the risk adjusting encounters could be conducted and documented with expectations of submissions for risk adjustment purposes. The `periodStart` and `periodEnd` parameters are the start and end dates of the clinical evaluation period.

If the `subject` is valid, the dates provided in `periodStart` and `periodEnd` will then be evaluated for any overlaps against the clinical evaluation period (`MeasureReport.period.start` and `MeasureReport.period.end`) of the [Risk Adjustment Coding Gap MeasureReport] contained in the [Risk Adjustment Coding Gap Bundle] for the patient. 

Before calling the [$ra.remediate-coding-gaps] operation, provider and/or risk adjustment coder would create [Clinical Evaluation DetectedIssue] resources for the HCC gaps that they would like to close, invalidate, or add as net-new and POST them to the server.  The `detectedIssue.code` is the HCC code.

The [$ra.remediate-coding-gaps] performs a series of actions:

- copies the existing [Risk Adjustment Coding Gap Composition] contained in the [Risk Adjustment Coding Gap Bundle] received from the provider from the gap generation step;
- creates a *new* [Risk Adjustment Coding Gap Bundle] and adds the copied [Risk Adjustment Coding Gap Composition] to the new Bundle;
- adds [Clinical Evaluation DetectedIssue] with `status` as preliminary to the new Bundle
- adds resources for the clinical evaluation evidence to the new Bundle
- copies all the existing DetectedIssue and supporting evidence resources from the [Risk Adjustment Coding Gap Bundle] received from the risk adjustment coder to the *new* [Risk Adjustment Coding Gap Bundle]. This includes resources for Original DetectedIssue, the original evidence, the Clinical Evaluation DetectedIssue, and the clinical evaluation evidence;  
- returns the *new* [Risk Adjustment Coding Gap Bundle].




