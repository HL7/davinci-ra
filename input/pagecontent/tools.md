FHIR provides many supports to aid in its implementation.  This page describes some of them.

### Community

The most important resource for implementing FHIR is the FHIR community, and the best place to engage the FHIR community is on [chat.fhir.org](http://chat.fhir.org).  That website is a multi-threaded discussion forum covering a wide range of implementer topics.  There are numerous streams specific to various Da Vinci projects, as well as streams on technologies and specifications such as Bulk Data, CDS Hooks, etc.  A search in the appropriate stream will often find an answer to your question and, if not, post a new question and you will likely get a speedy answer.

### Reference implementations

FHIR has been implemented in a variety of languages.  For most of these languages, free open-source reference implementations are available.  This standard software handles parsing and serializing all the formats, exposing FHIR instances as language-friendly object representations, handles making RESTful calls, and otherwise dealing with the low-level implementation of the standard.  By using reference implementations, implementers can focus on business logic and other application-specific software, relying on well-tested shared libraries to handle the FHIR-specific behavior.

A list of FHIR reference implementations can be found [here]({{site.data.fhir.path}}downloads.html#refimpl).

### Validator

One of the benefits of using FHIR is that the rules that define how instances must look that are rendered in the specification are expressed in computable form - which means that software can evaluate instances to verify whether they comply with profiles defined in a published implementation guide.  This software can do more than typical XML and JSON schema validation - they can check complex invariants, verify terminology, resolve references, and check most of the rules documented in the specification.  As a result, human review and testing can be limited to those few things that the validator cannot test.

The current version of the FHIR Validator can be found [here](https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar).  (It changes regularly to fix bugs and add enhancements, so plan to update regularly.)

Guidance on using it is found [here](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator).

