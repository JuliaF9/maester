8.5.8 (L2) Ensure external meeting chat is off

**Description:**
This meeting policy setting controls whether users can read or write messages in
external meeting chats with untrusted organizations. If an external organization is on the
list of trusted organizations this setting will be ignored.

**Rationale:**
Restricting access to chat in meetings hosted by external organizations limits the
opportunity for an exploit like GIFShell or DarkGate malware from being delivered to
users.

#### Remediation action:

1. Navigate to Microsoft Teams admin center https://admin.teams.microsoft.com.
2. Select Settings & policies > Global (Org-wide default) settings.
3. Select Meetings to open the meeting settings section.
4. Under meeting engagement set External meeting chat to Off.

#### Related links

* [Microsoft Teams Admin Center](https://admin.teams.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 453](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/microsoftteams/settings-policies-reference#meeting-engagement)

<!--- Results --->
%TestResult%