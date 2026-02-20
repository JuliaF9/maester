5.1.2.2 (L2) Ensure third party integrated applications are not allowed

**Description:**
App registration allows users to register custom-developed applications for use within
the directory.

**Rationale:**
Third-party integrated applications connection to services should be disabled unless
there is a very clear value and robust security controls are in place. While there are
legitimate uses, attackers can grant access from breached accounts to third party
applications to exfiltrate data from your tenancy without having to maintain the breached
account.

#### Remediation action:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/.
2. Click to expand Entra ID > Users select Users settings.
3. Set Users can register applications to No.
4. Click Save.

#### Related links

* [Microsoft Entra Admin Center](https://entra.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 177](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity-platform/how-applications-are-added)

<!--- Results --->
%TestResult%