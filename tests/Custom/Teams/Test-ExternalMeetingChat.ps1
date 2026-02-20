<#
.SYNOPSIS
    Checks if no user is allowed to chat in external meetings

.DESCRIPTION
    Ensure external meeting chat is off
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ExternalMeetingChat

    Returns true if 'AllowExternalNonTrustedMeetingChat' set to false
#>

function Test-ExternalMeetingChat {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    Write-Verbose 'Test-ExternalMeetingChat: Testing if no user is allowed to chat in external meetings with users from non trusted organizations'
    try {
        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global | Select-Object -ExpandProperty AllowExternalNonTrustedMeetingChat
        $testResult = $TeamsMeetingPolicy -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. No user is allowed to chat in external meetings."
        } else {
            $testResultMarkdown = "Users are still allowed to chat in external meetings, the setting is set to: '$($TeamsMeetingPolicy)'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}