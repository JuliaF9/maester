<#
.SYNOPSIS
    Checks if

.DESCRIPTION
    Ensure guest access to a site or OneDrive will expire automatically
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-GuestAccessExpire

    Returns true if 'ExternalUserExpirationRequired' set to true and 'ExternalUserExpireInDays' is set to 30
#>

function Test-GuestAccessExpire {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-GuestAccessExpire: Testing if guest access to a site or OneDrive will expire automatically.'
    try {
        $SpoPolicyExpirationReq = Get-SPOTenant | Select-Object -ExpandProperty ExternalUserExpirationRequired
        $SpoPolicyExpireInDays = Get-SPOTenant | Select-Object -ExpandProperty ExternalUserExpireInDays

        $testResult = $SpoPolicyExpirationReq -eq $true -and $SpoPolicyExpireInDays -eq 30

        if ($testResult) {
            $testResultMarkdown = "Well done. Guest access to a site or OneDrive will expire automatically."
        } else {
            $testResultMarkdown = "Guest access to a site or OneDrive does still not expire automatically. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}


