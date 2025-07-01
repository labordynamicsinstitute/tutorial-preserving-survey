## Loading data from Qualtrics using API

An API token is assigned to your Qualtrics account and is used to request data from a survey. 

The API token is stored as a secret in Github using environmental variables:

```plaintext
echo "QUALTRICS_API_KEY=${{ secrets.QUALTRICS_API_KEY }}" >> $GITHUB_ENV
```

Then, in your publishable R code, you can simply refer to "`QUALTRICS_API_KEY`" in your code so as to not give away your API token. 

Let's see how this works in the next slide: