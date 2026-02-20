3.2.2 (L1) Ensure DLP policies are enabled for Microsoft Teams

**Description:**
The default Teams Data Loss Prevention (DLP) policy rule in Microsoft 365 is a
preconfigured rule that is automatically applied to all Teams conversations and
channels. The default rule helps prevent accidental sharing of sensitive information by
detecting and blocking certain types of content that are deemed sensitive or
inappropriate by the organization.

**Rationale:**
Enabling the default Teams DLP policy rule in Microsoft 365 helps protect an
organization's sensitive information by preventing accidental sharing or leakage Credit
Card information in Teams conversations and channels.
DLP rules are not one size fits all, but at a minimum something should be defined. The
organization should identify sensitive information important to them and seek to
intercept it using DLP.

#### Remediation action:

1. Navigate to Microsoft Purview compliance portal https://purview.microsoft.com/
2. Under Solutions select Data loss prevention then Policies.
3. Click Policies tab.
4. Check Default policy for Teams then click Edit policy.
5. The edit policy window will appear click Next
6. At the Choose locations to apply the policy page, turn the status toggle
to On for Teams chat and channel messages location and then click Next.
7. On Customized advanced DLP rules page, ensure the Default Teams DLP
policy rule Status is On and click Next.
8. On the Policy mode page, select the radial for Turn it on right away and click Next.
9. Review all the settings for the created policy on the Review your policy and
create it page, and then click submit.
10. Once the policy has been successfully submitted click Done.

#### Related links

* [Microsoft Purview](https://purview.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 156](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/exchange/connect-ippssession?view=exchange-ps)

<!--- Results --->
%TestResult%