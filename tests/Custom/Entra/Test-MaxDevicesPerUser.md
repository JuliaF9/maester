5.1.4.2 (L1) Ensure the maximum number of devices per user is limited

**Description:**
This setting defines the maximum number of Microsoft Entra joined or registered
devices that a user can have in Microsoft Entra ID. Once this limit is reached, no
additional devices can be added until existing ones are removed. Values above 100 are
automatically capped at 100.
The recommended state is 20 or less..

**Rationale:**
Microsoft incident response teams have observed threat actors enrolling their own
devices to establish persistence after a non-privileged user has been compromised.
High device quotas can exacerbate this risk by enabling attackers to register multiple
devices that appear legitimate, while also contributing to unmanaged or personal
devices cluttering the environment, driving up licensing costs and complicating
compliance efforts.
Enforcing a reasonable device limit per user supports good governance, reduces the
attack surface, and encourages administrators to reassess and clean up legacy or
unused device enrollments.

#### Remediation action:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/.
2. Click to expand Entra ID > Devices select Device settings.
3. Set Maximum number of devices per user to 20 (Recommended) or less.

#### Related links

* [Microsoft Entra Admin Center](https://entra.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 200](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity/devices/manage-device-identities#configure-device-settings)

<!--- Results --->
%TestResult%