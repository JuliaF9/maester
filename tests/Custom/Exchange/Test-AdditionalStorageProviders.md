6.5.3 (L2) Ensure additional storage providers are restricted in Outlook on the web

**Description:**
This setting allows users to open certain external files while working in Outlook on the
web. If allowed, keep in mind that Microsoft doesn't control the use terms or privacy
policies of those third-party services.

**Rationale:**
By default, additional storage providers are allowed in Office on the Web (such as Box,
Dropbox, Facebook, Google Drive, OneDrive Personal, etc.). This could lead to
information leakage and additional risk of infection from organizational non-trusted
storage providers. Restricting this will inherently reduce risk as it will narrow
opportunities for infection and data leakage.

#### Remediation action:

To remediate using PowerShell:
1. Connect to Exchange Online using Connect-ExchangeOnline.
2. Run the following PowerShell command:
   Set-OwaMailboxPolicy -Identity OwaMailboxPolicy-Default -
   AdditionalStorageProvidersAvailable $false

#### Related links

* [Microsoft Exchange Admin Center](https://admin.exchange.microsoft.com/)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 361](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/exchange/set-owamailboxpolicy?view=exchange-ps)

<!--- Results --->
%TestResult%