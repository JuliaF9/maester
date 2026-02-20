<#
.SYNOPSIS
    Checks the maximum number of Microsoft Entra joined or registered devices that a user can have in Microsoft Entra ID

.DESCRIPTION
    Ensure the maximum number of devices per user is limited
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-MaxDevicesPerUser

    Returns true if 'UserDeviceQuota' is set to either 5, 10 or 20
#>

function Test-MaxDevicesPerUser {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-MaxDevicesPerUser: Testing if the maximum number of devices per user is limited."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/deviceRegistrationPolicy" -ApiVersion v1.0
        $testResult = $result.userDeviceQuota -eq 20 -or $result.userDeviceQuota -eq 10 -or $result.userDeviceQuota -eq 5

        if ($testResult) {
            $testResultMarkdown = "Well done. **[The maximum number of devices per user is $($result.userDeviceQuota)."
        } else {
            $testResultMarkdown = "$($testResult) The maximum number of devices per user is $($result). It should be set to 20 (recommended) or less"
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}