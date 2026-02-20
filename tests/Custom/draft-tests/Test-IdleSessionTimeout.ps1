<#
.SYNOPSIS
    Checks if Idle session timeout exceeds 3 hours for unmanaged devices

.DESCRIPTION
    Ensure Idle session timeout is set to 3 hours for unmanaged devices
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-IdleSessionTimeout

    Returns true if Idle session timeout is 3 hours or less
#>
function Test-IdleSessionTimeout {
    [OutputType([bool])]
    [CmdletBinding()]
    param()

    Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
    if (-not (Test-MtConnection Graph)) {
        return $null
    }

    Write-Verbose 'Test-ChannelEmailAddress: Testing if Idle session timeout is set to 3 hours for unmanaged devices.'
    try {
        $TimeoutPolicy = $PSSessionOption.IdleTimeout
        $BenchmarkTimeSpan = [TimeSpan]::Parse('03:00:00') # 3 hours
        if ($TimeoutPolicy) {
            $Timeout = $PolicyDefinition.ActivityBasedTimeoutPolicy.ApplicationPolicies[0].WebSessionIdleTimeout
            $PolicyDefinition = $TimeoutPolicy.Definition | ConvertFrom-Json
            $TimeSpan = [TimeSpan]::Parse($Timeout)
            $TimeoutReadable = "{0} days, {1} hours, {2} minutes" -f $TimeSpan.Days, $TimeSpan.Hours, $TimeSpan.Minutes
            if ($TimeSpan -le $BenchmarkTimeSpan) {
                Add-MtTestResultDetail -Result 'Well done. Timeout is set to '$($TimeoutReadable)'.'
                return $true
            } else {
                Add-MtTestResultDetail -Result 'Timeout is too long. It is set to '$($TimeoutReadable)'.'
                return $false
            }
        } else {
            Add-MtTestResultDetail -Result 'Idle session timeout is not configured.'
        }
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}