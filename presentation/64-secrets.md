## Secrets (Github version)

- You will want to keep  APIs key safe using **GitHub Secrets**.
- Secrets allow you to store sensitive information in the repository environment. 
- Use the secret as an environment variable in the GitHub workflow file. 

## Storing secrets in `.Renviron` locally

You already have a `.Renviron` for local development:

```{.bash}
QUALTRICS_API_KEY='something here'
```

- Do not publish this file!
- Do not commit it to Github![^gitignore]

[^gitignore]: Add `.Renviron` to your `.gitignore` file to prevent it from being tracked by Git and accidentally pushed to GitHub.

## Storing secrets in Github

::::{.columns}
::: {.column width="50%"}
- Enter them manually in the GitHub web interface
- Use the `.Renviron` file to set the GitHub Actions secrets with the [Github CLI](https://cli.github.com/):

```bash
gh secret set -f .Renviron
```
:::
::: {.column width="50%"}

```{.bash}

✓ Set Actions secret DATAVERSE_TOKEN for labordynamicsinstitute/tutorial-preserving-survey
✓ Set Actions secret QUALTRICS_BASE_URL for labordynamicsinstitute/tutorial-preserving-survey
✓ Set Actions secret DATAVERSE_SERVER for labordynamicsinstitute/tutorial-preserving-survey
✓ Set Actions secret QUALTRICS_API_KEY for labordynamicsinstitute/tutorial-preserving-survey
✓ Set Actions secret DATAVERSE_DATASET_DOI for labordynamicsinstitute/tutorial-preserving-survey
```
:::
::::

## Using secrets in GitHub Actions

In GitHub workflows, set your environment variables:

```bash
echo "QUALTRICS_API_KEY=${{ secrets.QUALTRICS_API_KEY }}" >> $GITHUB_ENV
```

## Using secrets in Github Actions

- R code does **not** need to be adapted!


```{.R code-line-numbers="2"}
# Same R code as before!
if (Sys.getenv("QUALTRICS_API_KEY") != "") {
  data.raw <- fetch_survey(surveyID = QUALTRICS_SURVEY, verbose = TRUE) 
} else {
  stop("Please set the QUALTRICS_API_KEY environment 
  variable to your API key.")
}
```
