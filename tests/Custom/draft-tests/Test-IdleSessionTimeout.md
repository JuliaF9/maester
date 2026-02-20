1.3.2 (L2) Ensure 'Idle session timeout' is set to '3 hours (or less)' for unmanaged devices

**Description:**
Idle session timeout allows the configuration of a setting which will timeout inactive
users after a pre-determined amount of time. When a user reaches the set idle timeout
session, they'll get a notification that they're about to be signed out. They must choose
to stay signed in or they'll be automatically signed out of all Microsoft 365 web apps.
Combined with a Conditional Access rule this will only impact unmanaged devices.
Idle session timeout doesn't affect Microsoft 365 desktop and mobile apps.

**Rationale:**
Ending idle sessions through an automatic process can help protect sensitive company
data and will add another layer of security for end users who work on unmanaged
devices that can potentially be accessed by the public. Unauthorized individuals onsite
or remotely can take advantage of systems left unattended over time. Automatic timing
out of sessions makes this more difficult.

#### Remediation action:

Step 1 - Configure Idle session timeout:

1. Navigate to the Microsoft 365 admin center https://admin.microsoft.com/.
2. Click to expand Settings Select Org settings.
3. Click Security & Privacy tab.
4. Select Idle session timeout.
5. Check the box Turn on to set the period of inactivity for users to be signed off of Microsoft 365 web apps
6. Set a maximum value of 3 hours.
7. Click save.

Step 2 - Ensure the Conditional Access policy is in place:

1. Navigate to Microsoft Entra admin center https://entra.microsoft.com/
2. Expand Protect > Conditional Access.
3. Click New policy and give the policy a name.
   o Select Users > All users.
   o Select Cloud apps or actions > Select apps and select Office 365
   o Select Conditions > Client apps > Yes check only Browser unchecking all other boxes.
   o Select Sessions and check Use app enforced restrictions.
4. Set Enable policy to On and click Create.

#### Related links

* [Microsoft 365 Admin Center](https://admin.microsoft.com)
* [CIS Microsoft 365 Foundations Benchmark v5.0.0 - Page 46](https://www.cisecurity.org/benchmark/microsoft_365)
* [Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/idle-session-timeout-web-apps?view=o365-worldwide)

<!--- Results --->
%TestResult%