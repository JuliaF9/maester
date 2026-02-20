8.1.2 (L1) Ensure users can't send emails to a channel email address

**Description:**
This setting controls whether Teams channels are allowed to receive emails sent to
their unique email addresses. When enabled, emails sent to a channel's address will be
delivered and appear in the channel's conversation thread; when disabled, the channel
will reject incoming emails, preventing them from being posted.

**Rationale:**
Channel email addresses are not under the tenant’s domain and organizations do not
have control over the security settings for this email address. An attacker could email
channels directly if they discover the channel email address.

#### Remediation action:

1. Navigate to Microsoft Teams admin center https://admin.teams.microsoft.com.
2. Select Settings & policies > Global (Org-wide default) settings.
3. Click Teams to open the Teams settings section.
4. Under email integration set Users can send emails to a channel email address to Off.

#### Related links

* [Microsoft Teams Admin Center](https://admin.teams.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 412](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/step-by-step-guides/reducing-attack-surface-in-microsoft-teams?view=o365-worldwide#restricting-channel-email-messages-to-approved-domains)

<!--- Results --->
%TestResult%