
<div markdown="1" class="bg-info">
<b>The Da Vinci Risk Adjustment Implementation Guide is under development</b>
</div>

###  Summary

This Fast Healthcare Interoperability Resource (FHIR) Risk Adjustment Implementation Guide (IG) describes exchanging Risk Adjustment coding gaps between Payers and Providers. The first phase of this IG focuses on the standard exchange format from Payers from Providers.

This Implementation Guide is supported by the Da Vinci initiative which is a private effort to accelerate the adoption of Health Level Seven International Fast Healthcare Interoperability Resources (HL7® FHIR®) as the standard to support and integrate value-based care (VBC) data exchange across communities.

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar:

- [Home]\: The home page provides the summary and background information for the FHIR Risk Adjustment FHIR IG.

- [Introduction]\: The introduction provides [TODO].

- [HCC]\: The Hiearchical Condition Category page [TODO].

- [FHIR Artifacts/Profiles]\: This page lists the set of Profile that are defined in this guide to exchange Risk Adjustment coding gaps.

- [FHIR Artifacts/Extensions]\: This page lists the set of Profile that are defined in this guide to exchange Risk Adjustment coding gaps.

- [FHIR Artifacts/Operations]\: This page lists operations defined in this guide.

- [FHIR Artifacts/Terminology]\: This page lists code systems and value sets defined in this guide.

- [FHIR Artifacts/Capability statements]\: This page describes the expected FHIR capabilities of the various DEQM actors.

- [Examples]\: List of all the examples used in this guide.

- [Glossary]\: List of glossary for this guide.

- [Downloads]\: This page provides links to downloadable artifacts.


### Background
{: #background}

### Scope
<b>Phase One Goal and Scope</b>
- *Goal*: Define standard methodology (format) for Payers to communicate coding gaps to Providers.
- *In Scope*: Payer communicates risk coding report to Provider group (for individual or group of Members).
 Focus on CMS-HCC Risk Adjustment Model - for Medicare Advantage Program, but make sure that we will keep it agonistic enough that  is able to support other models such as HHS-HCC, commercial models maybe used by Medicaid
Focus on medical Risk Adjustment Model. RxC (prescription drug category) is out of scope, since it uses pharmacy data to determine risk adjustment. RxHCC is in scope, since it uses diagnosis to determine risk adjustment similar to HCC.  
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

### Acronyms

---

{% include link-list.md %}
