6.5.2 (L1) Ensure MailTips are enabled for end users

**Description:**
MailTips are informative messages displayed to users while they're composing a
message. While a new message is open and being composed, Exchange analyzes the
message (including recipients). If a potential problem is detected, the user is notified
with a MailTip prior to sending the message. Using the information in the MailTip, the
user can adjust the message to avoid undesirable situations or non-delivery reports
(also known as NDRs or bounce messages).

**Rationale:**
Setting up MailTips gives a visual aid to users when they send emails to large groups of
recipients or send emails to recipients not within the tenant.

#### Remediation action:

To remediate using PowerShell:
1. Connect to Exchange Online using Connect-ExchangeOnline.
2. Run the following PowerShell command:
   $TipsParams = @{
        MailTipsAllTipsEnabled = $true
        MailTipsExternalRecipientsTipsEnabled = $true
        MailTipsGroupMetricsEnabled = $true
        MailTipsLargeAudienceThreshold = '25'
   }
   Set-OrganizationConfig @TipsParams

#### Related links

* [Microsoft Exchange Admin Center](https://admin.exchange.microsoft.com/)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 358](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/exchange/set-organizationconfig?view=exchange-ps)

<!--- Results --->
%TestResult%