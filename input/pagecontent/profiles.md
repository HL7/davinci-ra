{% include globals-table.xhtml %}

List of profiles that define constrains on FHIR resources for systems conforming to this implementation guide.

|Resource Type|Profile|
|---|---|
|MeasureReport|[Risk Adjustment Coding Gap Report Profile]|
|MeasureReport|[Risk Adjustment Data Exchange MeasureReport Profile]|
|Measure|[Risk Adjustment Model Measure Profile]|
|Group|[Patient Group Profile]|
|Parameter|[RA Parameters ccRemark Patch Profile]|
{: .grid}

---

|Resource Type|Profile|Note|
|---|---|
|Bundle|[Risk Adjustment Coding Gap Report Bundle]|The Risk Adjustment Coding Gap Report Bundle is a collection Bundle returned by [$ra.evaluate-measure] and included in this version of the IG as DRAFT.|
{: .grid}

<br />

{% include link-list.md %}
