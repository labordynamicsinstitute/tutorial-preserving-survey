
## Loading data from Qualtrics using API

An API token is assigned to your Qualtrics account and is used to request data from a survey. 

However, this token is your **secret token** and you don't want this appearing in your published code!

---

**Solutions**

- Set it manually: 

```{.R}
Sys.setenv(QUALTRICS_API_KEY = "your-token")
```

- Set it using environment variables stored outside your code (e.g., in `.Renviron` file)
	 - That is how we do it for this presentation during development!
	 
```{.R}
QUALTRICS_API_KEY="your-token"
```

---

- We can also push these "secrets" to GitHub Secrets and load it in GitHub Actions 
  - This is how we do it in this tutorial - see source code!

```{.R}
# Here environment variables are read from .Renviron
QUALTRICS_API_KEY <- Sys.getenv("QUALTRICS_API_KEY")
```
