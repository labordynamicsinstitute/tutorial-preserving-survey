# Some notes

---

> - [ ] **Create a survey** (in Qualtrics) for data collection.
> - [ ] Load the latest responses from the server **using an API**

---

There is not much in this tutorial that requires Qualtrics.

- You could do this with SurveyCTO, LimeSurvey, or any other system that has an API. 
- You could do this with Google Forms, if you have linked it to a Google Sheet.
- You could do this with a **lab experiment** system that stores data in an SQL database

---

> - [ ] Clean and process the data to **remove non-public data automatically**.

It is important to remove any PII or confidential information as soon as possible. 

---

- That may not always be feasible. For instance, if you need geolocation to merge in contextual data, or compute distances, then some data processing may unavoidably require access to sensitive data.
- But any data that is not needed should be removed early on.
- This is not irreversible: if you later find that you need more data elements, you can always re-process the raw data, stored on Qualtrics, until your IRB requires that you delete those data.

---

> - [ ] **Preserve** shareable data in a trusted repository
> - [ ] Later, **publish those data** with a credible record of when it was first preserved!

It is important to distinguish

- **preserving data** from
- **publishing** data, and possibly
- **sharing data with collaborators**