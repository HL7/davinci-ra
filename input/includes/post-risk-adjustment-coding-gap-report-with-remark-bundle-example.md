#### Examples
{:.no_toc}

**Scenario:**

A Provider receives a Risk Adjustment Coding Gap Report from a Payer.  After seeing the patient, Provider adds Condition Category remarks to the Risk Adjustment Coding Gap Report instance received from the Payer; they then create a transaction Bundle that includes the Risk Adjustment Coding Gap Report with the added Condition Category Remark(s) along with any Resources that are referenced by the remarks, such as Organization, and POST the Bundle to Payer. 

**POST Risk Adjustment Coding Gaps Report with Remarks**

```
POST [base]/Bundle/ra-bundle02
```

**Request body**
~~~
{
    "resourceType": "Bundle",
    "id": "ra-bundle02",
    "type": "transaction",
    "timestamp": "2024-10-15T06:10:58.172+00:00",
    "entry": [
        {
            "fullUrl": "https://ra.davinci.hl7.org/fhir/MeasureReport/ra-measurereport01-with-remark",
            "resource": {
                "resourceType": "MeasureReport",
                "id": "ra-measurereport01-with-remark",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport"
                    ]
                },
                ...
            }
        },
        {                    {
            "fullUrl": "http://example.org/fhir/Encounter/ra-encounter011pat01",
            "resource": {
                "resourceType": "Encounter",
                "id": "ra-encounter011pat01",
        }
~~~

**Response**

~~~
HTTP/1.1 200 ok
~~~

