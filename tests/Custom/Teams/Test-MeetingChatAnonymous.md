8.5.5 (L2) Ensure meeting chat does not allow anonymous users

**Description:**
This policy setting controls who has access to read and write chat messages during a
meeting.

**Rationale:**
Ensuring that only authorized individuals can read and write chat messages during a
meeting reduces the risk that a malicious user can inadvertently show content that is not
appropriate or view sensitive information.

#### Remediation action:

1. Navigate to Microsoft Teams admin center https://admin.teams.microsoft.com.
2. Select Settings & policies > Global (Org-wide default) settings.
3. Select Meetings to open the meeting settings section.
4. Under meeting engagement set Meeting chat to On for everyone but anonymous users.

#### Related links

* [Microsoft Teams Admin Center](https://admin.teams.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 446](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/skype/set-csteamsmeetingpolicy?view=skype-ps#-meetingchatenabledtype)

<!--- Results --->
%TestResult%