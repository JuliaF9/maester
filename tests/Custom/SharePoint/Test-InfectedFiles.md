7.3.1 (L2) Ensure Office 365 SharePoint infected files are disallowed for download

**Description:**
By default, SharePoint online allows files that Defender for Office 365 has detected as
infected to be downloaded.

**Rationale:**
Defender for Office 365 for SharePoint, OneDrive, and Microsoft Teams protects your
organization from inadvertently sharing malicious files. When an infected file is detected
that file is blocked so that no one can open, copy, move, or share it until further actions
are taken by the organization's security team.

#### Remediation action:

To remediate using PowerShell:
1. Connect to SharePoint Online using Connect-SPOService -Url https://tenant-admin.sharepoint.com, replacing "tenant" with the appropriate value.
2. Run the following PowerShell command to set the recommended value:
   Set-SPOTenant –DisallowInfectedFileDownload $true

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 376](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/defender-office-365/safe-attachments-for-spo-odfb-teams-configure?view=o365-worldwide)

<!--- Results --->
%TestResult%