Although the exact mechanisms for securing these exchanges are not specified as part of this IG:
- Exchanges are limited to mutually agreed upon (i.e., between the Server and the Client) patient lists or populations, and apply to all RA content exchanged for those patients such as payer‑generated RA gap reports and clinical evaluation evidence, under the security, privacy, and provenance requirements inherited from HRex and core FHIR.
- Systems should use standard authentication and authorization approaches. The [SMART App Launch] and [SMART backend services] authentication/authorization approach are recommended models.
- This implementation guide inherits all of the mandatory requirements and recommendations defined in the [Security and Privacy](https://hl7.org/fhir/us/davinci-hrex/en/security.html) section of the Da Vinci Health Record Exchange [(HRex)](https://hl7.org/fhir/us/davinci-hrex/en/index.html) implementaion guide. §Implementers **SHALL** read and adhere to the guidance for the following topics§:

    - Statutes, Regulations
    - FHIR Clinical Safy, Security and Implementation Guidance
    - Security/Privacy Related Technologies, Including Explicit Consent and Security Labels
    - Exchange Security
    - Additionally Protected Information
    - Security Contexts for Da Vinci IGs

The FHIR implementer’s [Security Principles]({{site.data.fhir.path}}security.html), [Security & Privacy Module]({{site.data.fhir.path}}secpriv-module.html), and [Implementer's Checklist]({{site.data.fhir.path}}safety.html) helps implementers to be sure that they have considered all the parts of FHIR that impact their system design regarding privacy, security, provenance, and safety.

{% include link-list.md %}
