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

codesystem "CMSHCC": 'http://terminology.hl7.org/CodeSystem/cmshcc' version '24'
// codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'

valueset "Example Acquired Lower Limb Deformities": 'http://hl7.org/fhir/us/davinci-ra/ValueSet/example-acquired-lower-limb-deformities'
/** "Example Acquired Lower Limb Deformities" value set contains Z89- family ICD10 codes that map to HCC189. E.g., 
code "Acquired absence of right great toe": 'Z89.411' from "ICD10CM" display 'Acquired absence of right great toe' 
**/
valueset "Example HCC189 Exclusion": 'http://hl7.org/fhir/us/davinci-ra/ValueSet/example-hcc189-exclusion'
/** "Example HCC189 Exclusion" value sets contain exclusion criteria for Z89- family ICD10 codes M20 and M21.
    code "Acquired deformities of fingers and toes": 'M20' from "ICD10CM" display 'Acquired deformities of fingers and toes'
    code "Other acquired deformities of limbs": 'M21' from "ICD10CM" display 'Other acquired deformities of limbs'
**/
//code "Amputation Status, Lower Limb/Amputation Complications": '189' from "CMSHCC" display 'Amputation Status, Lower Limb/Amputation Complications'

/* Measure/$risk-adjustment
Condition Category Measure **/

//$risk-adjustment periodStart and periodEnd
//Workaround: the service we're using for the POC defines a "Measurement Period" not a "Clinical Evaluation Period"
parameter "Measurement Period" Interval<DateTime>
  default Interval[@2022-01-01T00:00:00.0, @2023-01-01T00:00:00.0)

context Patient

define "Clinical Evaluation Period":
  "Measurement Period"

/** Medicare Advantage patients who are age 65 years and older and have an eligible encounter */
define "Initial Population":
    MedicareAdvantage."Qualifying Member"
    and exists MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers"

/** Closed Gap Population includes patients with historic gap that are closed or net-new */
define "Closed Gap Population":
  "Historic Gap Closed"
  or "Net New"

define "Closed Gap Exclusion":
  exists "HCC189 Exclusions"   

define "Open Gap Population":
  "Historic Gap Open"
  or "Suspected Gap"  

/** Patients have the condition before clinical evaluation period
AND patients have eligible encounter diagnosis during the clnical evaluation period  */
define "Historic Gap Closed":
  exists "HCC189 Diagnosis Encounter during Clinical Evaluation Period"
  and 
  exists "HCC189 Historic Diagnosis Encounter" 

/** Patients do not have the condition before clinical evaluation period
AND patients have eligible encounter diagnosis during the clnical evaluation period  */
define "Net New":
  exists "HCC189 Diagnosis Encounter during Clinical Evaluation Period"
  and 
  not exists "HCC189 Historic Diagnosis Encounter" 

/** patients have historic gap and these gaps still open because there are no encounter dianosis during the clinical evaluation period to close the gap. */
define "Historic Gap Open":
  exists "HCC189 Historic Diagnosis Encounter" 
  and 
  not exists "HCC189 Diagnosis Encounter during Clinical Evaluation Period"

/** Patients have suspected gap. Suspected gap were determined by payer/vendors' own suspecting algorithm */
define "Suspected Gap":
  null

/** Patient has an Encounter Diagnosis of the following exclusion conditions during Clinical Evaluation Period
M20 Acquired deformities of fingers and toes
M21 Other acquired deformities of limbs */
define "HCC189 Exclusions":
  MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers during Clinical Evaluation Period" HCCEncounter
    with ([Condition] C where C.code in "Example HCC189 Exclusion") Diagnosis
      such that Diagnosis in Global.EncounterDiagnosis(HCCEncounter) 

/** Patient has an Encounter Diagnosis of "Acquired absence of right great toe": 'Z89.411' during Clinical Evaluation Period
Z89.411 maps to HCC189 */
define "HCC189 Diagnosis Encounter during Clinical Evaluation Period":
  MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers during Clinical Evaluation Period" HCCEncounter
    with ([Condition] C where C.code in "Example Acquired Lower Limb Deformities") HCCDiagnosis
      such that HCCDiagnosis in Global.EncounterDiagnosis(HCCEncounter) 

/** Patient has an Encounter Diagnosis of "Acquired absence of right great toe": 'Z89.411' outside of the Clinical Evaluation Period (could be prior or after) **/
define "HCC189 Historic Diagnosis Encounter":    
  MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers outside Clinical Evaluation Period" HCCEncounter
    with ([Condition] C where C.code in "Example Acquired Lower Limb Deformities") HCCDiagnosis
      such that HCCDiagnosis in Global.EncounterDiagnosis(HCCEncounter)      
/**

// define stratifiers

//===================

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
  exists "Net-New Encounter"

// SDE
define "Exclusion Encounter":
  "HCC189 Exclusions"

// SDE
define "Historic Encounter":
  "HCC189 Historic Encounter Diagnosis"

// SDE
define "Net-New Encounter":
  null as List<Encounter>

/** 
Suspected population may be defined by organizations that create suspecting algorithms.
This placeholder definition is included for information only */
// SDE
//define "Suspecting Algorithm":
//  null

// SDE
//define "Closed Gap Encounter":
//  "HCC189 Encounter Diagnosis"

/** Patient has an Encounter Diagnosis of "Acquired absence of right great toe": 'Z89.411' during Clinical Evaluation Period
Z89.411 maps to HCC189 */
/**define "HCC189 Encounter Diagnosis":
  MedicareAdvantage."HCC Qualifying Encounters with Eligible Providers during Clinical Evaluation Period" HCCEncounter
    with ([Condition] C where C.code in "Example Acquired Lower Limb Deformities") HCCDiagnosis
      such that HCCDiagnosis in Global.EncounterDiagnosis(HCCEncounter)   

*/      

/** 
//past notes
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