CodeSystem: RiskAdjustmentConditionCategoryType
Title: "Risk Adjustment Condition Category Type Codes"
Id: cc-type
Description: "Code sytstem that indicates whether it is a suspected Condition Category (CC) gap, a historic Condition Category (CC) gap, or a net-new Condition Category (CC). Historic, suspected, and net-new are mutually exclusive."
* ^experimental = false
* ^caseSensitive = true
* #historic "Historic Condition Category Gap" "Historic Condition Category (CC) Gap. Historic Condition Category (CC) is based on verified data from any clinical evaluation period."
* #suspected "Suspected Condition Category Gap" "Suspected Condition Category (CC) Gap. A member has never had this as a verified Condition Category (CC), but when a Server runs a suspecting algorithm, suspected Condition Categories (CCs) are identified."
* #net-new "Net-New Condition Category" "Net-New Condition Category (CC). New Condition Category (CC), not from suspected process or historic. A Net-New Condition Category (CC) is documented for the first time during the clinical evaluation period for the risk adjustment model. Any Condition Categories (CCs) that are net new must be either closed-gap or pending and cannot be open-gap."

CodeSystem: CodingGapRemark
Title: "Coding Gap Remark Codes"
Id: coding-gap-remark
Description: "Code sytstem that indicates coded remark for a coding gap."
* ^experimental = false
* ^caseSensitive = true
* #assessed-present "Assessed and present" "Assessed the gap and acknowledged it is still present."
* #assessed-not-present "Assessed and not present" "Assessed the gap and acknowledged it is not present."
* #in-progress "In progress" "Assessed the gap and actions are taken to address the gap."
* #deferred "Deferred" "Assessed the gap and actions will be taken in the future to address the gap."
* #not-assessed "Not assessed" "Gap was shown to the provider but no action was taken to assess the gap."
* #not-presented "Not presented" "System did not present the gap to the end user."
* #not-ingested "Not ingested" "System cannot process the gap that was received."

CodeSystem: RiskAdjustmentEvidenceStatus
Title: "Risk Adjustment Evidence Status Codes"
Id: evidence-status
Description: "Code System that indicates whether a coding gap is an open-gap, invalid-gap, closed-gap or pending"
* ^experimental = false
* ^caseSensitive = true
* #closed-gap "Closed Condition Category Gap" "Evidence to support a Condition Category (CC) was confirmed"
* #invalid-gap "Invalid Condition Category Gap" "Evidence to support a Condition Category (CC) was invalidated."
* #open-gap "Open Condition Category Gap" "Action is needed to confirm whether the Condition Category (CC) is valid."
* #pending "Pending Condition Category Gap" "Evidence was received by the payer and is in the process of being evaluated."

CodeSystem: RiskAdjustmenthierarchicalStatus
Title: "Risk Adjustment Hierarchical Status Codes"
Id: hierarchical-status
Description: "Code system that indicates how hierarchies were applied to a Condition Category (CC), and if applied, whether the Condition Category (CC) is superseded."
* ^experimental = false
* ^caseSensitive = true
* #applied-superseded "Hierarchies applied and Condition Category is superseded" "Hierarchies were applied to a Condition Category (CC) and the Condition Category (CC) is superseded."
* #applied-not-superseded "Hierarchies applied and Condition Category is not superseded" "Hierarchies were applied to a Condition Category (CC) and the Condition Category (CC) is not superseded."
* #not-applied "Hierarchies not applied" "Hierarchies were not applied to a Condition Category (CC)."
* #not-applicable "Not applicable" "Applying hierarchies to a Condition Category (CC) is not applicable."

CodeSystem: RemarkReason
Title: "Remark Reason Codes"
Id: remark-reason
Description: "Reason codes for remark"
* ^experimental = false
* ^caseSensitive = true
* #additional-evidence-needed "Additional Evidence Needed" "Reason primarily for the in-progress remark and sometimes for the deferred remark. Available information reviewed by the remarking actor is insufficient to confirm the Condition Category as present or to invalidate it as not present. Additional clinical documentation, outside records, patient evaluation, diagnostic results, or reconciliation is needed before the gap can be resolved."
* #already-submitted "Data Already Submitted" "Reason for the assessed-present or assessed-not-present remark. Clinical evidence addressing this coding gap was previously submitted to the payer."
* #attribution-routing-mismatch "Attribution or Routing Mismatch" "Reason primarily for the not-assessed remark and sometimes for the not-presented or the not-ingested remark. The remarking actor indicates that the Condition Category gap appears to have been attributed, assigned, or routed to the wrong clinician, organization, care team, or other responsible party. The gap may require reassignment, rerouting, attribution correction, or review of supporting evidence context before assessment by the appropriate party."
* #inactive-condition "Condition no longer active" "Reason for the assessed-not-present remark is because the patient's condition is no longer active."
* #inapplicable-gap "Inapplicable gap" "Reason for the assessed-not-present remark is because the patient has an active condition but the gap does not accurately describe it."
* #never-had-condition "Patient never had the condition" "Reason for the assessed-not-present remark is because the patient has never had this condition."
* #outside-specialty-scope "Outside Clinician Specialty or Scope" "Reason for the not-assessed remark. Assessment or confirmation of this condition is outside the rendering clinician’s specialty or scope of practice."
* #patient-declined-evaluation "Patient Declined Evaluation" "Reason for the not-assessed remark. The patient was offered an evaluation to address this gap but declined assessment."
* #patient-not-evaluated "Patient Not Evaluated During Period" "Reason for the not-assessed remark. The patient was not seen or evaluated by the provider during the relevant reporting period."
* #payer-attribution-mismatch "Payer Attribution Mismatch" "Reason for the not-presented remark. The patient is not attributed to this provider or organization based on the payer’s records."
* #requires-follow-up "Requires Patient Follow-up" "Reason for the deferred remark. Further assessment or action is needed to address the coding gap at a future patient encounter."

CodeSystem: RATemporaryCodes
Title: "RA Temporary Code System"
Id: ra-temp
Description: "Temporary code system defined in this implementation guide"
* ^experimental = false
* ^caseSensitive = true
* #evidence-note "Evidence Note" "Type of Condition Category remark that is evidence note."
