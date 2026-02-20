5.1.3.2 (L1) Ensure users cannot create security groups

**Description:**
This setting allows users in the organization to create new security groups and add
members to these groups in the Azure portal, API, or PowerShell. These new groups
also show up in the Access Panel for all other users. If the policy setting on the group
allows it, other users can create requests to join these groups.

**Rationale:**
Allowing end users to create security groups without oversight can lead to uncontrolled
group sprawl, increasing the risk of inappropriate access to sensitive data. The default
assignment of group ownership to the creator introduces a potential for privilege
escalation, especially if IT teams overlook how these groups are later used to manage
access.
A more malicious scenario arises when a compromised non-privileged user creates
deceptively named security groups such as “Accounting” or “Break-glass”, or uses
homograph techniques to mimic legitimate group names. Third-party IT teams may be
particularly susceptible, as they might not be familiar with the environment or lack
consistent naming conventions. An unsuspecting administrator could then mistakenly
assign elevated privileges, grant access to sensitive data, or exclude these

#### Remediation action:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/.
2. Click to expand Entra ID > Groups select General.
3. Set Users can create security groups in Azure portals, API or PowerShell to No.

#### Related links

* [Microsoft Entra Admin Center](https://entra.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 193](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity/users/groups-self-service-management?WT.mc_id=Portal-Microsoft_AAD_IAM#group-settings)

<!--- Results --->
%TestResult%