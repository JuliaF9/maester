8.2.1 (L2) Ensure external domains are restricted in the Teams admin center

**Description:**
This policy controls whether external domains are allowed, blocked or permitted based
on an allowlist or denylist. When external domains are allowed, users in your
organization can chat, add users to meetings, and use audio video conferencing with
users in external organizations.

**Rationale:**
Allowlisting external domains that an organization is collaborating with allows for
stringent controls over who an organization's users are allowed to make contact with.

#### Remediation action:

1. Navigate to Microsoft Teams admin center https://admin.teams.microsoft.com/.
2. Click to expand Users select External access.
3. Select the Policies tab
4. Click on the Global (Org-wide default) policy.
5. Set Teams and Skype for Business users in external organizations to Off.
6. Click Save.

#### Related links

* [Microsoft Teams Admin Center](https://admin.teams.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 416](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/microsoftteams/trusted-organizations-external-meetings-chat?tabs=organization-settings)

<!--- Results --->
%TestResult%