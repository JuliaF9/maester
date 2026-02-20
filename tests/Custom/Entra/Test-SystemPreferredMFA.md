5.2.3.6 (L1) Ensure system-preferred multifactor authentication is enabled

**Description:**
System-preferred multifactor authentication (MFA) prompts users to sign in by using the
most secure method they registered.
The user is prompted to sign-in with the most secure method according to the below
order. The order of authentication methods is dynamic. It's updated by Microsoft as the
security landscape changes, and as better authentication methods emerge.

**Rationale:**
Regardless of the authentication method enabled by an administrator or set as
preferred by the user, the system will dynamically select the most secure option
available at the time of authentication. This approach acts as an additional safeguard to
prevent the use of weaker methods, such as voice calls, SMS, and email OTPs, which
may have been inadvertently left enabled due to misconfiguration or lack of
configuration hardening.
Enforcing the default behavior also ensures the feature is not disabled.

#### Remediation action:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/.
2. Click to expand Entra ID > Authentication methods.
3. Select Settings.
4. Set the System-preferred multifactor authentication State to Enabled and include All users.
5. Any users exclusions should be documented and reviewed annually.

#### Related links

* [Microsoft Entra Admin Center](https://entra.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 294](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity/authentication/concept-system-preferred-multifactor-authentication)

<!--- Results --->
%TestResult%