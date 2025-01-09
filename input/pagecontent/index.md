

###  Summary

The Da Vinci Fast Healthcare Interoperability Resource (FHIR) Risk Adjustment Implementation Guide (IG) describes exchanging risk adjustment coding gaps between payers and providers. Risk adjusted premium calculations are important to government managed care. To better inform providers of opportunities to address risk adjusted conditions, better enable payers to communicate risk adjustment information, and enhance government sponsors' ability to allocate funding accurately, payers and providers need a standard protocol to share and receive clinical data related to risk adjustment and a standard methodology to communicate risk based coding, documentation and submission status of chronic conditions. The first Standard for Trial Use (STU) version of this implementation guide focused on the standard exchange format of risk adjustment coding gaps from payers to providers, it offers potential for reducing the administrative burden experienced by providers by standardizing the reporting they receive from all payers.

This version of the implementation guide focuses primarily on the communication from providers back to payers. It focuses on two forms of communication:

- Allowing the provider, a risk adjustment coder or the provider's EMR to add a Condition Category Remark to the Risk Adjustment Coding Gap Report.  Providers and risk adjustment coders may indicate that a gap was closed, invalidated, not appropriate at this time, etc.  It also allows for the EMR to notify the payer when the content could not be processed. Note that where appropriate, the payer or an entity acting on behalf of the payer can also add a remark to the Risk Adjustment Coding Gap Report.

- A Risk Adjustment Data Exchange MeasureReport was added to allow the provider to return data to the payer to potentially close the Condition Category code gaps.  We anticipate this could be used to submit Consolidated Clinical Document Architecture documents such as the Continuity of Care Document (CCD), Progress Notes, etc. It can also be used to submit specific FHIR data if appropriate.

This version also introduces the draft content for digital Condition Category (dCC). It describes how to specify dCCs, using Clinical Quality Language (CQL), through an example which would allow for a more automated process of generating risk adjustment coding gap reports by evaluating dCCs against clinical data. 

This implementation guide is supported by the Da Vinci initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities. Like all Da Vinci Implementation Guides, it follows the [HL7 Da Vinci Guiding Principles] for the exchange of patient health information. As an HL7 FHIR Implementation Guide, changes to this specification are managed by the sponsoring [Clinical Quality Information (CQI) Work Group] and are incorporated as part of the standard balloting process.

### Content and Organization

The main menu shown at the top of each page is categorized into several primary topics with several sub-topics:

- **[Home]**\: The home page provides a high-level summary of this IG and background information about risk adjustment for revenue normalization.

- **Background**: 

