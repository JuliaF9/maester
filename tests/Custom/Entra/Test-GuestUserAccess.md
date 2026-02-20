5.1.6.2 (L1) Ensure that guest user access is restricted

**Description:**
Microsoft Entra ID, part of Microsoft Entra, allows you to restrict what external guest
users can see in their organization in Microsoft Entra ID. Guest users are set to a limited
permission level by default in Microsoft Entra ID, while the default for member users is
the full set of user permissions.
These directory level permissions are enforced across Microsoft Entra services
including Microsoft Graph, PowerShell v2, the Azure portal, and My Apps portal.
Microsoft 365 services leveraging Microsoft 365 groups for collaboration scenarios are
also affected, specifically Outlook, Microsoft Teams, and SharePoint. They do not
override the SharePoint or Microsoft Teams guest settings.
The recommended state is at least Guest users have limited access to
properties and memberships of directory objects or more restrictive.

**Rationale:**
By limiting guest access to the most restrictive state this helps prevent malicious group
and user object enumeration in the Microsoft 365 environment. This first step, known as
reconnaissance in The Cyber Kill Chain, is often conducted by attackers prior to more
advanced targeted attacks.

#### Remediation action:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/.
2. Click to expand Entra ID > External Identities select External collaboration settings.
3. Under Guest user access set Guest user access restrictions to one of the following:
   o State: Guest users have limited access to properties and memberships of directory objects
   o State: Guest user access is restricted to properties and memberships of their own directory objects (most restrictive)

#### Related links

* [Microsoft Entra Admin Center](https://entra.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 226](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity/users/users-restrict-guest-permissions)

<!--- Results --->
%TestResult%