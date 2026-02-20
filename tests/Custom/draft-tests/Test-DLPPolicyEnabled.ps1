<#
.SYNOPSIS
    Checks if data loss preventention is enabled to protect an organization's sensitive information

.DESCRIPTION
    Ensure DLP policies are enabled for Microsoft Teams
    CIS Microsoft 365 Foundations Benchmark v6.0.0

.EXAMPLE
    Test-DLPPolicyEnabled

    Returns true if ...
#>

function Test-DLPPolicyEnabled {
    [CmdletBinding()]
    [OutputType([bool])]
    param()

    if (-not (Test-MtConnection ExchangeOnline)) {
        Add-MtTestResultDetail -SkippedBecause NotConnectedExchange
        return $null
    }

    Write-Verbose 'Test-DLPPolicyEnabled: Testing if DLP policies are enabled for Microsoft Teams.'
    try {
        $DlpPolicy = Get-DlpCompliancePolicy | Where-Object { $_.Workload -match "Teams" } | Format-List Name, Mode, TeamsLocation*
        if ($DlpPolicy -eq $false) {
            Add-MtTestResultDetail -Result 'Well done. DLP policies are enabled for Microsoft Teams.'
            return $true
        } else {
            Add-MtTestResultDetail -Result "DLP policies are still not enabled for Microsoft Teams."
            return $false
        }
    } catch {
        Add-MtTestResultDetail -SkippedBecause Error -SkippedError $_
        return $null
    }
}