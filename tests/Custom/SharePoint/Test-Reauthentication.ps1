<#
.SYNOPSIS
    Checks if guests who use a verification code to access the site or links are required to reauthenticate after a set number of days.

.DESCRIPTION
    Ensure reauthentication with verification code is restricted
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-Reauthentication

    Returns true if 'EmailAttestationRequired' set to true and 'EmailAttestationReAuthDays' is set to 15
#>

function Test-Reauthentication {
    [CmdletBinding()]
    [OutputType([bool])]
    param()


    Write-Verbose 'Test-Reauthentication: Testing if reauthentication with verification code is restricted.'
    try {
        $SpoPolicyEmailAttReq = Get-SPOTenant | Select-Object -ExpandProperty EmailAttestationRequired
        $SpoPolicyEmailAttReAuth = Get-SPOTenant | Select-Object -ExpandProperty EmailAttestationReAuthDays

        $testResult = $SpoPolicyEmailAttReq -eq $true -and $SpoPolicyEmailAttReAuth -eq 15

        if ($testResult) {
            $testResultMarkdown = "Well done. Reauthentication with verification code is restricted."
        } else {
            $testResultMarkdown = "Reauthentication with verification code is still not restricted. It is set to $($SpoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}