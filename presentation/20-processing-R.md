# Using an API to obtain data

---

## Using APIs

- An API is a mechanism that enables two software components to communicate with each other 
- APIs can be used to request data or services and get responses without needing to know how the other program works internally

## Loading data from Qualtrics using an API

In order to always be analyzing the most up to date survey responses, load the data directly from the web using a Qualtrics API. We need a few pieces of information. 

---

These parts are public. In fact, the window of time may be important for credibility.

```{.R}
# qualtrics URL components
QUALTRICS_FULL_URL <- "first part of survey URL"

QUALTRICS_SURVEY <- "second part of survey URL, usually starts with SV"

# Keep only responses in the desired window of time
QUALTRICS_STIME <- ymd_hms("2025-07-01 00:00:01")
QUALTRICS_ETIME <- ymd_hms("2025-08-26 23:59:00")

```