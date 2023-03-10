
<div class="new-content" markdown="1">
All sections on this page are new content.
</div><!-- new-content -->
<div class="note-to-balloters" markdown="1">

**The Digital Condition Category sections are DRAFT and open for review.**

</div>

###  Benefits of Digital Condition Categories (dCCs)

Complete, accurate, and timely data collection is crucial to the long-term financial stability of Medicare Advantage (MA) and other risk adjustment programs. To ensure reliable financial reporting, diagnostic coding guidelines must be correctly applied to encounter data. In MA coding intensity refers to observed differences in the prevalence of diagnostic coding between private MA plans and traditional Fee-For-Service Medicare. Both the Centers for Medicare and Medicaid Services (CMS) and the General Accounting Office (GAO) have long been concerned about the coding intensity issue, which resulted in an estimated $12 billion in excess Medicare spending in 2020 alone. The GAO estimates that roughly a tenth of Medicare payments to MA plans in 2021 were improper, totaling about $23 billion for the year.

Under risk adjustment, risk adjustment coders (e.g., Certified Risk Adjustment Coder (CRC)) review encounter data to determine if patients have certain medical conditions that might increase their expected cost of claims during an enrollment period. If the coders find evidence that meets quality standards, the payer can typically expect to receive a payment adjustment that is meant to offset the higher-than-expected cost of claims. Unfortunately, there is a financial incentive for payers to misuse the HCC coding process to make patients appear to be is sicker than they actually are, thus generating inflated and improper payments. For this reason, coding intensity is subject to such extensive regulation and safeguards. Several attempts have been made over the years to address the problem, such as correction factors and stepped-up enforcement of contract-level Risk Adjustment Data Validation (RADV) audits. These efforts have met with only limited success, and the US Federal Government is still actively seeking a solution to the problem. 
The root cause of the problem is the improper manual application of the ICD-10-CM coding guidelines to unstructured encounter data. The operative terms here are “manual” and “unstructured”. By using Clinical Quality Language (CQL) to program the ICD-10-CM coding logic, together with FHIR resources to structure the encounter data and create a stable target for the CQL, a practical and definitive solution to the coding intensity problem may finally be at hand. Digital Condition Categories (dCCs) are the risk adjustment counterpart to Digital Quality Measures (dQMs) which are increasingly being used for the quality measure evaluation. A dCC, then, is the risk adjustment equivalent to a dQM.

During the July 2022 CMS Connectathon a dCC proof-of-concept was conducted to demonstrate automated coding for HCC 179 (amputation of lower limb). In principle, any risk adjustable Condition Category could be coded by this method, prior to applying the HCC hierarchies.

###  Digital Condition Category 

Similar to the definitions of digital quality measures<sup>[1](https://ecqi.healthit.gov/dqm?qt-tabs_dqm=1)</sup>, digital condition categories are condition category measures organized as self-contained measure specification and code packages, that use one or more sources of health information that is captured and can be transmitted electronically via interoperable systems. Digital condition categories use machine-readable measure logic, such as logics written in Clinical Quality Language, and use common data model such as FHIR. 

A digital condition category is structured as a proportion measure<sup>[2](http://hl7.org/fhir/us/cqfmeasures/measure-conformance.html#proportion-measures)</sup>, which consists of an initial population, denominator, numerator, and an optional denominator exclusions as shown in the Venn diagram in Figure 4-1. 

{% include img-portrait.html img="dCC-venn-diagram.png" caption = "Figure 4-1: Condition Category Measure Venn Diagram" %}

**Table 4-1: Condition Category Measure Population.**

| Population | Definition | 
|:----|:----|
| Initial Population | The initial population refers to all patients to be evaluated by a Condition Category Measure involving patients who share a common set of specified characteristics. All patients counted are drawn from the initial population. |
| Denominator | The denominator population includes 1) historic gaps that are either open or closed 2) suspected gaps that are either open or closed. 3) net new. Note that gaps that are net news are typically always closed.|
| Denominator Exclusions| Exclusion criteria that define patients to be removed from the denominator. |
| Numerator| The numerator population includes closed historic gaps, net news, and closed suspected gaps.|
{: .grid}

- **Closed gaps** are patients with confirmed coding gap and have an eligible encounter diagnosis during the current clinical evaluation period.
- **Historic gaps open** are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and have coding gaps that are open. 
- **Historic gaps closed** are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and coding gaps are closed. 
- **Suspected open or closed** gaps are determined using payers/vendors' internal suspecting algorithms. 

###  Example Digital Condition Category 
Figure 4-2 is a Venn diagram that shows the condition catetory measure population using a hierarchical condition category code, HCC189 "Amputation Status, Lower Limb/Amputation Complications" as an exmaple. 
- The initial population for HCC189 is defined as enrolled Medicare Advantage members. 
- The denominator population for HCC189 includes all open and closed historic gaps, suspected gaps, and closed net-new gaps for the ICD-10 codes that map to HCC189, for example, Z89.411 Acquired absence of right great toe. 
- The denominator exclusion for HCC189 defines criteria that will exlude patients from the denominator population, for example ICD-10 code M20 Acquired deformities of fingers and toes and M21 Other acquired deformities of limbs. 

{% include img-portrait.html img="hcc-189-venn-diagram.png" caption = "Figure 4-2: Condition Category Measure Venn Diagram - HCC189 Example" %}

###  $ra.evaluate-measure Operation

{% include img-portrait.html img="evaluate-measure-payer-to-provider.png" caption = "Figure 14-1: Evaluate Measure - Payer to Provider" %}

{% include img-portrait.html img="evaluate-measure-payer-server.png" caption = "Figure 14-2: Evaluate Measure - Payer Server" %}

{% include img-portrait.html img="evaluate-measure-provider-server.png" caption = "Figure 14-3: Evaluate Measure - Provider Server" %}

###  Using CQL

Specifying a digital condition category should follow the using CQL requirements specified in the [Quality Measure Implementation Guide](http://hl7.org/fhir/us/cqfmeasures/using-cql.html). 

