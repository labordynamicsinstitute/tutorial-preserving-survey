
## Putting it all together


- We already downloaded from the API, and have created checksum for raw data.
- Let's clean the data, and save local copies
- Then upload the publishable data to Dataverse, and add metadata.

## Cleaning the data

```{r run-clean_data, ref.label="clean_data", eval=TRUE, message=TRUE, echo=TRUE}
```


## Save files

```{r save-data-2, echo=TRUE, eval=TRUE}
# save files in their locations
data.confidential.file <-
    file.path(confdatapath,"confidential_data.rds")
data.clean.file <-
    file.path(cleandatapath,"clean_data.rds")
saveRDS(data.confidential, 
        data.confidential.file)
saveRDS(data.clean, 
        data.clean.file)
```

## ... and create checksums


```{r checksum-clean, echo=TRUE, eval=TRUE}
# Calculate checksums for the saved files
confidential_checksum <- 
     digest::digest(data.confidential.file, 
                    algo = "sha256", 
                    file = TRUE)
clean_checksum <- 
     digest::digest(data.clean.file, 
                    algo = "sha256", 
                    file = TRUE)
# Write checksums to files
writeLines(confidential_checksum, 
           file.path(metadatapath, "data.confidential.sha256"))
writeLines(clean_checksum, 
           file.path(metadatapath, "data.clean.sha256"))
```

## Analysis

So here are the results so far (`r Sys.Date()`):

```{r gender_table, results='asis', include=TRUE,echo=FALSE,message=FALSE}

if ( nrow(data.clean) >0 ) {
data.clean |>
  select(gender) |>
  group_by(gender) |>
  summarise(Frequency=n()) |>
  ungroup() |>
  mutate(Percent = round(Frequency/nrow(data.clean)*100,2)) -> data.table

data.table |> kable()
} else {
  cat("No data yet. Check back later.")
}
```

## By Education

```{r education_table, results='asis', include=TRUE,echo=FALSE,message=FALSE}
if ( nrow(data.clean) >0 ) {
data.clean |>
  select(education) |>
  group_by(education) |>
  summarise(Frequency=n()) |>
  ungroup() |>
  mutate(Percent = round(Frequency/nrow(data.clean)*100,2)) -> data.table

data.table |> kable()
} else {
  cat("No data yet. Check back later.")
}
```

## Age

```{r age_table, results='asis', echo=FALSE, message=FALSE}
if (nrow(data.clean) > 0) {
  var_data <- data.clean$age_1
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
if (nrow(data.clean) > 0) {
  cat("### Number of tabs open")
  var_data <- data.clean$num_tabs_1
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