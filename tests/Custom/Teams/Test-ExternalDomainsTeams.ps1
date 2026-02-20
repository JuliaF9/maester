<#
.SYNOPSIS
    Checks if the ability to chat, add users to meetings, and use audio video conferencing with
    users in external organizations is restricted

.DESCRIPTION
    Ensure external domains are restricted in the Teams admin cente
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ExternalDomainTeams

    Returns true if 'EnableFederationAccess' set to false
#>

function Test-ExternalDomainTeams {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    Write-Verbose 'Test-ExternalDomainTeams: Testing if external domains are restricted in the Teams admin center.'
    try {
        $TeamsMeetingPolicy = Get-CsExternalAccessPolicy -Identity Global | Select-Object -ExpandProperty EnableFederationAccess
        $testResult = $TeamsMeetingPolicy -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. External domains are restricted in the Teams admin center."
        } else {
            $testResultMarkdown = "External domains are still not restricted in the Teams admin center, the setting is set to: '$($TeamsMeetingPolicy)'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}