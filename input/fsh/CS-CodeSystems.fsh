CodeSystem: RiskAdjustmentConditionCategoryType
Title: "Risk Adjustment Condition Category Type"
Id: cc-type
Description: "Code sytstem that indicates whether it is a suspected Condition Category (CC) gap, a historic Condition Category (CC) gap, or a net-new Condition Category (CC). Historic, suspected, and net-new are mutually exclusive."
* ^experimental = false
* ^caseSensitive = true
* #historic "Historic Condition Category Gap" "Historic Condition Category (CC) Gap. Historic Condition Category (CC) is based on verified data from any clinical evaluation period."
* #suspected "Suspected Condition Category Gap" "Suspected Condition Category (CC) Gap. A member has never had this as a verified Condition Category (CC), but when a Server runs a suspecting algorithm, suspected Condition Categories (CCs) are identified."
* #net-new "Net-New Condition Category" "Net-New Condition Category (CC). New Condition Category (CC), not from suspected process or historic. A Net-New Condition Category (CC) is documented for the first time during the clinical evaluation period for the risk adjustment model. Any Condition Categories (CCs) that are net new must be either closed-gap or pending and cannot be open-gap."

CodeSystem: CodingGapRemark
Title: "Coding Gap Remark"
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
