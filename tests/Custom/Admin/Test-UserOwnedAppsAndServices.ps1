<#
.SYNOPSIS
    Checks if internal phishing protection is enabled

.DESCRIPTION
    Ensure 'User owned apps and services' is restricted
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-UserOwnedAppsAndServices

    Returns true if 'isOfficeStoreEnabled' and 'isAppAndServicesTrialEnabled' are false
#>

function Test-UserOwnedAppsAndServices {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-UserOwnedAppsAndServices: Testing if 'User owned apps and services' is restricted."
    try {
        #IMPORTANT: First, make sure you are connected to Microsoft Graph using: Connect-Graph -Scopes "OrgSettings-AppsAndServices.Read.All"
        $result = Invoke-MtGraphRequest -RelativeUri "admin/appsAndServices/settings" -ApiVersion beta
        $testResult = $result.isOfficeStoreEnabled -eq $false -and $result.isAppAndServicesTrialEnabled -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. User owned apps and services is restricted."
        } else {
            $testResultMarkdown = "'User owned apps and services' is still not restricted."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}


