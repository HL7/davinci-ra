library HCC189 version '0.0.001'

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include FHIRHelpers version '4.0.001' called FHIRHelpers
include MedicareAdvantage version '0.0.001' called MedicareAdvantage

/** Has to define the HCC model version (e.g., CMSHCC v24) and whether to use ICD10CM to HCC mapping for either initial run, mid-year (sweep), or final run --**/
codesystem "CMSHCC": 'http://terminology.hl7.org/CodeSystem/cmshcc' version 'http://terminology.hl7.org/CodeSystem/cmshcc/version/v24-mid-year-2022'
codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'

/** need to think through interllectual property issues, for example NCQA may place some limitations/constraints on using their value sets **/
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "Annual Wellness Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1240'
/**valueset "Outpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1087' **/
valueset "Preventive Care Services - Established Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Care Services-Initial Office Visit, 18 and Up": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Hospice care ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1108.15'
/**valueset "Nursing Facility Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1012'
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016'**/
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Acute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1083'
valueset "Nonacute Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1084'
valueset "Observation": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1086'
/** codes for the Example Acquired Lower Limb Deformities value set
code "Acquired deformities of fingers and toes": 'M20' from "ICD10CM" display 'Acquired deformities of fingers and toes'
code "Other acquired deformities of limbs": 'M21' from "ICD10CM" display 'Other acquired deformities of limbs'
**/
valueset "Example Acquired Lower Limb Deformities": 'http://hl7.org/fhir/us/davinci-ra/ValueSet/example-acquired-lower-limb-deformities'
code "Amputation Status, Lower Limb/Amputation Complications": '189' from "CMSHCC" display 'Amputation Status, Lower Limb/Amputation Complications'
/**code "Acquired absence of right great toe": 'Z89.411' from "ICD10CM" display 'Acquired absence of right great toe' **/
valueset "Example HCC189 Exclusion": 'http://hl7.org/fhir/us/davinci-ra/ValueSet/example-hcc189-exclusion'
/** contains 
M20 Acquired deformities of fingers and toes
M21 Other acquired deformities of limbs
**/

/* Measure/$risk-adjustment
Condition Category Measure

define "Measure Historic Condition Catetory Inclusion":
  "Initial Population"
    and "Historic HCC Population"
    and not "Historic HCC Exclusions"

define "Measure Suspected Condition Category Inclusion":
  "Initial Population"
    and "Suspected HCC Population"
    and not "Suspected HCC Exclusions"

Conformance Requirement
1. CQL "Initial Population", "Historic HCC Population", and "Historic HCC Exclusions" must return a Boolean
2. CQL "Suspected HCC Population" (union of the Suspected and the Confirmed is the ...)
2. CQL "Condition Category" definition must return a code (CodableConcept.coding)
*/

parameter "Measurement Period" Interval<DateTime>

context Patient

/** Medicare Advantage patients who are age 65 years and older and have face to face encounters during the clincial evaluation period */
define "Initial Population":
  MedicareAdvantage."Qualifying Member"
    and exists "HCC Qualifying Encounters with Eligible Providers"

define "Closed Gap Population":
  "Initial Population"  
  and exists "Has HCC189 Encounter Diagnosis"
  

define "Closed Gap Exclusion":
  exists "Has HCC189 Exclusions"  

define "Historic Population":
  exists "Has HCC189 Encounter Diagnosis" 

/** Patient has HCC189 exclusions*/
define "Historic Exclusions":
  exists "Has HCC189 Exclusion Conditions"
   or exists "Has HCC189 Exclusions"

define "Condition Category":
  "Amputation Status, Lower Limb/Amputation Complications"

/** Patient has an Encounter Diagnosis of Acquired absence of right great toe*/
define "Has HCC189 Encounter Diagnosis":
  from
      "HCC Qualifying Encounters with Eligible Providers" HCCQualifyingEncounters
      let HCCEncounterDiagnosis: HCCQualifyingEncounters.diagnosis D return singleton from ([Condition] C where C.id = Global."GetId"(D.condition.reference))
      where HCCEncounterDiagnosis.code in "Example Acquired Lower Limb Deformities"
      and HCCQualifyingEncounters.period starts during "Measurement Period"
      return true

define "Has HCC189 Exclusions":
  from 
    "HCC Qualifying Encounters with Eligible Providers" HCCQualifyingEncounters
     let HCCEncounterDiagnosis: HCCQualifyingEncounters.diagnosis D return singleton from ([Condition] C where C.id = Global."GetId"(D.condition.reference))
     where HCCEncounterDiagnosis.code in "Example HCC189 Exclusion"
  return true

/** Patient has an Encounter Diagnosis in one of the exclusion conditions*/
/** Is timing needed ? **/
define "Has HCC189 Exclusion Conditions":
  from
      "HCC Qualifying Encounters with Eligible Providers" HCCQualifyingEncounters
      let HCCEncounterDiagnosis: HCCQualifyingEncounters.diagnosis D return singleton from ([Condition] C where C.id = Global."GetId"(D.condition.reference))
      where HCCEncounterDiagnosis.code in "Example Acquired Lower Limb Deformities"
    /**where Global."Prevalence Period" ( AcquiredLowerLimbDeformities ) starts on or before
    end of "Measurement Period" **/
      return true

/** Measurement Period is clinical Evaluation Period **/
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
  ) ValidEncounter
    		where ValidEncounter.status  = 'finished'
        and Global."Normalize Interval"(ValidEncounter.period) during "Measurement Period"


/**
  Eligible Provider need to be in the provider Taxonomy codes defined in RADV table (with Provider Taxonomy codes)
**/
/** Is the initial population all members of a payer? example below use age limit for Medicare Advantage Program**/
/** Members have to be enrolled during the risk adjustment clinical evaluation period. Need to do entrollment look up **/
/** Cannot be simply based on age, even for Medicare Advantage Program. For the demo purpose, 
use this to define QualifyingMembers: AgeInYearsAt(date from start of "Measurement Period") >=65 
and exists "HCC Qualifying Encounters" **/
/** Discussed whether encounters are needed when define initial population. HCC189 is unusual, since it's amputation, encounters may not be needed. 
There was comment that even for HCC189, encounters will be needed. For the demo purpose, we will include encounters**/
/** define population is Medicare Advantage Part C Members. make this as a helper library: MedicareAdvantage.cql **/