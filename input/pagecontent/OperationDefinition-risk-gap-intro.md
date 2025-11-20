
{% assign id = {{page.id}} %}


### Custom Header: contextId

#### Purpose
The contextId header is an optional, non-standard HTTP header used to transmit an internal or system-specific identifier associated with the current request context. For example, a contextId maybe a 'gap-request-id' that is used by some systems to track an appointment that later is morphed into an encounter, and this "gap-request-id" can then be used by the server system to produce a Risk Adjustment Coding Gap Report. 

#### Usage
Include the contextId header in FHIR API POST operations. Implementers are expected to document the meaning of contextId used in their implementation and expected format if any constraints apply.

#### Syntax
contextId: `<string>`
<br>
`<string>`: A system-specific identifier, such as an internal request id, gap-request-id, or similar identifier used for internal tracking.

POST [base]/MeasureReport/$risk-gap
<br>
Host: example.org
<br>
Content-Type: application/fhir+json
<br>
contextId: gap-request-id-123

Servers receiving the contextId should log, propagate, or process the header according to their internal policies.


{% include link-list.md %}
