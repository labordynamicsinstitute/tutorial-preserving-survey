## Storing secrets in GitHub

You can store your Qualtrics secrets in an `.Renviron` file that you keep in the root of your project that contains the following information:

```plaintext
QUALTRICS_API_KEY='something here'
QUALTRICS_BASE_URL='url goes here'
DATAVERSE_TOKEN='token goes here'
DATAVERSE_SERVER='https://demo.dataverse.org'
DATAVERSE_DATASET_DOI='doi goes here'
```

You'll fill out missing information with your specific details.

Then you will set the GitHub Actions secrets with

```plaintext
gh secret set -f .Renviron
```

