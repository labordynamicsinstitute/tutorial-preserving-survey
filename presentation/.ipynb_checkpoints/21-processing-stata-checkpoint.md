## Processing survey data in stata

Next we need to drop those who did not consent to participate.

```{.stata}
drop if consent=="No" // dropping data for those who didn't consent
```
