# davinci-ra

Da Vinci Risk Adjustment

## Testing

### Directory Structure

    .
    ├── bundles                 # FHIR Bundle(s) that contain the test Resources from the tests directory
    ├── input                   
    |    └── tests
    |         └── Touchstone    # Touchstone tests  
    |         └── *             # Directories that contain test data as FHIR Resources
    └── _bundle                 # Script that posts FHIR Bundle(s) from the bundles directory to a FHIR Server

### Reference Implementation Endpoint

<https://ra.davinci.hl7.org/fhir/>

## Bundles

The `_refresh` operation misses a number of resources in its bundling.  Use the following to bundle everything:

``` bat
JAVA -jar "input-cache\tooling-cli-2.4.0.jar" -BundleResources -v=r4 -e=json -op=bundles -ptd=input\examples -bid=ra-examples
```

### Tooling

Testing is performed using Aegis Touchstone.

Tests are hosted in Touchstone in the `FHIR4-0-1-RASTU2` directory: <https://touchstone.aegis.net/touchstone/testdefinitions?selectedTestGrp=/FHIRSandbox/DaVinci/FHIR4-0-1-RA-STU2>

### Process

* Add tests to the `input/tests/Touchstone` directory

* Add FHIR test data Resources to the `input/tests/*` directory(s)

* Add FHIR test data Resources from the `input/tests/*` directory(s) to FHIR Bundle(s) in the bundles directory

* Run the `_bundle` script to post the test Bundle(s) to the Reference Implementation Endpoint

* Upload the tests from the `input/tests/Touchstone` directory to the Touchstone tooling

* Execute the tests in Touchstone, ref documentation at <https://touchstone.aegis.net/touchstone/>
