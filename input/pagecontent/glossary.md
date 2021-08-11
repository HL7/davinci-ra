
<div markdown="1" class="bg-info">
<b>The Da Vinci Risk Adjustment Implementation Guide is under development</b>
</div>

{: #hcc-model}Hierarchical Condition Category (HCC) Model
  : A risk adjustment model that is used to calculate risk scores to predict future healthcare costs. There are two types of HCC models. The CMS-HCC Risk Adjustment Model is used for Medicare Advantage Program. The HHS-HCC Risk Adjustment Model is used for commercial payer populations and covers all age. Medicaid has more flexibility, they may use any model, such as Chronic Illness & Disability Payment system (CDPS), 3M model.


{: #hcc}Hierarchical Condition Category
  : A set of codes that categorizes ICD diagnosis codes into disease groups that are similar both clinically and financially.


{: #condition-category}Condition Category
  : A group of diagnoses. Diabetes have 3 categories 17, 18, 19 (19 being most severe). Condition Category are categories before the hierarchy has been applied.


{: #historic-condition}Historic Condition
  : Condition that has been seen in the past (that was documented on a claim from a previous year or documented from other data source, e.g., Model Output report (MOR), or chart from a prior year) but not yet confirmed in the current year. Historic Condition may also be referred to as Certified Condition by some Payers. This may also called Persistent Condition. Many historic conditions are persistent.  


{: #suspected-condition}Suspected Condition
  : Condition that is not diagnosed or documented in the current year, but are suspected by the Payer based on AI algorithms using data such as lab results and procedures. Suspected Condition may also be referred to as Potential Condition by some Payers.


{: #confirmed-status}Evidence Status - Confirmed
  : HCC exists for the Member for the relevant year and can be used for risk adjustment for that year. HCC may be confirmed by a claim submitted for the current year or confirmed by other sufficient documentations such as a CMS Model Output Report (MOR). Evidence status confirmed may also known as evidence status closed.  


{: #unconfirmed-status}Evidence Status - Unconfirmed
  : HCC does not exist for the Member for the relevant year and can not be used for risk adjustment for that year until evidence is confirmed. Evidence status unconfirmed may also known as evidence status open.  

---

{% include link-list.md %}
