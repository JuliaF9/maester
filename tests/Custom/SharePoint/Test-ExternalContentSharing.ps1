<#
.SYNOPSIS
    Checks if external content sharing is restricted to 'New and existing guests' or less permissive

.DESCRIPTION
    Ensure external content sharing is restricted
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ExternalContentSharing

    Returns true if 'SharingCapability' is set to 'ExternalUserSharingOnly', 'ExistingExternalUserSharingOnly' or 'Disabled'
#>

function Test-ExternalContentSharing {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    Write-Verbose 'Test-ExternalContentSharing: Testing if external content sharing is restricted.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty SharingCapability
        $testResult = $SpoPolicy -eq 'ExternalUserSharingOnly' -or $SpoPolicy -eq 'ExistingExternalUserSharingOnly' -or $SpoPolicy -eq 'Disabled'

        if ($testResult) {
            $testResultMarkdown = "Well done. External content sharing is restricted."
        } else {
            $testResultMarkdown = "External content sharing is still not restricted. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}


