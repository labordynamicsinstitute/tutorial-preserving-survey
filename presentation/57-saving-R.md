## Saving confidential and clean data

- save the confidential  data to a **clearly marked** folder (J-PAL policy: an encrypted volume)
- save the cleaned publishable data to a **well-defined** folder.

```{r save-data, echo=TRUE, eval=FALSE}
#| code-line-numbers: "2-4|6-7"
# save confidential data NOT for publishing, if needed
write.csv(data, file.path(confdatapath,"confidential_data.csv"), 
        row.names = FALSE)
saveRDS(data, file.path(confdatapath,"confidential_data.rds"))
# saving clean data for publishing
write.csv(data, file.path(cleandatapath,"clean_data.csv"), 
         row.names = FALSE)
```

## Descriptive statistics

Now you are ready use your cleaned data for reproducible analyses!
