## Side-note: Qualtrics API credentials

The behavior of Qualtrics API credentials depends on whether you are using traditional static tokens or modern OAuth credentials.

---

## Multiple API Keys / Tokens

### 1. Traditional Static API Tokens (`X-API-TOKEN`)

* **The Limit:** You can only have **one** active static API token per user account at a time.
* **The Catch:** If you go to your account settings and generate a new token for a second application, it will **immediately overwrite and invalidate** the old token, breaking your first application.

### 2. The Solution: OAuth 2.0 Client Credentials

If you need separate, independent credentials for different applications, you should avoid static tokens and use **OAuth 2.0** instead:

* Navigate to **Account Settings** > **Qualtrics IDs** > **OAuth Client Manager**.
* Here, you can click **Create Client** to generate unique sets of `Client ID` and `Client Secret` credentials.
* You can create **multiple clients** for different applications (e.g., one for Salesforce, one for an internal BI tool, one for a Python script). If you need to revoke access for one app, you can delete its specific client without affecting the others.

---

## Restricting an API Key to a Single Survey

Directly out of the box, **no**. Qualtrics does not allow you to restrict an API token or an OAuth client to a specific `Survey ID` via API scopes. An API key inherits the **exact permissions of the user account** that generated it. If your personal account has access to 100 surveys, any API key you generate will also have access to all 100 surveys.

However, you can easily enforce a single-survey limit by using a standard **Service Account** workaround:

### Step-by-Step "Service Account" Workaround

1. **Create a Service User:** Have your Qualtrics Brand Administrator create a dummy/dedicated user account specifically for your application (e.g., `survey_xyz_api@yourcompany.com`).
2. **Collaborate on the Survey:** Log into your main account, find the single survey you want to grant access to, and use the **Collaborate / Share** setting to share it with the service account.
3. **Set Granular Permissions:** Within the collaboration settings, check only the permissions the API actually needs (e.g., check *View Reports* and *Download Survey Results*, but uncheck *Edit* or *Copy*).
4. **Generate Credentials from the Service User:** Log into Qualtrics *as the service user* and generate your API token or OAuth Client credentials there.

Because that service account can only see the single survey you shared with it, the API credentials are automatically locked down to that survey alone.