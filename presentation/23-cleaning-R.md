## Cleaning data


- We filter the data to only include those who consented
- We remove survey preview responses
- (Optionally) remove responses that took place outside the relevant window.  
- Remove confidential data (variables `name_confidential` and `number_confidential` in our survey, for example). 

---

```{.R}
 data <- data.raw |>
    filter(consent == "Yes") |>
    filter(Status != "Survey Preview") |>
    filter(StartDate > QUALTRICS_STIME & EndDate < QUALTRICS_ETIME) |>
    select(StartDate,EndDate,Status,Finished,RecordedDate,
    ResponseId,consent,age_1,gender,education,
    num_tabs_1,name_confidential,number_confidential)
clean_data <- data %>%
  select(-name_confidential, -number_confidential)
```

## Cleaning data by selection

We could also simply not ever select the confidential data if we don't actually need it.


```{.R}
 clean_data <- data.raw |>
    filter(consent == "Yes") |>
    filter(Status != "Survey Preview") |>
    filter(StartDate > QUALTRICS_STIME & EndDate < QUALTRICS_ETIME) |>
    select(StartDate,EndDate,Status,Finished,RecordedDate,
    ResponseId,consent,age_1,gender,education,num_tabs_1)
```


## Using confidential data

We could also (hypothetically) immediately compute variables that rely on confidential data.


```{.R}
 clean_data <- data.raw |>
    filter(consent == "Yes") |>
    filter(Status != "Survey Preview") |>
    filter(StartDate > QUALTRICS_STIME & EndDate < QUALTRICS_ETIME) |>
    select(StartDate,EndDate,Status,Finished,RecordedDate,
    ResponseId,consent,age_1,gender,education,num_tabs_1,
           gps_lat, gps_lon) |>
    mutate(distance = compute_distance_from_cornell(
    gps_lat,gps_lon,precision="100m")) |>
    select(-gps_lat, -gps_lon)  
```

