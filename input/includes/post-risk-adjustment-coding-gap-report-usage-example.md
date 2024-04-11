
#### Examples
{:.no_toc}

**Scenario:**

A payer posts a risk adjustment coding gap report for patient, *ra-patient01*, to let the provider know if the patient has any risk adjustment coding gaps for the clinical evaluation period from 2021-01-01 to 2021-09-30.

**POST Risk Adjustment Coding Gaps Report**


```
POST [base]/bundle/ra-bundle01
```

**Request body**
~~~
{
    "resourceType": "Bundle",
    "id": "ra-bundle01",
    "meta": {
        "profile": [
            "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport-bundle"
        ]
    },
    "identifier": {
        "system": "urn:ietf:rfc:3986",
        "value": "urn:uuid:8d3e72d9-9d74-4cbb-b797-a1cab0d13492"
    },
    "type": "collection",
    "timestamp": "2021-11-16T06:17:58.172+00:00",
    "entry": [
        {
            "fullUrl": "https://ra.davinci.hl7.org/fhir/MeasureReport/ra-measurereport01",
            "resource": {
                "resourceType": "MeasureReport",
                "id": "ra-measurereport01",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport"
                    ]
                },
                ...
~~~

**Response**

~~~
HTTP/1.1 200 ok
~~~
