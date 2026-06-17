## Side-note: Qualtrics API credentials

Qualtrics API credentials cannot be restricted to a single survey. [skip](#secrets)


## Traditional Static API Tokens (`X-API-TOKEN`)

* **The Limit:** You can only have **one** active static API token per user account at a time.
* **The Catch:** If you go to your account settings and generate a new token for a second application, it will **immediately overwrite and invalidate** the old token, breaking your first application.

## OAuth 2.0 Client Credentials

Separate, independent credentials for different applications:

* **Account Settings** > **Qualtrics IDs** > **OAuth Client Manager**.
* Click **Create Client** to generate unique sets of `Client ID` and `Client Secret` credentials.
* You can create **multiple clients** for different applications
* To revoke access for one app, you can delete its specific client without affecting the others.

## BUT: API Key access ALL your surveys

- Regardless of method, the API key can access ALL of your surveys!
- There is **NO** way to restrict that natively.

That's a problem.


## Workaround: "Service Account"

- You can create a specific user, say `jpal-survey-user`
- Requires support from system administrator
- Once the user is created, proceed as before, but when logged in as `jpal-survey-user`! 
- As `YOU`, share only the specific survey with `jpal-survey-user` and give it only the permissions it needs

## It's a bit more complicated... {.orange}