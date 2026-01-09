## Storing secrets in GitHub

Then in GitHub workflows you can set your environment variables to be used in your code, such as the API key:

```plaintext
echo "QUALTRICS_API_KEY=${{ secrets.QUALTRICS_API_KEY }}" >> $GITHUB_ENV
```

So in your publishable R code, you can simply refer to "`QUALTRICS_API_KEY`" in your code so as to not give away your API token. 

--- 

You can check that the API key is set using the following code in R:

```{.R}
message(Sys.getenv("QUALTRICS_API_KEY"))
```

But don't include this in your published output (i.e., slides like these!)