- **Specification**: These pages provide guidance on the resource profiles and operation defined in this IG.
    - [General Guidance] provides guidance that applies to all functionalities in this IG.
    - [Report Generation] describes how generating a Risk Adjustment Coding Gap Report is accomplished.
    - [Report Query] provides guidance on using query to return a Risk Adjustment Coding Gap Report(s) and their evaluated resources.
    - [Submit Data to Payer] provides guidance on submitting clinical evaluation evidence to Payer for the purpose of evaluating risk adjustment coding gaps using [$submit-data](https://www.hl7.org/fhir/measure-operation-submit-data.html) and [Risk Adjustment Data Exchange MeasureReport].
    - [Add Remark to Condition Category] describes how providers can add remarks to Condition Categories on the Risk Adjustment Coding Gap Report to note that they took actions while seeing the patient.
    - [Digital Condition Category (dCC)] includes draft content describing how a Condition Category can be structured as a proportion measure and be specified using CQL as a digital Condition Category in a similar fashion to electronic quality measures through an example. 
    - [Security, Privacy, and Safety](security.html) provides general expectations to ensure security and privacy of exchanges
    - [Glossary] lists glossary and acronyms by this IG.

- **FHIR Artifacts**: These pages list FHIR artifacts specified in this IG.
    - [Artifacts Summary](artifacts.html) shows a complete list of FHIR artifacts defined in this IG. 
    - [Profiles] lists the set of Profiles that are defined in this IG to exchange risk adjustment coding gaps.
    - [Extensions] lists the set of Extensions that are defined in this IG to exchange risk adjustment coding gaps.
    - [Operations] lists operations defined in this IG.
    - [Terminology] lists code systems and value sets defined in this IG.
    - [Capability statements] describes the expected FHIR capabilities of the risk adjustment actors of this IG.
    - [Examples] lists all the examples used in this IG.

- **Base Specs** includes links to the FHIR core specification as well as the US Core specs that underlie this IG.
- **Support** includes various links for support and guidance, as well as [Downloads] links for this IG and guidance on tools and support for Da Vinci implementers.


### Background
{: #background}
Health risk is a combination of two factors, loss and probability. Many players in the healthcare industry need to measure and manage health risks. For example, providers need to know which patients in their panel are facing the greatest clinical risks to prioritize their care; insurance payers need to know the expected financial risk of their covered lives so they can price their premiums appropriately.

#### Modeling Approaches: Risk Adjustment vs. Risk Prediction
<b>Risk adjustment models</b> are used to compare and normalize health risks across groups or populations. For instance, the Medicare Advantage (MA) population represents a risk pool, as does the subset of the MA population that Payer X covers. One common use of risk adjustment is to make equitable comparisons among healthcare payers that take into account the health status of their enrolled members, to provide adequate financial support for treating individuals with higher-than-average health needs, and to minimize incentives for plans and providers to selectively enroll healthier members. Risk adjustment models determine whether Payer X’s risk pool represents more or less health risk than the MA population average, so that if Payer X is running a greater risk – say, because its risk pool includes a greater portion of economically disadvantaged persons – then appropriate payments are made to help ensure that these members' premiums are subsidized to offset the higher expected cost of claims that Payer X will incur. Risk adjustment is used for this purpose within Medicare (the CMS-HCC<sup>[1](glossary.html#acronyms)</sup> and CMS-RxHCC<sup>[1](glossary.html#acronyms)</sup> models), Medicaid (the CDPS<sup>[1](glossary.html#acronyms)</sup> and MRX<sup>[1](glossary.html#acronyms)</sup> models), the Affordable Care Act (the HSS-HCC and RXC<sup>[1](glossary.html#acronyms)</sup> models), as well as other health insurance programs.

<b>Risk prediction models</b> have a different intent. These are used to predict the future behavior of individuals or populations such as who is likely to be a high utilizer of healthcare services or who is likely to experience adverse health care events.

#### Model Hierarchies: Condition Categories (CCs) vs. HCCs; Disease Hierarchies vs. Disease Categories; Superseding
This IG has mainly focused on the Medicare Advantage risk adjustment models, but it should also work for other risk adjustment and prediction models as long as they structure their data using <b>Condition Categories (CCs)</b>. A Condition Category (CC) is a clinically or financially related grouping of medical conditions. The number of Condition Categories (CCs) in each risk model depends on the purpose of that model, from about 80 Condition Categories (CCs) in the CMS-HCC model to about 400 Condition Categories (CCs) in the DxCG<sup>[1](glossary.html#acronyms)</sup> model. It is very common for Condition Categories (CCs) to be organized in terms of disease hierarchies and disease categories, with the former denoting the severity of a disease and the latter indicating other aspects such as which system and/or part of the anatomy is affected, how the disease affects the body, the nature of the disease process, what causes it, how it spreads, how quickly it progresses and so forth. When a disease hierarchy is applied it assigns Condition Categories (CCs) into Hierarchical Condition Categories (HCCs) with less severe HCCs superseded (dropped) if evidence of higher severity HCCs is present. Since different HCCs have an impact upon total risk assessment, they should be maintained. For example, the combination of a new diagnosis of major depression to an existing diagnosis of non-insulin dependent diabetes may increase total risk by more than the sum of the individual category risk assignments.

#### Risk Adjustment Applications: Revenue Normalization vs. Resource Utilization
This IG focuses on <b>risk adjustment for revenue normalization</b>, but risk adjustment has several other applications. Quality measures such as Plan All-Cause Readmissions, Acute Hospital Utilization, Hospitalization Following Discharge from a Skilled Nursing Facility, Emergency Department Utilization and Hospitalization for Potentially Preventable Complications are all risk-adjusted. Risk adjustment is used in care management to identify future high-cost or high-utilizing individuals, direct them toward appropriate treatment options, allocate resources for that treatment, and evaluate the outcomes of those programs. Risk adjustment is also used as an analytical method by actuaries and underwriters for pricing purposes. However, the goals, processes and methods of these other risk adjustment applications are quite different from those of risk adjustment for revenue normalization and are outside the scope of this IG.

Unless otherwise specified, when the term “risk adjustment” is used in this IG it is limited to risk adjustment for revenue normalization and is exclusively concerned with the exchange of diagnostic data to resolve Condition Category (CC) or HCC gaps.

#### Time Periods: Clinical Evaluation vs. Data Collection; Payment Years; Sweeps
There are several important time periods to keep track of here. For example, the Medicare Advantage <b>clinical evaluation period</b> runs from January 1 of [PY-1] through December 31 of [PY-1] during which the patient may have an encounter(s) with the provider(s) to document the presence of disease(s). The date of service for the extracted diagnosis must correspond to the correct Payment Year but payers are generally permitted more than one calendar year to collect the diagnoses. The Medicare Advantage <b>data collection period</b><sup>[1](glossary.html#acronyms)</sup> runs from January 1 [PY-1] to the end of January [PY+1]; during this time the payer may submit diagnoses collected during the clinical evaluation period to CMS. PY denotes the <b>Payment Year</b>, or the year when the payer receives its payment adjustment from Medicare. These payments begin on January 1 of [PY] based on diagnoses submitted to CMS through the first week of September of [PY-1]. This is a particularly important date known as the September Sweeps. For financial reasons, payers want to submit as many diagnoses as they can prior to September Sweeps because these are used to set the amount for the initial payment adjustments. Payers sometimes offer providers “Early Bird” incentives to document HCCs as soon in the year as they can, preferably prior to September Sweeps. For this reason, it is important for the payer to record when they receive medical evidence that closes an HCC gap so the provider can receive any “Early Bird” incentives they may have earned.

For example, during Medicare Advantage PY 2022 diagnoses are accepted from patient encounters with dates of service during the clinical evaluation period of Jan 1, 2021 to Dec 31, 2021. Payers may submit to Medicare the diagnoses they collect from these encounters as soon as Jan 1, 2021 and continuing through the end of Jan 2023. Sweeps for PY 2022 occur at the end of the first week of Sep 2021. Payers begin receiving payment adjustments from Medicare beginning in Jan 2022 based on diagnoses received through Sweeps.

The risk adjustment activities in support of these payment cycles concurrently overlap during any given year, as shown in the Figure 1-1. Note that this figure shows the Medicare Advantage risk adjustment cadence; other programs such as Medicaid and the ACA follow a different annual risk adjustment cadence.

{% include img-portrait.html img="payment-cycle-overlap.png" caption = "Figure 1-1 Medicare Advantage Risk Adjustment Cadence" %}

#### Concurrent Models: Blending; Special-Purpose Models
Since the data collection period is always longer than the clinical evaluation period there will be multiple models actively collecting data at the same time. For example, during the calendar year 2022 a typical MA payer will be actively collecting data to close gaps from several models:
- CMS-HCC V24 for the 2021 Payment Year (2020 dates of service, data submission deadline is the end of January 2022)
- CMS-HCC V22 for the 2021 Payment Year (2020 dates of service, data submission deadline is the end of January 2022)
- CMS-HCC V21 for the 2021 Payment Year (2020 dates of service, data submission deadline is the end of January 2022)
- CMS-RxHCC V05 for the 2021 Payment Year (2020 dates of service, data submission deadline is the end of January 2022)
- CMS-HCC V24 for the 2022 Payment Year (2021 dates of service)
- CMS-HCC V22 for the 2022 Payment Year (2021 dates of service)
- CMS-HCC V21 for the 2022 Payment Year (2021 dates of service)
- CMS-RxHCC V05 for the 2022 Payment Year (2021 dates of service)
- CMS-HCC V24 for the 2023 Payment Year (2022 dates of service)
- CMS-HCC V22 for the 2023 Payment Year (2022 dates of service)
- CMS-RxHCC V05 for the 2023 Payment Year (2022 dates of service)

To avoid confusion, the provider supplies dates for the clinical evaluation period, which is driven by dates of service. So if the provider sets the clinical evaluation period to run from Jan 1, 2022 through Dec 31, 2022, the payer would only report Condition Category (CC) gaps from these models:
- CMS-HCC V24 for the 2023 Payment Year (2022 dates of service)
- CMS-HCC V22 for the 2023 Payment Year (2022 dates of service)
- CMS-RxHCC V05 for the 2023 Payment Year (2022 dates of service)

What’s going on with these three different model versions? There are three answers.
1.	Risk adjustment models are an important actuarial tool for insurance payers, who must forecast the health risk of populations several years in advance. To avoid undermining any statistical analyses that are based on these HCC models, any changes to these models are rolled out in gradual, predictable ways. New models are always phased in, usually over a period of four or five years, during which the risk scores from the older model are gradually given less weight and risk scores from the new model are weighted more heavily. This model transition process is called blending. For several years leading up to 2022 the V22 and V24 models coexisted side by side. By 2022 the blending period ended with the V24 risk scores being accorded 100% of the weight.
2.	Risk scores for members diagnosed with certain medical conditions such as End Stage Renal Disease (ESRD) or who are enrolled in a special Medicare Advantage Plan for All-encompassing Care for the Elderly (PACE<sup>[1](glossary.html#acronyms)</sup>) are always scored using the model which is one version previous to the current one. While the V22 and V24 models were being blended both were considered current, meaning that the next previous version was V21. When a member is diagnosed with renal disease and CMS designates them as ESRD, the member shifts from being scored under the V22/V24 models to being scored under the V21 model. By 2022 the blending period was over, the V24 model became the most current model, the V22 model came into use for ESRD and PACE, and the V21 model was phased out.
3.	Throughout this period the CMS-RxHCC V05 model was also in continuous use. The purpose of the CMS-RxHCC model is to normalize the expected cost of medications across populations, just as the CMS-HCC model normalizes the expected cost of medical treatments. Despite the name, the RxHCC model is derived from medical claims – not pharmacy claims. The RxHCC model overlaps with CMS-HCC to a considerable degree; many times the same diagnosis will close both an HCC and an RxHCC, although there are some diagnoses that only roll up to RxHCCs and not HCCs. Many risk adjustment models feature this separation between the medical and prescription drug portions of the model (Medicare CMS-HCC and CMS-RxHCC; Medicaid CPDS and MRX; ACA HHS-HCC and RXC.)

---


{% include link-list.md %}
