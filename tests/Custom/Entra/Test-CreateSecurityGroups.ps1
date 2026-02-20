<#
.SYNOPSIS
    Checks if users can create security groups

.DESCRIPTION
    Ensure users cannot create security groups
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-CreateSecurityGroups

    Returns true if 'AllowedToCreateSecurityGroups' is set to false
#>

function Test-CreateSecurityGroups {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-CreateSecurityGroups: Testing if users cannot create security groups."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/authorizationPolicy" -ApiVersion v1.0
        $testResult = $result.defaultUserRolePermissions.allowedToCreateSecurityGroups -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. **['Users cannot create security groups'](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings/menuId/UserSettings)** is set to **Yes** in your tenant."
        } else {
            $testResultMarkdown = "Your tenant is configured with **[Users cannot create security groups](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings/menuId/UserSettings)** set to **No**. The recommended setting is **Yes**."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}