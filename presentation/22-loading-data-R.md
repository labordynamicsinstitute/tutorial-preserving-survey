## Loading data from Qualtrics using API

After setting the API token, we use it to pull the data from the survey server

```{.R}
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = TRUE) 
} else {
  stop("Please set the QUALTRICS_API_KEY environment 
  variable to your API key.")
}
```