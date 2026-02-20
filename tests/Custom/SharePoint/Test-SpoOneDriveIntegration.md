7.2.2 (L1) Ensure SharePoint and OneDrive integration with Azure AD B2B is enabled

**Description:**
Entra ID B2B provides authentication and management of guests. Authentication
happens via one-time passcode when they don't already have a work or school account
or a Microsoft account. Integration with SharePoint and OneDrive allows for more
granular control of how guest user accounts are managed in the organization's AAD,
unifying a similar guest experience already deployed in other Microsoft 365 services
such as Teams.

**Rationale:**
External users assigned guest accounts will be subject to Entra ID access policies, such
as multi-factor authentication. This provides a way to manage guest identities and
control access to SharePoint and OneDrive resources. Without this integration, files can
be shared without account registration, making it more challenging to audit and manage
who has access to the organization's data.

#### Remediation action:

To remediate using PowerShell:
1. Connect to SharePoint Online using Connect-SPOService
2. Run the following command:
   Set-SPOTenant -EnableAzureADB2BIntegration $true

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 374](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/sharepoint/sharepoint-azureb2b-integration#enabling-the-integration)

<!--- Results --->
%TestResult%