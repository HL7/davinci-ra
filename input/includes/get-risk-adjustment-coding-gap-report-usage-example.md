
#### Examples
{:.no_toc}

**Scenario:**

A provider requested a risk adjustment coding gap report for patient, *ra-patient01*, to see if the patient has any risk adjustment coding gaps for the clinical evaluation period from 2021-01-01 to 2021-09-30.

**GET Risk Adjustment Coding Gaps Report**


```
GET [base]/MeasureReport/$report?subject=Patient/ra-patient01&periodStart=2021-01-01&periodEnd=2021-09-30
```

**Request body**
~~~
(Note that request body is not applicable in this example)
~~~

**Response**

~~~
HTTP/1.1 200
Date: Tues, 16 November 2021 01:02:06 GMT
Content-Type: application/fhir+json;charset=UTF-8
...Other Headers...

{
  "resourceType" : "Bundle",
  "id" : "ra-bundle01",
  "meta" : {
    "profile" : [
      "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport-bundle"
    ]
  },
  "identifier" : {
    "system" : "urn:ietf:rfc:3986",
    "value" : "urn:uuid:8d3e72d9-9d74-4cbb-b797-a1cab0d13492"
  },
  "type" : "collection",
  "entry" : [
    {
      "fullUrl" : "https://ra-sandbox.alphora.com/cqf-ruler-r4/fhir/MeasureReport/ra-measurereport01",
      "resource" : {
        "resourceType" : "MeasureReport",
        "id" : "ra-measurereport01",
        "meta" : {
          "profile" : [
            "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport"
          ]
        },
        "status" : "complete",
  "type" : "individual",
  "measure" : "https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01",
  "subject" : {
    "reference" : "Patient/ra-patient01"
  },
  "date" : "2021-10-18",
  "reporter" : {
    "reference" : "Organization/ra-payer01"
  },
  "period" : {
    "start" : "2021-01-01",
    "end" : "2021-09-30"
  },
  "group" : [
    {
      "id" : "group-001",
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                "code" : "historic"
              }
            ]
          }
        },

      ...

}

~~~
