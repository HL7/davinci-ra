
<div class="bg-info" markdown="1">

This section describes structure of a Condition Category Measure and specifing a Condition Category as a digital Condition Category measure using Clinical Quality Language (CQL). It also provides guidance and a framework that will allow payers/vendors to automate the process of identifying members/patients with coding gaps for a clinical evaluation period. 

###  Condition Category Measure
A Condition Category Measure is structured as a proportion measure, which consists of an initial population, denominator, numerator, and an optional denominator exclusions as shown in the Vann diagram in Figure 4-1. 

{% include img-portrait.html img="dCC-vann-diagram.png" caption = "Figure 4-1: Condition Category Measure Vann Diagram" %}

| Population | Definition | 
|:----|:----|
| Initial Population | The initial population refers to all patients to be evaluated by a Condition Category Measure involving patients who share a common set of specified characteristics. All patients counted are drawn from the initial population. |
| Denominator | The denominator population includes 1) historic gaps that are either open or closed 2) net new gaps 3) suspected gaps that are either open or closed. |
| Denominator Exclusions| Exclusion criteria that define patients to be removed from the denominator. |
| Numerator| The numerator population includes closed historic gaps, net new gaps and closed suspected gaps.|
{: .grid}

- Closed gaps are patients with confirmed coding gap and have an eligible encounter diagnosis during the current clinical evaluation period.
- historic gaps open are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and have coding gaps that are open. 
- historic gaps closed are defined as patients with an eligible encounter diagnosis outside of the current clinical evaluation period and coding gaps are closed. 
- suspected open or closed gaps are determined using payers/vendors' internal suspecting algorithms. 

The figure below shows a Condition Category Measure using HCC189 Amputation Status, Lower Limb/Amputation Complications as an exmaple. The initial population for HCC189 is defined as enrolled Medicare Advantage members. The denominator population for HCC189 includes all open and closed historic gaps, suspected gaps, and closed net-new gaps for the ICD-10 codes that map to HCC189, for example, Z89.411 Acquired absence of right great toe. The denominator exclusion for HCC189 defines criteria that will exlude patients from the denominator population, for example ICD-10 code M20 Acquired deformities of fingers and toes and M21 Other acquired deformities of limbs. 

{% include img-portrait.html img="HCC189-vann-diagram.png" caption = "Figure 4-2: Condition Category Measure Vann Diagram - HCC189 Example" %}


</div>