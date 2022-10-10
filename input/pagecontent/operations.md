
The operation specified in this implementation guide:

**[$report Operation](OperationDefinition-report.html)**

<div class="bg-info" markdown="1">
Draft operation definitions that are under discussions and development. 

|Operation Name|Link to Operation|Description|
|---|---|---|
|Risk Adjustment Report Operation|[$davinci-ra.report]|Payer calls this operation to generate Risk Adjustment Coding Gap Bundle including supporting original evidence to be sent to the Provider.|
|Risk Adjustment Remediate Operation|[$davinci-ra.remediate]|After Provider receives the Risk Adjustment Coding Gap Bundle from Payer, Provider or Certified Coder calls this operation during their their clinical evaluation process to update the risk adjustment coding gaps and providing supporting clinical evaluation evidence. Updated Risk Adjustment Coding Gap Bundle as result of the remediation process will be sent back to the Payer by either POST or PULL.|
|Risk Adjustment Resolve Operation|[$davinci-ra.resolve]|Payer calls this operation to resolve risk adjustment coding gaps after receiving the updated Risk Adjustment Coding Gap Bundle with supporting clinical evaluation evidence from Payer or Certified Coder.|
|Risk Adjustment Evaluate Measure Operation|[$davinci-ra.evaluate-measure]|This operation evaluates digital Condition Category against patient data to generate Risk Adjustment Coding Gap MeasureReport.|
{: .grid}

</div>
<br />

{% include link-list.md %}
