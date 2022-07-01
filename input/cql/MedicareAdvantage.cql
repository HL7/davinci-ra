library MedicareAdvantage version '0.0.001'

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include FHIRHelpers version '4.0.001' called FHIRHelpers

valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "Annual Wellness Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1240'
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Care Services-Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Hospice care ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1108.15'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Acute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1083'
valueset "Nonacute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1084'
valueset "Observation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1086'
/**valueset "Outpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1087' **/
/**valueset "Nursing Facility Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1012'
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016'**/

parameter "Clinical Evaluation Period" Interval<DateTime>

context Patient

define "Qualifying Member":
    AgeInYearsAt(date from start of "Clinical Evaluation Period") >=65

define "HCC Qualifying Encounters with Eligible Providers":
  (
    [Encounter: "Office Visit"]
    		union [Encounter: "Annual Wellness Visit"]
    		union [Encounter: "Preventive Care Services - Established Office Visit, 18 and Up"]
    		union [Encounter: "Preventive Care Services-Initial Office Visit, 18 and Up"]
    		union [Encounter: "Hospice care ambulatory"]
        union [Encounter: "Emergency Department Visit"]
        union [Encounter: "Encounter Inpatient"]
        union [Encounter: "Acute Inpatient"]
        union [Encounter: "Nonacute Inpatient"]
        union [Encounter: "Observation"]
  )

define "HCC Qualifying Encounters with Eligible Providers during Clinical Evaluation Period":
    "HCC Qualifying Encounters with Eligible Providers" ValidEncounter
    	where ValidEncounter.status  = 'finished'
        and Global."Normalize Interval"(ValidEncounter.period) during "Clinical Evaluation Period"

define "HCC Qualifying Encounters with Eligible Providers outside Clinical Evaluation Period":
    "HCC Qualifying Encounters with Eligible Providers" ValidEncounter
    	where ValidEncounter.status  = 'finished'
        and not Global."Normalize Interval"(ValidEncounter.period) during "Clinical Evaluation Period"