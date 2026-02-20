<#
.SYNOPSIS
    Checks if Teams channels will reject incoming emails sent to their unique email addresses, preventing them from being posted

.DESCRIPTION
    Ensure users can't send emails to a channel email address
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ChannelEmailAddress

    Returns true if 'AllowEmailIntoChannel' set to false
#>

function Test-ChannelEmailAddress {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    Write-Verbose 'Test-ChannelEmailAddress: Testing if no user is allowed to send emails to a channel email address.'
    try {
        $TeamsMeetingPolicy = Get-CsTeamsClientConfiguration -Identity Global | Select-Object -ExpandProperty AllowEmailIntoChannel
        $testResult = $TeamsMeetingPolicy -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. No user is allowed to send emails to a channel email address."
        } else {
            $testResultMarkdown = "Users are still allowed to send emails to a channel email address, the setting is set to: '$($TeamsMeetingPolicy)'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}