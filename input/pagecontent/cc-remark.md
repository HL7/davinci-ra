Once a [Risk Adjustment Coding Gap Report] is generated, a [Condition Category Remark] can be added to the MeasureReport.  Here are some ways this remark may be used:
 - added by the payer or an entity working on behalf of the payer with additional information about the Condition Category.  An example might be adding the qualifying diagnosis codes (`qualifyingDxCode`) when proprietary risk models are used by the payer and the mappings of ICD-10-codes to Condition Categories are not readily available to the provider. 
 - added by a Risk Adjustment Coder who reviews the chart prior to the provider seeing the patient. This coder might be working on behalf of the payer or the provider or both.
 - added by the provider's Electronic Medical Record (EMR) if a coding gap is not appropriate to show to the type of provider seeing the patient or if the EMR cannot process the coding gaps in the MeasureReport.
 - added by the provider at the time the patient is seen to indicate to the payer that an action was taken.

Note: The [Condition Category Remark] extension is not intended to change the status of a Condition Category gap. To change the status, follow the [Submit Data to Payer] section of this guidance.  Note that both a Condition Category remark and [Submit Data to Payer] can be generated at the time the Provider sees the patient if that is appropriate.

### The Condition Category Remark Extension
This [Condition Category Remark] extension is added to the [Risk Adjustment Coding Gap Report] within the `MeasureReport.group` element. This allows for a remark be added at the Condition Category code level. The Condition Category Remark is a Complex extension and can repeat; it has several fields:
- A remark must have at least an `author`, an `authorOrganization`, or an `authorSoftware`
    - `author` indicates the person who provided the remark. It can be an identifier such as an NPI or a person's name.
    - `authorOrganization` which can be an identifier such as a TIN or NPI for the organization or can be a text name of the Organization.
    - `authorSoftware` is the software system that generated the remark either an identifier for the system or a system name.
- `authorDatetime` when the remark was made
- `text` a free text remark
- `code` a coded remark indicating what happened at the time of the remark, such as when a provider sees the patient and decides a condition is present; the code would be "assessed-present". The code list which is extensible includes assessed-present, assessed-not-present, in-progress, not-assessed, not-presented, deferred, and not-ingested.
- `reasonCode` reason why remark is added. The value set which is extensible includes never-had-condition, inactive-condition, and inapplicable-gap.
- `relatedDataIentifier` an identifier field that can be used to link to a claim or document such as a Continuity of Care Document (CCD) that the provider is sending via another method or transaction.
- `qualifyingDxCode` diagnoses that would be classified under this Condition Category as defined by the risk adjustment model. This would be added by the payer or an entity working on behalf of the payer.
- `qualifyingDxList`: a list of diagnoses classified under this Condition Category as defined by the risk adjustment model provided as a string. Added by the payer or an entity working on behalf of the payer. 

The Provider's system being used SHALL NOT change any other part of the original Risk Adjustment Coding Gap Report and can only add the [Condition Category Remark] to the appropriate `MeasureReport.group`(s).  If a provider wants to share data with the Payer in order to change a gap status, they should use the [Submit Data to Payer] process.  

If a payer or someone acting on behalf of the payer like a risk adjustment coder is adding a remark to the report, they would update the report on their server.

{% include img-portrait.html img="report-cc-remark-overview-payer.png" caption="Figure 2.5-1 Payer Adds Remark to Condition Category Overview"%}

If a provider, the provider's electronic heath record or a risk adjustment coder working on his behalf  adds a Remark to the Risk Adjustment Coding Gap Report, the ccRemark can be added to the Report with the Patch process or the entire MeasureReport with the added ccRemark posted to the Provider's system.

{% include img-portrait.html img="report-cc-remark-overview-provider.png" caption="Figure 2.5-2 Provider Add Remark to Condition Category Overview"%}

{% include img-portrait.html img="report-cc-remark-workflow.png" caption="Figure 2.5-3 Report Condition Category Remark Workflow when the Provider adds the Remark"%}

### Provider Handling of the Condition Category Remark

The Provider may choose to send the Condition Category remark only to the Payer using a light weight approach rather than sending the entire MeasureReport resource. They can do this using the [PATCH](https://www.hl7.org/fhir/http.html#patch) operation.

A [RA Parameters ccRemark Patch Profile] is defined to specify the structures of using the Parameter resource to send the remark using the PATCH operation. 

### Payer Handling of the Condition Category Remark
This implementation guide does not direct any action be taken by the Payer upon receipt of a [Risk Adjustment Coding Gap Report] with added Condition Category remark(s).

After a Payer generates a subsequent [Risk Adjustment Coding Gap Report], in their role as Reporting Server they can choose to include the Condition Category remarks as they see fit. This might include adding the remarks only if received from the same Provider and can include any remarks all the way up to including all Condition Category remarks received from any provider. The Payer is not required to include any Condition Category remarks on subsequently generated [Risk Adjustment Coding Gap Report].

### Usage

#### Sending the full MeasureReport with added Remarks to Payer
`PUT [base]/MeasureReport/[id]`

{% include examplebutton.html example="put-risk-adjustment-coding-gap-report-with-remark-example" b_title = "Click Here to See Example PUT Risk Adjustment Coding Gap Report with Remarks Added" %}

#### Using Patch to update the Payer's MeasureReport with Remarks
`PATCH [base]/MeasureReport/[id]`

{% include examplebutton.html example="patch-risk-adjustment-coding-gap-report-with-remark-example" b_title = "Click Here to See Example PATCH Risk Adjustment Coding Gap Report with Remarks" %}


{% include link-list.md %}


