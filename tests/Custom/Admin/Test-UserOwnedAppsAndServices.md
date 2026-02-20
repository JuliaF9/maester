1.3.4 (L1) Ensure 'User owned apps and services' is restricted

**Description:**
By default, users can install add-ins in their Microsoft Word, Excel, and PowerPoint
applications, allowing data access within the application.
Do not allow users to install add-ins in Word, Excel, or PowerPoint.

**Rationale:**
Attackers commonly use vulnerable and custom-built add-ins to access data in user
applications.
While allowing users to install add-ins by themselves does allow them to easily acquire
useful add-ins that integrate with Microsoft applications, it can represent a risk if not
used and monitored carefully.
Disable future user's ability to install add-ins in Microsoft Word, Excel, or PowerPoint
helps reduce your threat-surface and mitigate this risk.

#### Remediation action:

1. Navigate to Microsoft 365 admin center https://admin.microsoft.com.
2. Click to expand Settings > Org settings.
3. In Services select User owned apps and services.
4. Uncheck Let users access the Office Store and Let users start trials on behalf of your organization.
5. Click Save.

#### Related links

* [Microsoft 365 Admin Center](https://admin.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 55](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/manage-addins-in-the-admin-center?view=o365-worldwide#manage-add-in-downloads-by-turning-onoff-the-office-store-across-all-apps-except-outlook)

<!--- Results --->
%TestResult%