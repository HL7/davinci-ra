ValueSet: RiskAdjustmentConditionCategoryType
Title: "Condition Category Type"
Id: cc-type
Description: "Type of value-based performance reporting performance metric."
* ^experimental = false
* codes from system RiskAdjustmentConditionCategoryType

ValueSet: CodingGapRemark
Title: "Coding Gap Remark"
Id: coding-gap-remark
Description: "Coded remark for a coding gap."
* ^experimental = false
* codes from system CodingGapRemark

ValueSet: RiskAdjustmentEvidenceStatus
Title: "Evidence Status"
Id: evidence-status
Description: "Codes that indicate whether a coding gap is an open-gap, invalid-gap, closed-gap, or pending."
* ^experimental = false
* codes from system RiskAdjustmentEvidenceStatus

ValueSet: RiskAdjustmenthierarchicalStatus
Title: "Hierarchical Status"
Id: hierarchical-status
Description: "Codes that indicate how hierarchies were applied to a Condition Category (CC), and if applied, whether the Condition Category (CC) is superseded."
* ^experimental = false
* codes from system RiskAdjustmenthierarchicalStatus

ValueSet: RemarkReason
Title: "Remark Reason"
Id: remark-reason
Description: "Reason for the remark"
* ^experimental = false
* codes from system RemarkReason

ValueSet: SampleCMSHCC
Title: "Sample CMS Hierarchical Condition Category"
Id: sample-cmshcc
Description: "This is a sample of the concepts that can be found in the CMS Hierarchical Condition Categories (CMS-HCC) code system version 24. The source of the codes included in this example was published at https://www.cms.gov/Medicare/Health-Plans/MedicareAdvtgSpecRateStats/Downloads/Announcement2020.pdf. The CMS-HCC model uses more than 9,000 ICD-10-CM codes, which are mapped to condition categories (CCs) that predict costs well. The condition categories (CCs) are based on diagnoses clinically related to one another and with similar predicted cost implications. Hierarchies are imposed on the Condition Categories (CCs) to capture the most costly diagnoses. Hierarchy logic is imposed on certain Condition Categories (CCs) to account for different hierarchical costs, thus, the term Hierarchical Condition Category, or HCC."
* ^experimental = false
* CMSHCC#22 "Morbid Obesity"
* CMSHCC#88 "Angina Pectoris"
* CMSHCC#112 "Fibrosis of Lung and Other Chronic Lung Disorders"



