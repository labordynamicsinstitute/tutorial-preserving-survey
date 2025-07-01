## Cleaning data

Next we need to remove confidential data (variables `name_confidential` and `number_confidential`). We create a new dataset called "clean_data."

```{.R}
clean_data <- data %>%
  select(-name_confidential, -number_confidential)
```
