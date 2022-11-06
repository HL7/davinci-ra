
The table below lists the operations specified in this implementation guide. 

<div class="bg-success" markdown="1">

|Operation Name|Link to Operation|Description|
|---|---|---|
|Risk Adjustment Condition Category Gaps|[$ra.cc-gaps]|Payer calls this operation to generate Risk Adjustment Coding Gap Bundle including original evidence that supports the condition category gaps.|
|Risk Adjustment Remediate Condition Category Gaps|[$ra.remediate-cc-gaps]|This operation supports the collaboration between Provider and Risk Adjustment Coder throughout the remediation step. Provider or Risk Adjustment Coder calls this operation during their their clinical evaluation process to update the risk adjustment Condition Category gaps and providing clinical evaluation evidence to support the changes.|
|Risk Adjustment Approve Condition Category Gaps|[$ra.approve-cc-gaps]|At the end of the remediation process, Risk Adjustment Coder approves Condition Category gaps by setting the DetectedIsssue contained in the Risk Adjustment Coding Gap Bundle from status of `preliminary` to `final`.|
|Risk Adjustment Resolve Condition Category Gaps|[$ra.resolve-cc-gaps]|Payer calls this operation to resolve Condition Category gaps after Risk Adjustment Coder completed the remediation process and sent the updated Risk Adjustment Coding Gap Bundle with the supporting clinical evaluation evidence to Payer.|
|Risk Adjustment Evaluate Measure|[$ra.evaluate-measure]|This operation evaluates digital Condition Category against patient data to generate Risk Adjustment Coding Gap Bundle.|
{: .grid}

</div><!-- new-content -->

<div class="note-to-balloters" markdown="1">
The $report operation specified in STU1 is renamed to $ra.cc-gaps in this ballot and with updates.
</div>

<br />

{% include link-list.md %}
