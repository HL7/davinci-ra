
<div class="new-content" markdown="1">
All sections on this page are new content.
</div><!-- new-content -->
<div class="note-to-balloters" markdown="1">

**The Digital Condition Category sections are DRAFT and open for review.**

</div>

This page describes Digital Condition Categories (dCCs), a new concept introduced in this implementation guide. 

###  Benefits of Digital Condition Categories (dCCs)

Complete, accurate, and timely data collection is crucial to the long-term financial stability of Medicare Advantage (MA) and other risk adjustment programs. To ensure reliable financial reporting, diagnostic coding guidelines must be correctly applied to encounter data. In MA, coding intensity refers to observed differences in the prevalence of diagnostic coding between private MA plans and traditional Fee-For-Service Medicare. Both the Centers for Medicare and Medicaid Services (CMS) and the General Accounting Office (GAO) have long been concerned about the coding intensity issue, which resulted in an estimated $12 billion in excess Medicare spending in 2020 alone.<sup>[1](https://www.medpac.gov/wp-content/uploads/2022/03/Mar22_MedPAC_ReportToCongress_Ch12_SEC.pdf)</sup> The GAO estimates that roughly a tenth of Medicare payments to MA plans in 2021 were improper, totaling about $23 billion for the year.

Under risk adjustment, risk adjustment coders (e.g., Certified Risk Adjustment Coder (CRC)) review encounter data to determine if patients have certain medical conditions that might increase their expected cost of claims during an enrollment period. If the coders find evidence that meets quality standards, the payer can typically expect to receive a payment adjustment that is meant to offset the higher-than-expected cost of claims. Unfortunately, there is a financial incentive for payers to misuse the HCC coding process to make patients appear to be sicker than they actually are, thus generating inflated and improper payments. For this reason, coding intensity is subject to extensive regulation and safeguards. Several attempts have been made over the years to address the problem, such as correction factors and stepped-up enforcement of contract-level Risk Adjustment Data Validation (RADV) audits. These efforts have been met with only limited success, and the US Federal Government is still actively seeking a solution to the problem. 
The root cause of the problem is the improper manual application of the ICD-10-CM coding guidelines to unstructured encounter data. The operative terms here are “manual” and “unstructured”. By using Clinical Quality Language (CQL) to program the ICD-10-CM coding logic, together with FHIR resources to structure the encounter data and create a stable target for the CQL, a practical and definitive solution to the coding intensity problem may finally be at hand. Digital Condition Categories (dCCs) are the risk adjustment counterpart to Digital Quality Measures (dQMs) which are increasingly being used for the quality measure evaluation. A dCC, then, is the risk adjustment equivalent to a dQM.

During the July 2022 CMS Connectathon a dCC proof-of-concept was conducted to demonstrate automated coding for HCC 179 (amputation of lower limb). In principle, any risk-adjustable Condition Category could be coded by this method, prior to applying the HCC hierarchies.

###  Digital Condition Category 

Similar to the definitions of digital quality measures<sup>[1](https://ecqi.healthit.gov/dqm?qt-tabs_dqm=1)</sup>, digital condition categories are condition category measures organized as self-contained measure specification and code packages, that use one or more sources of health information that are captured and can be transmitted electronically via interoperable systems. Digital condition categories use machine-readable measure logic, such as logics written in Clinical Quality Language, and common data models such as FHIR. 

A digital condition category is structured as a proportion measure<sup>[2](http://hl7.org/fhir/us/cqfmeasures/measure-conformance.html#proportion-measures)</sup>, which consists of an initial population, denominator, numerator, and optional denominator exclusions as shown in the Venn diagram in Figure 3-1. 

{% include img-portrait.html img="dCC-venn-diagram.png" caption = "Figure 3-1: Condition Category Measure Venn Diagram" %}

**Table 3-1: Condition Category Measure Population.**

| Population | Definition | 
|:----|:----|
| Initial Population | The initial population refers to all patients to be evaluated by a Condition Category Measure who share a common set of specified characteristics. All patients counted are drawn from the initial population. |
| Denominator | The denominator population includes 1) historic gaps that are either open or closed 2) suspected gaps that are either open or closed 3) net-new gaps. Note that gaps that are net-news are always closed.|
| Denominator Exclusions| Exclusion criteria that defines patients to be removed from the denominator. |
| Numerator| The numerator population includes closed historic gaps, closed suspected gaps, and net-new Condition Categories (CCs).|
{: .grid}

- **Closed gaps** are patients with confirmed coding gaps and have an eligible encounter diagnosis during the current clinical evaluation period.
- **Historic open gaps** are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and have coding gaps that are open. 
- **Historic closed gaps** are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and have coding gaps that are closed. 
- **Suspected open or closed** gaps are determined using payers/vendors' internal suspecting algorithms. 

###  Example Digital Condition Category 
Figure 3-2 is a Venn diagram that shows the condition catetory measure population using a hierarchical condition category code, HCC189 "Amputation Status, Lower Limb/Amputation Complications" as an exmaple. 
- The initial population for HCC189 is defined as enrolled Medicare Advantage members. 
- The denominator population for HCC189 includes all open and closed historic gaps, suspected gaps, and closed net-new gaps for the ICD-10 codes that map to HCC189, for example, Z89.411 Acquired absence of right great toe. 
- The denominator exclusion for HCC189 defines criteria that will exclude patients from the denominator population, for example ICD-10 code M20 Acquired deformities of fingers and toes and M21 Other acquired deformities of limbs. 

{% include img-portrait.html img="hcc-189-venn-diagram.png" caption = "Figure 3-2: Condition Category Measure Venn Diagram - HCC189 Example" %}

###  $ra.evaluate-measure Operation

[$ra.evaluate-measure] to dCCs would be considered as equivalent to using [$evaluate-measure](https://www.hl7.org/fhir/measure-operation-evaluate-measure.html) to calculate an eMeasure and obtain the results.  

The $ra.evaluate-measure operation requires four input (IN) parameters: subject, periodStart, periodEnd, and one of the measure parameters (measureId, measureIdentifier, or measureUrl). The subject parameter references either a single patient or a group of patients (as specified in the Patient Group profile). The term clinical evaluation period refers to the time period during which the risk adjusting encounters could be conducted and documented with expectations of submissions for risk adjustment purposes. The periodStart and periodEnd parameters are the start and end dates of the clinical evaluation period. The measure parameter identifies the measure definition of a risk adjustment model that will be used to calculate dCCs.

###  Using CQL

Specifying a digital condition category should follow the using CQL requirements specified in the [Quality Measure Implementation Guide](http://hl7.org/fhir/us/cqfmeasures/using-cql.html). Future versions of this IG may specify additional requirements for specifying dCCs using CQL and provide examples.

{% include link-list.md %}

