1.3.5 (L1) Ensure internal phishing protection for Forms is enabled

**Description:**
Microsoft Forms can be used for phishing attacks by asking personal or sensitive
information and collecting the results. Microsoft 365 has built-in protection that will
proactively scan for phishing attempt in forms such personal information request.

**Rationale:**
Enabling internal phishing protection for Microsoft Forms will prevent attackers using
forms for phishing attacks by asking personal or other sensitive information and URLs.

#### Remediation action:

Make sure you are connected to Microsoft Graph using:
``` powershell
Connect-Graph -Scopes "OrgSettings-Forms.Read.All"
```
1. Navigate to Microsoft 365 admin center https://admin.microsoft.com.
2. Click to expand Settings then select Org settings.
3. Under Services select Microsoft Forms.
4. Click the checkbox labeled Add internal phishing protection under Phishing protection.
5. Click Save.

#### Related links

* [Microsoft 365 Admin Center](https://admin.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 59](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-US/microsoft-forms/review-unblock-forms-users-detected-blocked-potential-phishing)

<!--- Results --->
%TestResult%