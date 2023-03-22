
<div class="new-content" markdown="1">
All sections on this page are new content.
</div><!-- new-content -->

### Introduction and Background

Once the [Risk Adjustment Coding Gap Report] has been constructed, it is sent to the intended recipient and filtered to ensure that only germane HCC gaps are made available to providers. The Provider (or a software program acting on behalf of the Provider) determines whether the gap is currently valid, and whether the requested encounter data evidence exists to close the gap. Three courses of action are available to the Provider (or a software program acting on behalf of the Provider):
1.	They can request the gap be closed by submitting a claim or other valid form of encounter data.
2.	They can request the gap be invalidated (e.g., the patient never had the condition described by the gap; the patient formerly had the condition, but it is no longer active; the gap inaccurately describes the patient’s condition, such as when the HCC gap is for suspected heart disease when in reality the patient has heart failure.) Gap invalidation requests require the Provider to submit valid encounter data to the Payer for verification purposes.
3.	The Provider may take no action, and simply wait to see what develops (e.g., monitoring the patient for late effects of acute conditions such as heart attack or stroke.)
If the Provider requests an HCC gap closure or invalidation, the FHIR gap data is passed to a Risk Adjustment Coder (e.g., Certified Risk Adjustment Coder (CRC)) for review. The Risk Adjustment Coder role may reside within the Payer, or the Payer may contract with a third party to perform this role; either way, the Risk Adjustment Coder must review the submission to determine whether the ICD-10-CM guidelines have been met for this gap. It may be that the submission is incomplete in some respect, such as lack of a valid provider signature or attestation or clinical data that does not meet the coding guidelines. In this event, the Risk Adjustment Coder may return a query to the Provider requesting that the missing data be supplied, and the Provider is given the opportunity to make the requested correction.
The Risk Adjustment Coder also has another responsibility, to document any missing risk adjustable conditions that are found in the encounter data supplied by the Provider. For example, the Risk Adjustment Coder may discover evidence of RxHCCs in the medical record, and these should also be documented even if these conditions were unsuspected by the Payer and no corresponding RxHCC gap exists. In that event the Risk Adjustment Coder may request that the Payer create a net-new HCC gap to document the submitted encounter data evidence.
Assuming that the data is valid and complete, the HCC gap data now passes back to the Payer for final processing.

Just as the Payer is responsible for generating HCC gaps, so too are they responsible for resolving them. The Payer ingests the gap closure and gap invalidation data supplied by the Provider and reviewed by the Risk Adjustment Coder, and formally updates the gap status. It is recommended that the Payer record the date when the gap status change occurs so that providers may receive credit for their performance (e.g., if the Payer incentivizes providers for early closure of HCC gaps prior to the Medicare Advantage September sweeps.) At this time the Payer will perform any necessary backend processes before closing the loop with the generation of a new HCC gap list, and the cycle begins anew. While these payer backend processes are largely outside the scope of this implementation guide (IG), there are times when they can impact gap data. One of these is the process of submitting risk adjustment data to government agencies (e.g., Encounter Data Processing System (EDPS) in the case of MA risk adjustment; the Edge Server in the case of ACA risk adjustment.) It is possible that an HCC gap closure may not be confirmed by these agencies during the submission process, either because the HCC is rejected or because of a submission error. Either way, a situation may arise whereby the HCC gap is closed from the Payer’s perspective, but the data has not been accepted from the government’s perspective. This can place the Payer in a quandary, since the Risk Adjustment IG recommends that the Payer close the loop by sending the Provider confirmation that their gap closure or invalidation request has been processed. If the Payer provides this confirmation, then the government agency subsequently rejects the encounter data submission, the Payer might need to reopen the HCC gap – and this can lead to provider abrasion. It is up to the Payer to decide how to handle this situation, but the Risk Adjustment IG has provided an additional evidenceStatus value of pending to indicate to the Provider that the Payer has received their gap closure request, and is in the process of confirming that closure with the government agency. The Payer will subsequently change the evidenceStatus to open-gap or closed-gap depending on the resolution of that submission.

### Actors

The Actors involved in the remediation phase are Provider, Risk Adjustment Coder, and Payer. 
- Provider (or a software program acting on behalf of the Provider) acts as Client reviews the [Risk Adjustment Coding Gap Report] generated by the Payer and creates a Task to submit clinical evaluation evidence for gap closure and/or invalidation when applicable.  
- Payer/Risk Adjustment Coder acts as Server that receives and processes the [Risk Adjustment Clinical Evaluation Evidence Task] provided by the Provider.  
- Risk Adjustment Coder acts as Remediation Client creates Risk Adjustment Clinical Evaluation Evidence Task for net-new Condition Category (CC). 

