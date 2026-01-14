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

