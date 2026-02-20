<#
.SYNOPSIS
    Checks if 'AuditDisabled' is set to False at the organizational level

.DESCRIPTION
    Ensure 'AuditDisabled' organizationally is set to 'False'
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-AuditDisabled

    Returns true if 'AuditDisabled' is set to false
#>

function Test-AuditDisabled {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection ExchangeOnline)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedExchange
        return $null
    }


    Write-Verbose "Test-AuditDisabled: Testing if 'AuditDisabled' organizationally is set to 'False'."
    try {
        $ExoPolicy = Get-OrganizationConfig | Select-Object -ExpandProperty AuditDisabled
        $testResult = $ExoPolicy -eq $false

        if ($testResult) {
            $testResultMarkdown = "Well done. 'AuditDisabled' organizationally is set to '$($ExoPolicy)'."
        } else {
            $testResultMarkdown = "'AuditDisabled' organizationally is still set to '$($ExoPolicy)'."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}



