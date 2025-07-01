## Processing survey data in stata

After exporting the raw survey data and loading it into stata you'll need to clean it up a bit.

```{.stata}
import delimeted "${filepath}/data/raw/survey_data.csv", varnames(1) clear

** cleaning data
drop if _n<=2 // drop first two rows of data, don't contain survey responses

label var consent "Consent" // labelling variables for readability
label var age_1 "Age in years"
label var gender "Gender"
label var education "Highest level of education completed"
label var num_tabs_1 "Number of computer tabs open"
label var name_confidential "Respondent name"
label var number_confidential "Respondent phone number"
```