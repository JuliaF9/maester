5.1.4.6 (L2) Ensure users are restricted from recovering BitLocker keys

**Description:**
This setting determines if users can self-service recover their BitLocker key(s). 'Yes'
restricts non-admin users from being able to see the BitLocker key(s) for their owned
devices if there are any. 'No' allows all users to recover their BitLocker key(s).
The recommended state is Yes.

**Rationale:**
Restricting user access to the self-service BitLocker recovery key portal helps mitigate
the risk of recovery key exposure in the event of a compromised user account. If an
attacker gains access to both the user’s credentials and the physical device, they could
potentially retrieve the recovery key and decrypt sensitive data. The recovery key itself
is also considered sensitive information.

#### Remediation action:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/.
2. Click to expand Entra ID > Devices select Device settings.
3. Set Restrict users from recovering the BitLocker key(s) for their owned devices to Yes.

#### Related links

* [Microsoft Entra Admin Center](https://entra.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 212](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity/devices/manage-device-identities#configure-device-settings)

<!--- Results --->
%TestResult%