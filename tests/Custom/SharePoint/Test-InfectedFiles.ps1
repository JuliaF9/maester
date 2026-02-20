<#
.SYNOPSIS
    Checks if infected files are blocked so that no one can open, copy, move, or share it until further actions are taken

.DESCRIPTION
    Ensure Office 365 SharePoint infected files are disallowed for download
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-InfectedFiles

    Returns true if 'DisallowInfectedFileDownload' set to true
#>

function Test-InfectedFiles {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-InfectedFiles: Testing if Office 365 SharePoint infected files are disallowed for download.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty DisallowInfectedFileDownload
        $testResult = $SpoPolicy -eq $true

        if ($testResult) {
            $testResultMarkdown = "Well done. Office 365 SharePoint infected files are disallowed for download."
        } else {
            $testResultMarkdown = "Office 365 SharePoint infected files are still allowed for download. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}