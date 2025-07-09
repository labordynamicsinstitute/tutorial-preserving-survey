## Loading data from Qualtrics using API

An API token is assigned to your Qualtrics account and is used to request data from a survey. 

You can set it directly in your R code:

``` {.R}
Sys.setenv(QUALTRICS_API_KEY = "your-token")
```
However, this token is your secret token and you don't want this appearing in your published code.

We'll revisit in later slides how to fix this issue for sharable code.