
<div class="bg-info" markdown="1">
**This page is under development.**

</div>

### Introduction

Just as the payer is responsible for generating HCC gaps, so too are they responsible for resolving them. In this phase the payer ingests the gap closure and gap invalidation data supplied by the provider and reviewed by the certified HCC coder, and formally updates the gap status. It is recommended that the payer record the date when the gap status change occurs so that providers may receive credit for their performance (e.g., if the payer incentivizes providers for early closure of HCC gaps prior to the Medicare Advantage September sweeps.)
At this time the payer will perform any necessary backend processes before closing the loop with the generation of a new HCC gap list, and the cycle begins anew. While these payer backend processes are largely outside the scope of the Risk Adjustment IG, there are times when they can impact gap data. One of these is the process of submitting risk adjustment data to government agencies (e.g., EDPS in the case of MA risk adjustment; the Edge Server in the case of ACA risk adjustment.) It is possible that an HCC gap closure may not be confirmed by these agencies during the submission process, either because the HCC is rejected or because of a submission error. Either way, a situation may arise whereby the HCC gap is closed from the payer’s perspective, but the data has not been accepted from the government’s perspective. This can place the payer in a quandary, since the Risk Adjustment IG recommends that the payer close the loop by sending the provider confirmation that their gap closure or invalidation request has been processed. If the payer provides this confirmation, then the government agency subsequently rejects the encounter data submission, the payer might need to reopen the HCC gap – and this can lead to provider abrasion. It is up to the payer to decide how to handle this situation, but the Risk Adjustment IG has provided an additional evidenceStatus value of pending to indicate to the provider that the payer has received their gap closure request, and is in the process of confirming that closure with the government agency. The payer will subsequently change the evidenceStatus to open-gap or closed-gap depending on the resolution of that submission.

{% include img-portrait.html img="three-stages-resolution.png" caption = "Figure 2-: " %}

As shown in the figure above, after the provider and risk adjustment coder complete the process of reviewing the gap closure and invalidaiton through the remediation step described in this implementation guide, the risk adjustment coder sends the gap closure and invalidation information along with the supporting evidence (referred to as clinical evaluation evidence) identified during the medical record review back to the payer. The payer then performs the step of resolving coding gaps. This section details the workflow, operation and profiles involved. 

### Actors

Upon completion of the remediation step, the risk adjustment coder sends the resulting [Risk Adjustment Coding Gap Bundle] back to the payer. The payer reviews the bundle received and calls the [$ra.resolve-coding-gaps] operation to resolve the gap closure and invalidaiton based on the clinical evaluation evidence.  

{% include img-portrait.html img="resolve-coding-gaps-actors.png" caption = "Figure 2-: $ra.resolve-coding-gaps Operation Actors" %}

### $ra.resolve-coding-gaps Operation

The [$ra.resolve-coding-gaps] operation occurs on the payer side. It requires three input (IN) parameters: `subject`, `periodStart`, and `periodEnd`. The `subject` parameter references either a single patient or a group of patients (as specified in the [Patient Group] profile). The term clinical evaluation period refers to the time period during which the risk adjusting encounters could be conducted and documented with expectations of submissions for risk adjustment purposes. The `periodStart` and `periodEnd` parameters are the start and end dates of the clinical evaluation period.

If the `subject` is valid, the dates provided in `periodStart` and `periodEnd` will then be evaluated for any overlaps against the clinical evaluation period (`MeasureReport.period.start` and `MeasureReport.period.end`) of the [Risk Adjustment Coding Gap MeasureReport] contained in the [Risk Adjustment Coding Gap Bundle] for the patient. 

The [$ra.resolve-coding-gaps] performs a series of actions:

- copies the existing [Risk Adjustment Coding Gap Composition] contained in the [Risk Adjustment Coding Gap Bundle] received from the risk adjustment coder;
- updates the copied Composition.status from `preliminary` to `final`;
- creates a *new* [Risk Adjustment Coding Gap Bundle] and adds the copied [Risk Adjustment Coding Gap Composition] to the new Bundle;
- updates the [Risk Adjustment Coding Gap MeasureReport] referenced by the Composition:
  - for each Condition Category code contained in the MeasureReport (`MeasureReport.group.code`)
    - select the most recent of all DetectedIssue entries in the [Risk Adjustment Coding Gap Composition] using the `DetectedIssue.meta.lastUpdated` field
    - update the corresponding Condition Category code contained in the MeasureReport (`MeasureReport.group.code`) to the selected value;
- copies all the existing DetectedIssue and supporting evidence resources from the [Risk Adjustment Coding Gap Bundle] received from the risk adjustment coder to the *new* [Risk Adjustment Coding Gap Bundle].  This includes resources for Original DetectedIssue, the original evidence, the Clinical Evaluation DetectedIssue, and the clinical evaluation evidence;  
- returns the *new* [Risk Adjustment Coding Gap Bundle].

```cql
Risk Adjustment Coding Gap Bundle   <-- note: Bundle received from the risk adjustment coder -->
        {"identifier": "ra-bundle-from-coder"}
        ...
    Risk Adjustment Coding Gap Composition 
        ...
        {"identifier": "ra-composition-patient-1"}
        {"status": "preliminary"}
```

```cql
Risk Adjustment Coding Gap Bundle   <-- note: Bundle produced by the $ra.resolve-cdoing-gaps operation -->
        {"identifier": "ra-bundle-after-resolve"}  <!-- note: this is a new Bundle indicated by a new identifier>
        ...
    Risk Adjustment Coding Gap Composition 
        ...
        {"identifier": "ra-composition-patient-1"}  <!-- note: this is the same Composition as shown in the Bundle above>
        {"status": "final"}  <!-- note: the status of the Composition was updated from preliminary to final by $ra.resolve-coding-gaps>
```


### Workflow

{% include img-portrait.html img="resolve-workflow.png" caption = "Figure 2-: " %}


### Illustrate the $ra.resolve-coding-gaps Operation through examples

An example coding scenario is used below to help better illustrate the functionalities of the $ra.resolve-coding-gaps operation and put it in context.

```cql
- HCC 22: morbid obesity
- HCC 88: Coronary Artery Disease (CAD) with angina
- RxHCC 188: Coronary Artery Disease
```

{% include img-portrait.html img="resolve-in-example.jpg" caption = "" %}


{% include link-list.md %}
