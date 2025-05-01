
This implementation guide uses terminology, notations and design principles that are specific to FHIR. Before reading this implementation guide, it is important to be familiar with some of the basic principles of FHIR as well as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html) (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard and builds on the [US Core 3.1 (FHIR R4)]({{site.data.fhir.ver.uscore3}}), [US Core 6.1 (FHIR R4)]({{site.data.fhir.ver.uscore6}}), and [US Core 7.0 (FHIR R4)]({{site.data.fhir.ver.uscore7}}) implementation guides. Implementers therefore need to familiarize themselves with those profiles as well. The general implementation notes and guidance on the resource pages of these guides will apply to Da Vinci implementations as they would in any other. A complete list of the FHIR resources in the core specification can be found [here]({{site.data.fhir.path}}resourcelist.html)

{% include link-list.md %}
