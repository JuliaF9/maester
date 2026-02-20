7.2.3 (L1) Ensure external content sharing is restricted

**Description:**
The external sharing settings govern sharing for the organization overall. Each site has
its own sharing setting that can be set independently, though it must be at the same or
more restrictive setting as the organization.
The new and existing guests option requires people who have received invitations to
sign in with their work or school account (if their organization uses Microsoft 365) or a
Microsoft account, or to provide a code to verify their identity. Users can share with
guests already in your organization's directory, and they can send invitations to people
who will be added to the directory if they sign in.

**Rationale:**
Forcing guest authentication on the organization's tenant enables the implementation of
controls and oversight over external file sharing. When a guest is registered with the
organization, they now have an identity which can be accounted for. This identity can
also have other restrictions applied to it through group membership and conditional
access rules.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint
2. Click to expand Policies > Sharing.
3. Locate the External sharing section.
4. Under SharePoint, move the slider bar to New and existing guests or a less permissive level.
   o OneDrive will also be moved to the same level and can never be more permissive than SharePoint.

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 376](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/sharepoint-online/set-spotenant?view=sharepoint-ps)

<!--- Results --->
%TestResult%