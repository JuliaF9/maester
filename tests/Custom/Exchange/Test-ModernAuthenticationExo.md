6.5.1 (L1) Ensure modern authentication for Exchange Online is enabled

**Description:**
Modern authentication in Microsoft 365 enables authentication features like multifactor
authentication (MFA) using smart cards, certificate-based authentication (CBA), and
third-party SAML identity providers. When you enable modern authentication in
Exchange Online, Outlook 2016 and Outlook 2013 use modern authentication to log in
to Microsoft 365 mailboxes. When you disable modern authentication in Exchange
Online, Outlook 2016 and Outlook 2013 use basic authentication to log in to Microsoft
365 mailboxes.

**Rationale:**
Strong authentication controls, such as the use of multifactor authentication, may be
circumvented if basic authentication is used by Exchange Online email clients such as
Outlook 2016 and Outlook 2013. Enabling modern authentication for Exchange Online
ensures strong authentication mechanisms are used when establishing sessions
between email clients and Exchange Online.

#### Remediation action:

1. Navigate to Microsoft 365 admin center https://admin.microsoft.com.
2. Click to expand Settings select Org Settings.
3. Select Modern authentication.
4. Check Turn on modern authentication for Outlook 2013 for Windows
and later (recommended) to enable modern authentication.

#### Related links

* [Microsoft Exchange Admin Center](https://admin.exchange.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 355](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/enable-or-disable-modern-authentication-in-exchange-online)

<!--- Results --->
%TestResult%