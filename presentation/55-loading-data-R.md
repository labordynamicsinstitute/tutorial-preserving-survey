## Loading the downloaded data into R

You downloaded the responses from the Qualtrics web interface (previous slide). Now read that exported file into R.

```{r defines, echo=TRUE, eval=TRUE}
datesuffix <- "June+16,+2026_15.35"
fileprefix <- "Testing+preservation_"
filename <- paste0(fileprefix, datesuffix, ".csv")
``` 

## Some data org hygiene

We want to be careful about managing our data structure:[^confpres]

[^confpres]: See [my tutorial on handling of confidential data and reproducibility](https://labordynamicsinstitute.github.io/reproducibility-confidential/presentation/)

```{r defines2, echo=TRUE, eval=TRUE}
#| code-line-numbers: "|3-4|5"
# Path to the file you downloaded from Qualtrics
datapath <- here::here("data")
rawdatapath <- file.path(datapath, "raw-confidential")
confdatapath <- file.path(datapath, "confidential")
cleandatapath <- file.path(datapath, "clean")
```


## Loading the downloaded data into R


- Any CSV reader works too, with some adjustments.

```{r readcsv, echo=TRUE, eval=TRUE}
library(readr)
# discard the two Qualtrics metadata rows
data.raw <- read_csv(file.path(rawdatapath, filename), skip = 3,
            col_names = FALSE)
# read the header separately to get column names
header <- read.csv(file.path(rawdatapath, filename), 
            nrows=0)
colnames(data.raw) = colnames(header)
```

## Loading the downloaded data into R

```{r showdata1, echo=TRUE, eval=TRUE}
head(data.raw)
```

## Loading with `qualtRics` package

- The [`qualtRics`](https://cran.r-project.org/web/packages/qualtRics/vignettes/qualtRics.html)[^qualtrics] package can read a Qualtrics CSV export directly with `read_survey()`:

[^qualtrics]: `r format(citation("qualtRics"), style = "text")`

```{r read_survey, echo=TRUE, eval=TRUE}
library(qualtRics)

data.raw <- read_survey(file.path(rawdatapath, filename))
```


## Loading with `qualTRics` package


```{r showdata2, echo=TRUE, eval=TRUE}
head(data.raw)
```
