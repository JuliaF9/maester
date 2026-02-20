7.2.1 (L1) Ensure modern authentication for SharePoint applications is required

**Description:**
Modern authentication in Microsoft 365 enables authentication features like multifactor
authentication (MFA) using smart cards, certificate-based authentication (CBA), and
third-party SAML identity providers.

**Rationale:**
Strong authentication controls, such as the use of multifactor authentication, may be
circumvented if basic authentication is used by SharePoint applications. Requiring
modern authentication for SharePoint applications ensures strong authentication
mechanisms are used when establishing sessions between these applications,
SharePoint, and connecting users.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint.
2. Click to expand Policies select Access control.
3. Select Apps that don't use modern authentication.
4. Select the radio button for Block access.
5. Click Save.

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 371](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/sharepoint-online/set-spotenant?view=sharepoint-ps)

<!--- Results --->
%TestResult%