# Custom Tests

Welcome to the Custom Tests directory! This is where you can create and manage your own Pester tests tailored to your specific needs. If you have tests you'd like to add or modify, this is the place to do it.

### Getting Started

- **Naming Convention**: Make sure your test files end with `.Tests.ps1` for easy identification.
- **Customizing Tests**: If you need to customize the default tests provided elsewhere, simply copy them from the `tests` directory and modify them to suit your requirements.
- **Running Custom Tests**: To execute tests located in this `Custom` directory exclusively, use the `-Path` parameter with `Invoke-Maester`. For example:

   ```powershell
   Invoke-Maester -Path ./Custom


### Connection & Run Guide:

1. Connection:

   1. Connect-SPOService -Url https://datatreeag-admin.sharepoint.com
   2. Connect-MicrosoftTeams
   3. Connect-ExchangeOnline
   4. Connect-IPPSSession
   5. Connect-Graph
   6. Connect-Maester

   For special tests, make sure to alo connect to Microsoft Graph using:

   Connect-Graph -Scopes "OrgSettings-Forms.Read.All"
   Connect-Graph -Scopes "OrgSettings-AppsAndServices.Read.All"

2. Move to tests:

   ```powershell
   cd tests

3. Run:

   ```powershell
   Invoke-Maester -Path ./Custom
