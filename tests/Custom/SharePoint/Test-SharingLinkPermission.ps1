<#
.SYNOPSIS
    Checks if users must deliberately select the edit permission when sharing a link.

.DESCRIPTION
    Ensure the SharePoint default sharing link permission is set
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-SharingLinkPermission

    Returns true if 'DefaultLinkPermission' set to 'View'
#>

function Test-SharingLinkPermission {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-SharingLinkPermission: Testing if the SharePoint default sharing link permission is set.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty DefaultLinkPermission
        $testResult = $SpoPolicy -eq 'View'

        if ($testResult) {
            $testResultMarkdown = "Well done. The SharePoint default sharing link permission is set."
        } else {
            $testResultMarkdown = "The SharePoint default sharing link permission is still not set. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}