<#
.SYNOPSIS
    Checks if the content being shared is accessible by either the entire organization or select individuals

.DESCRIPTION
    Ensure link sharing is restricted in SharePoint and OneDrive
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-LinkSharingSpoAndOneDrive

    Returns true if 'DefaultSharingLinkType' set to 'Direct' or 'Internal'
#>

function Test-LinkSharingSpoAndOneDrive {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-LinkSharingSpoAndOneDrive: Testing if link sharing is restricted in SharePoint and OneDrive.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty DefaultSharingLinkType
        $testResult = $SpoPolicy -eq 'Direct' -or $SpoPolicy -eq 'Internal'

        if ($testResult) {
            $testResultMarkdown = "Well done. Link sharing is restricted in SharePoint and OneDrive."
        } else {
            $testResultMarkdown = "Link sharing is still not restricted in SharePoint and OneDrive. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}



