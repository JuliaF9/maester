<#
.SYNOPSIS
    Checks if no user is allowed to record meetings

.DESCRIPTION
    Ensure meeting recording is off by default
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-MeetingRecording

    Returns true if 'AllowCloudRecording' set to false
#>

function Test-MeetingRecording {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    Write-Verbose 'Test-MeetingRecording: Testing if no user is allowed to record meetings'
    try {
        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global | Select-Object -ExpandProperty AllowCloudRecording
        $testResult = $TeamsMeetingPolicy -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. No user is allowed to record meetings."
        } else {
            $testResultMarkdown = "Users are still allowed to record meetings, the setting is set to: '$($TeamsMeetingPolicy)'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}