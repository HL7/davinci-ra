
#### Examples
{:.no_toc}

**Scenario:**

A Provider would like to know his patient, *ra-ra-patient01*, has any risk adjustment codes or suspected risk adjustment codes for the period from 2021-01-01 to 2021-12-31. The Client requested a Risk Adjustment Coding Gap Report on 2021-06-30.

**GET Risk Adjustment Coding Gaps Report**


```
GET [base]/MeasureReport/$report?subject=Patient/ra-ra-patient01&periodStart=2021-01-01&periodEnd=2021-12-31
```

**Request body**
~~~
(Note that request body is not applicable in this example)
~~~

**Response**

~~~
HTTP/1.1 200
Date: Wed, 22 July 2020 01:02:06 GMT
Content-Type: application/fhir+json;charset=UTF-8
...Other Headers...

{
  "resourceType": "Bundle",
  "id": "single-ra-coding-gap-report01",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/gaps-bundle-deqm"
    ]
  },
  "identifier": {
    "system": "urn:ietf:rfc:3986",
    "value": "urn:uuid:77f43ef5-8c60-4222-ae58-36969063a093"
  },
  "type": "collection",
  "timestamp": "2021-06-30T13:08:53+00:00",
  "entry": [
    {
      
}

~~~
