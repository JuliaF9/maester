<#
.SYNOPSIS
    Checks if system-preferred MFA prompts users to sign in with their most secure registered authentication method.


.DESCRIPTION
    Ensure system-preferred multifactor authentication is enabled
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-SystemPreferredMFA

    Returns true if 'includeTargets' is set to all_users and 'state' is set to enabled
#>

function Test-SystemPreferredMFA {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-SystemPreferredMFA: Testing if system-preferred multifactor authentication is enabled."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/authenticationMethodsPolicy" -ApiVersion v1.0

        $includeTargetsCheck = $result.authenticationMethodConfigurations.includeTargets | ForEach-Object {
            $_.id -eq 'all_users'
        }
        $stateCheck = $result.authenticationMethodConfigurations.state | ForEach-Object {
            $_.state -eq 'enabled'
        }
        $testresult = ($includeTargetsCheck -notcontains $false) -and ($stateCheck -notcontains $false)

        if ($testResult) {
            $testResultMarkdown = "Well done. System-preferred multifactor authentication is enabled."
        } else {
            $testResultMarkdown = "Your tenant is configured with: 'System-preferred multifactor authentication is enabled' isSet to **No**. The recommended setting is **Yes**."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}