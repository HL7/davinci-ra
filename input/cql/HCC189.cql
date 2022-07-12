library HCC189 version '24.1.001'
//24 is HCCv24
//24.1  HCCv24 initial run
//24.1.001 Initial minor version of this CQL for HCCv24 initial run. 
//24.1.002 Second minor update version of this CQL for HCCv24 initial run. 
//24.2.001 Initial minor version of this CQL for HCCv24 mid-year run. 
//24.3.001 Initial minor version of this CQL for HCCv24 final run. 

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include FHIRHelpers version '4.0.001' called FHIRHelpers
include MedicareAdvantage version '0.0.001' called MedicareAdvantage

/** Has to define the HCC model version (e.g., CMSHCC v24) and whether to use ICD10CM to HCC mapping for either initial run, mid-year (sweep), or final run --**/
// codesystem "CMSHCC": 'http://terminology.hl7.org/CodeSystem/cmshcc' version '24.1.001'
// codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'


/** codes for the Example Acquired Lower Limb Deformities value set
code "Acquired deformities of fingers and toes": 'M20' from "ICD10CM" display 'Acquired deformities of fingers and toes'
code "Other acquired deformities of limbs": 'M21' from "ICD10CM" display 'Other acquired deformities of limbs'
**/
valueset "Example Acquired Lower Limb Deformities": 'http://hl7.org/fhir/us/davinci-ra/ValueSet/example-acquired-lower-limb-deformities'
// code "Amputation Status, Lower Limb/Amputation Complications": '189' from "CMSHCC" display 'Amputation Status, Lower Limb/Amputation Complications'
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

//$risk-adjustment periodStart and periodEnd
//Workaround: the service we're using for the POC defines a "Measurement Period" not a "Clinical Evaluation Period"
parameter "Measurement Period" Interval<DateTime>
  default Interval[@2022-01-01T00:00:00.0, @2023-01-01T00:00:00.0)

context Patient

define "Clinical Evaluation Period":
  "Measurement Period"

/** Medicare Advantage patients who are age 65 years and older and have an eligible encounter */
define "Qualifying Members":
  MedicareAdvantage."Qualifying Member"
    and exists MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers"

define "Initial Population":
  "Qualifying Members"

define "Denominator":
  "Initial Population"
    and (
      "Historic Population" 
        or "Suspected Population" 
        or "Net-New Population" 
        or exists "Closed Gap Encounter"
    )
    and not "Denominator Exclusions" 

define "Denominator Exclusions":
  exists "HCC189 Exclusions" 

define "Numerator":
  exists "Closed Gap Encounter"

// Stratifier
define "Historic Population":
  exists "HCC189 Historic Encounter Diagnosis"

// Stratifier
define "Suspected Population":
  false

// Stratifier
define "Net-New Population":
  exists "Closed Gap Encounter"
    and not "Historic Population"

// SDE
define "Exclusion Encounter":
  "HCC189 Exclusions"

// SDE
define "Historic Encounter":
  "HCC189 Historic Encounter Diagnosis".HCCEncounter

define "Historic Diagnosis":
  "HCC189 Historic Encounter Diagnosis".HCCDiagnosis

// SDE
define "Net-New Encounter":
  if exists "Closed Gap Encounter" then
    "HCC189 Encounter Diagnosis".HCCEncounter
  else null as Encounter

define "Net-New Diagnosis":
  if exists "Closed Gap Encounter" then
    "HCC189 Encounter Diagnosis".HCCDiagnosis
  else null as Condition

/** 
Suspected population may be defined by organizations that create suspecting algorithms.
This placeholder definition is included for information only */
// SDE
define "Suspecting Algorithm":
  null

// SDE
define "Closed Gap Encounter":
  "HCC189 Encounter Diagnosis"

/** Patient has an Encounter Diagnosis of "Acquired absence of right great toe": 'Z89.411' during Clinical Evaluation Period
Z89.411 maps to HCC189 */
define "HCC189 Encounter Diagnosis":
  from
  MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers during Clinical Evaluation Period" HCCEncounter,
  ([Condition] C where C.code in "Example Acquired Lower Limb Deformities") HCCDiagnosis
      where HCCDiagnosis in Global.EncounterDiagnosis(HCCEncounter) 
       
/** Patient has an Encounter Diagnosis of the following exclusion conditions during Clinical Evaluation Period
M20 Acquired deformities of fingers and toes
M21 Other acquired deformities of limbs */
define "HCC189 Exclusions":
  MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers during Clinical Evaluation Period" HCCEncounter
    with ([Condition] C where C.code in "Example HCC189 Exclusion") Diagnosis
      such that Diagnosis in Global.EncounterDiagnosis(HCCEncounter) 

/** Patient has an Encounter Diagnosis of "Acquired absence of right great toe": 'Z89.411' outside of the Clinical Evaluation Period (could be prior or after) **/
define "HCC189 Historic Encounter Diagnosis":    
  from 
  MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers outside Clinical Evaluation Period" HCCEncounter,
    ([Condition] C where C.code in "Example Acquired Lower Limb Deformities") HCCDiagnosis
     where HCCDiagnosis in Global.EncounterDiagnosis(HCCEncounter)
