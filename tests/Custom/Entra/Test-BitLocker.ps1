<#
.SYNOPSIS
    Checks if users are blocked from recovering BitLocker keys

.DESCRIPTION
    Ensure users are restricted from recovering BitLocker keys
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-BitLocker

    Returns true if 'AllowedToReadBitlockerKeysForOwnedDevice' is set to false
#>


function Test-BitLocker {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-BitLocker: Testing if users are restricted from recovering BitLocker keys."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/authorizationPolicy" -ApiVersion v1.0
        $testResult = $result.defaultUserRolePermissions.allowedToReadBitlockerKeysForOwnedDevice -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. Users are restricted from recovering BitLocker keys."
        } else {
            $testResultMarkdown = "Your tenant is configured with: 'Users are restricted from recovering BitLocker keys' isSet to **No**. The recommended setting is **Yes**."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}