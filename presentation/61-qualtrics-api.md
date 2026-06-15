## Using APIs

- An API (*Application Programming Interface*) is a mechanism that enables two software components to communicate with each other 
- APIs can be used to request data or services and get responses without needing to know how the other program works internally

## Loading data from Qualtrics using an API

In order to always be analyzing the most up to date survey responses, load the data directly from the web using a Qualtrics API. We need a few pieces of information. 

---

These parts are public. In fact, the window of time may be important for credibility.

```{.R}
# qualtrics URL components
QUALTRICS_FULL_URL <- "first part of survey URL"

QUALTRICS_SURVEY <- "second part of survey URL, usually starts with SV"

# Keep only responses in the desired window of time
QUALTRICS_STIME <- ymd_hms("2025-07-01 00:00:01")
QUALTRICS_ETIME <- ymd_hms("2025-08-26 23:59:00")

```

## Fetching the data with the API

After setting the API token (next slides), we use it to pull the data from the survey server — this *replaces the manual download* from before:

```{.R}
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = TRUE) 
} else {
  stop("Please set the QUALTRICS_API_KEY environment 
  variable to your API key.")
}
```

## The rest of the pipeline is unchanged

`data.raw` now comes from the API instead of a downloaded file — but the cleaning and saving steps from before are **exactly the same**:

```{.R}
clean_data <- data.raw |>
    filter(consent == "Yes") |>
    filter(Status != "Survey Preview") |>
    filter(StartDate > QUALTRICS_STIME & EndDate < QUALTRICS_ETIME) |>
    select(StartDate,EndDate,Status,Finished,RecordedDate,
    ResponseId,consent,age_1,gender,education,num_tabs_1)

write.csv(clean_data, file.path(publicdata,"clean_data.csv"), 
row.names = FALSE)
```
