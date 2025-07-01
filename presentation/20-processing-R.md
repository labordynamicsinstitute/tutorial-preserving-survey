## Loading data from Qualtrics using API

In order to always be analyzing the most up to data survey responses, we can load the data directly from the web using a Qualtrics API:

```{.R}
# qualtrics URL components
QUALTRICS_FULL_URL <- "first part of survey URL"

QUALTRICS_SURVEY <- "second part of survey URL, usually starts with SV"

# Keep only responses in the desired window of time
QUALTRICS_STIME <- ymd_hms("2025-07-01 00:00:01")
QUALTRICS_ETIME <- ymd_hms("2025-08-26 23:59:00")

if (!dir.exists(here::here("data"))) {
  dir.create(here::here("data"))
}

```