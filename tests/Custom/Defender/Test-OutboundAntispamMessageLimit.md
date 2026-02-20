2.1.15 (L1) Ensure outbound anti-spam message limits are in place

**Description:**
The default outbound anti-spam policy in Microsoft Defender automatically applies to all
users and is designed to detect and limit suspicious email-sending behavior. The policy
enforces limits based on both volume and spam detection. If a user sends too many
emails too quickly or if a high percentage of their messages are flagged as spam, their
ability to send email can be temporarily restricted. This helps prevent abuse from
compromised accounts or inadvertent spam campaigns.

**Rationale:**
Message limit settings help lessen the impact of a Business Email Compromise (BEC)
by automatically restricting accounts that send unusually high volumes of email. This
containment prevents compromised accounts from launching large-scale attacks and
helps ensure the organization’s email remains trusted and deliverable. Without these
limits, excessive or suspicious outbound traffic could result in Microsoft blocking the
organization’s email, disrupting communication and damaging reputation.

#### Remediation action:

1. Navigate to Microsoft 365 Defender https://security.microsoft.com.
2. Click to expand Email & collaboration select Policies & rules> Threat policies.
3. Under Policies select Anti-spam and click to open Anti-spam outbound policy (Default).
4. Select Edit protection settings.
5. Set the following settings to the recommended values, or more restrictive values.
   o External: Set an external message limit - 500
   o Internal: Set an internal message limit - 1000
   o Daily: Set a daily message limit - 1000
   o Action: Restriction placed on users who reach the message limit - Restrict the user from sending mail
6. Ensure Notify these users and groups if a sender is blocked due to sending outbound spam contains a monitored mailbox.

#### Related links

* [Microsoft 365 Defender](https://security.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 127](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/defender-office-365/outbound-spam-protection-about)

<!--- Results --->
%TestResult%