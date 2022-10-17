
<div class="bg-info" markdown="1">

**This is a new page that is under development for Jan2023 ballot.**

</div>

###  Digital Condition Category 
This implementation guide introduces digital condition categories (dCCs), a new term coined after digital quality measures (dQMs). Similar to the definitions of digital quality measures<sup>[1](https://ecqi.healthit.gov/dqm?qt-tabs_dqm=1)</sup>, digital condition categories are condition category measures organized as self-contained measure specification and code packages, that use one or more sources of health information that is captured and can be transmitted electronically via interoperable systems. Digital condition categories use machine-readable measure logic, such as logics written in in Clinical Quality Language, an use common data model such as FHIR. 

A digital condition category is structured as a proportion measure, which consists of an initial population, denominator, numerator, and an optional denominator exclusions as shown in the Vann diagram in Figure 4-1. 

{% include img-portrait.html img="dCC-vann-diagram.png" caption = "Figure 4-1: Condition Category Measure Vann Diagram" %}

**Table 4-1: Condition Category Measure Population.**

| Population | Definition | 
|:----|:----|
| Initial Population | The initial population refers to all patients to be evaluated by a Condition Category Measure involving patients who share a common set of specified characteristics. All patients counted are drawn from the initial population. |
| Denominator | The denominator population includes 1) historic gaps that are either open or closed 2) suspected gaps that are either open or closed. 3) net new. Note that gaps that are net news are typically always closed.|
| Denominator Exclusions| Exclusion criteria that define patients to be removed from the denominator. |
| Numerator| The numerator population includes closed historic gaps, net news, and closed suspected gaps.|
{: .grid}

- Closed gaps are patients with confirmed coding gap and have an eligible encounter diagnosis during the current clinical evaluation period.
- historic gaps open are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and have coding gaps that are open. 
- historic gaps closed are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and coding gaps are closed. 
- suspected open or closed gaps are determined using payers/vendors' internal suspecting algorithms. 

###  Example Digital Condition Category 
Figure 4-2 is a Vann diagram that shows the condition catetory measure population using a hiearchical condition category code, HCC189 "Amputation Status, Lower Limb/Amputation Complications" as an exmaple. 
- The initial population for HCC189 is defined as enrolled Medicare Advantage members. 
- The denominator population for HCC189 includes all open and closed historic gaps, suspected gaps, and closed net-new gaps for the ICD-10 codes that map to HCC189, for example, Z89.411 Acquired absence of right great toe. 
- The denominator exclusion for HCC189 defines criteria that will exlude patients from the denominator population, for example ICD-10 code M20 Acquired deformities of fingers and toes and M21 Other acquired deformities of limbs. 

{% include img-portrait.html img="hcc-189-vann-diagram.png" caption = "Figure 4-2: Condition Category Measure Vann Diagram - HCC189 Example" %}

###  Using CQL

Specifying a digital condition category should follow the using CQL requirements specified in the [Quality Measure Implementation Guide](http://hl7.org/fhir/us/cqfmeasures/using-cql.html). 

This section describes additional considerations when specifying dCCs using CQL. 

```cql
TODO: example cql
```