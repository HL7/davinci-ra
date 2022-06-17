
This operation accepts the clinical/administrative attachments and the necessary information needed to re-associate them to the risk adjustable encounter, and returns a transaction layer HTTP response.  This operation can be used by any HTTP endpoint, not just FHIR RESTful servers.

The input parameters are:
- One or more Attachments as FHIR Resources
- Data elements for reassociation to the risk adjustable encounter
  1. A risk adjustable encounter id
  1. A unique patient identifier
  1. Date of Service Start Date
  1. Date of Service End Date
- There are no output parameters.

{% include link-list.md %}
