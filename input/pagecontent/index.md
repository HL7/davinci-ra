
<div markdown="1" class="bg-info">
<b>The Da Vinci Risk Adjustment Implementation Guide is under development</b>
</div>

###  Summary

This Fast Healthcare Interoperability Resource (FHIR) Risk Adjustment Implementation Guide (IG) describes exchanging Risk Adjustment coding gaps between Payers and Providers. The first phase of this IG focuses on the standard exchange format from Payers to Providers.

This Implementation Guide is supported by the Da Vinci initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities.

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar:

- [Home]\: The home page provides the summary and background information for the FHIR Risk Adjustment FHIR IG.

- [Risk Adjustment]\: The risk adjustment page describes risk adjustment models such as the Hiearchical Condition Category (HCC).

- [Guidance]\: The guidance page provides guidance on the resource profiles and operation defined in this implementation guide.

- [FHIR Artifacts/Profiles]\: This page lists the set of Profile that are defined in this guide to exchange Risk Adjustment coding gaps.

- [FHIR Artifacts/Extensions]\: This page lists the set of Profile that are defined in this guide to exchange Risk Adjustment coding gaps.

- [FHIR Artifacts/Operations]\: This page lists operations defined in this guide.

- [FHIR Artifacts/Terminology]\: This page lists code systems and value sets defined in this guide.

- [FHIR Artifacts/Capability statements]\: This page describes the expected FHIR capabilities of the various DEQM actors.

- [Examples]\: List of all the examples used in this guide.

- [Glossary/Acronyms]\: List of acronyms for this guide.

- [Glossary/Glossary]\: List of glossary for this guide.

- [Downloads]\: This page provides links to downloadable artifacts.

### Background
{: #background}
Risk adjustment is a method of adjusting capitation payments to health plans, to account for the differences in expected health cost of individuals enrolled in the plan. Capitation payments are an incentive for health plans to enroll not only healthier individual but those with chronic conditions or who are more seriously ill by removing some of the financial burden [1], shifting the focus of plan competition to plan benefits, quality, efficiency, and value. Risk adjustment is intended to be accurate at the group level. At the individual level, predicted medical costs can be lower or higher than actual medical costs, but at the group level, below-average predicated costs balance out above-average predicated costs.

Risk adjustment is important to Centers for Medicare and Medicaid Services (CMS) capitation payment. The CMS Medicare Advantage program, through which private plans provide health insurance to Medicare beneficiaries, utilizes a risk adjustment mechanism, as does the Medicare Part D program, which provides prescription drug insurance through private plans to Medicare beneficiaries [2]. Risk adjustment model is also used by Medicaid, Accountable Care Act (ACA) plans, and private health insurances.

There are different risk adjustment models for different populations, such as CMS Hierarchical Condition Category (CMS-HCC), HHS-HCC, the Chronic Illness and Disability Payment System (CDPS), and commercial ones. While the design of this guide is agonistic so it can support other risk adjustment models, it focuses on the CMS-HCC used by the CMS Medicare Advantage program.

The risk adjustment process occurs annually and requires capturing each member’s full burden of illness [3]. Risk adjustment is particularly important for Medicare Advantage patients. Every January 1, Medicare wipes the state clean for all members and everyone is considered completely healthy until diagnosis codes are reported. Therefore, it is important for providers to evaluate and accurately document all conditions related to the patient’s health status annually. This will ensure that payer data is up-to-date and will therefore maximize the resources available to the providers and patients. If a chronic condition is not reported annually, it indicates the condition is resolved and no longer exists, leading to an inaccurate depiction of the patient’s health status and inaccurate risk scores set by the payer [4].

Accurate and complete documentation of chronic illnesses are the biggest implementation challenges for risk adjustment. To better inform providers of opportunities to address adjusted conditions, better enable payers to communicate risk adjustment information, and enhance government sponsors' ability to allocate funding accurately. Payers need a standard protocol to share and receive clinical data related to risk adjustment with responsible providers. Providers need a standard protocol to share and receive clinical data related to risk adjustment with responsible payers. Both payers and providers also need a standard methodology to communicate risk based coding, documentation and submission status of chronic illnesses. The purpose of this guide is to specify a standard methodology (format) to communicate risk-based coding gaps between payers and providers for individuals or group of patients, which would help drive accurate and complete documentation of health conditions

### Risk Adjustment of Capitation Payment vs. Risk Adjustment in Quality Measurement

The term *risk adjustment* has been used in capitated payment calculations and in quality measurement and may present different meaning to the payer and quality measurement communities. This guide is focused solely on the risk adjustment for capitation payment. It is not intended to cover the topic of risk adjustment in quality measurement.

Risk adjustment in quality measurement refers to the inclusion of risk factors associated with a measure score in a statistical model of provider performance captured at the person, facility, community, or other levels. It promotes fair and accurate comparison of healthcare outcomes across healthcare organizations and providers.[5] Measure developers often risk adjust outcome measures, however not all measures need risk adjustment. The Quality Measure Implementation Guide and the Da Vinci Data Exchange for Quality Measurement Implementation Guide are the FHIR implementation guides where the topic of risk adjustment in quality measurement would be covered.

### Audience


### Scope

<img src="workflow-medicare-advantage.png" alt="Figure 1-1 Workflow for Medicare Advantage Population" class="img-responsive img-rounded center-block"/>

<b>Phase One Goal and Scope</b>
- *Goal*: Define standard methodology (format) for Payers to communicate coding gaps to Providers.
- *In Scope*:
  - Payer communicates risk adjustment coding gaps report to Provider group (for individual or group of Members).
  - Focus on CMS-HCC Risk Adjustment Model - for Medicare Advantage Program, but make sure that we will keep it agonistic enough that  is able to support other models such as HHS-HCC, commercial models maybe used by Medicaid.
  - Focus on medical Risk Adjustment Model. RxC (prescription drug category) is out of scope, since it uses pharmacy data to determine risk adjustment. RxHCC is in scope, since it uses diagnosis to determine risk adjustment similar to HCC.  
- *Potential Topics to Address in Phase Two*
  - Support HCC Performance Gaps
  - Invalidation of HCC gaps
- *Out of Scope*:
  - How a Payer determine a coding gap is out of scope
  - How gaps are produced or managed on the Payer side, include hierarchies, interaction actors, and demographics
  - FHIR based exchange from Payer to CMS is out of scope (only focus on from Payer to Provider in phase one)
  - How does Providers (EMR on Provider side) communicate back to Payer (Addressing information/data flow from Provider to Payer) is out of scope for Phase One but could potentially be for Phase Two
Mechanism for Providers to communicate HCC invalidations to Payer is out of scope for Phase One but could potentially be for Phase Two
Depending on the HCC, the invalidation rates varies based on a number of variables - the quality of the suspecting, the characteristics of the disease, etc.
  - Suspecting process and algorithms/predictive models that are used for suspecting analytics are out of scope of this Use Case
Payers communication to Providers on patient Attribution


---

{% include link-list.md %}
