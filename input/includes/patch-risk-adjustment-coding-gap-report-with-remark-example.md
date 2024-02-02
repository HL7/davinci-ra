#### Examples
{:.no_toc}

**Scenario:**

A Provider receives a Risk Adjustement Gaps Report from a Payer.  The Provider uses PATCH to update the Report at the Payer with just the Remark information they add at time of visit.

**PATCH Risk Adjustment Coding Gaps Report with Remarks**

```
PATCH [base]/measure/ra-measurereport01
```

**Request body**
~~~
{
    "resourceType": "Parameters",
    "id": "ra-measurereport01",
    "parameter": [
        {
            "name": "operation",
            "part": [
                {
                    "name": "type",
                    "valueCode": "add"
                },
                {
                    "name": "path",
                    "valueString": "MeasureReport.group.where(id='group-001')"
                },
                {
                    "name": "name",
                    "valueString": "extension"
                },
                {
                    "name": "value",
                    "part": [
                        {
                            "name": "url",
                            "valueUri": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-ccRemark"
                        },
                        {
                            "name": "extension",
                            "part": [
                                {
                                    "name": "url",
                                    "valueUri": "authorDatetime"
                                },
                                {
                                    "name": "value",
                                    "valueDateTime": "2023-12-11"
                                }
                            ]
                        }
                    ]
                }
            ]
        },
        {
            "name": "operation",
            "part": [
                {
                    "name": "type",
                    "valueCode": "add"
                },
                {
                    "name": "path",
                    "valueString": "MeasureReport.group.where(id='group-001')"
                },
                {
                    "name": "name",
                    "valueString": "extension"
                },
                {
                    "name": "value",
                    "part": [
                        {
                            "name": "url",
                            "valueUri": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-ccRemark"
                        },
                        {
                            "name": "extension",
                            "part": [
                                {
                                    "name": "url",
                                    "valueUri": "text"
                                },
                                {
                                    "name": "value",
                                    "valueString": "Example author text for a condition category."
                                }
                            ]
                        }
                    ]
                }
            ]
        },
        {
            "name": "operation",
            "part": [
                {
                    "name": "type",
                    "valueCode": "add"
                },
                {
                    "name": "path",
                    "valueString": "MeasureReport.group.where(id='group-002')"
                },
                {
                    "name": "name",
                    "valueString": "extension"
                },
                {
                    "name": "value",
                    "part": [
                        {
                            "name": "url",
                            "valueUri": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-ccRemark"
                        },
                        {
                            "name": "extension",
                            "part": [
                                {
                                    "name": "url",
                                    "valueUri": "authorDatetime"
                                },
                                {
                                    "name": "value",
                                    "valueDateTime": "2024-01-07"
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ]
}
~~~

**Response**

~~~
HTTP/1.1 200 ok
~~~
