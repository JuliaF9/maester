7.2.11 (L1) Ensure the SharePoint default sharing link permission is set

**Description:**
This setting configures the permission that is selected by default for sharing link from a
SharePoint site.

**Rationale:**
Setting the view permission as the default ensures that users must deliberately select
the edit permission when sharing a link. This approach reduces the risk of
unintentionally granting edit privileges to a resource that only requires read access,
supporting the principle of least privilege.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint
2. Click to expand Policies > Sharing.
3. Scroll to File and folder links.
4. Set Choose the permission that's selected by default for sharing
links to View.

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 398](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/sharepoint/turn-external-sharing-on-or-off#file-and-folder-links)

<!--- Results --->
%TestResult%