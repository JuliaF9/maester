<#
.SYNOPSIS
    Checks if only organizers and co-organizers are able to present in Teams meetings

.DESCRIPTION
    Ensure only organizers and co-organizers can present
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-DesignatedPresenterRole

    Returns true if 'DesignatedPresenterRoleMode' set to 'OrganizerOnlyUserOverride'
#>

function Test-DesignatedPresenterRole {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Teams)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
        return $null
    }

    Write-Verbose 'Test-DesignatedPresenterRole: Testing if only organizers and co-organizers can present'
    try {
        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global | Select-Object -ExpandProperty DesignatedPresenterRoleMode
        $testResult = $TeamsMeetingPolicy -eq 'OrganizerOnlyUserOverride'

        if ($testResult) {
            $testResultMarkdown = "Well done. Only organizers and co-organizers can present."
        } else {
            $testResultMarkdown = "Other users are still able to present, the setting is set to: '$($TeamsMeetingPolicy)'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}