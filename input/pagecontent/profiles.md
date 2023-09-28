
<div class="new-content" markdown="1">
DRAFT for Review:
- [Risk Adjustment Data Exchange MeasureReport]

New Profiles: 
- [Risk Adjustment Clinical Evaluation Evidence Task]
- [Risk Adjustment SearchSet Bundle]

Profile with new Extensions:
- [Risk Adjustment Coding Gap Report]
</div>

List of profiles that define constrains on FHIR resources for systems conforming to this implementation guide.

|Resource Type|Profile|
|---|---|---|
|MeasureReport|[Risk Adjustment Coding Gap Report]|
|Measure|[Risk Adjustment Model Measure]|
|Group|[Patient Group]|
|Task|[Risk Adjustment Clinical Evaluation Evidence Task]|
|Bundle|[Risk Adjustment SearchSet Bundle]
|Bundle|[Risk Adjustment Coding Gap Report Bundle]*|
{: .grid}

*The Risk Adjustment Coding Gap Report Bundle is a collection Bundle returned by [$ra.evaluate-measure]

<br />

{% include link-list.md %}
