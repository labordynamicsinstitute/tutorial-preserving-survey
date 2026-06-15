## Loading the downloaded data into R

You downloaded the responses from the Qualtrics web interface (previous slide). Now read that exported file into R.

---

- The `qualtRics` package can read a Qualtrics CSV export directly with `read_survey()`:

```{.R}
library(qualtRics)

# Path to the file you downloaded from Qualtrics
data.raw <- read_survey("data/survey_responses.csv")
```

- Any CSV reader works too:

```{.R}
library(readr)

data.raw <- read_csv("data/survey_responses.csv")
```

Either way, you now have a `data.raw` data frame to clean and analyze.
