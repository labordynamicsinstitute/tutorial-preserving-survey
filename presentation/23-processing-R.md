## Saving confidential and clean data

Lastly we need to save the confidential cleaned data that we don't publish to the relevant folder, and save the cleaned publishable data to its relevant folder.

```{.R}
** save confidential data NOT for publishing
write.csv(data, "relevant file path/data/confidential/confidential_data.csv", row.names = FALSE)

** saving clean data for publishing
write.csv(data, "relevant file path/data/clean/clean_data.csv", row.names = FALSE)
```