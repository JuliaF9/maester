5.1.2.3 (L1) Ensure 'Restrict non-admin users from creating tenants' is set to 'Yes'

**Description:**
Non-privileged users can create tenants in the Microsoft Entra ID and Microsoft Entra
administration portal under "Manage tenant". The creation of a tenant is recorded in the
Audit log as category "DirectoryManagement" and activity "Create Company". By
default, the user who creates a Microsoft Entra tenant is automatically assigned the
Global Administrator role. The newly created tenant doesn't inherit any settings or
configurations.

**Rationale:**
Restricting tenant creation prevents unauthorized or uncontrolled deployment of
resources and ensures that the organization retains control over its infrastructure. User
generation of shadow IT could lead to multiple, disjointed environments that can make it
difficult for IT to manage and secure the organization's data, especially if other users in
the organization began using these tenants for business purposes under the
misunderstanding that they were secured by the organization's security team.

#### Remediation action:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/
2. Click to expand Entra ID > Users > User settings.
3. Set Restrict non-admin users from creating tenants to Yes then Save.

#### Related links

* [Microsoft Entra Admin Center](https://entra.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 179](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/entra/fundamentals/users-default-permissions#restrict-member-users-default-permissions)

<!--- Results --->
%TestResult%