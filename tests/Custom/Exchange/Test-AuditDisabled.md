6.1.1 (L1) Ensure 'AuditDisabled' organizationally is set to 'False'

**Description:**
The value False indicates that mailbox auditing on by default is turned on for the
organization. Mailbox auditing on by default in the organization overrides the mailbox
auditing settings on individual mailboxes. For example, if mailbox auditing is turned off
for a mailbox (the AuditEnabled property on the mailbox is False), the default mailbox
actions are still audited for the mailbox, because mailbox auditing on by default is turned
on for the organization.

**Rationale:**
Enforcing the default ensures auditing was not turned off intentionally or accidentally.
Auditing mailbox actions will allow forensics and IR teams to trace various malicious
activities that can generate TTPs caused by inbox access and tampering.

#### Remediation action:

To remediate using PowerShell:
1. Connect to Exchange Online using Connect-ExchangeOnline.
2. Run the following PowerShell command:
   Set-OrganizationConfig -AuditDisabled $false

#### Related links

* [Microsoft Exchange Admin Center](https://admin.exchange.microsoft.com/)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 325](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/exchange/set-organizationconfig?view=exchange-ps#-auditdisabled)

<!--- Results --->
%TestResult%