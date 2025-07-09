## Loading data from Qualtrics using API

After setting the API token, we use it to load the data. We filter the data to only include those who consented, remove survey preview responses, and remove responses that took place outside the relevant window.  

```{.R}
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = TRUE) 
  data <- data.raw |>
    filter(consent == "Yes") |>
    filter(Status != "Survey Preview") |>
    filter(StartDate > QUALTRICS_STIME & EndDate < QUALTRICS_ETIME) |>
    select(StartDate,EndDate,Status,Finished,RecordedDate,ResponseId,consent,age_1,gender,education,num_tabs_1,name_confidential,number_confidential)
} else {
  data <- data.frame()
}
```