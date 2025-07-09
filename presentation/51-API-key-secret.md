## Storing secrets in GitHub

You can store your Qualtrics secrets in an `.Renviron` file that you keep in the root of your project that contains the following information:

```plaintext
QUALTRICS_API_KEY='something here'
QUALTRICS_BASE_URL='XXXX.qualtrics.com'
DATAVERSE_TOKEN='somethingelse'
DATAVERSE_SERVER='https://demo.dataverse.org'
DATAVERSE_DATASET_DOI='doi:10.70122/xxx/xxxxx'
```

You'll fill out the relevant missing information.

Then you will set the GitHub Actions secrets with

```plaintext
gh secret set -f .Renviron
```

