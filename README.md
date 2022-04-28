# davinci-ra

Da Vinci Risk Adjustment

## Testing

### Directory Structure

    .
    ├── bundles                 # FHIR Bundle Resource(s) that contain the test Resources from the tests directory
    ├── input                   
    |    └── tests
    |         └── Touchstone    # Touchstone tests  
    |         └── *             # Directories that contain test data as FHIR Resources
    └── _bundle                 # Script that posts FHIR bundles from the bundles directory to a FHIR Server

### Reference Implementation Endpoint

<https://cloud.alphora.com/sandbox/r4/ra/fhir/>

### Tooling

Testing is performed using Aegis Touchstone.

Tests are hosted in Touchstone in the FHIR4-0-1-RASTU2 directory: <https://touchstone.aegis.net/touchstone/testdefinitions?selectedTestGrp=/FHIRSandbox/DaVinci/FHIR4-0-1-RA-STU2>

### Process

* Add tests to the input/tests/Touchstone directory

* Add FHIR test data Resources to the input/tests/* directory(s)

* Add FHIR test data Resources from the input/tests/* directory(s) to FHIR Bundle Resource(s) in the bundles directory

* Run the _bundle script to post the test Bundle Resources to the Reference Implementation Endpoint

* Upload the tests from the input/tests/Touchstone directory to the Touchstone tooling

* Execute the tests in Touchstone, ref documentation at <https://touchstone.aegis.net/touchstone/>
