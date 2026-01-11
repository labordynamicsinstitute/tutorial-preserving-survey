Now, let's go look at our survey results. 

```{r downloaddata,include=TRUE,warning=TRUE,error=TRUE,message=TRUE}
# download data to local locations

# Inherit variables from parent document
if (!exists("QUALTRICS_STIME")) {
  error("This document is meant to be included in another R Markdown document.")
} else {
  message("QUALTRICS_STIME=",QUALTRICS_STIME)
  message("QUALTRICS_ETIME=",QUALTRICS_ETIME)
}

# if the Qualtrics API key is not set, we can't fetch the data
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = TRUE) 
  data <- data.raw |>
          filter(consent == "Yes") |>
          filter(Status != "Survey Preview") |>
          filter(StartDate > QUALTRICS_STIME & EndDate < QUALTRICS_ETIME) |>
    # renaming variables
    select(StartDate,EndDate,Status,Finished,RecordedDate,ResponseId,consent,age_1,gender,education,num_tabs_1,name_confidential,number_confidential)
} else {
  data <- data.frame()
}

```

---

```{r gender_table, results='asis', include=TRUE,echo=FALSE,message=FALSE}

if ( nrow(data) >0 ) {
data |>
  select(gender) |>
  group_by(gender) |>
  summarise(Frequency=n()) |>
  ungroup() |>
  mutate(Percent = round(Frequency/nrow(data)*100,2)) -> data.table

data.table |> kable()
} else {
  cat("No data yet. Check back later.")
}
```

---

```{r education_table, results='asis', include=TRUE,echo=FALSE,message=FALSE}
if ( nrow(data) >0 ) {
data |>
  select(education) |>
  group_by(education) |>
  summarise(Frequency=n()) |>
  ungroup() |>
  mutate(Percent = round(Frequency/nrow(data)*100,2)) -> data.table

data.table |> kable()
} else {
  cat("No data yet. Check back later.")
}
```

--- 

```{r age_table, results='asis', echo=FALSE, message=FALSE}
if (nrow(data) > 0) {
  cat("### Age")
  var_data <- data$age_1
  summary_stats <- data.frame(
    Statistic = c("Count", "Mean", "Median", "Min", "Max", "Std. Dev."),
    Value = c(
      sum(!is.na(var_data)),
      mean(var_data, na.rm = TRUE),
      median(var_data, na.rm = TRUE),
      min(var_data, na.rm = TRUE),
      max(var_data, na.rm = TRUE),
      sd(var_data, na.rm = TRUE)
    )
  )
  print(knitr::kable(summary_stats, digits = 2))
} else {
  cat("No data yet. Check back later.")
}
```

---

```{r tabs_table, results='asis', echo=FALSE, message=FALSE}
if (nrow(data) > 0) {
  cat("### Number of tabs open")
  var_data <- data$num_tabs_1
  summary_stats <- data.frame(
    Statistic = c("Count", "Mean", "Median", "Min", "Max", "Std. Dev."),
    Value = c(
      sum(!is.na(var_data)),
      mean(var_data, na.rm = TRUE),
      median(var_data, na.rm = TRUE),
      min(var_data, na.rm = TRUE),
      max(var_data, na.rm = TRUE),
      sd(var_data, na.rm = TRUE)
    )
  )
  print(knitr::kable(summary_stats, digits = 2))
} else {
  cat("No data yet. Check back later.")
}
```