CUSTOM.001 Ensure all users have UsageLocation set to 'DE'

**Description:**
The `Test-UsageLocation` function checks whether all users in the organization have their `UsageLocation` set to a specified location, in this case, "DE" (Germany). It retrieves all user data from the Microsoft Graph API and filters out those whose `UsageLocation` is either not set to "DE" or is null. If all users meet the criteria, the function returns `true`. If any users are non-compliant, a detailed message is returned for each user, indicating which users do not have the correct UsageLocation setting.

**Rationale:**
Ensuring that all users have their `UsageLocation` set to the correct value is crucial for compliance, security, and operational consistency. The `UsageLocation` determines factors such as license assignments, legal compliance based on geographic location, and enforcement of location-based policies. By running this check, the organization can ensure that all users are in compliance with required geographic settings, preventing potential issues related to licensing, data residency, and regional legal requirements.

#### Related links

* [Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/enterprise/configure-user-account-properties-with-microsoft-365-powershell?view=o365-worldwide)

<!--- Results --->
%TestResult%

