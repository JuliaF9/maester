1.3.7 (L2) Ensure 'third-party storage services' are restricted in 'Microsoft 365 on the web'

**Description:**
Third-party storage can be enabled for users in Microsoft 365, allowing them to store
and share documents using services such as Dropbox, alongside OneDrive and team
sites.

**Rationale:**
By using external storage services an organization may increase the risk of data
breaches and unauthorized access to confidential information. Additionally, third-party
services may not adhere to the same security standards as the organization, making it
difficult to maintain data privacy and security.

#### Remediation action:

1. Navigate to Microsoft 365 admin center https://admin.microsoft.com
2. Go to Settings > Org Settings > Services > Microsoft 365 on the web
3. Uncheck Let users open files stored in third-party storage
services in Microsoft 365 on the web

#### Related links

* [Microsoft 365 Admin Center](https://admin.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 63](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/admin/setup/set-up-file-storage-and-sharing?view=o365-worldwide#enable-or-disable-third-party-storage-services)

<!--- Results --->
%TestResult%