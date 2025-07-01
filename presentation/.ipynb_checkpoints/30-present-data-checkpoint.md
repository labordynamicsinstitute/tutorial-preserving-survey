## Descriptive statistics
Lastly, you are now ready to use your cleaned data for reproducible analyses!

```{.stata}
** summary statistics
sum age_1, detail
sum num_tabs_1, detail

tab gender
tab education
```