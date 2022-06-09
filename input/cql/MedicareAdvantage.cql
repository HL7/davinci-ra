library MedicareAdvantage version '0.0.001'

using FHIR version '4.0.1'

include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include FHIRHelpers version '4.0.001' called FHIRHelpers

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Qualifying Member":
    AgeInYearsAt(date from start of "Measurement Period") >=65
