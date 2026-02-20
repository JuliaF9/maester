7.2.5 (L2) Ensure that SharePoint guest users cannot share items they don't own

**Description:**
SharePoint gives users the ability to share files, folders, and site collections. Internal
users can share with external collaborators, and with the right permissions could share
to other external parties.

**Rationale:**
Sharing and collaboration are key; however, file, folder, or site collection owners should
have the authority over what external users get shared with to prevent unauthorized
disclosures of information.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint
2. Click to expand Policies then select Sharing.
3. Expand More external sharing settings, uncheck Allow guests to share items they don't own.
4. Click Save.

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 382](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/sharepoint/turn-external-sharing-on-or-off)

<!--- Results --->
%TestResult%