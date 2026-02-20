<#
.SYNOPSIS
    Checks if all users have set their usage location to 'DE'

.DESCRIPTION
    Ensure all users have UsageLocation set to 'DE'

.EXAMPLE
    Test-UsageLocation

    Returns true if the number of non-compliant users (where Usage Location is not set to 'DE' or set to null) is 0
#>


function Test-UsageLocation {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (!(Test-MtConnection Graph)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedGraph
        return $null
    }

    try {

        $location = "DE"

        #alle user zurückgeben lassen
        Write-Verbose 'Requesting users'
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Select "displayname, usageLocation"

        #mit $nonCompliantUsers die user herausfiltern, deren usageLocation nicht $location oder null ist
        $nonCompliantUsers = $users | Where-Object {
            $_.UsageLocation -ne $location -or $_.UsageLocation -eq $null
        }

        $testResult = ($nonCompliantUsers | Measure-Object).Count -eq 0
        #wenn anzahl der non-compliant user gleich 0 ist, dann haben alle user ihre usageLocation auf $location gesetzt
        if ($testResult) {
            Add-MtTestResultDetail -Result "All users have set UsageLocation to '$($location)'."
            return $true
        } else {
            #für jeden user in non-compliant users wird eine Fehlermeldung ausgegeben
            #foreach ($user in $nonCompliantUsers) {
            Add-MtTestResultDetail -Result "User/s `n%TestResult%`n does/do not have usage location set to '$($location)'." -GraphObjects $nonCompliantUsers -GraphObjectType Users
            return $false
        }

    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}