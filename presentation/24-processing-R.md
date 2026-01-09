## Saving confidential and clean data

Lastly we need to save the confidential cleaned data that we don't publish to one folder (if we need it), and save the cleaned publishable data to the relevant folder.

```{.R}
# save confidential data NOT for publishing, if needed
write.csv(data, file.path(confdata,"confidential_data.csv"), 
row.names = FALSE)

# saving clean data for publishing
write.csv(data, file.path(publicdata,"clean_data.csv"), 
row.names = FALSE)
```