{% include img-portrait.html img="three-stages-remediation.png" caption="Figure 2.4-1: Report Remediation Overview"%}

### Using Task
Figure 2.4-1 provides an overview of how the Task resource, [Risk Adjustment Clinical Evaluation Evidence Task], is used to support the remediation process. The [Task State Machine](StructureDefinition-ra-clinical-evaluation-evidence-task.html#task-state-machine) includes a diagram for the state machine used by this profile. 

After the [Report Query] step, the Provider reviews the coding gaps and determines whether they need to initiate the gap closure/invalidation process based on the clinical evaluation evidence after the review. 
- If no changes are needed, the process stops, no action is taken. 
- If clinical evaluation evidence reveals that changes are needed, for each coding gap that needing a change request, the Provider creates a [Risk Adjustment Clinical Evaluation Evidence Task] with proposed changes along with supporting clinical evaluation evidence. For example, if a patient has five HCCs, after the review, the Provider determines that two of the five HCCs need to be updated based on the clinical evaluation evidence, the Provider will need to create two separate Task resources in this scenario. The list below highlights the steps when creating a Risk Adjustment Clinical Evaluation Evidence Task:
    - Set the `Task.status` to `requested`
    - Set the `Task.focus` to reference the [Risk Adjustment Coding Gap Report] resource that contains the Condition Category code (a.k.a, HCC) that this Task is for
    - Set the `Task.reasonCode` using an appropriate code, such as closure-request or invalidation-request-never-had-condition, from the [Coding Gap Task Reason ValueSet](ValueSet-coding-gap-task-reason.html). Use the code creation-request for net-new. This is the reason for providing clinical evaluation evidence.      
    - Set a `Task.input` with `MeasureReport.group.id` as value
        - If the `Task.reasonCode` is other than `creation`, then a Task must have an `input` with `MeasureReport.group.id` as value. For example, the `input.value` is the `group.id` for HCC189 from the MeasureReport. `MeasureReport.group.id` uniquely identifies a Condition Category code that is included in a MeasureReport, this is how to indicate in Task which coding gap (a.k.a, HCC) the Task is for. 
    - Set another `Task.input` to reference a [Risk Adjustment SearchSet Bundle]
        - To provide clinical evaluation evidence, this is done by having a `Task.input` references a searchSet Bundle, the [Risk Adjustment SearchSet Bundle], which is a contained resource of this Task. 
    - `Task.contained` contains the searchSet Bundle resource
        - Note that the searchSet Bundle resource itself is contained using `Task.contained`. The searchSet Bundle includes entries for resources of clinical evaluation evidence and the absolute url of these resources which are provided in `Bundle.entry.fullUrl`. For example, if the Provider provides an Encounter and a Condition resources as clinical evaluation evidence, the Task will have a `Task.input` references a searchSet Bundle with two entries, one entry with the Encounter resource with its fullUrl and the other entry with the Condition resource with its fullUrl.  

Provider posts (POST) the Task resource (in a `requsted` status) to the Payer or a 3rd Party Server for review by the Risk Adjustment Coder. The Risk Adjustment Coder reviews the Task and the contained clinical evaluation evidence and conducts medical record review. 

The Risk Adjustment Coder has option to either reject or complete a Task.
- In a rejected scenario, for example, if evidence is missing, the Risk Adjustment Coder updates the Task with the following changes. The process then stops and no further action is taken (no patient records will be updated on the Payer system). 
    - Changes the `Task.status` from `requsted` to `rejected`
    - Provides narrative reason for rejection in `statusReason.text`
    - Updates the `Task.lastModified` timestamp
- The completed scenario is when the Risk Adjustment Coder approves the new evidence submitted after medical record review, formally updates the patient records in the Payer's database, and then completes the Task. The Task status is updated from `requested` to `completed` and the `lastModified` is also updated. 

The risk adjustment lifecycle renews. The risk adjustment engine runs against the patient records with the updated information. The generated Risk Adjustment Coding Gap MeasureReports would then reflect more accurate and up-to-date coding gap information. Note that Provider sending a Task for change request, for example a closure request, would not guarantee a gap closure on the Payer end. 

These Task resources should be stored, so the Provider, the Risk Adjustment Coder, or the Payer can access them and be able to review Tasks details and their updates history made throughout the lifecyle.

{% include img-portrait.html img="remediation.png" caption="Figure 2.4-2: Using Task to Support Remediation"%}


{% include link-list.md %}


