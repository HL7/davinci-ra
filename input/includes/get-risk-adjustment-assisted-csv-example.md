
#### Examples

{:.no_toc}

**Scenario:**

The Payer has used their existing processes to collect risk adjustment data and would to use the Assisted Approach to generate a Risk Adjustment Coding Gap Report.

**POST risk adjustment CSV data to REST endpoint**

```txt
POST [base]
```

**Request body**

```csv
periodStart,periodEnd,modelId,modelVersion,patientId,ccCode,suspectType,evidenceStatus,evidenceStatusDate,hierarchicalStatus
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,18,historic,closed-gap,2021-04-01,applied-not-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,111,historic,pending,2021-09-29,applied-not-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,24,historic,open-gap,2020-07-15,applied-not-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,112,historic,closed-gap,2021-04-27,applied-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,19,historic,pending,2021-09-27,applied-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,84,historic,open-gap,2020-12-15,applied-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,22,suspected,closed-gap,2021-03-15,applied-not-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,96,suspected,pending,2021-09-27,applied-not-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,110,suspected,open-gap,2020-07-15,applied-not-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,83,net-new,pending,2021-09-28,applied-not-superseded
2021-01-01,2021-09-30,https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01,24,ra-patient01,59,historic,open-gap,2020-07-15,applied-not-superseded
```

**Response**

```json
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "resource": {
        "resourceType": "MeasureReport",
        "id": "assisted-5534e962-4493-4be7-9499-aeadc962f641",
        "meta": {
          "profile": [
            "https://build.fhir.org/ig/HL7/davinci-ra/StructureDefinition-ra-measurereport.html"
          ]
        },
        "status": "complete",
        "type": "individual",
        "measure": "https://build.fhir.org/ig/HL7/davinci-ra/Measure-RAModelExample01",
        "subject": {
          "reference": "Patient/ra-patient01"
        },
        "date": "2023-03-10T18:31:14+00:00",
        "period": {
          "start": "2021-01-01T00:00:00+00:00",
          "end": "2021-09-30T00:00:00+00:00"
        },
        "group": [
          {
            "id": "group-18",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "historic"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "closed-gap"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2021-04-01"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "18"
                }
              ]
            }
          },
          {
            "id": "group-111",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "historic"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "pending"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2021-09-29"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "111"
                }
              ]
            }
          },
          {
            "id": "group-24",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "historic"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "open-gap"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2020-07-15"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "24"
                }
              ]
            }
          },
          {
            "id": "group-112",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "historic"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "closed-gap"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2021-04-27"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "112"
                }
              ]
            }
          },
          {
            "id": "group-19",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "historic"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "pending"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2021-09-27"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "19"
                }
              ]
            }
          },
          {
            "id": "group-84",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "historic"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "open-gap"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2020-12-15"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "84"
                }
              ]
            }
          },
          {
            "id": "group-22",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "suspected"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "closed-gap"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2021-03-15"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "22"
                }
              ]
            }
          },
          {
            "id": "group-96",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "suspected"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "pending"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2021-09-27"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "96"
                }
              ]
            }
          },
          {
            "id": "group-110",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "suspected"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "open-gap"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2020-07-15"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "110"
                }
              ]
            }
          },
          {
            "id": "group-83",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "net-new"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "pending"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2021-09-28"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "83"
                }
              ]
            }
          },
          {
            "id": "group-59",
            "extension": [
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-suspectType",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/suspect-type",
                      "code": "historic"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatus",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/us/davinci-ra/CodeSystem/evidence-status",
                      "code": "open-gap"
                    }
                  ]
                }
              },
              {
                "url": "http://hl7.org/fhir/us/davinci-ra/StructureDefinition/ra-evidenceStatusDate",
                "valueDate": "2020-07-15"
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/cmshcc",
                  "version": "24",
                  "code": "59"
                }
              ]
            }
          }
        ]
      },
      "request": {
        "method": "PUT",
        "url": "MeasureReport/assisted-5534e962-4493-4be7-9499-aeadc962f641"
      }
    }
  ]
}
```
