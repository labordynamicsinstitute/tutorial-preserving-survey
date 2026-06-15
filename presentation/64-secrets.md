## Secrets

- You will want to keep your API key safe using GitHub secrets.

- Secrets allow you to store sensitive information in your repository environment. You create secrets to use in GitHub Actions workflows.

- To make a secret available to an action, you must set the secret as an environment variable in your GitHub workflow file. 

## Storing secrets in `.Renviron` locally

You can store your Qualtrics secrets in an `.Renviron` file that you keep in the root of your project that contains the following information (fill in the true values):

```plaintext
QUALTRICS_API_KEY='something here'
QUALTRICS_BASE_URL='url goes here'
DATAVERSE_TOKEN='token goes here'
DATAVERSE_SERVER='https://demo.dataverse.org'
DATAVERSE_DATASET_DOI='doi goes here'
```

Do not publish this file!

## Storing secrets in Github


You can use the `.Renviron` file to set the GitHub Actions secrets with

```plaintext
gh secret set -f .Renviron
```

instead of using the web interface! (You need the [Github CLI](https://cli.github.com/))

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
