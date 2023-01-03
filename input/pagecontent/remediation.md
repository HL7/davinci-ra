
<div class="bg-info" markdown="1">
**This page is under development.**
</div>

<div class="bg-success" markdown="1">

### Introduction and Background

Once the [Risk Adjustment Coding Gap MeasureReport] has been constructed it is sent to the intended recipient and filtered to ensure that only germane HCC gaps are made available to providers. The provider (or a software program acting on behalf of the provider) determines whether the gap is currently valid, and whether the requested encounter data evidence exists to close the gap. Three courses of action are available to the provider (or a software program acting on behalf of the provider):
1.	They can request the gap be closed by submitting a claim or other valid form of encounter data.
2.	They can request the gap be invalidated (e.g., the patient never had the condition described by the gap; the patient formerly had the condition, but it is no longer active; the gap inaccurately describes the patient’s condition, such as when the HCC gap is for suspected heart disease when in reality the patient has heart failure.) Gap invalidation requests require the provider to submit valid encounter data to the payer for verification purposes.
3.	The provider may take no action, and simply wait to see what develops (e.g., monitoring the patient for late effects of acute conditions such as heart attack or stroke.)
If the provider requests an HCC gap closure or invalidation, the FHIR gap data is passed to a Risk Adjustment Coder (e.g., Certified Risk Adjustment Coder (CRC)) for review. The Risk Adjustment Coder role may reside within the payer, or the payer may contract with a third party to perform this role; either way, the Risk Adjustment Coder must review the submission to determine whether the ICD-10-CM guidelines have been met for this gap. It may be that the submission is incomplete in some respect, such as lack of a valid provider signature or attestation or clinical data that does not meet the coding guidelines. In this event, the Risk Adjustment Coder may return a query to the provider requesting that the missing data be supplied, and the provider is given the opportunity to make the requested correction.
The Risk Adjustment Coder also has another responsibility, to document any missing risk adjustable conditions that are found in the encounter data supplied by the provider. For example, the Risk Adjustment Coder may discover evidence of RxHCCs in the medical record, and these should also be documented even if these conditions were unsuspected by the payer and no corresponding RxHCC gap exists. In that event the Risk Adjustment Coder may request that the payer create a net-new HCC gap to document the submitted encounter data evidence.
Assuming that the data is valid and complete, the HCC gap data now passes back to the payer for final processing.

Just as the payer is responsible for generating HCC gaps, so too are they responsible for resolving them. The payer ingests the gap closure and gap invalidation data supplied by the provider and reviewed by the Risk Adjustment Coder, and formally updates the gap status. It is recommended that the payer record the date when the gap status change occurs so that providers may receive credit for their performance (e.g., if the payer incentivizes providers for early closure of HCC gaps prior to the Medicare Advantage September sweeps.) At this time the payer will perform any necessary backend processes before closing the loop with the generation of a new HCC gap list, and the cycle begins anew. While these payer backend processes are largely outside the scope of this implementation guide (IG), there are times when they can impact gap data. One of these is the process of submitting risk adjustment data to government agencies (e.g., EDPS in the case of MA risk adjustment; the Edge Server in the case of ACA risk adjustment.) It is possible that an HCC gap closure may not be confirmed by these agencies during the submission process, either because the HCC is rejected or because of a submission error. Either way, a situation may arise whereby the HCC gap is closed from the payer’s perspective, but the data has not been accepted from the government’s perspective. This can place the payer in a quandary, since the Risk Adjustment IG recommends that the payer close the loop by sending the provider confirmation that their gap closure or invalidation request has been processed. If the payer provides this confirmation, then the government agency subsequently rejects the encounter data submission, the payer might need to reopen the HCC gap – and this can lead to provider abrasion. It is up to the payer to decide how to handle this situation, but the Risk Adjustment IG has provided an additional evidenceStatus value of pending to indicate to the provider that the payer has received their gap closure request, and is in the process of confirming that closure with the government agency. The payer will subsequently change the evidenceStatus to open-gap or closed-gap depending on the resolution of that submission.

### Actors

The actors involved in the remediation phase are Provider, Risk Adjustment Coder, and Payer. 
- **Provider** (or a software program acting on behalf of the provider) reviews the [Risk Adjustment Coding Gap MeasureReport] generated by the Payer and creates a Task request gap closure and/or invalidation when applicable.  
- **Risk Adjustment Coder** reviews the Provider proposed changes requested in the Task and updates the Task with appropriate actions based on the medical record review. 
- **Payer** reviews the Task sent from the Risk Adjustment Coder and formally updates in the Payer's database.

### Using Task
Figure 2.4-1 and Figure 2.4-2 provide an overview of how the Task resource, [Risk Adjustment Clinical Evaluation Evidence Task], is used to support the remediation process. The [Task State Machine](StructureDefinition-ra-clinical-evaluation-evidence-task.html#task-state-machine) includes a diagram for the state machine used by this profile. 

After the [Report Query] step, the Provider reviews the coding gaps and determines whether updates (close/invalidate gap or add net-new) are needed after the review. 
- If no changes are needed, the process stops, no action is taken. 
- If changes are needed, the Provider creates a new [Risk Adjustment Clinical Evaluation Evidence Task]. Each instance of the Task resource corresponds to each coding gap change request, including net-new. For example, if a patient has five HCCs, after the review, the Provider determines that two of the five HCCs need to be updated and a net-new also need to be added, the Provider will need to create three seperate Task resources for the requests in this scenario. When create the Task:
    - Set the `Task.status` to `requested`
    - Set the `Task.focus` to reference the [Risk Adjustment Coding Gap MeasureReport] resource that contains the Condition Category code (a.k.a, HCC) that this Task request is for
    - Set the `Task.reasonCode` using an appropriate code, such as closure-request or invalidation-request-never-had-condition, from the [Coding Gap Request ValueSet](ValueSet-coding-gap-request.html). Use the code creation-request for net-new.    
    - The Task resource must include one to many `Task.input` and one of the `input` must be the value of `MeasureReport.group.id`, for example, the group.id in the MeasureReport for HCC 189. Because `MeasureReport.group.id` uniquely identifies a Condition Category code that is included in a MeasureReport, this is how to indicate in Task which coding gap (a.k.a, HCC) this Task is created for. 
    - This Task profile also supports clinical evaluation evidence be provided to support the request. For example, the Provider can supply the Encounter and the Condition resources that are used to support a gap-closure request also as input. In this case, this Task will have two additional `Task.input`, one references the Encounter resource, and the other references the Condition resource. 
    - Resources provided as the clinical evaluation evidence are included in the Task as contained resources. 

Provider posts (POST) the Task resource (in a requsted status) to the Payer or a 3rd Party server for review by the Risk Adjustment Coder. The Risk Adjustment Coder reviews the Task request and the supplied clinical evaluation evidence and conducts medical record review. The Risk Adjustment Coder has option to either reject or accept a Task request.
- In a reject scenario, for example, if evidence is missing, the Risk Adjustment Coder updates the Task with the following changes. The process then stops and no further action is taken. 
    - changes the `Task.status` from `requsted` to `rejected`
    - provides narrative reason for rejection in `statusReason.text`
    - updates the `Task.lastModified` timestamp
- In an accept scenario when the Risk Adjustment Coder agrees and accepts the change request after the medical record review, they will update the Task status from `requested` to `accepted` and the `lastModified`. The Risk Adjustment Coder POST the updated Task to the Payer server. 

Since Payer is responsible for resolving requests and formally updating the records in their database. The Payer reviews the updated Task from the Risk Adjustment Coder. 
- If the Payer approves the changes, the Payer updates the Task by changing the `Task.status` from `accepted` to `completed` and update the `lastModified` timestamp. The Payer then formally updates the records in their database. So when the lifecycle renews and report generation begins again, the Risk Adjustment Coding Gap MeasureReports will reflect the remediation results with the latest changes.  
- Payer also has the option of not approving the change. In this case, the `Task.status`is udpated back from `accepted` to `rejected` with reason for rejection provided in `statusReson.text`. The process stops and no further action is taken. 

Note that since these Task resources could be stored in the same server, either the Provider, the Risk Adjustment Coder, or the Payer would be able to access them and review details and updates made throughout the workflow.

{% include img-portrait.html img="remediation1.png" caption="Figure 2.4-1: Using Task to Support Remediation"%}

{% include img-portrait.html img="remediation2.png" caption="Figure 2.4-2: Using Task to Support Remediation (continuation of Figure 2.4-1)"%}

</div><!-- new-content -->


{% include link-list.md %}


