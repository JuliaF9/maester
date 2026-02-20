<#
.SYNOPSIS
    Checks if internal phishing protection is enabled

.DESCRIPTION
    Ensure internal phishing protection for Forms is enabled
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-PhishingProtectionForms

    Returns true if the setting 'isInOrgFormsPhishingScanEnabled' is true
#>

function Test-PhishingProtectionForms {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }


    Write-Verbose "Test-PhishingProtectionForms: Testing if internal phishing protection for Forms is enabled."
    try {
        #IMPORTANT: First, make you are connected to Microsoft Graph using: Connect-Graph -Scopes "OrgSettings-Forms.Read.All"
        $result = Invoke-MtGraphRequest -RelativeUri "admin/forms/settings" -ApiVersion beta
        $testresult = $result.isInOrgFormsPhishingScanEnabled -eq $true

        if ($testresult) {
            $testResultMarkdown = "Well done. Internal phishing protection for Forms is enabled."
        } else {
            $testResultMarkdown = "Internal phishing protection for Forms is still not enabled."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testresult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}


