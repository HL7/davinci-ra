
The Risk Adjustment Implementation Guide was developed under the  [Davinci Project](#)

### Version 2.1.0 
High-level updates include:
- Updated to support multiple USCore versions (USCore 3.1.1, USCore 6.1.0 and USCore 7.0.0)
- Updated the menu layout and updated/added pages accordingly
- Enhanced Condition Category Remark and updated guidance for sending remarks

- [FHIR-50186](https://jira.hl7.org/browse/FHIR-50186) - Renamed relatedDataIdentifier to relatedData and added to allow reference to Organization Resource for authorOrganization in ccRemark

### Version 2.0.0

- **Applied**: Added references to report generation overview and methods ([FHIR-40988](https://jira.hl7.org/browse/FHIR-40988))
- **Applied**: Fix Group.Type to person ([FHIR-40995](https://jira.hl7.org/browse/FHIR-40995))
- **Applied**: Make Group.actual fixed to true ([FHIR-40996](https://jira.hl7.org/browse/FHIR-40996))
- **Applied**: Remove or better define reason for meta.profile requirement ([FHIR-40997](https://jira.hl7.org/browse/FHIR-40997))
- **Applied**: Need to remove mandatory requirement in meta.profile ([FHIR-40935](https://jira.hl7.org/browse/FHIR-40935))
- **Applied**: Improve wording in remediation guidance ([FHIR-40989](https://jira.hl7.org/browse/FHIR-40989))
- **Applied**: Large number of technical corrections ([FHIR-41140](https://jira.hl7.org/browse/FHIR-41140))
- **Applied**: Add capabilitystatement-expectation extensions ([FHIR-40993](https://jira.hl7.org/browse/FHIR-40993))
- **Applied**: Add more guidance on what is expected in annotations ([FHIR-40991](https://jira.hl7.org/browse/FHIR-40991))
- **Applied**: Provide more guidance on the expectations on Task termination ([FHIR-40990](https://jira.hl7.org/browse/FHIR-40990))
- **Applied**: Add better description of scope/use/limitations/workflows to all Structure Definitions ([FHIR-40998](https://jira.hl7.org/browse/FHIR-40998))
- **Applied**: Added examples tab to all Profiles under FHIR Artifacts ([FHIR-40992](https://jira.hl7.org/browse/FHIR-40992))
- **Applied**: Group annotation extension was renamed to Condition Category Remark (ccRemark).  Also added section to describe how Patch could be used instead of sending back the full report (examples included) ([FHIR-41332](https://jira.hl7.org/browse/FHIR-41332))
- **Applied**: Update to use CMS-HCC v28 as example ([FHIR-48619](https://jira.hl7.org/browse/FHIR-48619))
- **Applied**: Changes to RA Coding Gap MeasureReport based on implementer feedback ([FHIR-48698](https://jira.hl7.org/browse/FHIR-48698))
- **Applied**: Moved Report Generation section on Evaluated-Approach to the dCC page.  Updated related text.  Added description of where Group profile is used to Group Profile page ([FHIR-47810](https://jira.hl7.org/browse/FHIR-47810))
- **Applied**: Removed meta.profile requirement  ([FHIR-40935](https://jira.hl7.org/browse/FHIR-40935))
- **Applied**: Will include MeasureReport id with PATCH Parameters file.  Will add profile for PATCH Parameter.  ([FHIR-444997](https://jira.hl7.org/browse/FHIR-44997))
- **Applied**: Added measurereport-categroy extension to report.  Changed query to use this instead of meta.profile  ([FHIR-45202](https://jira.hl7.org/browse/FHIR-45202))
- **Applied**: Updated Annotation to CC-Remark and updated elements to align with names like author, authorDateTime, etc.  Also added requirement for Author, Organization or Software.  Additionally added new code values as requested by implementers.  Added relatedData Identifier, reasonCode and qualifyingDxCode to Remark  ([FHIR-48732](https://jira.hl7.org/browse/FHIR-48732))
- **Applied**: Added new code for "not ingested" to Remark.code ([FHIR-48770](https://jira.hl7.org/browse/FHIR-48770))
- **Applied**: Added RA Parameters ccRemark Patch Profile ([FHIR-44997](https://jira.hl7.org/browse/FHIR-FHIR-44997))

### Version 2.0.0-ballot

- The 2.0.0-ballot includes the following changes to support new functionalities: 
    - The Guidance page in STU1 is now broken into two pages, General Guidance and Report Generation, with new content   
    - New pages: Report Generation, Report Query, Remediation, and Report Annotation 
    - New profiles and extensions, see [Profiles] 
- It also introduces Digital Condition Category as DRAFT content for review:
    - New page: [Digital Condition Category(dCC)](dcc.html)
    - New operation: [$ra.evaluate-measure]

**Trackers Applied for 2.0.0-ballot**
1. **Applied**: Add "data collection period" to Glossary ([FHIR-37672](https://jira.hl7.org/browse/FHIR-37672))
1. **Applied**: Corrected CMS-HCC model to HHS-HCC model ([FHIR-37745](https://jira.hl7.org/browse/FHIR-37745))
1. **Applied**: Corrected Category misspelling ([FHIR-38205](https://jira.hl7.org/browse/FHIR-38205))
1. **Applied**: Corrected Condition misspelling in Suspect Type Value Set ([FHIR-38206](https://jira.hl7.org/browse/FHIR-38206))
1. **Applied**: Corrected Venn Diagram misspelling in DCC content page ([FHIR-39300](https://jira.hl7.org/browse/FHIR-39300))
1. **Applied**: Make "Example CMS Hierarchical Condition Category Value Set" a true sample ([FHIR-39371](https://jira.hl7.org/browse/FHIR-39371))
1. **Applied**: Remove "Code System" and "Value Set" from names and titles of code system and value set ([FHIR-39374](https://jira.hl7.org/browse/FHIR-39374))

### Version 1.0.0
**Ballot Comments Applied**: **Summary** (**Jira Issue**)
1. **Applied**: Bind example value sets where ever possible instead of creating complicated element definitions ([FHIR-34774](https://jira.hl7.org/browse/FHIR-34774))
1. **Applied**: Missing Must Support, $report comment, & extension comment ([FHIR-35139](https://jira.hl7.org/browse/FHIR-35139))
1. **Applied**: Clarify provider-driven v. payer-driven approach to coding gaps ([FHIR-35324](https://jira.hl7.org/browse/FHIR-35324))
1. **Applied**: Keep group.population and group.stratifier in as optional ([FHIR-35221](https://jira.hl7.org/browse/FHIR-35221))
1. **Applied**: "Hierarchical Condition Categories (HCCs) with less severe HCCs superseded (ignored) if evidence of higher severity HCCs is present" statement is not accurate description. ([FHIR-34773](https://jira.hl7.org/browse/FHIR-34773))
1. **Applied**: Group usage in bundles missing from guidance ([FHIR-34710](https://jira.hl7.org/browse/FHIR-34710))
1. **Applied**: Over-specific precondition for patient resource logical id ([FHIR-34708](https://jira.hl7.org/browse/FHIR-34708))
1. **Applied**: Cardinality confusion for MeasureReport.group.code ([FHIR-34711](https://jira.hl7.org/browse/FHIR-34711))
1. **Applied**: Extracted diagnosis data element missing background ([FHIR-34696](https://jira.hl7.org/browse/FHIR-34696))
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
