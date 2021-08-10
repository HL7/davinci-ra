#### Overloads:

- <b>Overload option 1</b>
  - periodStart
  - periodEnd
  - subject

- <b>Overload option 2</b>
  - periodStart
  - periodEnd
  - subject
  - hccCode

#### Examples:

#### Discussion Notes (this section will be removed later):
  - *Does not need practitioner and organization as parameters*
  - *Subject would reference a single patient or a group of patients*
  - *Add hccCode, e.g., hcc 17, 18*

  - *Remove hccModel, model information will be in the returned MeasureReport*
    - *Discussed hccVersion, this become moot since the decision is not to include hccModel parameter (No need to add hccVersion as a parameter, but instead stating it in the hccModel description: whichever version that is active during the clinical evaluation period)*
  - *Remove suspectType and evidenceStatus parameters*
    - *We would return everything then leave it to the App to filter and display what they want*


 <br />
