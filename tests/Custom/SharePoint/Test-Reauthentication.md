7.2.10 (L1) Ensure reauthentication with verification code is restricted

**Description:**
This setting configures if guests who use a verification code to access the site or links
are required to reauthenticate after a set number of days.

**Rationale:**
By increasing the frequency of times guests need to reauthenticate this ensures guest
user access to data is not prolonged beyond an acceptable amount of time.

#### Remediation action:

1. Navigate to SharePoint admin center https://admin.microsoft.com/sharepoint
2. Click to expand Policies > Sharing.
3. Scroll to and expand More external sharing settings.
4. Set People who use a verification code must reauthenticate after
this many days to 15 or less.

#### Related links

* [Microsoft Sharepoint Admin Center](https://admin.microsoft.com/sharepoint)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 395](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/sharepoint/turn-external-sharing-on-or-off#change-the-organization-level-external-sharing-setting)

<!--- Results --->
%TestResult%