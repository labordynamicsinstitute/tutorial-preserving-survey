
## Take our survey {.smaller}

:::: {.columns}

::: {.column width="30%"}

:::

::: {.column width="40%"}
```{r qrcode}
#| echo: false
library(qrcode)

code <- qr_code(QUALTRICS_URL)
generate_svg(code, file = "survey-qrcode.svg")

png(filename="survey-qrcode.png")
plot(code)
invisible(dev.off())

knitr::include_graphics("survey-qrcode.png")

```


:::

::: {.column width="30%"}

:::

::::
