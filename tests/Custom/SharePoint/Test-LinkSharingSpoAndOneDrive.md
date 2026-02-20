7.2.7 (L1) Ensure link sharing is restricted in SharePoint and OneDrive

**Description:**
This setting sets the default link type that a user will see when sharing content in
OneDrive or SharePoint. It does not restrict or exclude any other options.

**Rationale:**
By defaulting to specific people, the user will first need to consider whether or not the
content being shared should be accessible by the entire organization versus select
individuals. This aids in reinforcing the concept of least privilege.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint
2. Click to expand Policies > Sharing.
3. Scroll to File and folder links.
4. Set Choose the type of link that's selected by default when users
share files and folders in SharePoint and OneDrive to Specific
people (only the people the user specifies) or Only people in your
organization.

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 388](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/sharepoint-online/set-spotenant?view=sharepoint-ps)

<!--- Results --->
%TestResult%