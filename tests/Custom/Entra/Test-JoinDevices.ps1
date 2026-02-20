<#
.SYNOPSIS
    Checks if users can register their devices as Microsoft Entra joined devices

.DESCRIPTION
    Ensure the ability to join devices to Entra is restricted
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-JoinDevices

    Returns true if 'AllowedToJoin' is set to either 'Selected' or 'None'
#>

function Test-JoinDevices {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    Write-Verbose "Test-JoinDevices: Testing if the ability to join devices to Entra is restricted."
    try {
        $result = Invoke-MtGraphRequest -RelativeUri "policies/deviceRegistrationPolicy" -ApiVersion v1.0
        $testResult = $result.azureADJoin.allowedToJoin.'@odata.type' -eq '#microsoft.graph.enumeratedDeviceRegistrationMembership' -or $result.azureADJoin.allowedToJoin.'@odata.type' -eq '#microsoft.graph.noDeviceRegistrationMembership'

        if ($testResult) {
            $testResultMarkdown = "Well done. **[The ability to join devices to Entra](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings/menuId/UserSettings)** is restricted in your tenant."
        } else {
            $testResultMarkdown = "$($testResult) Your tenant is configured with: **[The ability to join devices to Entra](https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings/menuId/UserSettings)** is not restricted. The recommended setting is to set it to 'Selected' or 'None'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}