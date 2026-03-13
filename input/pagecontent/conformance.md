<div class="new-content" markdown="1">
### Conformance Language

§This implementation guide makes use of conformance language such as **SHALL**, **SHOULD** and **MAY** to describe the behavior of systems.§

§The meaning of these words **SHALL** be interpreted as per the [FHIR core spec]({{site.data.fhir.path}}conformance-rules.html#conflang).§

This implementation guide also adheres to the general Da Vinci-wide conformance guidance defined in the [Da Vinci Health Record Exchange (HRex)](https://hl7.org/fhir/us/davinci-hrex/STU1.1/conformance.html) implementation guide. 

### MustSupport

Certain elements in the profiles defined in this implementation guide are marked as Must Support. §This flag is used to indicate that the element plays a critical role in defining and sharing value-based performance reports, and implementations **SHALL** understand and process the mustSupport elements.§

This IG uses US Core profiles where appropriate, therefore, the implications of the Must Support flag for US Core profiles must also be followed. See the mustSupport rules for the [US Core]({{site.data.fhir.ver.uscore7}}/must-support.html), which apply to content adhering to data elements profiled in those guides. 

The rules around mustSupport elements defined in [HRex](https://hl7.org/fhir/us/davinci-hrex/STU1.1/conformance.html#mustsupport) are also expected to apply to all Da Vinci implementation guides. 

For more information, see the definition of [Must Support](http://hl7.org/fhir/R4/conformance-rules.html#mustSupport) in the base FHIR specification.

### CapabilityStatement Requirements 
§In order to conform to this implementation guide, in addition to adhering to any relevant 'SHALL' statements, a system **SHALL** conform to at least one of the CapabilityStatements based on their role(s) listed here:§

* [Risk Adjustment Reporting Server Capability Statement](CapabilityStatement-ra-reporting-server.html)
* [Risk Adjustment Reporting Client Capability Statement](CapabilityStatement-ra-reporting-client)
* [Risk Adjustment Data Submission Client Capability Statement](CapabilityStatement-ra-data-submission-client.html)
* [Risk Adjustment Data Submission Server Capability Statement](CapabilityStatement-ra-data-submission-server.html)
<div>