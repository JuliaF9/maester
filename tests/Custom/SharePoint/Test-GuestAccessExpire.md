7.2.9 (L1) Ensure guest access to a site or OneDrive will expire automatically

**Description:**
This policy setting configures the expiration time for each guest that is invited to the
SharePoint site or with whom users share individual files and folders with.

**Rationale:**
This setting ensures that guests who no longer need access to the site or link no longer
have access after a set period of time. Allowing guest access for an indefinite amount of
time could lead to loss of data confidentiality and oversight.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint
2. Click to expand Policies > Sharing.
3. Scroll to and expand More external sharing settings.
4. Set Guest access to a site or OneDrive will expire automatically after this many days to 30

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 376](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/sharepoint/turn-external-sharing-on-or-off#change-the-organization-level-external-sharing-setting)

<!--- Results --->
%TestResult%