library HCC189 version '0.0.001'

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include FHIRHelpers version '4.0.001' called FHIRHelpers
include MedicareAdvantage version '0.0.001' called MedicareAdvantage

/** Has to define the HCC model version (e.g., CMSHCC v24) and whether to use ICD10CM to HCC mapping for either initial run, mid-year (sweep), or final run --**/
codesystem "CMSHCC": 'http://terminology.hl7.org/CodeSystem/cmshcc'
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

valueset "Example Acquired Lower Limb Deformities": 'http://hl7.org/fhir/us/davinci-ra/ValueSet/example-acquired-lower-limb-deformities'
/** codes for the value set
code "Acquired deformities of fingers and toes": 'M20' from "ICD10CM" display 'Acquired deformities of fingers and toes'
code "Other acquired deformities of limbs": 'M21' from "ICD10CM" display 'Other acquired deformities of limbs'
**/

code "Amputation Status, Lower Limb/Amputation Complications": '189' from "CMSHCC" display 'Amputation Status, Lower Limb/Amputation Complications'
code "Acquired absence of right great toe": 'Z89.411' from "ICD10CM" display 'Acquired absence of right great toe'

/** what about the child concepts of M20 and M21? **/
/**
code "Acquired clawhand, clubhand, clawfoot and clubfoot": 'M21.5' from "ICD10CM" display 'Acquired clawhand, clubhand, clawfoot and clubfoot'

code "Acquired deformities of toe(s), unspecified": 'M20.6' from "ICD10CM" display 'Acquired deformities of toe(s), unspecified'
code "Acquired deformities of toe(s), unspecified, unspecified foot": 'M20.60' from "ICD10CM" display 'Acquired deformities of toe(s), unspecified, unspecified foot'
code "Acquired deformities of toe(s), unspecified, right foot": 'M20.61' from "ICD10CM" display 'Acquired deformities of toe(s), unspecified, right foot'
code "Acquired deformities of toe(s), unspecified, left foot": 'M20.62' from "ICD10CM" display 'Acquired deformities of toe(s), unspecified, left foot'
code "Other deformities of toe(s) (acquired)": 'M20.5' from "ICD10CM" display 'Other deformities of toe(s) (acquired)'
code "Other deformities of toe(s) (acquired), right foot": 'M20.5X1' from "ICD10CM" display 'Other deformities of toe(s) (acquired), right foot'
code "Other deformities of toe(s) (acquired), left foot": 'M20.5X2' from "ICD10CM" display 'Other deformities of toe(s) (acquired), left foot'
code "Other hammer toe(s) (acquired)": 'M20.4' from "ICD10CM" display 'Other hammer toe(s) (acquired)'
code "Other deformities of toe(s) (acquired), unspecified foot": 'M20.5X9' from "ICD10CM" display 'Other deformities of toe(s) (acquired), unspecified foot'
... and more
**/

/* Measure/$risk-adjustment

Condition Category Measure

define "Measure Category Inclusion":
  "Initial Population"
    and "Category Population"
    and not "Category Exclusions"

Conformance Requirement
1. CQL "Initial Population", "Category Population", and "Category Exclusions" must return a Boolean
2. CQL "Condition Category" definition must return a Coding
*/

parameter "Measurement Period" Interval<DateTime>

context Patient

/** Is the initial population all members of a payer? example below use age limit for Medicare Advantage Program**/
/** Members have to be enrolled during the risk adjustment clinical evaluation period. Need to do entrollment look up **/
/** Cannot be simply based on age, even for Medicare Advantage Program. For the demo purpose, we could use age limit **/
/** AgeInYearsAt(date from start of "Measurement Period") >=65
and exists "HCC Qualifying Encounters" **/
/**
  define population is Medicare Advantage Part C Members
  make this as a helper library
**/
/** use this for the demo to define QualifyingMembers: AgeInYearsAt(date from start of "Measurement Period") >=65 **/
/** does it need encounters? HCC189 is unusual, since it's amputation. We will include encounters**/
define "Initial Population":
  MedicareAdvantage."Qualifying Member"
    and exists "HCC Qualifying Encounters with Eligible Providers"

define "Category Population":
  exists "Has HCC189 Diagnosis" 

define "Category Exclusions":
  exists "Has HCC189 Exclusion Conditions"
   or exists "Has HCC189 Exclusion Encounter Diagnosis"

define "Condition Category":
  "Amputation Status, Lower Limb/Amputation Complications"

define "Has HCC189 Diagnosis":
  Global.EncounterDiagnosis("HCC Qualifying Encounters with Eligible Providers") EncounterDiagnosis
      where
        EncounterDiagnosis.code ~ 'Amputation Status, Lower Limb/Amputation Complications'

/** Is timing needed ? **/
define "Has HCC189 Exclusion Conditions":
 [Condition: "Example Acquired Lower Limb Deformities"] AcquiredLowerLimbDeformities
    /**where Global."Prevalence Period" ( AcquiredLowerLimbDeformities ) starts on or before
    end of "Measurement Period" **/

/** error in this definition: EncounterDiagnosis function takes an Encounter not a list **/
define "Has HCC189 Exclusion Encounter Diagnosis":
  Global.EncounterDiagnosis("HCC Qualifying Encounters with Eligible Providers") EncounterDiagnosis
      where
        EncounterDiagnosis.code in "Example Acquired Lower Limb Deformities"

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
