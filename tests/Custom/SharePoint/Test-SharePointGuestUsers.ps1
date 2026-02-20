<#
.SYNOPSIS
    Checks if external users cannot share items they don't own to prevent unauthorized disclosures of information

.DESCRIPTION
    Ensure that SharePoint guest users cannot share items they don't own
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-SharePointGuestUsers

    Returns true if 'PreventExternalUsersFromResharing' set to true
#>

function Test-SharePointGuestUsers {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-SharePointGuestUsers: Testing if modern authentication for SharePoint applications is required.'
    try {
        $SpoPolicy = Get-SPOTenant | Select-Object -ExpandProperty PreventExternalUsersFromResharing
        $testResult = $SpoPolicy -eq $true

        if ($testResult) {
            $testResultMarkdown = "Well done. SharePoint guest users cannot share items they do not own."
        } else {
            $testResultMarkdown = "SharePoint guest users still can share items they do not own. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}