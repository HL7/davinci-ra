#### Examples
{:.no_toc}

**Scenario:**

A Provider receives a Risk Adjustment Gaps Report from a Payer.  After seeing the patient, Remarks are added to the full report and it is updated at the Payer.

**PUT Risk Adjustment Coding Gaps Report with Remarks**


```
PUT [base]/MeasureReport/ra-measurereport01
```

**Request body**
~~~
{
    "resourceType": "MeasureReport",
    "id": "ra-measurereport01",
    "meta": {
        "profile": [
            "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-measurereport"
        ]
    },
    "extension": [
        {
            "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-clinicalDataCollectionDeadline",
            "valueDate": "2022-03-31"
        }
    ],
    "status": "complete",
    "type": "individual",
    "measure": "https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01",
    "subject": {
        "reference": "Patient/ra-patient01"
    },
    "date": "2021-10-18",
    "reporter": {
        "reference": "Organization/ra-payer01"
    },
    "period": {
        "start": "2021-01-01",
        "end": "2021-09-30"
    },
    "group": [
        {
            "id": "group-001",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "18",
                        "display": "Diabetes with Chronic Complications"
                    }
                ],
                "text": "HCC 18: Diabetes with Chronic Complications"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "historic",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "closed-gap",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2021-04-01"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-not-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                }
            ]
        },
        {
            "id": "group-002",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "111",
                        "display": "Chronic Obstructive Pulmonary Disease"
                    }
                ],
                "text": "HCC 111: Chronic Obstructive Pulmonary Disease"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "historic",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "pending",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2021-09-29"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-not-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                }
            ]
        },
        {
            "id": "group-003",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "59",
                        "display": "Major Depressive, Bipolar, and Paranoid Disorders"
                    }
                ],
                "text": "HCC 59: Major Depressive, Bipolar, and Paranoid Disorders"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "historic",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "open-gap",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2020-07-15"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-not-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-ccRemark",
                    "extension": [
                        {"url": "author",
                        "valueIdentifier": {
                            "system": "http://hl7.org/fhir/sid/us-npi",
                            "value": "1234567890"
                            }
                        },
                        {"url": "authorDatetime",
                        "valueDateTime": "2021-11-01"
                        },
                        {"url": "text",
                        "valueString": "Diagnosis added"
                        },
                        {"url": "code",
                            "valueCodeableConcept" : {
                                "coding": [
                                    {
                                    "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/coding-gap-remark",
                                    "code": "assessed-present",
                                    "display": "Assessed and present"
                                    }
                                ]
                            }
                        },
                        {"url": "relatedDataIdentifier",
                            "valueIdentifier":  {
                                "system": "http://example.org/fhir/myclaimno",
                                "value": "CLM23333"}
                        }
                    ]
                }
            ]
        },
        {
            "id": "group-004",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "112",
                        "display": "Fibrosis of lung and other chronic lung disorders"
                    }
                ],
                "text": "HCC 112: Fibrosis of lung and other chronic lung disorders"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "historic",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "closed-gap",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2021-04-27"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                }
            ]
        },
        {
            "id": "group-005",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "19",
                        "display": "Diabetes without Complications"
                    }
                ],
                "text": "HCC 19: Diabetes without Complications"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "historic",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "pending",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2021-09-27"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                }
            ]
        },
        {
            "id": "group-006",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "84",
                        "display": "Cardio-Respiratory Failure and Shock"
                    }
                ],
                "text": "HCC 84: Cardio-Respiratory Failure and Shock"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "historic",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "open-gap",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2020-12-15"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-ccRemark",
                    "extension": [
                        {"url": "author",
                            "valueIdentifier": {
                            "system": "http://hl7.org/fhir/sid/us-npi",
                            "value": "1234567890"
                            }
                        },
                        {"url": "authorDatetime",
                        "valueDateTime": "2021-11-01"
                        },
                        {"url": "text",
                        "valueString": "Continue evaluation"
                        },
                        {"url": "code",
                            "valueCodeableConcept" : {
                                "coding": [
                                    {
                                    "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/coding-gap-remark",
                                    "code": "deferred",
                                    "display": "Deferred"
                                    }
                                ]
                            }
                        }
                    ]
                }
            ]

        },
        {
            "id": "group-007",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "22",
                        "display": "Morbid Obesity"
                    }
                ],
                "text": "HCC 22: Morbid Obesity"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "suspected",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "closed-gap",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2021-03-15"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-not-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                }
            ]
        },
        {
            "id": "group-008",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "96",
                        "display": "Specified Heart Arrhythmias"
                    }
                ],
                "text": "HCC 96: Specified Heart Arrhythmias"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "suspected",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "pending",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2021-09-27"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-not-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                }
            ]
        },
        {
            "id": "group-009",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "110",
                        "display": "Cystic Fibrosis"
                    }
                ],
                "text": "HCC 110: Cystic Fibrosis"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "suspected",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "open-gap",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2020-07-15"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-not-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-confidenceScale",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "255508009",
                                "system": "http://snomed.info/sct",
                                "display": "Medium"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-ccRemark",
                    "extension": [
                        {"url": "author",
                        "valueIdentifier": {
                            "system": "http://hl7.org/fhir/sid/us-npi",
                            "value": "1234567890"
                            }
                        },
                        {"url": "authorDatetime",
                        "valueDateTime": "2021-11-01"
                        },
                        {"url": "text",
                        "valueString": "Not diagnosed"
                        },
                        {"url": "code",
                            "valueCodeableConcept" : {
                                "coding": [
                                    {
                                    "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/coding-gap-remark",
                                    "code": "assessed-not-present"
                                    
                                    }
                                ]
                            }
                        },
                        {"url": "relatedDataIdentifier",
                            "valueIdentifier":  {
                                "system": "http://example.org/fhir/mychart",
                                "value": "432203939"}
                        }
                    ]
                }
            ]
        },
        {
            "id": "group-010",
            "code": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                        "version": "24",
                        "code": "83",
                        "display": "Respiratory Arrest"
                    }
                ],
                "text": "HCC 83: Respiratory Arrest"
            },
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "net-new",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "pending",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status"
                            }
                        ]
                    }
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                    "valueDate": "2021-09-28"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-hierarchicalStatus",
                    "valueCodeableConcept": {
                        "coding": [
                            {
                                "code": "applied-not-superseded",
                                "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/hierarchical-status"
                            }
                        ]
                    }
                }
            ]
        }
    ],
    "evaluatedResource": [
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-001"
                }
            ],
            "reference": "Condition/ra-condition02pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-002"
                }
            ],
            "reference": "Condition/ra-condition03pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-003"
                }
            ],
            "reference": "Condition/ra-condition08pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-004"
                }
            ],
            "reference": "Condition/ra-condition09pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-005"
                }
            ],
            "reference": "Condition/ra-condition10pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-006"
                }
            ],
            "reference": "Condition/ra-condition11pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-007"
                }
            ],
            "reference": "Condition/ra-condition17pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-008"
                }
            ],
            "reference": "Condition/ra-condition18pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-010"
                }
            ],
            "reference": "Condition/ra-condition33pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-001"
                }
            ],
            "reference": "Condition/ra-condition43pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-004"
                }
            ],
            "reference": "Condition/ra-condition44pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-001"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-007"
                }
            ],
            "reference": "Encounter/ra-encounter02pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-002"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-005"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-008"
                },
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-010"
                }
            ],
            "reference": "Encounter/ra-encounter03pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-003"
                }
            ],
            "reference": "Encounter/ra-encounter08pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-004"
                }
            ],
            "reference": "Encounter/ra-encounter09pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-006"
                }
            ],
            "reference": "Encounter/ra-encounter11pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-001"
                }
            ],
            "reference": "Encounter/ra-encounter43pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-004"
                }
            ],
            "reference": "Encounter/ra-encounter44pat01"
        },
        {
            "extension": [
                {
                    "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-groupReference",
                    "valueString": "group-009"
                }
            ],
            "reference": "Observation/ra-obs21pat01"
        }
    ]
}

~~~

**Response**

~~~
HTTP/1.1 200 ok
~~~