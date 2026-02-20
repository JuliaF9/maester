<#
.SYNOPSIS
    Checks if internal phishing protection is enabled

.DESCRIPTION
    Ensure 'third-party storage services' are restricted in 'Microsoft 365 on the web'
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ThirdPartyStorageServices

    Returns true if 'AccountEnabled' is false
#>

function Test-ThirdPartyStorageServices {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }


    Write-Verbose "Test-ThirdPartyStorageServices: Testing if 'third-party storage services' are restricted in 'Microsoft 365 on the web'."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "users" -Select "accountEnabled"
        $check = $result | ForEach-Object {
            $_.accountEnabled -eq $false
        }
        $testResult = $check -notcontains $true

        if ($testResult) {
            $testResultMarkdown = "Well done. 'Third-party storage services' are restricted in 'Microsoft 365 on the web'."
        } else {
            $testResultMarkdown = "'Third-party storage services' are still not restricted in 'Microsoft 365 on the web'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}





