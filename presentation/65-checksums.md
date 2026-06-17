## Checksums can be used to demonstrate consistency

- A **checksum** is a single value calculated from a data file that can be used to verify the integrity of the file. 
- The [`sha256`](https://en.wikipedia.org/wiki/Secure_Hash_Algorithms) algorithm is commonly used for this purpose.
- In R, the package [`digest`](https://eddelbuettel.github.io/digest/)[^digest] is available.

[^digest]: `r format(citation("digest"), style = "text")`

```{r sample-checksum, echo=TRUE,eval=TRUE}
library(digest)
# Calculate the checksum of a file
digest(trees)
digest(trees,algo="sha256")
```

## Adding checksums to the data download

```{r checksum-download, message=TRUE, echo = TRUE, eval=TRUE}
#| code-line-numbers: "3-6"
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- suppressMessages(fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = FALSE))
  data.raw.chksum <- digest::digest(data.raw, algo = "sha256")
  message("Checksum of the downloaded data: ", data.raw.chksum)
  # Write checksum to a file
  writeLines(data.raw.chksum, file.path(rawdatapath, "data.raw.chksum"))
} else {
  stop("Please set the QUALTRICS_API_KEY environment 
  variable to your API key.")
}
```

## How does that help?

- Subsequent downloads can verify that the download is the same as originally downloaded!




```{r checksum-verify, echo = TRUE, message=TRUE,eval=TRUE, cache=TRUE}
# Read the original checksum from file
original.chksum <- readLines(file.path(rawdatapath, "data.raw.chksum"))
message("Original checksum from file: ", original.chksum)
# Redownload data
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- suppressMessages(fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = FALSE))
  data.raw.chksum <- digest::digest(data.raw, algo = "sha256")
  message("Checksum of the downloaded data: ", data.raw.chksum)
}
```

## How does that help?

- Subsequent downloads can verify that the download is the same as originally downloaded!

```{r checksum-verify2, echo = TRUE, message=TRUE,eval=TRUE}
# Compare the checksums
if (original.chksum == data.raw.chksum) {         
  message("Checksums match! Data integrity verified.")
} else {
  warning("Checksums do NOT match! Data may have changed/ been altered.")
}
```
