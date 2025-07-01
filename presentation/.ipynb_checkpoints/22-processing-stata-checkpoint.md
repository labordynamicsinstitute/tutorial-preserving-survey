## Processing survey data in stata

Lastly we need to save the confidential cleaned data that we don't publish to the relevant folder, remove the confidential data, and save the cleaned publishable data to its relevant folder.

```{.stata}
** save confidential data NOT for publishing
save "${filepath}/data/confidential/survey_data_clean_confidential.dta", replace 

** remove confidential data
drop name_confidential number_confidential

** saving clean data for publishing
save "${filepath}/data/clean/survey_data_clean.dta", replace  
```