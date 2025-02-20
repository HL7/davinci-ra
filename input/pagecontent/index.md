

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

- **Background**: These pages provide background information to this IG.  
    - [FHIR Introduction](fhir.html) highlights the key sections of the FHIR core specification that Da Vinci implementers should be familiar with.
    - [Background - Risk Adjustment](background.html) provides background information about risk adjustment for revenue normalization, risk adjustment models, scope of this IG, and etc. 
    - [Participants and Credits](credits.html) provides thanks to key contributors to the creation of this guide.
    - [Glossary](glossary.html) lists glossary and acronyms for this guide.
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
    - [Search Parameters](search-parameters.html) lists Search Parameter defined in this IG.
    - [Operations] lists operations defined in this IG.
    - [Terminology] lists code systems and value sets defined in this IG.
    - [Capability statements] describes the expected FHIR capabilities of the risk adjustment actors of this IG.
    - [Examples] lists all the examples used in this IG.

- **Base Specs** includes links to the FHIR core specification as well as the US Core specs that underlie this IG.
- **Support** includes various links for support and guidance, as well as [Downloads] links for this IG and guidance on tools and support for Da Vinci implementers.


### Dependencies
At present, the Risk Adjustment IG is based on [FHIR R4]({{site.data.fhir.path}}).  In addition, this guide also relies on a number of parent implementation guides:

{% include dependency-table-short.xhtml %}

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.

As seen in the above table, this implementation guide is dependent on the [US Core 3.1 (FHIR R4)]({{site.data.fhir.ver.uscore3}}), [US Core 6.1 (FHIR R4)]({{site.data.fhir.ver.uscore6}}) and [US Core 7.0 (FHIR R4)]({{site.data.fhir.ver.uscore7}}) implementation guides.  The first is supported for those systems limited to [United States Core Data for Interoperability (USCDI) v1](https://www.healthit.gov/isp/united-states-core-data-interoperability-uscdi) capabilities, the second is for upcoming regulatory requirements mandating support for [USCDI v3](https://www.healthit.gov/isp/united-states-core-data-interoperability-uscdi#uscdi-v3), and the last is to enable support for proposed regulations mandating support for [USCDI v4](https://www.healthit.gov/isp/united-states-core-data-interoperability-uscdi#uscdi-v4).  Wherever possible, Da Vinci profiles strive to comply with all three releases, simplifying implementation for those who will need to support varying regulatory expectations over time.


### Intellectual Property Considerations
This implementation guide and the underlying FHIR specification are licensed as public domain under the [FHIR license](http://hl7.org/fhir/R4/license.html#license). The license page also describes rules for the use of the FHIR name and logo.

{% include ip-statements.xhtml %}
---


{% include link-list.md %}
