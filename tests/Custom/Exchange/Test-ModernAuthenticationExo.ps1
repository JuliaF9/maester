<#
.SYNOPSIS
    Checks if modern authentication for Exchange Online is enabled

.DESCRIPTION
    Ensure modern authentication for Exchange Online is enabled
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-ModernAuthenticationExo

    Returns true if 'OAuth2ClientProfileEnabled' set to true
#>

function Test-ModernAuthenticationExo {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection ExchangeOnline)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedExchange
        return $null
    }


    Write-Verbose "Test-ModernAuthenticationExo: Testing if modern authentication for Exchange Online is enabled."
    try {
        $ExoPolicy = Get-OrganizationConfig | Select-Object -ExpandProperty OAuth2ClientProfileEnabled
        $testResult = $ExoPolicy -eq $true

        if ($testResult) {
            $testResultMarkdown = "Well done. Modern authentication for Exchange Online is enabled."
        } else {
            $testResultMarkdown = "Modern authentication for Exchange Online is still disabled. It is set to $($ExoPolicy)."
        }
        Add-MtTestResultDetail -Result $testResultMarkdown
        return $testResult

    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}



