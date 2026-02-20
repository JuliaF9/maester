<#
.SYNOPSIS
    Checks if SharePoint and OneDrive integration with Azure AD B2B is enabled

.DESCRIPTION
    Ensure SharePoint and OneDrive integration with Azure AD B2B is enabled
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-SpoOneDriveIntegration

    Returns true if 'EnableAzureADB2BIntegration' set to true
#>

function Test-SpoOneDriveIntegration {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-SpoOneDriveIntegration: Testing if SharePoint and OneDrive integration with Azure AD B2B is enabled.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty EnableAzureADB2BIntegration
        $testResult = $SpoPolicy -eq $true

        if ($testResult) {
            $testResultMarkdown = "Well done. SharePoint and OneDrive integration with Azure AD B2B is enabled."
        } else {
            $testResultMarkdown = "Sharepoint and Onedrive integration with Azure AD B2B is still not enabled. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}