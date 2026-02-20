<#
.SYNOPSIS
    Checks if no anonymous user is allowed to chat in meetings

.DESCRIPTION
    Ensure meeting chat does not allow anonymous users
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-MeetingChatAnonymous

    Returns true if 'MeetingChatEnabledType' set to 'EnabledExceptAnonymous'
#>

function Test-MeetingChatAnonymous {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    Write-Verbose 'Test-MeetingChatAnonymous: Testing if no anonymous user is allowed to chat in meetings'
    try {
        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global | Select-Object -ExpandProperty MeetingChatEnabledType
        $testResult = $TeamsMeetingPolicy -eq 'EnabledExceptAnonymous'

        if ($testResult) {
            $testResultMarkdown = "Well done. No anonymous user is allowed to chat in meetings."
        } else {
            $testResultMarkdown = "Users are still allowed to chat in meetings, the setting is set to: '$($TeamsMeetingPolicy)'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}