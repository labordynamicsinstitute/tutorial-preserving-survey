
```{r qrcode}
#| echo: false
library(qrcode)

code <- qr_code(QUALTRICS_URL)
generate_svg(code, file = "qrcode.svg")

png(filename="qrcode.png")
plot(code)
invisible(dev.off())

knitr::include_graphics("qrcode.png")

```

