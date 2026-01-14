

## Overview

## Timing

::: {.columns-2}

:::: {.column}

Consider the following questions:

Once you have **collected** the data
- is it really going to change?

Once you have registered your analysis plan
- should the **processing and analysis** really change?

::::

:::: {.column}

<img alt="Cycle" src="tutorial-archiving/cycle1.png" width="100%">

::::

:::

## Modified Data and Workflow

::: {.columns-2}

:::: {.column}


Let's consider the preservation part separately:

::::

:::: {.column}

<img alt="With reuse" src="tutorial-archiving/cycle2.png" width="100%">

::::

:::


## Modified Data and Workflow

::: {.columns-2}

:::: {.column}

Preserve as you go

::::

:::: {.column}

<img alt="Modified" src="tutorial-archiving/cycle2-2.png" width="100%">

::::

:::

## Note: Doubtful ethics of others...


<div style="text-align: center; font-size: 200%;">
I don't want to be scooped!
<br />
<br/>
Thus, I'm not going to publish my raw data just yet!
</div>



# What is preservation

## Preservation {.smaller}

::: {.columns-2}

:::: {.column}

- Preservation != publication, != sharing
- In fact, preservation may mean: not very accessible at all!
- Preservation is intended to maintain data for tens, even hundreds of years
  - Preservation may involve curation: active transformation of the data for improved accessibility
  
::::

:::: {.column}

<img alt="Stacks" src="images/Archives-Stacks-1.jpg" with="60%">

::::

:::
  
## What is publication


Publication typically involves making information about the data, as well as the data themselves, available to others.

- Publication can initially mean that only **metadata** (information about the data) is published
- In some cases, it may be that **only** metadata is ever published
- But the metadata will point to how to access the data, how long the data will be preserved, and other salient facts


## This all seems so complicated

- I need to preserve my data for decades!
- I need to manage the application process for decades!
- Where do I get that DOI thing?
- How to I get Google to index my data?



## Let's start

<div style="text-align: center;">
<img src="images/giphy_scan.gif" width="50%" alt="scan" />
</div>


## Options for Preservation (1)


**Trusted Repositories**

Journals and institutions have assessed a number of trusted repositories:

- [CoreTrustSeal](https://www.coretrustseal.org/) has a certification process
- [re3data.org](https://www.re3data.org/) lists research data repositories
- [Nature](https://www.nature.com/sdata/policies/repositories), [F1000Research](https://f1000research.com/for-authors/data-guidelines#hosting), and [PLOS](https://journals.plos.org/plosone/s/data-availability) have lists of trusted repositories. 
- Always check with your journal for specific restrictions or suggestions.

## Options for Preservation (2)

**Trusted Repositories**

- These generally include at least the following:

  -  [Dryad Digital Repository](http://datadryad.org/)
  -  [figshare](http://figshare.com/)
  -  [Harvard Dataverse](https://dataverse.harvard.edu)
  -  [ICPSR](https://www.icpsr.umich.edu/icpsrweb/) and [OPENICPSR](https://www.openicpsr.org/openicpsr/)
  -  [Open Science Framework](http://osf.io/)
  -  [Zenodo](http://zenodo.org/)
  - Country or region-specific repositories (that nevertheless generally accept depositors from anywhere): [GESIS](https://datorium.gesis.org/xmlui/) (Germany), [Swedish National Data Service (SND)](https://snd.gu.se/en/describe-and-deposit-data), [EASY](https://easy.dans.knaw.nl/ui/home) (Netherlands), [CSIRO](https://data.csiro.au/collections/) (Australia), etc.
- Many universities have formal document repositories that may be able to assume such a role; talk to your (data) librarian

## What are NOT options for preservation

::: {.columns-2}

:::: {.column}

- Github, Gitlab, Bitbucket, etc.
- Dropbox, Box.com, Google Drive, etc.
- Your personal website
- Your university's departmental website

::::

:::: {.column}

<img alt="404" src="images/google-404.png" width="100%">

<img alt="404-gh" src="images/Page_not_found_GitHub_Pages.png" width="100%">

::::

:::

## Options for Preservation

::: {.columns}

:::: {.column width="50%"}

Here: Demo Dataverse for Lars <https://demo.dataverse.org/dataverse/larstest>

![](images/demo-dataverse-lars.png)

::::

:::: {.column width="50%"}
In one of my day jobs:

<img alt="openicpsr" src="images/openicpsr-main-page.png" width="100%">

::::

:::

## Getting started on Dataverse

We will NOT use the regular Dataverse; rather, we will test on the demo site. 

- This also works with Zenodo: **<https://sandbox.zenodo.org/>**
- Check your URL bar! There's often no other indication that this is not the real Zenodo or Dataverse!



## A tutorial of sorts

- Demo Dataverse for Lars <https://demo.dataverse.org/dataverse/larstest>

## Remember the API tokens?


```plaintext
QUALTRICS_API_KEY='something here'
QUALTRICS_BASE_URL='url goes here'
DATAVERSE_TOKEN='token goes here'
DATAVERSE_SERVER='https://demo.dataverse.org'
DATAVERSE_DATASET_DOI='doi goes here'
```

We're going to need the last three here!

## Uploading data to Dataverse

- From terminal: 

```{.bash}
python3 -m venv venv-dv
source venv-dv/bin/activate
source .Renviron
git clone https://github.com/larsvilhuber/dataverse-uploader
pip install -r dataverse-uploader/requirements.txt
python3 dataverse-uploader/dataverse.py \
   $DATAVERSE_TOKEN $DATAVERSE_SERVER \ 
   $DATAVERSE_DATASET_DOI . -d data
```

## Automatically from Github Actions


- [Code for uploading automatically](https://github.com/labordynamicsinstitute/tutorial-preserving-survey/blob/main/.github/workflows/compile-presentation.yml#L175)

## Voilà!

We have a workflow that can automatically download from Qualtrics, and in the same move, upload to Dataverse!

Possible improvements:

- [immediately publish (no human intervention)](https://github.com/labordynamicsinstitute/tutorial-preserving-survey/blob/main/.github/workflows/compile-presentation.yml#L193)
- upload the download logs and checksums together with the data
- [run on a schedule](https://github.com/labordynamicsinstitute/tutorial-preserving-survey/blob/main/.github/workflows/compile-presentation.yml#L8)