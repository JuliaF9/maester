7.2.4 (L2) Ensure OneDrive content sharing is restricted

**Description:**
This setting governs the global permissiveness of OneDrive content sharing in the
organization.
OneDrive content sharing can be restricted independent of SharePoint but can never be
more permissive than the level established with SharePoint.

**Rationale:**
OneDrive, designed for end-user cloud storage, inherently provides less oversight and
control compared to SharePoint, which often involves additional content overseers or
site administrators. This autonomy can lead to potential risks such as inadvertent
sharing of privileged information by end users. Restricting external OneDrive sharing
will require users to transfer content to SharePoint folders first which have those tighter
controls.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint
2. Click to expand Policies > Sharing.
3. Locate the External sharing section.
4. Under OneDrive, set the slider bar to Only people in your organization.

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 379](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/sharepoint-online/set-spotenant?view=sharepoint-ps#-onedrivesharingcapability)

<!--- Results --->
%TestResult%