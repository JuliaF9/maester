<#
.SYNOPSIS
    Checks if users are restricted from registering third-party applications.

.DESCRIPTION
    Ensure third party integrated applications are not allowed
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ThirdPartyIntegratedApps

    Returns true if 'AllowedToCreateApps' is set to false
#>

function Test-ThirdPartyIntegratedApps {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-ThirdPartyIntegratedApps: Testing if third party integrated applications are not allowed."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/authorizationPolicy" -ApiVersion v1.0
        $testResult = $result.defaultUserRolePermissions.allowedToCreateApps -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. **[Third party integrated apps are not allowed.]**"
        } else {
            $testResultMarkdown = "$($testResult) Your tenant is configured with: **[Third party integrated apps are still allowed.]**. The recommended setting is to set it to 'not allowed'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}