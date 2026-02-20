<#
.SYNOPSIS
    Checks if users are required to transfer OneDrive content to SharePoint folders first to share it

.DESCRIPTION
    Ensure OneDrive content sharing is restricted
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-OneDriveContentSharing

    Returns true if 'OneDriveSharingCapability' set to 'Disabled'
#>

function Test-OneDriveContentSharing {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-OneDriveContentSharing: Testing if OneDrive content sharing is restricted.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty OneDriveSharingCapability
        $testResult = $SpoPolicy -eq 'Disabled'

        if ($testResult) {
            $testResultMarkdown = "Well done. OneDrive content sharing is restricted."
        } else {
            $testResultMarkdown = "Modern OneDrive content sharing is restricted. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}

