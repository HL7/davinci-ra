
The Risk Adjustment Implementation Guide was developed under the  [Davinci Project](#)

### version 1.0.0
**Ballot Comments Applied**: **Summary** (**Jira Issue**)
1. **Applied**: Bind example value sets where ever possible instead of creating complicated element definitions ([FHIR-34774](https://jira.hl7.org/browse/FHIR-34774))
1. **Applied**: Missing Must Support, $report comment, & extension comment ([FHIR-35139](https://jira.hl7.org/browse/FHIR-35139))
1. **Applied**: Clarify provider-driven v. payer-driven approach to coding gaps ([FHIR-35324](https://jira.hl7.org/browse/FHIR-35324))
1. **Applied**: Keep group.population and group.stratifier in as optional ([FHIR-35221](https://jira.hl7.org/browse/FHIR-35221))
1. **Applied**: "Hierarchical Condition Categories (HCCs) with less severe HCCs superseded (ignored) if evidence of higher severity HCCs is present" statement is not accurate description. ([FHIR-34773](https://jira.hl7.org/browse/FHIR-34773))
1. **Applied**: Group usage in bundles missing from guidance ([FHIR-34710](https://jira.hl7.org/browse/FHIR-34710))
1. **Applied**: Over-specific precondition for patient resource logical id ([FHIR-34708](https://jira.hl7.org/browse/FHIR-34708))
1. **Applied**: Cardinality confusion for MeasureReport.group.code ([FHIR-34711](https://jira.hl7.org/browse/FHIR-34711))
1. **Applied**: extracted diagnosis data element missing background ([FHIR-34696](https://jira.hl7.org/browse/FHIR-34696))
1. **Applied**: Figure 1-2 Workflow for Medicare Advantage Population, Phase One misses the preceding step where provider sends initial diagnostic/condition codes before risk coding report is generated. ([FHIR-34778](https://jira.hl7.org/browse/FHIR-34778))
1. **Applied**: plural possessive ([FHIR-34695](https://jira.hl7.org/browse/FHIR-34695))
1. **Applied**: actor names ([FHIR-34698](https://jira.hl7.org/browse/FHIR-34698))
1. **Applied**: Typo in Intro ([FHIR-34501](https://jira.hl7.org/browse/FHIR-34501))

**Other Changes Applied**: **Summary** (**Jira Issue**)
1. **Applied**: Remove extension-reporterGroup extension from RA Coding Gap MeasureReport ([FHIR-36850](https://jira.hl7.org/browse/FHIR-36850))
1. **Applied**: Noted several errors in example data ([FHIR-35773](https://jira.hl7.org/browse/FHIR-35773))
1. **Applied**: US Core 3.1.1 Alignment ([FHIR-35924](https://jira.hl7.org/browse/FHIR-35924))
1. **Applied**: Add language to acknowledge physician burden reduction ([FHIR-35323](https://jira.hl7.org/browse/FHIR-35323))
1. **Applied**: Correct MeasureReport.group.stratifier.code cardinality due to error in base resource ([FHIR-36053](https://jira.hl7.org/browse/FHIR-36053))
1. **Applied**: Title for HCC 18 should be "Diabetes with chronic complications" not "Diabetes without complications" ([FHIR-35774](https://jira.hl7.org/browse/FHIR-35774))
1. **Applied**: Add more details to the description of the evaluatedResource element ([FHIR-35980](https://jira.hl7.org/browse/FHIR-35980))
1. **Applied**: Change to Condition Category (CC) gap instead of HCC gap in SuspectType definitions ([FHIR-36024](https://jira.hl7.org/browse/FHIR-36024))
1. **Applied**: Typo in 1.4 Scope text ([FHIR-35971](https://jira.hl7.org/browse/FHIR-35971))
1. **Applied**: Example MeasureReport01 Group vs EvaluatedResources Data Conflict ([FHIR-37345](https://jira.hl7.org/browse/FHIR-37345))
1. **Applied**: Example MeasureReport01 HCC Code Consistency ([FHIR-37348](https://jira.hl7.org/browse/FHIR-37348))
1. **Applied**: Example MeasureReport04 HCC Code Consistency ([FHIR-37351](https://jira.hl7.org/browse/FHIR-37351))
1. **Applied**: Example MeasureReport06 Links Different Patient Than EvaluatedResource ([FHIR-37354](https://jira.hl7.org/browse/FHIR-37354))
1. **Applied**: Example MeasureReport01 Group vs Condition Data Conflict ([FHIR-37347](https://jira.hl7.org/browse/FHIR-37347))
1. **Applied**: Example MeasureReport02 Group vs Condition Data Conflict ([FHIR-37350](https://jira.hl7.org/browse/FHIR-37350))
1. **Applied**: Example MeasureReport05 Encounter and Condition Link Consistency Issue ([FHIR-37353](https://jira.hl7.org/browse/FHIR-37353))
1. **Applied**: Example MeasureReport04 Group-013 Condition May Not be Applicable ([FHIR-37352](https://jira.hl7.org/browse/FHIR-37352))

### Version 0.1.0
Initial content for STU1 ballot.

{% include link-list.md %}
