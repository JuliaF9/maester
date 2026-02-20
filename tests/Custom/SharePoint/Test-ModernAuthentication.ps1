<#
.SYNOPSIS
    Checks if users are required to authenticate to SharePoint using modern authentication

.DESCRIPTION
    Ensure modern authentication for SharePoint applications is required
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ModernAuthentication

    Returns true if 'LegacyAuthProtocolsEnabled' set to false
#>

function Test-ModernAuthentication {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-ModernAuthentication: Testing if modern authentication for SharePoint applications is required.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty LegacyAuthProtocolsEnabled
        $testResult = $SpoPolicy -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. Modern authentication for SharePoint applications is required."
        } else {
            $testResultMarkdown = "Modern authentication for SharePoint applications is still not required. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}


