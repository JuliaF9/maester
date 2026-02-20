<#
.SYNOPSIS
    Checks if users can create tenants

.DESCRIPTION
    Ensure 'Restrict non-admin users from creating tenants' is set to 'Yes'
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-CreateTenants

    Returns true if 'AllowedToCreateTenants' is set to false
#>

function Test-CreateTenants {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-CreateTenants: Testing if 'Restrict non-admin users from creating tenants' is set to 'Yes'."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/authorizationPolicy" -ApiVersion v1.0
        $testResult = $result.defaultUserRolePermissions.allowedToCreateTenants -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. **['Restrict non-admin users from creating tenants'](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings/menuId/UserSettings)** is set to **Yes** in your tenant."
        } else {
            $testResultMarkdown = "Your tenant is configured with **[Users can create tenants](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings/menuId/UserSettings)** set to **No**. The recommended setting is **Yes**."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}