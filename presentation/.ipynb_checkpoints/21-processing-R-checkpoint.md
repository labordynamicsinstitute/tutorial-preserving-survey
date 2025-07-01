## Loading data from Qualtrics using API

Here we actually load the data. Notice we filtered the data to only include those who responded "Yes" to the consent question and also removed observations that were completed as survey previews. 

```{.R}
## load data from qualtrics survey using API
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = TRUE) 
  data <- data.raw |>
    filter(Status != "Survey Preview") |>
    filter(consent == "Yes") |>
    filter(StartDate > QUALTRICS_STIME & EndDate < QUALTRICS_ETIME) |>
    select(StartDate,EndDate,Status,Finished,RecordedDate,ResponseId,consent,age_1,gender,education,num_tabs_1,name_confidential,number_confidential)
} else {
  data <- data.frame()
}
```