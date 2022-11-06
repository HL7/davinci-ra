
<div class="bg-info" markdown="1">
**This page is under development.**

</div>

### Introduction

After the provider and risk adjustment coder complete the process of reviewing the gap closure and invalidaiton through the remediation step described in this implementation guide, the risk adjustment coder sends the gap closure and invalidation information along with the supporting evidence (referred to as clinical evaluation evidence) from the medical record review process back to the payer. The payer then performs the step of resolving coding gaps. This section details the workflow, operation and profiles involved. 

### Actors

Upon completion of the remediation step, the risk adjustment coder sends the resulting [Risk Adjustment Coding Gap Bundle] back to the payer. The payer reviews the bundle received and calls the [$ra.resolve-cc-gaps] operation to resolve the gap closure and invalidaiton based on the clinical evaluation evidence.  

{% include img-portrait.html img="resolve-cc-gaps-actors.png" caption = "Figure 2-: $ra.resolve-cc-gaps Operation Actors" %}

### $ra.resolve-cc-gaps Operation

The [$ra.resolve-cc-gaps] operation occurs on the payer side. 

The [$ra.resolve-cc-gaps] operation requires three input (IN) parameters: `subject`, `periodStart`, and `periodEnd`. The `subject` parameter references either a single patient or a group of patients (as specified in the [Patient Group] profile). The term clinical evaluation period refers to the time period during which the risk adjusting encounters could be conducted and documented with expectations of submissions for risk adjustment purposes. The `periodStart` and `periodEnd` parameters are the start and end dates of the clinical evaluation period.

If the `subject` is valid, the dates provided in `periodStart` and `periodEnd` will then be evaluated for any overlaps against the clinical evaluation period (`MeasureReport.period.start` and `MeasureReport.period.end`) of the [Risk Adjustment Coding Gap MeasureReport](s) contained in the [Risk Adjustment Coding Gap Bundle] for the patient. 

The [$ra.resolve-cc-gaps] performs a series of actions:
- extracts the existing [Risk Adjustment Coding Gap Composition] contained in the [Risk Adjustment Coding Gap Bundle] received from the risk adjustment coder
- sets the extracted existing Composition.status from `preliminary` to `final`;
- creates a *new* [Risk Adjustment Coding Gap Bundle] and adds to it the etracted existing [Risk Adjustment Coding Gap Composition];
- updates the [Risk Adjustment Coding Gap MeasureReport] contained int the Composition by sorting through the `DetectedIssue.meta.lastUpdated` field of all Detectedissue entries in the [Risk Adjustment Coding Gap Composition], the Condition Category codes contained in the MeasureReport (`MeasureReport.group.code`) are updated accordingly bassed on the most recent DetectedIssue entry information for those Condition Category codes; 
- adds to the *new* [Risk Adjustment Coding Gap Bundle] all of the DetectedIsssue resources and supporting evidence for the coding gaps included in the MeasureReports. This includes resources for Original DetectedIssue, the original evidence, the Clinical Evaluation DetectedIssue, and the clinical evaluation evidence extracted from the [Risk Adjustment Coding Gap Bundle] received from the risk adjustment code;  
- returns the *new* [Risk Adjustment Coding Gap Bundle].

```cql
Risk Adjustment Coding Gap Bundle   <-- note: Bundle received from the risk adjustment coder -->
        ...
        {"identifier": "ra-bundle-from-coder"}
        ...
    Risk Adjustment Coding Gap Composition 
        ...
        {"identifier": "ra-composition-patient-1"}
        {"status": "preliminary"}
```

```cql
Risk Adjustment Coding Gap Bundle   <-- note: Bundle produced by the $ra.resolve-cc-gaps operation -->
        ...
        {"identifier": "ra-bundle-after-resolve"}  <!-- note: this is a new bundle indicated by a new identifier>
        ...
    Risk Adjustment Coding Gap Composition 
        ...
        {"identifier": "ra-composition-patient-1"}  <!-- note: this is the same Composition as shown in the Bundle above>
        {"status": "final"}  <!-- note: the status of the Composition was updated from preliminary to final by $ra.resolve-cc-gaps>
```


### Workflow

{% include img-portrait.html img="resolve-workflow.png" caption = "Figure 2-: " %}


### Illustrate the $ra.resolve-cc-gaps Operation through examples

An example coding scenario is used below to help better illustrate the functionalities of the $ra.resolve-cc-gaps operation and put it in context.

```cql
- HCC 22: mobid obesity
- HCC 88: Coronary Artery Disease (CAD) with angina
- RxHCC 188: Coronary Artery Disease
```

{% include img-portrait.html img="resolve-in-example.jpg" caption = "" %}


{% include link-list.md %}
