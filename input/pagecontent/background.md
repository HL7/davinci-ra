### Introduction

The Da Vinci Project member organizations have identified the need of standardizing how risk adjustment coding gaps are communicated between payers and providers. This implementation guide (IG) specifies standardized risk adjustment coding gap reports and provides guidance to query the coding gap reports from a Payer for one or more patients. Standardizing the reporting structure helps lessen the burden on the providers in processing the reports so they can more easily address the patients’ care needs. This standardized structure also supports the Payer sharing information that they have but the providers may not, such as data from other providers’ claims, lab results, filled prescriptions, etc. 

This IG also provides mechanisms enabling the feedback loop from Provider to Payer. Providers may add a Condition Category Remark(s) to the Risk Adjustment Coding Gap Report to indicate that they took some action(s) for a specific coding gap on the report and communicates that back to the Payer. However, if the Provider identifies a coding gap that is on the report needs to be closed or invalidated based on medical record review, this feedback process is done using the [Risk Adjustment Data Exchange MeasureReport], which allows the Provider to send the supporting clinical evaluation evidence to the Payer. This feedback loop is important for achieving the goal of improving the accuracy and completeness of risk adjustment.

### Preconditions and Assumptions

- A contract for medical services exists between the Server and the Client requesting the Risk Adjustment Coding Gap Reports.
- Risk Adjustment Coding Gap Reports are pre-generated on the Server by a backend system such as a risk adjustment engine for risk adjustment model(s).
- It is the responsibility of the Server to ensure that the data used in the report is present in a structured and retrievable form.
- The Server and the Client have agreed upon a process to identify specific patient(s) and exchange the Patient resource's logical id or the Patient Group resource's logical id.
- For Security, see [Security, Privacy, and Safety](security.html)

### Scope

After careful review with the risk adjustment subject matter experts, it was determined that the most challenging aspect of the current risk adjustment process was the inconsistent manner in which reports on risk adjustment coding gaps were communicated between a provider (or system operating on their behalf) and a payer (or system operating on the payer’s behalf). Figure 1-2 shows a high-level example of the risk adjustment workflow in a CMS Medicare Advantage program. This implementation guide focuses on specifying a standard exchange format, the Risk Adjustment Coding Gap Report, between payers and providers. This diagram does not depict preceding steps such as the payer receiving clinical or claims data from providers or other sources, nor does it attempt to define contractual relationships.

{% include img-portrait.html img="workflow-medicare-advantage.png" caption = "Figure 1-2 Workflow for Medicare Advantage Population" %}

This implementation guide does not define how payers determine a coding gap and how coding gaps are produced or managed on the payer side including hierarchies. This implementation guide also does not define suspecting processes and algorithms/predictive models that are used for suspecting analytics.   

### Actors and Roles

Different entities can play different Roles in different scenarios. The Actors in this implementation guide are Payer and Provider. Their roles as Client and Server are described below. 


**Client**: 
- Reporting Client
    - Payer plays this role when they request a [Risk Adjustment Coding Gap Report] to POST to Provider's FHIR Server 
    - Provider plays this role 1) when they request a Risk Adjustment Coding Gap Report, or 2) when they add a Condition Category Remark to a Risk Adjustment Coding Gap Report
- Data Submission Client
    - Provider plays this role when they create a [Risk Adjustment Data Exchange MeasureReport] and submit to Payer

**Server**:
- Reporting Server
    - The Payer plays this role when they 1) generate and store a Risk Adjustment Coding Gap Report, or 2) when they add Condition Category remark to the Risk Adjustment Coding Gap Report, if the Payer chooses to share any or all Condition Category remarks submitted by the Provider
    - The Payer plays this role when they receive and process the Risk Adjustment Data Exchange MeasureReport       
- Data Submission Server
    - The Provider plays this role when they POST Risk Adjustment Coding Gap Report with Condition Category Remark(s)

The Methodology section of this implementation guide describes these Actors in more detail in the context of report generation, report query, and data submission steps of risk adjustment lifecycle and adding of Condition Category remarks to the Risk Adjustment Coding Gap report. 
   

{% include link-list.md %}
