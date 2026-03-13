
This implementation guide uses terminology, notations and design principles that are specific to FHIR. Before reading this implementation guide, it is important to be familiar with some of the basic principles of FHIR as well as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

* [FHIR overview]({{site.data.fhir.path}}overview.html)
* [Developer's introduction]({{site.data.fhir.path}}overview-dev.html) (or [Clinical introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR data types]({{site.data.fhir.path}}datatypes.html)
* [Using codes]({{site.data.fhir.path}}terminologies.html)
* [References between resources]({{site.data.fhir.path}}references.html)
* [How to read resource & profile definitions]({{site.data.fhir.path}}formats.html) and additional [IG reading guidance](https://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html)
* [Base resource]({{site.data.fhir.path}}resource.html)

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard and builds on the [US Core 3.1 (FHIR R4)]({{site.data.fhir.ver.uscore3}}), [US Core 6.1 (FHIR R4)]({{site.data.fhir.ver.uscore6}}), and [US Core 7.0 (FHIR R4)]({{site.data.fhir.ver.uscore7}}) implementation guides. Implementers therefore need to familiarize themselves with those profiles as well. The general implementation notes and guidance on the resource pages of these guides will apply to Da Vinci implementations as they would in any other. A complete list of the FHIR resources in the core specification can be found [here]({{site.data.fhir.path}}resourcelist.html)

<div class="new-content" markdown="1">
The table below lists the resources profiled or otherwise used in this specification. Implementers should review the general descriptions and usage notes for these resources for additional implementation guidance.

<table class="grid">
  <thead>
    <tr>
      <th>Resource</th>
      <th>Usage</th>
    </tr>
  </thead>
  <tbody>
    <tr><td><a href="{{site.data.fhir.path}}bundle.html">Bundle</a></td><td>Used to define Bundle</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}capabilitystatement.html">CapabilityStatement</a></td><td>Used to define conformance expectations for this guide</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}codesystem.html">CodeSystem</a></td><td>Used to define custom codes specific to this guide</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}condition.html">Condition</a></td><td>Used in examples. MeasureReport.evaluatedResource could reference a Condition</td></a></td></tr>   
    <tr><td><a href="{{site.data.fhir.path}}documentreference.html">DocumentReference</a></td><td>Used in examples. MeasureReport.evaluatedResource could reference a DocumentReference</td></a></td></tr>    
    <tr><td><a href="{{site.data.fhir.path}}encounter.html">Encounter</a></td><td>Used in examples. MeasureReport.evaluatedResource could reference an Encounter</td></a></td></tr>      
    <tr><td><a href="{{site.data.fhir.path}}group.html">Group</a></td><td>Used to represent Group of patients</td></a></td></tr>    
    <tr><td><a href="{{site.data.fhir.path}}measure.html">Measure</a></td><td>Used to represent Risk Adjustment Model.</td></a></td></tr>      
    <tr><td><a href="{{site.data.fhir.path}}measurereport.html">MeasureReport</a></td><td>Used for Risk Adjustment Coding Gap Report and Risk Adjustment Data Exchange MeasureReport.</td></tr> 
    <tr><td><a href="{{site.data.fhir.path}}observation.html">Observation</a></td><td>Used in examples. MeasureReport.evaluatedResource could reference an Observation</td></a></td></tr>      
    <tr><td><a href="{{site.data.fhir.path}}operationdefinition.html">OperationdeDinition</a></td><td>Used to represent operations used by this IG</td></a></td></tr>           
    <tr><td><a href="{{site.data.fhir.path}}organization.html">Organization</a></td><td>Used to represent the reporter of the report</td></a></td></tr>    
    <tr><td><a href="{{site.data.fhir.path}}parameters.html">Parameters</a></td><td>Used to represent RA Parameters ccRemark Patch Profile</td></a></td></tr>     
    <tr><td><a href="{{site.data.fhir.path}}patient.html">Patient</a></td><td>Used to represent MeasureReport subject</td></a></td></tr>   
    <tr><td><a href="{{site.data.fhir.path}}practitioner.html">Practitioner</a></td><td>Used by Condition Category Remark extension and in examples.</td></a></td></tr>           
    <tr><td><a href="{{site.data.fhir.path}}searchparameter.html">SearchParameter</a></td><td>Used in defining additional search parameters used by this IG</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}structuredefinition.html">StructureDefinition</a></td><td>Used when defining profiles and extensions in this guide</td></tr>
    <tr><td><a href="{{site.data.fhir.path}}valueset.html">ValueSet</a></td><td>Used to define a list of codes used by Risk Adjustment profiles and extensions</td></tr>    
  </tbody>
</table>

</div>






{% include link-list.md %}

