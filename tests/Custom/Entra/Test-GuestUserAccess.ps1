<#
.SYNOPSIS
    Checks if guest user access is restricted

.DESCRIPTION
    Ensure that guest user access is restricted
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-GuestUserAccess

    Returns true if the value returned is '10dae51f-b6af-4016-8d66-8c2a99b929b3' or '2af84b1e-32c8-42b7-82bc-daa82404023b' (most restrictive)
#>

function Test-GuestUserAccess {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-GuestUserAccess: Testing if guest user access is restricted."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/authorizationPolicy" -ApiVersion v1.0
        $testResult = $result.guestUserRoleId -eq '10dae51f-b6af-4016-8d66-8c2a99b929b3' -or $result.guestUserRoleId -eq '2af84b1e-32c8-42b7-82bc-daa82404023b'

        if ($testResult) {
            $testResultMarkdown = "Well done. Guest user access is restricted."
        } else {
            $testResultMarkdown = "Your tenant is configured with: 'Guest user access is restricted' isSet to **No**. The recommended setting is **Yes**."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}