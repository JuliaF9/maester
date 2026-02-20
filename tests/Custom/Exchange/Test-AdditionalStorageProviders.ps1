<#
.SYNOPSIS
    Checks if additional storage providers are restricted in Outlook on the web

.DESCRIPTION
    Ensure additional storage providers are restricted in Outlook on the web
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-AdditionalStorageProviders

    Returns true if 'AdditionalStorageProvidersAvailable' is set to false
#>


function Test-AdditionalStorageProviders {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection ExchangeOnline)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedExchange
        return $null
    }


    Write-Verbose "Test-AdditionalStorageProviders: Testing if additional storage providers are restricted in Outlook on the web."
    try {
        $ExoPolicy = Get-OwaMailboxPolicy -Identity OwaMailboxPolicy-Default | Select-Object -ExpandProperty AdditionalStorageProvidersAvailable
        $testResult = $ExoPolicy -eq $false

        if ($ExoPolicy) {
            $testResultMarkdown = "Well done. additional storage providers are restricted in Outlook on the web."
        } else {
            $testResultMarkdown = "Additional storage providers are still not restricted in Outlook on the web. It is set to $($ExoPolicy)"
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}


